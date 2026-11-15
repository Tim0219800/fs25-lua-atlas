---@meta
-- FS25 1.25.1.0 : utils/MathUtil.lua (stub généré, atlas Lua FS25)

---@class MathUtil
MathUtil = {}

---@param value number
---@return boolean
function MathUtil.isNan(value) end

---@param number number
---@return boolean
function MathUtil.isInt(number) end

---@param number number
---@return boolean
function MathUtil.isInf(number) end

---@param number number
---@return boolean
function MathUtil.isFinite(number) end

---@return boolean
function MathUtil.getIsValidTransformationValue(...) end

---@param lowerValue number
---@param upperValue number
---@return number
function MathUtil.randomFloat(lowerValue, upperValue) end

---@param value number
---@param precision number?
---@return number
function MathUtil.round(value, precision) end

---@param value number
---@param step number
---@return number
function MathUtil.roundToStep(value, step) end

---@param degValue number
---@return number
function MathUtil.degToRad(degValue) end

---@param v1 number
---@param v2 number
---@param alpha number
---@return number
function MathUtil.lerp(v1, v2, alpha) end

---@param v1 number
---@param v2 number
---@param cv number
---@return number
function MathUtil.inverseLerp(v1, v2, cv) end

---@param value number
---@param limit1 number
---@param limit2 number
---@return boolean
function MathUtil.getIsOutOfBounds(value, limit1, limit2) end

---@param value number
---@param maxValue number
---@return number
function MathUtil.getFlooredPercent(value, maxValue) end

---@param value number
---@param minValue number
---@param maxValue number
---@return number
function MathUtil.getFlooredBounded(value, minValue, maxValue) end

---@param limit number
---@return number
function MathUtil.getValidLimit(limit) end

---@param alpha number
---@param beta number
---@return number
function MathUtil.getAngleDifference(alpha, beta) end

---@param yaw number
---@param pitch number
---@return number
---@return number
---@return number
function MathUtil.eulerToDirection(yaw, pitch) end

---@param directionX number
---@param directionY number
---@param directionZ number
---@return number
---@return number
function MathUtil.directionToPitchYaw(directionX, directionY, directionZ) end

---@param x number
---@param y number
---@return number
function MathUtil.vector2Length(x, y) end

---@param x number
---@param y number
---@return number
function MathUtil.vector2LengthSq(x, y) end

---@param x number
---@param y number
---@return number
---@return number
function MathUtil.vector2Normalize(x, y) end

---@param x number
---@param y number
---@param length number
---@return number
---@return number
function MathUtil.vector2SetLength(x, y, length) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param alpha number
---@return number
---@return number
function MathUtil.vector2Lerp(x1, y1, x2, y2, alpha) end

---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.vector3Length(x, y, z) end

---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.vector3LengthSq(x, y, z) end

---@param x number
---@param y number
---@param z number
---@return number
---@return number
---@return number
function MathUtil.vector3Normalize(x, y, z) end

---@param x number
---@param y number
---@param z number
---@param length number
---@return number
---@return number
---@return number
function MathUtil.vector3SetLength(x, y, z, length) end

---@param x number
---@param y number
---@param z number
---@param minVal number
---@param maxVal number
---@return number
---@return number
---@return number
function MathUtil.vector3Clamp(x, y, z, minVal, maxVal) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param alpha number
---@return number
---@return number
---@return number
function MathUtil.vector3Lerp(x1, y1, z1, x2, y2, z2, alpha) end

---@param v1 table
---@param v2 table
---@param alpha number
---@return number
---@return number
---@return number
function MathUtil.vector3ArrayLerp(v1, v2, alpha) end

---@param v1 array
---@param v2 array
---@param cv array
---@return number
function MathUtil.inverseVector3ArrayLerp(v1, v2, cv) end

---@param x number
---@param y number
---@param z number
---@param m11 number
---@param m12 number
---@param m13 number
---@param m21 number
---@param m22 number
---@param m23 number
---@param m31 number
---@param m32 number
---@param m33 number
---@return number
---@return number
---@return number
function MathUtil.vector3Transformation(x, y, z, m11, m12, m13, m21, m22, m23, m31, m32, m33) end

---@param ax number
---@param ay number
---@param az number
---@param bx number
---@param by number
---@param bz number
---@return number
function MathUtil.dotProduct(ax, ay, az, bx, by, bz) end

---@param ax number
---@param ay number
---@param az number
---@param bx number
---@param by number
---@param bz number
---@return number
---@return number
---@return number
function MathUtil.crossProduct(ax, ay, az, bx, by, bz) end

---@param dirX1 number
---@param dirY1 number
---@param dirZ1 number
---@param dirX2 number
---@param dirY2 number
---@param dirZ2 number
---@return number
function MathUtil.getVectorAngleDifference(dirX1, dirY1, dirZ1, dirX2, dirY2, dirZ2) end

