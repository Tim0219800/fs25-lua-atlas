# utils/SplineUtil.lua

Source : `dataS/scripts/utils/SplineUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK ce fichier ne contient **que des signatures** (pas de corps).

- **SplineUtil** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SplineUtil.getValidSplineTime(t: number) → number` | 17 |  |
| `SplineUtil.getSplineTimeAtWorldPos(spline: integer, t: number, posX: number, posZ: number, checkDistance: number, maxSteps: number) → number, integer` | 31 |  |
| `SplineUtil.getSlopeAngle(spline: integer, splineTime: number) → number` | 69 |  |
| `SplineUtil.getCenterPosition(splineNode: integer) → number, number, number` | 81 |  |
| `SplineUtil.convertToLinearSplineXZ(cubicSpline: integer, thresholdAngleDeg: number?, stepSizeInMeter: number?) → array` | 130 |  |
| `SplineUtil.getClosestEditPoint(splineNode: integer, posX: number, posY: number, posZ: number) → integer?, number?, number?, number?, number?` | 182 |  |
| `SplineUtil.getClosestEditPointsOnCurve(splineNode: integer, posX: number, posY: number, posZ: number, eps: number?) → number?, number?, number?, number?, integer?, integer?` | 227 |  |
