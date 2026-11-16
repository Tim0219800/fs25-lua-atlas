# misc/BezierCurve.lua

*[Version française](../../fr/scripts/misc/BezierCurve.md)*

Source: `dataS/scripts/misc/BezierCurve.lua` — FS25 1.25.1.0

✍ Cubic Bezier curve for easing animations, with the end points fixed at (0,0) and (1,1) and two free control points. It keeps polynomial coefficients for each axis and recomputes them when a control point changes. Only these setters are in the dump; the constructor and sampling code are absent from this file's visible code (UNVERIFIED).

- **BezierCurve** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `BezierCurve:recalculateCoefficients()` | 47 | ✍ Recomputes the cubic coefficients ax, bx, cx and ay, by, cy from the two control points; called by every setter. |
| `BezierCurve:setPositionX1(newValue: number)` | 60 | ✍ Sets the first control point X, clamped to 0..1, then recalculates the coefficients. |
| `BezierCurve:setPositionY1(newValue: number)` | 69 | ✍ Sets the first control point Y, clamped to 0..1 (the in-code doc does not mention the clamp), then recalculates the coefficients. |
| `BezierCurve:setPositionX2(newValue: number)` | 78 | ✍ Sets the second control point X, clamped to 0..1, then recalculates the coefficients. |
| `BezierCurve:setPositionY2(newValue: number)` | 87 | ✍ Sets the second control point Y, clamped to 0..1, then recalculates the coefficients. |
