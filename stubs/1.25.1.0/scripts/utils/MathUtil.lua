---@meta
-- FS25 1.25.1.0 : utils/MathUtil.lua (generated stub, FS25 Lua Atlas)

--- Collection of static math helpers in the global MathUtil table: number checks, rounding, interpolation, 2D and 3D vectors, quaternions, angles, segment and circle intersections, unit conversions (time, speed, length, area) and bit helpers. In this SDK dump almost every function is a signature without body, so most descriptions are inferred from names and annotations; only eulerToDirection and directionToPitchYaw have visible code.
---@class MathUtil
MathUtil = {}

--- Signature only (no body in the SDK dump): Tells whether a number is NaN (not a number).
---@param value number
---@return boolean
function MathUtil.isNan(value) end

--- Signature only (no body in the SDK dump): Tells whether a number is a whole number.
---@param number number
---@return boolean
function MathUtil.isInt(number) end

--- Signature only (no body in the SDK dump): Tells whether a number is positive or negative infinity.
---@param number number
---@return boolean
function MathUtil.isInf(number) end

--- Signature only (no body in the SDK dump): Tells whether a number is finite, i.e. neither NaN nor infinite.
---@param number number
---@return boolean
function MathUtil.isFinite(number) end

--- Signature only (no body in the SDK dump): Takes any number of values and returns true only if none is nil, NaN or infinite. Meant as a guard before applying translations or rotations to a node.
---@return boolean
function MathUtil.getIsValidTransformationValue(...) end

--- Signature only (no body in the SDK dump): Returns a random float between the two given bounds, both included.
---@param lowerValue number
---@param upperValue number
---@return number
function MathUtil.randomFloat(lowerValue, upperValue) end

--- Signature only (no body in the SDK dump): Rounds a value to a number of decimals; with no precision given it rounds to the nearest integer.
---@param value number
---@param precision number?
---@return number
function MathUtil.round(value, precision) end

--- Signature only (no body in the SDK dump): Rounds a value to the nearest multiple of a step size (the step defaults to 0.5 according to the annotations).
---@param value number
---@param step number
---@return number
function MathUtil.roundToStep(value, step) end

--- Signature only (no body in the SDK dump): Converts an angle from degrees to radians.
---@param degValue number
---@return number
function MathUtil.degToRad(degValue) end

--- Signature only (no body in the SDK dump): Linear interpolation between two values for a given alpha factor.
---@param v1 number
---@param v2 number
---@param alpha number
---@return number
function MathUtil.lerp(v1, v2, alpha) end

--- Signature only (no body in the SDK dump): Inverse of lerp: returns the alpha factor at which a current value sits between a start and an end value.
---@param v1 number
---@param v2 number
---@param cv number
---@return number
function MathUtil.inverseLerp(v1, v2, cv) end

--- Signature only (no body in the SDK dump): Returns true if a value lies outside the range given by two limits.
---@param value number
---@param limit1 number
---@param limit2 number
---@return boolean
function MathUtil.getIsOutOfBounds(value, limit1, limit2) end

--- Signature only (no body in the SDK dump): Computes a value as a percentage of a maximum, with the result floored. The exact rounding and scale (0-100 or 0-1) are UNVERIFIED.
---@param value number
---@param maxValue number
---@return number
function MathUtil.getFlooredPercent(value, maxValue) end

--- Signature only (no body in the SDK dump): Clamps a value between a minimum and a maximum and floors it. The order of the two operations is UNVERIFIED.
---@param value number
---@param minValue number
---@param maxValue number
---@return number
function MathUtil.getFlooredBounded(value, minValue, maxValue) end

--- Signature only (no body in the SDK dump): Wraps a radian angle into the range from -pi to pi.
---@param limit number
---@return number
function MathUtil.getValidLimit(limit) end

--- Signature only (no body in the SDK dump): Difference between two radian angles, returned in the range -pi to pi (sign convention UNVERIFIED).
---@param alpha number
---@param beta number
---@return number
function MathUtil.getAngleDifference(alpha, beta) end

--- Turns a yaw and a pitch (radians) into a unit direction vector x, y, z. Yaw rotates around Y; the vertical component is the sine of minus the pitch, so a positive pitch points downward.
---@param yaw number
---@param pitch number
---@return number
---@return number
---@return number
function MathUtil.eulerToDirection(yaw, pitch) end

