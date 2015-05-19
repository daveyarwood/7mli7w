defmodule StateMachine do
  defmacro __using__(_) do
    quote do
      import StateMachine
      @states []
      @before_compile StateMachine
    end
  end

  defmacro state(name, events) do
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end

  defmacro __before_compile__(env) do
    module = env.module
    states = Module.get_attribute(module, :states)
    events = states
             |> Keyword.values
             |> List.flatten
             |> Keyword.keys
             |> Enum.uniq
    quote do
      def state_machine do
        unquote(states)
      end

      unquote event_callbacks(events, module)
    end
  end

  def hook(module, fn_name, prefix, context) do
    f = String.to_atom(prefix <> to_string(fn_name))
    if function_exported? module, f, 1 do
      apply module, f, [context]
    else
      context
    end
  end

  def event_callback(name, module) do
    callback = name
    quote do
      def unquote(name)(context) do
        context = hook unquote(module), unquote(name), "before_", context
        context = StateMachine.Behavior.fire(state_machine, context, unquote(callback))
        context = hook unquote(module), unquote(name), "after_", context
      end
    end
  end

  def event_callbacks(names, module) do
    Enum.map names, fn name -> event_callback name, module end
  end
end
