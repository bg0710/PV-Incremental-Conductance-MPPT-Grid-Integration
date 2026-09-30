# PR Current Controller

The supplied custom PR controller is configured with:

- `kp = 1.2`
- `kr = 750`
- `f = 50 Hz`

Its resonant term is implemented as:

`kr*s / (s^2 + (2*pi*f)^2)`

The controller is used for sinusoidal grid-current tracking around the 50 Hz fundamental.