---@param dirX1 number
---@param dirZ1 number
---@param dirX2 number
---@param dirZ2 number
---@return number
function MathUtil.getSignedAngleBetweenVectors2D(dirX1, dirZ1, dirX2, dirZ2) end

---@param dx number
---@param dz number
---@return number
function MathUtil.getYRotationFromDirection(dx, dz) end

---@param rotY number
---@return number
---@return number
function MathUtil.getDirectionFromYRotation(rotY) end

---@param x number
---@param y number
---@param minRot number
---@param maxRot number
---@return number
---@return number
function MathUtil.getRotationLimitedVector2(x, y, minRot, maxRot) end

---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param vecX number
---@param vecY number
---@param vecZ number
---@return number
---@return number
---@return number
function MathUtil.quaternionVectorMultiplication(quatX, quatY, quatZ, quatW, vecX, vecY, vecZ) end

---@param px number
---@param pz number
---@param lineX number
---@param lineZ number
---@param normlineDirX number
---@param normlineDirZ number
---@return number
---@return number
function MathUtil.projectOnLine(px, pz, lineX, lineZ, normlineDirX, normlineDirZ) end

---@param px number
---@param pz number
---@param lineX number
---@param lineZ number
---@param normlineDirX number
---@param normlineDirZ number
---@return number
function MathUtil.getProjectOnLineParameter(px, pz, lineX, lineZ, normlineDirX, normlineDirZ) end

---@param x number
---@param y number
---@param z number
---@param w number
---@param x1 number
---@param y1 number
---@param z1 number
---@param w1 number
---@return number
---@return number
---@return number
---@return number
function MathUtil.quaternionMult(x, y, z, w, x1, y1, z1, w1) end

---@param x number
---@param y number
---@param z number
---@param w number
---@return number
---@return number
---@return number
---@return number
function MathUtil.quaternionNormalized(x, y, z, w) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param w1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param w2 number
---@param t number
---@return number
---@return number
---@return number
---@return number
function MathUtil.slerpQuaternion(x1, y1, z1, w1, x2, y2, z2, w2, t) end

---@param targetRotation number
---@param curRotation number
---@return number
function MathUtil.normalizeRotationForShortestPath(targetRotation, curRotation) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param w1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param w2 number
---@param t number
---@return number
---@return number
---@return number
---@return number
function MathUtil.nlerpQuaternionShortestPath(x1, y1, z1, w1, x2, y2, z2, w2, t) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param w1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param w2 number
---@param t number
---@return number
---@return number
---@return number
---@return number
function MathUtil.slerpQuaternionShortestPath(x1, y1, z1, w1, x2, y2, z2, w2, t) end

---@param x number
---@param y number
---@param z number
---@param w number
---@param x1 number
---@param y1 number
---@param z1 number
---@param w1 number
---@param t number
---@return number
---@return number
---@return number
---@return number
function MathUtil.quaternionMadShortestPath(x, y, z, w, x1, y1, z1, w1, t) end

---@param posX number
---@param posZ number
---@param sx number
---@param sz number
---@param dx number
---@param dz number
---@param length number
---@param widthHalf number
---@return number
function MathUtil.getDistanceToRectangle2D(posX, posZ, sx, sz, dx, dz, length, widthHalf) end

---@param x number
---@param z number
---@param sx number
---@param sz number
---@param dx number
---@param dz number
---@param length number
---@return number
---@return integer
function MathUtil.getSignedDistanceToLineSegment2D(x, z, sx, sz, dx, dz, length) end

---@param x1 number
---@param z1 number
---@param dirX1 number
---@param dirZ1 number
---@param x2 number
---@param z2 number
---@param dirX2 number
---@param dirZ2 number
---@return boolean
---@return number?
---@return number?
function MathUtil.getLineLineIntersection2D(x1, z1, dirX1, dirZ1, x2, z2, dirX2, dirZ2) end

---@param ax1 number
---@param az1 number
---@param ax2 number
---@param az2 number
---@param bx1 number
---@param bz1 number
---@param bx2 number
---@param bz2 number
---@return boolean
---@return number
---@return number
function MathUtil.getLineSegmentsIntersection(ax1, az1, ax2, az2, bx1, bz1, bx2, bz2) end

---@param ax1 number
---@param az1 number
---@param ax2 number
---@param az2 number
---@param bx1 number
---@param bz1 number
---@param bx2 number
---@param bz2 number
---@return boolean
---@return number
---@return number
function MathUtil.getLineSegmentsIntersectionParameter(ax1, az1, ax2, az2, bx1, bz1, bx2, bz2) end

---@param ax1 number
---@param az1 number
---@param ax2 number
---@param az2 number
---@param bx1 number
---@param bz1 number
---@param bx2 number
---@param bz2 number
---@param allowEndStartSamePos boolean?
---@return boolean
---@return boolean?
function MathUtil.getAreLineSegmentsIntersecting(ax1, az1, ax2, az2, bx1, bz1, bx2, bz2, allowEndStartSamePos) end

