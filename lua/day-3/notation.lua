local scheduler = require 'scheduler'

local function note(letter, octave)
  local notes = {
    C  = 0,   Cs = 1,   D = 2,   Ds = 3,   E = 4,
    F  = 5,   Fs = 6,   G = 7,   Gs = 8,   A = 9,
    As = 10,  B  = 11
  }

  local notes_per_octave = 12

  if letter == 'R' then
    return nil
  else
    return (octave + 1) * notes_per_octave + notes[letter]
  end
end

local tempo = 100

local function set_tempo(bpm)
  tempo = bpm
end

local function duration(value)
  local quarter   = 60 / tempo
  local durations = {
    h = 2.0, q = 1.0, ed = 0.75, e = 0.5, s = 0.25
  }

  return durations[value] * quarter
end

local function volume(vol)
  if vol and #vol > 0 and #vol <= 5 then
    local underscores = #vol
    return underscores * 25
  else
    return 127
  end
end

local function parse_note(s)
  local letter, octave, value, vol =
    string.match(s, "([A-GRs]+)(%d*)(%a+)(_*)")

  return {
    note     = note(letter, octave),
    duration = duration(value),
    volume   = volume(vol)
  }
end

NOTE_DOWN = 0x90
NOTE_UP   = 0x80
VELOCITY  = 0x7f

function play(note, duration, volume)
  if note then midi_send(0, volume, NOTE_DOWN, note, VELOCITY) end
  scheduler.wait(duration)
  if note then midi_send(0, volume, NOTE_UP, note, VELOCITY) end
end

local function part(t)
  local function play_part()
    for i = 1, #t do
      play(t[i].note, t[i].duration, t[i].volume)
    end
  end

  scheduler.schedule(0.0, coroutine.create(play_part))
end

local function go()
  scheduler.run()
end

setmetatable(_G, {
  __index = function(t, s)
    local result = parse_note(s)
    return result or rawget(t, s)
  end
})

return {
  parse_note = parse_note,
  play = play,
  part = part,
  set_tempo = set_tempo,
  go = go
}