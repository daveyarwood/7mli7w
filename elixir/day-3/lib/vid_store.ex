defmodule VidStore do
  use StateMachine

  state :available,
    rent: [to: :rented, calls: [&VidStore.renting/1]]

  state :rented,
    return: [to: :available, calls: [&VidStore.returning/1]],
    lose: [to: :lost, calls: [&VidStore.losing/1]]

  state :lost, 
    find: [to: :found, calls: [&VidStore.finding/1]]

  state :found,
    return: [to: :available, calls: [&VidStore.returning/1]],
    rent: [to: :rented, calls: [&VidStore.renting/1]]

  def before_renting video do
    log video, "About to rent #{video.title}"
  end

  def renting video do
    vid = log video, "Renting #{video.title}"
    %{vid | times_rented: (video.times_rented + 1)}
  end

  def after_renting video do
    log video, "Rented #{video.title}"
  end

  def returning video do
    log video, "Returning #{video.title}"
  end

  def losing video do
    log video, "Losing #{video.title}"
  end

  def finding video do
    log video, "Finding #{video.title}"
  end

  def log video, message do
    %{video | log: [message|video.log]}
  end
end