--- Inverse of eulerToDirection: returns pitch then yaw (radians) for a direction vector. Pitch comes from asin of minus the Y component, yaw from atan2 of x and z. Expects a normalized direction.
---@param directionX number
---@param directionY number
---@param directionZ number
---@return number
---@return number
function MathUtil.directionToPitchYaw(directionX, directionY, directionZ) end

--- Signature only (no body in the SDK dump): Length of a 2D vector.
---@param x number
---@param y number
---@return number
function MathUtil.vector2Length(x, y) end

--- Signature only (no body in the SDK dump): Squared length of a 2D vector, cheaper than the length because it avoids a square root.
---@param x number
---@param y number
---@return number
function MathUtil.vector2LengthSq(x, y) end

--- Signature only (no body in the SDK dump): Returns the 2D vector scaled to unit length.
---@param x number
---@param y number
---@return number
---@return number
function MathUtil.vector2Normalize(x, y) end

--- Signature only (no body in the SDK dump): Returns the 2D vector rescaled so its length equals the given value.
---@param x number
---@param y number
---@param length number
---@return number
---@return number
function MathUtil.vector2SetLength(x, y, length) end

--- Signature only (no body in the SDK dump): Component-wise linear interpolation between two 2D points for a given alpha.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param alpha number
---@return number
---@return number
function MathUtil.vector2Lerp(x1, y1, x2, y2, alpha) end

--- Signature only (no body in the SDK dump): Length of a 3D vector.
---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.vector3Length(x, y, z) end

--- Signature only (no body in the SDK dump): Squared length of a 3D vector, avoiding the square root.
---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.vector3LengthSq(x, y, z) end

--- Signature only (no body in the SDK dump): Returns the 3D vector scaled to unit length.
---@param x number
---@param y number
---@param z number
---@return number
---@return number
---@return number
function MathUtil.vector3Normalize(x, y, z) end

--- Signature only (no body in the SDK dump): Returns the 3D vector rescaled so its length equals the given value.
---@param x number
---@param y number
---@param z number
---@param length number
---@return number
---@return number
---@return number
function MathUtil.vector3SetLength(x, y, z, length) end

--- Signature only (no body in the SDK dump): Returns the 3D vector with its length limited between a minimum and a maximum length.
---@param x number
---@param y number
---@param z number
---@param minVal number
---@param maxVal number
---@return number
---@return number
---@return number
function MathUtil.vector3Clamp(x, y, z, minVal, maxVal) end

--- Signature only (no body in the SDK dump): Component-wise linear interpolation between two 3D points for a given alpha.
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

--- Signature only (no body in the SDK dump): Linear interpolation between two vectors passed as tables, returning x, y, z. The table layout (indices 1 to 3) is UNVERIFIED.
---@param v1 table
---@param v2 table
---@param alpha number
---@return number
---@return number
---@return number
function MathUtil.vector3ArrayLerp(v1, v2, alpha) end

--- Signature only (no body in the SDK dump): Inverse interpolation for vectors given as arrays; takes two arrays and a current-value array and returns a single number. Exact computation UNVERIFIED.
---@param v1 array
---@param v2 array
---@param cv array
---@return number
function MathUtil.inverseVector3ArrayLerp(v1, v2, cv) end

--- Signature only (no body in the SDK dump): Multiplies a 3D vector by a 3x3 matrix given as nine values, row by row, and returns the transformed x, y, z.
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

--- Signature only (no body in the SDK dump): Dot product of two 3D vectors.
---@param ax number
---@param ay number
---@param az number
---@param bx number
---@param by number
---@param bz number
---@return number
function MathUtil.dotProduct(ax, ay, az, bx, by, bz) end

--- Signature only (no body in the SDK dump): Cross product of two 3D vectors, returned as x, y, z.
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

--- Signature only (no body in the SDK dump): Angle between two 3D direction vectors (radians presumably; unit UNVERIFIED).
---@param dirX1 number
---@param dirY1 number
---@param dirZ1 number
---@param dirX2 number
---@param dirY2 number
---@param dirZ2 number
---@return number
function MathUtil.getVectorAngleDifference(dirX1, dirY1, dirZ1, dirX2, dirY2, dirZ2) end

