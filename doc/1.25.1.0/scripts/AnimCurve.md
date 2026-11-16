# AnimCurve.lua

*[Version française](../fr/scripts/AnimCurve.md)*

Source: `dataS/scripts/AnimCurve.lua` — FS25 1.25.1.0

✍ Animation curve class holding keyframes and a current/max time. This dump contains only `reset`; the constructor and interpolation code are absent, so the rest is UNVERIFIED.

- **AnimCurve** (l.167)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimCurve:reset()` | 187 | ✍ Clears all keyframes and sets the keyframe count, current time and max time back to 0. The interpolator is kept. |