---@param ax1 number
---@param ay1 number
---@param ax2 number
---@param ay2 number
---@param bx1 number
---@param by1 number
---@param bx2 number
---@param by2 number
---@return boolean
function MathUtil.getLineBoundingVolumeIntersect(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2) end

---@param x1 number
---@param z1 number
---@param dirX1 number
---@param dirZ1 number
---@param dirX2 number
---@param dirZ2 number
---@param x3 number
---@param z3 number
---@param dirX3 number
---@param dirZ3 number
---@return boolean
function MathUtil.hasRectangleLineIntersection2D(x1, z1, dirX1, dirZ1, dirX2, dirZ2, x3, z3, dirX3, dirZ3) end

---@param x1 number
---@param y1 number
---@param r1 number
---@param x2 number
---@param y2 number
---@param r2 number
---@return number?
---@return number?
---@return number?
---@return number?
function MathUtil.getCircleCircleIntersection(x1, y1, r1, x2, y2, r2) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param r1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param r2 number
---@return boolean
function MathUtil.hasSphereSphereIntersection(x1, y1, z1, r1, x2, y2, z2, r2) end

---@param startX number
---@param startZ number
---@param endX number
---@param endZ number
---@param pointX number
---@param pointZ number
---@return number
function MathUtil.getDistanceToLineSegment2D(startX, startZ, endX, endZ, pointX, pointZ) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function MathUtil.getPointPointDistance(x1, y1, x2, y2) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function MathUtil.getPointPointDistanceSquared(x1, y1, x2, y2) end

---@param area number
---@param pixelToSqm number
---@return number
function MathUtil.areaToHa(area, pixelToSqm) end

---@param area number
---@return number
function MathUtil.haToSqm(area) end

---@param inchValue number
---@return number
function MathUtil.inchToM(inchValue) end

---@param mValue number
---@return number
function MathUtil.mToInch(mValue) end

---@param ms integer
---@return number
function MathUtil.msToMinutes(ms) end

---@param ms integer
---@return number
function MathUtil.msToHours(ms) end

---@param ms integer
---@return number
function MathUtil.msToDays(ms) end

---@param minutes number
---@return integer
function MathUtil.minutesToMs(minutes) end

---@param hours number
---@return integer
function MathUtil.hoursToMs(hours) end

---@param days integer
---@return integer
function MathUtil.daysToMs(days) end

---@param mps number
---@return number
function MathUtil.mpsToKmh(mps) end

---@param kmh number
---@return number
function MathUtil.kmhToMps(kmh) end

---@param rpm integer
---@param radius number
---@return number
function MathUtil.rpmToMps(rpm, radius) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
function MathUtil.getXZWidthAndHeight(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param offset number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
function MathUtil.getWorldParallelogramOffset(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, offset) end

---@param bitmask integer
---@return integer
function MathUtil.getNumOfSetBits(bitmask) end

---@return integer
function MathUtil.bitsToMask(...) end

---@param number integer
---@return array
function MathUtil.getBinary(number) end

---@param number integer
---@return array
function MathUtil.numberToSetBits(number) end

---@param number integer
---@param separator string?
---@return string
function MathUtil.numberToSetBitsStr(number, separator) end

---@param integer integer
---@return integer
function MathUtil.getNumRequiredBits(integer) end

---@param r number
---@param g number
---@param b number
---@return number
function MathUtil.getBrightnessFromColor(r, g, b) end

---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.getHorizontalRotationFromDeviceGravity(x, y, z) end

---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.getSteeringAngleFromDeviceGravity(x, y, z) end

---@param p0 number
---@param p1 number
---@param p2 number
---@param p3 number
---@param t number
---@return number
function MathUtil.catmullRom(p0, p1, p2, p3, t) end

---@param a number?
---@param b number?
---@param epsilon number?
---@return boolean
function MathUtil.equalEpsilon(a, b, epsilon) end

---@param startVal number
---@param endVal number
---@param step number
---@return function
function MathUtil.floatRange(startVal, endVal, step) end

---@param min number
---@param max number
---@param x number
---@return number
function MathUtil.smoothstep(min, max, x) end

---@param value number
---@param step integer
---@return number
function MathUtil.snapValue(value, step) end

---@param number number
---@return integer
function MathUtil.getIndexOfFirstNonZeroFractionDigit(number) end

---@param x number
---@param y number
---@param angle number
---@return number
---@return number
function MathUtil.vector2Rotate(x, y, angle) end

---@param vertices array
---@return number?
function MathUtil.getPolygon2DSize(vertices) end

---@param vertices array
---@param precision number
---@return number
---@return number
function MathUtil.getPolygonLabel(vertices, precision) end

---@param value number
---@param alpha number
---@param maxValue number
---@return number
function MathUtil.symmetricDipCurve(value, alpha, maxValue) end

---@param value string|number
---@return number
function MathUtil.convertStringToNumber(value) end