--- Signature only (no body in the SDK dump): Signed angle between two directions on the XZ plane. Sign convention and unit are UNVERIFIED.
---@param dirX1 number
---@param dirZ1 number
---@param dirX2 number
---@param dirZ2 number
---@return number
function MathUtil.getSignedAngleBetweenVectors2D(dirX1, dirZ1, dirX2, dirZ2) end

--- Signature only (no body in the SDK dump): Returns the rotation around Y for a direction given by dx and dz, measured from the Z axis rather than from the X axis.
---@param dx number
---@param dz number
---@return number
function MathUtil.getYRotationFromDirection(dx, dz) end

--- Signature only (no body in the SDK dump): Returns the x and z direction components for a rotation around Y; counterpart of getYRotationFromDirection.
---@param rotY number
---@return number
---@return number
function MathUtil.getDirectionFromYRotation(rotY) end

--- Signature only (no body in the SDK dump): Returns a 2D direction restricted to a rotation range given by a minimum and a maximum angle.
---@param x number
---@param y number
---@param minRot number
---@param maxRot number
---@return number
---@return number
function MathUtil.getRotationLimitedVector2(x, y, minRot, maxRot) end

--- Signature only (no body in the SDK dump): Rotates a vector by a quaternion (x, y, z, w) and returns the resulting x, y, z.
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

--- Signature only (no body in the SDK dump): Projects a point in the XZ plane onto a line given by a point and a normalized direction, returning the projected x and z.
---@param px number
---@param pz number
---@param lineX number
---@param lineZ number
---@param normlineDirX number
---@param normlineDirZ number
---@return number
---@return number
function MathUtil.projectOnLine(px, pz, lineX, lineZ, normlineDirX, normlineDirZ) end

--- Signature only (no body in the SDK dump): Returns the signed distance along a line (point plus normalized direction) of the projection of a point in the XZ plane.
---@param px number
---@param pz number
---@param lineX number
---@param lineZ number
---@param normlineDirX number
---@param normlineDirZ number
---@return number
function MathUtil.getProjectOnLineParameter(px, pz, lineX, lineZ, normlineDirX, normlineDirZ) end

--- Signature only (no body in the SDK dump): Multiplies two quaternions and returns the four components of the product.
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

--- Signature only (no body in the SDK dump): Returns the given quaternion scaled to unit norm, as four components.
---@param x number
---@param y number
---@param z number
---@param w number
---@return number
---@return number
---@return number
---@return number
function MathUtil.quaternionNormalized(x, y, z, w) end

--- Signature only (no body in the SDK dump): Interpolates between two quaternions with factor t. The parameter annotation speaks of linear interpolation despite the name; exact method UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Adjusts a target angle relative to the current angle so that turning from current to target takes the shortest way.
---@param targetRotation number
---@param curRotation number
---@return number
function MathUtil.normalizeRotationForShortestPath(targetRotation, curRotation) end

--- Signature only (no body in the SDK dump): Normalized linear interpolation between two quaternions along the shortest path, with factor t.
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

--- Signature only (no body in the SDK dump): Spherical interpolation between two quaternions along the shortest path, with factor t.
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

--- Signature only (no body in the SDK dump): Multiply-and-add style quaternion blend along the shortest path with factor t; the first quaternion is the base. Exact formula UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Distance from a point on the XZ plane to a rectangle defined by a start point, a direction, a length and a half width.
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

--- Signature only (no body in the SDK dump): Distance from a point to a segment given by start, normalized direction and length. Returns the distance and a case code: 0 for perpendicular projection (signed distance), 1 or 2 for nearest end point (unsigned).
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

--- Signature only (no body in the SDK dump): Intersection of two infinite lines in the XZ plane, each given by a point and a direction. Return layout and parallel-line behaviour are UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Intersection point of two segments given by their end points; the annotations say it returns false for collinear segments.
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

--- Signature only (no body in the SDK dump): Like getLineSegmentsIntersection but returns the intersection parameter along the segments instead of a point; false for collinear segments.
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

--- Signature only (no body in the SDK dump): Boolean test of whether two segments cross, collinear ones included. The optional last flag lets a segment continuing the other (shared end point, as in polygon contours) not count as an intersection.
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

--- Signature only (no body in the SDK dump): Tells whether the bounding boxes of two 2D lines overlap; a cheap pre-check rather than an exact intersection test.
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

