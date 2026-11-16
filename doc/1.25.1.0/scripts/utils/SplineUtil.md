# utils/SplineUtil.lua

*[Version française](../../fr/scripts/utils/SplineUtil.md)*

Source: `dataS/scripts/utils/SplineUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Static helpers for spline nodes: time clamping, nearest-point searches, slope, center, conversion of a cubic spline to a linear polyline on XZ, and closest edit point queries. The dump has signatures with annotations but no bodies, so behaviour comes from the annotations and is UNVERIFIED.

- **SplineUtil** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `SplineUtil.getValidSplineTime(t: number) → number` | 17 | ✍ Signature only (no body in the SDK dump): Turns an input into a valid spline time in the 0 to 1 range; whether it clamps or wraps is not shown. |
| `SplineUtil.getSplineTimeAtWorldPos(spline: integer, t: number, posX: number, posZ: number, checkDistance: number, maxSteps: number) → number, integer` | 31 | ✍ Signature only (no body in the SDK dump): Searches for the spline time nearest a world position (x and z only), starting at time t and stepping by a check distance up to a maximum step count. Returns the time and the steps used. |
| `SplineUtil.getSlopeAngle(spline: integer, splineTime: number) → number` | 69 | ✍ Signature only (no body in the SDK dump): Returns the slope angle in radians of the spline at a given time. |
| `SplineUtil.getCenterPosition(splineNode: integer) → number, number, number` | 81 | ✍ Signature only (no body in the SDK dump): Returns the x, y, z center position of a spline node; how the center is computed is not shown. |
| `SplineUtil.convertToLinearSplineXZ(cubicSpline: integer, thresholdAngleDeg: number?, stepSizeInMeter: number?) → array` | 130 | ✍ Signature only (no body in the SDK dump): Converts a cubic spline into an array of positions approximating it linearly on XZ, with an optional angle threshold (default 5 degrees) and step size (default 0.5 m). |
| `SplineUtil.getClosestEditPoint(splineNode: integer, posX: number, posY: number, posZ: number) → integer?, number?, number?, number?, number?` | 182 | ✍ Signature only (no body in the SDK dump): Finds the edit point nearest in 3D to a world position by exact search over all edit points. Returns a 0-based index, distance and position, or nil if the node is invalid. |
| `SplineUtil.getClosestEditPointsOnCurve(splineNode: integer, posX: number, posY: number, posZ: number, eps: number?) → number?, number?, number?, number?, integer?, integer?` | 227 | ✍ Signature only (no body in the SDK dump): Projects a world position onto the curve and returns the closest curve point, its spline time and the 0-based indices of the edit points before and after it (nil outside the ends). An optional error tolerance can be given. |
