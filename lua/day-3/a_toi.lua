-- 'A Toi', a waltz by E. Waldteufel (excerpt)
-- arr. for 4-hand piano by Thomas A'Beckett, Jr.

song = require 'notation'

song.set_tempo(150)

-- secondo, RH
song.part{
  A3q, E3q, A3q, Gs3e, A3e, B3e, Gs3e, E3q,
  Cs3q, Fs3q, D3q, Cs3e, D3e, Cs3e, B2e, A2q,
  Cs3q, D3q, F3q, Fs3q, Gs3q, A3q,
  B2q, D3q, E3q, A3q, A2q
}

-- secondo, LH
song.part{
  A2q, E2q, A2q, Gs2e, A2e, B2e, Gs2e, E2q,
  Cs2q, Fs2q, D2q, Cs2e, D2e, Cs2e, B1e, A1q,
  Cs2q, D2q, F2q, Fs2q, Gs2q, A2q,
  B1q, D2q, E2q, A2q, A1q
}

-- primo, RH
song.part{
  Rq, Rq, Rq, Rq, Rq, Rq,
  A4q, D5q, A4q, A4e, A4e, A4e, A4e, A4q,
  A4q, A4q, D5q, Cs5q, E5q, E5q,
  Fs5q, Fs5q, E5q, E5q
}

-- primo, RH (chords)
song.part{
  Rq, Rq, Rq, Rq, Rq, Rq,
  E5q, A5q, Fs5q, E5e, Fs5e, E5e, D5e, Cs5q,
  E5q, Fs5q, Gs5q, A5q, B5q, Cs6q,
  D6q, B5q, Gs5q, A5q
}

-- primo, RH (chords)
song.part{
  Rq, Rq, Rq, Rq, Rq, Rq,
  Rq, Rq, Rq, Rq, Rq, Rq,
  Rq, Rq, Rq, Rq, Rq, Rq,
  Rq, Rq, D5q, Cs5q
}

-- primo, LH
song.part{
  A4q, E4q, A4q, Gs4e, A4e, B4e, Gs4e, E4q,
  E4q, A4q, Fs4q, E4e, Fs4e, E4e, D4e, Cs4q,
  E4q, Fs4q, Gs4q, A4q, B4q, Cs5q,
  D5q, B4q, B4q, A4q
}

song.go()