--- Signature only (no body in the SDK dump): Tests whether a rectangle and a line intersect on the XZ plane. Parameter meaning (rectangle by point plus two directions, line by point plus direction) is inferred and UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Returns the intersection points of two circles given by center and radius. Return layout and the no-intersection case are UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Returns whether two spheres, each given by center and radius, intersect.
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

--- Signature only (no body in the SDK dump): Distance from a point to a 2D segment given by start and end coordinates. Argument order is segment start, segment end, then the point.
---@param startX number
---@param startZ number
---@param endX number
---@param endZ number
---@param pointX number
---@param pointZ number
---@return number
function MathUtil.getDistanceToLineSegment2D(startX, startZ, endX, endZ, pointX, pointZ) end

--- Signature only (no body in the SDK dump): Distance between two 2D points.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function MathUtil.getPointPointDistance(x1, y1, x2, y2) end

--- Signature only (no body in the SDK dump): Squared distance between two 2D points; handy when comparing distances because no square root is taken.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function MathUtil.getPointPointDistanceSquared(x1, y1, x2, y2) end

--- Signature only (no body in the SDK dump): Converts an area expressed in density-map pixels to hectares, using the size of a pixel in square meters.
---@param area number
---@param pixelToSqm number
---@return number
function MathUtil.areaToHa(area, pixelToSqm) end

--- Signature only (no body in the SDK dump): Converts hectares to square meters.
---@param area number
---@return number
function MathUtil.haToSqm(area) end

--- Signature only (no body in the SDK dump): Converts inches to meters.
---@param inchValue number
---@return number
function MathUtil.inchToM(inchValue) end

--- Signature only (no body in the SDK dump): Converts meters to inches.
---@param mValue number
---@return number
function MathUtil.mToInch(mValue) end

--- Signature only (no body in the SDK dump): Converts milliseconds to minutes.
---@param ms integer
---@return number
function MathUtil.msToMinutes(ms) end

--- Signature only (no body in the SDK dump): Converts milliseconds to hours.
---@param ms integer
---@return number
function MathUtil.msToHours(ms) end

--- Signature only (no body in the SDK dump): Converts milliseconds to days.
---@param ms integer
---@return number
function MathUtil.msToDays(ms) end

--- Signature only (no body in the SDK dump): Converts minutes to milliseconds.
---@param minutes number
---@return integer
function MathUtil.minutesToMs(minutes) end

--- Signature only (no body in the SDK dump): Converts hours to milliseconds.
---@param hours number
---@return integer
function MathUtil.hoursToMs(hours) end

--- Signature only (no body in the SDK dump): Converts days to milliseconds.
---@param days integer
---@return integer
function MathUtil.daysToMs(days) end

--- Signature only (no body in the SDK dump): Converts a speed from meters per second to kilometers per hour.
---@param mps number
---@return number
function MathUtil.mpsToKmh(mps) end

--- Signature only (no body in the SDK dump): Converts a speed from kilometers per hour to meters per second.
---@param kmh number
---@return number
function MathUtil.kmhToMps(kmh) end

--- Signature only (no body in the SDK dump): Converts a rotation speed in revolutions per minute and a wheel radius into a linear speed in meters per second (units presumed).
---@param rpm integer
---@param radius number
---@return number
function MathUtil.rpmToMps(rpm, radius) end

--- Signature only (no body in the SDK dump): Computes width and height from a start point and two world-space offsets (width and height vectors) in the XZ plane, as used for density-map areas. Exact return values UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Offsets a parallelogram defined by a start point and width and height vectors in the XZ plane by a given amount. Exact result UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Counts the bits set to 1 in a bitmask.
---@param bitmask integer
---@return integer
function MathUtil.getNumOfSetBits(bitmask) end

--- Signature only (no body in the SDK dump): Builds a bitmask from a list of bit positions, counting from 0.
---@return integer
function MathUtil.bitsToMask(...) end

--- Signature only (no body in the SDK dump): Returns the bits of a number as a list of 0 and 1 values, least significant first according to the annotated example.
---@param number integer
---@return array
function MathUtil.getBinary(number) end

--- Signature only (no body in the SDK dump): Returns the list of positions (from 0) of the bits set in a number.
---@param number integer
---@return array
function MathUtil.numberToSetBits(number) end

