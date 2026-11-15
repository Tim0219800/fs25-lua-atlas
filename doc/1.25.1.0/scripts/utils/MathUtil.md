# utils/MathUtil.lua

Source : `dataS/scripts/utils/MathUtil.lua` — FS25 1.25.1.0

- **MathUtil** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MathUtil.isNan(value: number) → boolean` | 16 |  |
| `MathUtil.isInt(number: number) → boolean` | 24 |  |
| `MathUtil.isInf(number: number) → boolean` | 32 |  |
| `MathUtil.isFinite(number: number) → boolean` | 40 |  |
| `MathUtil.getIsValidTransformationValue(...: any) → boolean` | 48 |  |
| `MathUtil.randomFloat(lowerValue: number, upperValue: number) → number` | 77 |  |
| `MathUtil.round(value: number, precision: number?) → number` | 86 |  |
| `MathUtil.roundToStep(value: number, step: number) → number` | 104 |  |
| `MathUtil.degToRad(degValue: number) → number` | 122 |  |
| `MathUtil.lerp(v1: number, v2: number, alpha: number) → number` | 136 |  |
| `MathUtil.inverseLerp(v1: number, v2: number, cv: number) → number` | 146 |  |
| `MathUtil.getIsOutOfBounds(value: number, limit1: number, limit2: number) → boolean` | 178 |  |
| `MathUtil.getFlooredPercent(value: number, maxValue: number) → number` | 191 |  |
| `MathUtil.getFlooredBounded(value: number, minValue: number, maxValue: number) → number` | 212 |  |
| `MathUtil.getValidLimit(limit: number) → number` | 226 |  |
| `MathUtil.getAngleDifference(alpha: number, beta: number) → number` | 243 |  |
| `MathUtil.eulerToDirection(yaw: number, pitch: number) → number, number, number` | 256 |  |
| `MathUtil.directionToPitchYaw(directionX: number, directionY: number, directionZ: number) → number, number` | 272 |  |
| `MathUtil.vector2Length(x: number, y: number) → number` | 280 |  |
| `MathUtil.vector2LengthSq(x: number, y: number) → number` | 289 |  |
| `MathUtil.vector2Normalize(x: number, y: number) → number, number` | 299 |  |
| `MathUtil.vector2SetLength(x: number, y: number, length: number) → number, number` | 312 |  |
| `MathUtil.vector2Lerp(x1: number, y1: number, x2: number, y2: number, alpha: number) → number, number` | 330 |  |
| `MathUtil.vector3Length(x: number, y: number, z: number) → number` | 342 |  |
| `MathUtil.vector3LengthSq(x: number, y: number, z: number) → number` | 352 |  |
| `MathUtil.vector3Normalize(x: number, y: number, z: number) → number, number, number` | 364 |  |
| `MathUtil.vector3SetLength(x: number, y: number, z: number, length: number) → number, number, number` | 379 |  |
| `MathUtil.vector3Clamp(x: number, y: number, z: number, minVal: number, maxVal: number) → number, number, number` | 399 |  |
| `MathUtil.vector3Lerp(x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, alpha: number) → number, number, number` | 421 |  |
| `MathUtil.vector3ArrayLerp(v1: table, v2: table, alpha: number) → number, number, number` | 455 |  |
| `MathUtil.inverseVector3ArrayLerp(v1: array, v2: array, cv: array) → number` | 469 |  |
| `MathUtil.vector3Transformation(x: number, y: number, z: number, m11: number, m12: number, m13: number, m21: number, m22: number, m23: number, m31: number, m32: number, m33: number) → number, number, number` | 503 |  |
| `MathUtil.dotProduct(ax: number, ay: number, az: number, bx: number, by: number, bz: number) → number` | 526 |  |
| `MathUtil.crossProduct(ax: number, ay: number, az: number, bx: number, by: number, bz: number) → number, number, number` | 541 |  |
| `MathUtil.getVectorAngleDifference(dirX1: number, dirY1: number, dirZ1: number, dirX2: number, dirY2: number, dirZ2: number) → number` | 554 |  |
| `MathUtil.getSignedAngleBetweenVectors2D(dirX1: number, dirZ1: number, dirX2: number, dirZ2: number) → number` | 568 |  |
| `MathUtil.getYRotationFromDirection(dx: number, dz: number) → number` | 579 |  |
| `MathUtil.getDirectionFromYRotation(rotY: number) → number, number` | 588 |  |
| `MathUtil.getRotationLimitedVector2(x: number, y: number, minRot: number, maxRot: number) → number, number` | 600 |  |
| `MathUtil.quaternionVectorMultiplication(quatX: number, quatY: number, quatZ: number, quatW: number, vecX: number, vecY: number, vecZ: number) → number, number, number` | 627 |  |
| `MathUtil.projectOnLine(px: number, pz: number, lineX: number, lineZ: number, normlineDirX: number, normlineDirZ: number) → number, number` | 657 |  |
| `MathUtil.getProjectOnLineParameter(px: number, pz: number, lineX: number, lineZ: number, normlineDirX: number, normlineDirZ: number) → number` | 673 |  |
| `MathUtil.quaternionMult(x: number, y: number, z: number, w: number, x1: number, y1: number, z1: number, w1: number) → number, number, number, number` | 694 |  |
| `MathUtil.quaternionNormalized(x: number, y: number, z: number, w: number) → number, number, number, number` | 711 |  |
| `MathUtil.slerpQuaternion(x1: number, y1: number, z1: number, w1: number, x2: number, y2: number, z2: number, w2: number, t: number) → number, number, number, number` | 734 |  |
| `MathUtil.normalizeRotationForShortestPath(targetRotation: number, curRotation: number) → number` | 756 |  |
| `MathUtil.nlerpQuaternionShortestPath(x1: number, y1: number, z1: number, w1: number, x2: number, y2: number, z2: number, w2: number, t: number) → number, number, number, number` | 786 |  |
| `MathUtil.slerpQuaternionShortestPath(x1: number, y1: number, z1: number, w1: number, x2: number, y2: number, z2: number, w2: number, t: number) → number, number, number, number` | 814 |  |
| `MathUtil.quaternionMadShortestPath(x: number, y: number, z: number, w: number, x1: number, y1: number, z1: number, w1: number, t: number) → number, number, number, number` | 855 |  |
| `MathUtil.getDistanceToRectangle2D(posX: number, posZ: number, sx: number, sz: number, dx: number, dz: number, length: number, widthHalf: number) → number` | 875 |  |
| `MathUtil.getSignedDistanceToLineSegment2D(x: number, z: number, sx: number, sz: number, dx: number, dz: number, length: number) → number, integer` | 918 |  |
| `MathUtil.getLineLineIntersection2D(x1: number, z1: number, dirX1: number, dirZ1: number, x2: number, z2: number, dirX2: number, dirZ2: number) → boolean, number?, number?` | 954 |  |
| `MathUtil.getLineSegmentsIntersection(ax1: number, az1: number, ax2: number, az2: number, bx1: number, bz1: number, bx2: number, bz2: number) → boolean, number, number` | 979 |  |
| `MathUtil.getLineSegmentsIntersectionParameter(ax1: number, az1: number, ax2: number, az2: number, bx1: number, bz1: number, bx2: number, bz2: number) → boolean, number, number` | 1013 |  |
| `MathUtil.getAreLineSegmentsIntersecting(ax1: number, az1: number, ax2: number, az2: number, bx1: number, bz1: number, bx2: number, bz2: number, allowEndStartSamePos: boolean?) → boolean, boolean?` | 1043 |  |
| `MathUtil.getLineBoundingVolumeIntersect(ax1: number, ay1: number, ax2: number, ay2: number, bx1: number, by1: number, bx2: number, by2: number) → boolean` | 1110 |  |
| `MathUtil.hasRectangleLineIntersection2D(x1: number, z1: number, dirX1: number, dirZ1: number, dirX2: number, dirZ2: number, x3: number, z3: number, dirX3: number, dirZ3: number) → boolean` | 1130 |  |
| `MathUtil.getCircleCircleIntersection(x1: number, y1: number, r1: number, x2: number, y2: number, r2: number) → number?, number?, number?, number?` | 1208 |  |
| `MathUtil.hasSphereSphereIntersection(x1: number, y1: number, z1: number, r1: number, x2: number, y2: number, z2: number, r2: number) → boolean` | 1263 |  |
| `MathUtil.getDistanceToLineSegment2D(startX: number, startZ: number, endX: number, endZ: number, pointX: number, pointZ: number) → number` | 1359 |  |
| `MathUtil.getPointPointDistance(x1: number, y1: number, x2: number, y2: number) → number` | 1417 |  |
| `MathUtil.getPointPointDistanceSquared(x1: number, y1: number, x2: number, y2: number) → number` | 1431 |  |
| `MathUtil.areaToHa(area: number, pixelToSqm: number) → number` | 1442 |  |
| `MathUtil.haToSqm(area: number) → number` | 1450 |  |
| `MathUtil.inchToM(inchValue: number) → number` | 1458 |  |
| `MathUtil.mToInch(mValue: number) → number` | 1466 |  |
| `MathUtil.msToMinutes(ms: integer) → number` | 1474 |  |
| `MathUtil.msToHours(ms: integer) → number` | 1482 |  |
| `MathUtil.msToDays(ms: integer) → number` | 1490 |  |
| `MathUtil.minutesToMs(minutes: number) → integer` | 1498 |  |
| `MathUtil.hoursToMs(hours: number) → integer` | 1506 |  |
| `MathUtil.daysToMs(days: integer) → integer` | 1514 |  |
| `MathUtil.mpsToKmh(mps: number) → number` | 1522 |  |
| `MathUtil.kmhToMps(kmh: number) → number` | 1530 |  |
| `MathUtil.rpmToMps(rpm: integer, radius: number) → number` | 1539 |  |
| `MathUtil.getXZWidthAndHeight(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number, number, number, number, number, number` | 1557 |  |
| `MathUtil.getWorldParallelogramOffset(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, offset: number) → number, number, number, number, number, number` | 1576 |  |
| `MathUtil.getNumOfSetBits(bitmask: integer) → integer` | 1624 |  |
| `MathUtil.bitsToMask(...: integer) → integer` | 1636 |  |
| `MathUtil.getBinary(number: integer) → array` | 1649 |  |
| `MathUtil.numberToSetBits(number: integer) → array` | 1665 |  |
| `MathUtil.numberToSetBitsStr(number: integer, separator: string?) → string` | 1683 |  |
| `MathUtil.getNumRequiredBits(integer: integer) → integer` | 1704 |  |
| `MathUtil.getBrightnessFromColor(r: number, g: number, b: number) → number` | 1722 |  |
| `MathUtil.getHorizontalRotationFromDeviceGravity(x: number, y: number, z: number) → number` | 1732 |  |
| `MathUtil.getSteeringAngleFromDeviceGravity(x: number, y: number, z: number) → number` | 1767 |  |
| `MathUtil.catmullRom(p0: number, p1: number, p2: number, p3: number, t: number) → number` | 1797 |  |
| `MathUtil.equalEpsilon(a: number?, b: number?, epsilon: number?) → boolean` | 1813 |  |
| `MathUtil.floatRange(startVal: number, endVal: number, step: number) → function` | 1830 |  |
| `MathUtil.smoothstep(min: number, max: number, x: number) → number` | 1878 |  |
| `MathUtil.snapValue(value: number, step: integer) → number` | 1888 |  |
| `MathUtil.getIndexOfFirstNonZeroFractionDigit(number: number) → integer` | 1902 |  |
| `MathUtil.vector2Rotate(x: number, y: number, angle: number) → number, number` | 1923 |  |
| `MathUtil.getPolygon2DSize(vertices: array) → number?` | 1936 |  |
| `MathUtil.getPolygonLabel(vertices: array, precision: number) → number, number` | 1970 |  |
| `MathUtil.symmetricDipCurve(value: number, alpha: number, maxValue: number) → number` | 2145 |  |
| `MathUtil.convertStringToNumber(value: string\|number) → number` | 2156 |  |
