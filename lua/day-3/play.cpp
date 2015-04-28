// lol, I'm writing c++
extern "C"
{
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
}
#include "RtMidi.h"
static RtMidiOut midi_main;
static RtMidiOut midi_ports [20];

int initialize_midi_ports() {
    unsigned int ports = midi_main.getPortCount();
    if (ports < 1) {
        std::cerr << "Error: No MIDI ports available.\n";
        return 0;
    }

    for (int i = 0; i < ports && i < 20; i++) {
        RtMidiOut *m = new RtMidiOut();
        m->openPort(i);
        midi_ports[i] = *m;
    }

    return ports;
}

int midi_send(lua_State* L)
{
  int    port   = lua_tonumber(L, -5);
  double volume = lua_tonumber(L, -4);
  double status = lua_tonumber(L, -3);
  double data1  = lua_tonumber(L, -2);
  double data2  = lua_tonumber(L, -1);

  std::vector<unsigned char> volmsg(3);
  volmsg[0] = static_cast<unsigned char>(176);
  volmsg[1] = static_cast<unsigned char>(7);
  volmsg[2] = static_cast<unsigned char>(volume);

  std::vector<unsigned char> message(3);
  message[0] = static_cast<unsigned char>(status);
  message[1] = static_cast<unsigned char>(data1);
  message[2] = static_cast<unsigned char>(data2);

  midi_ports[port].sendMessage(&volmsg);
  midi_ports[port].sendMessage(&message);

  return 0;
}

void err_handle(lua_State *state) {
    if (!lua_isstring(state, lua_gettop(state)))
        std::cerr << "Error: Undefined error. wat";

    std::string str = lua_tostring(state, lua_gettop(state));
    lua_pop(state, 1);

    std::cerr << str;
    std::cerr << "\n";
}

int main(int argc, const char* argv[])
{
    if (argc < 1) {
        std::cerr << "Error: need a filename to play.\n";
        return -1;
    }

    if (!initialize_midi_ports()) {
        std::cerr << "Error: can't initialize MIDI ports.";
        return -2;
    }

    lua_State* L = luaL_newstate();
    luaL_openlibs(L);

    lua_pushcfunction(L, midi_send);
    lua_setglobal(L, "midi_send");

    int err = luaL_dofile(L, argv[1]);
    if (err) {
        std::cerr << "Error: Problem reading file\n\n";
        err_handle(L);
        return -3;
    }

    lua_close(L);

    return 0;
}