--- Signature only (no body in the SDK dump): Same as numberToSetBits but returns a string, joined with an optional separator (default comma and space).
---@param number integer
---@param separator string?
---@return string
function MathUtil.numberToSetBitsStr(number, separator) end

--- Signature only (no body in the SDK dump): Returns how many bits are needed to store a positive integer; the result is at least 1.
---@param integer integer
---@return integer
function MathUtil.getNumRequiredBits(integer) end

--- Signature only (no body in the SDK dump): Returns the brightness of an RGB color in the 0 to 1 range, described as relative luminance.
---@param r number
---@param g number
---@param b number
---@return number
function MathUtil.getBrightnessFromColor(r, g, b) end

--- Signature only (no body in the SDK dump): Derives a horizontal rotation from a device gravity vector (x, y, z), presumably from a mobile or motion sensor. Details UNVERIFIED.
---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.getHorizontalRotationFromDeviceGravity(x, y, z) end

--- Signature only (no body in the SDK dump): Derives a steering angle from a device gravity vector (x, y, z), presumably for tilt steering. Details UNVERIFIED.
---@param x number
---@param y number
---@param z number
---@return number
function MathUtil.getSteeringAngleFromDeviceGravity(x, y, z) end

--- Signature only (no body in the SDK dump): Catmull-Rom spline interpolation of one scalar between the second and third of four control values, with factor t.
---@param p0 number
---@param p1 number
---@param p2 number
---@param p3 number
---@param t number
---@return number
function MathUtil.catmullRom(p0, p1, p2, p3, t) end

--- Signature only (no body in the SDK dump): Compares two numbers within a tolerance (default 0.0001); returns false if either value is nil.
---@param a number?
---@param b number?
---@param epsilon number?
---@return boolean
function MathUtil.equalEpsilon(a, b, epsilon) end

--- Signature only (no body in the SDK dump): Returns an iterator over a range of floats, both ends included, unlike a numeric for loop that may stop short with floats. Raises an error for an endless range.
---@param startVal number
---@param endVal number
---@param step number
---@return function
function MathUtil.floatRange(startVal, endVal, step) end

--- Signature only (no body in the SDK dump): Smooth interpolation (smoothstep) of x between a minimum and a maximum edge. Exact curve UNVERIFIED.
---@param min number
---@param max number
---@param x number
---@return number
function MathUtil.smoothstep(min, max, x) end

--- Signature only (no body in the SDK dump): Snaps a value to a multiple of an integer step. Rounding direction UNVERIFIED.
---@param value number
---@param step integer
---@return number
function MathUtil.snapValue(value, step) end

--- Signature only (no body in the SDK dump): Returns the 1-based position of the first non-zero digit after the decimal point for inputs strictly between -1 and 1, and 0 otherwise (for example 0.002 gives 3).
---@param number number
---@return integer
function MathUtil.getIndexOfFirstNonZeroFractionDigit(number) end

--- Signature only (no body in the SDK dump): Rotates a 2D vector by an angle in radians; rotation direction UNVERIFIED.
---@param x number
---@param y number
---@param angle number
---@return number
---@return number
function MathUtil.vector2Rotate(x, y, angle) end

--- Signature only (no body in the SDK dump): Returns the flat size of a polygon in the XZ plane; takes an array of node ids and only uses their x and z translation. Return layout UNVERIFIED.
---@param vertices array
---@return number?
function MathUtil.getPolygon2DSize(vertices) end

--- Signature only (no body in the SDK dump): Takes an array of vertices and a precision; presumably computes a label position for a polygon. Purpose UNVERIFIED.
---@param vertices array
---@param precision number
---@return number
---@return number
function MathUtil.getPolygonLabel(vertices, precision) end

--- Signature only (no body in the SDK dump): Returns a symmetric curve over an input in 0 to 1, with fixed values at both edges equal to a maximum and a dip in the middle whose strength is set by alpha (0 gives a flat line, 1 the deepest dip).
---@param value number
---@param alpha number
---@param maxValue number
---@return number
function MathUtil.symmetricDipCurve(value, alpha, maxValue) end

--- Signature only (no body in the SDK dump): Converts a string or number to a number, tolerating underscores as digit separators and a comma as decimal separator (the annotated example turns 1_087_36,41532 into 108736.41532).
---@param value string|number
---@return number
function MathUtil.convertStringToNumber(value) end
