---@meta
-- FS25 1.25.1.0 : misc/Color.lua (generated stub, FS25 Lua Atlas)

--- RGBA colour value class with channels from 0 to 1. It converts to and from packed 32-bit integers, hex strings, vectors, 0..255 RGBA values and named presets (Color.PRESETS is referenced but defined outside this file, UNVERIFIED). Its metatable adds numeric indexing (1 to 4), swizzling such as color.rgb, and multiplication with numbers, tables or other colours.
---@class Color
Color = {}

--- Index metamethod: looks in the instance, then in the Color class, then maps numeric keys 1 to 4 to r, g, b, a, and finally tries swizzling the key (for example a string of channel letters).
---@param color Color
---@param key string
---@return any
function Color_mt.__index(color, key) end

--- Multiplication metamethod. Two tables multiply their RGB channels (alpha too when both have it), a number scales all four channels; results are clamped to 0..1 and returned as a new Color. Other operand types raise Assert.fail.
---@param left (table|number|Color)
---@param right (table|number|Color)
---@return Color
function Color_mt.__mul(left, right) end

--- Constructor taking r, g, b, a in 0..1; missing channels default to 0, alpha to 1 (solid black). Range checks exist only in debug builds.
---@param r number
---@param g number
---@param b number
---@param a number?
---@return Color
function Color.new(r, g, b, a) end

--- Returns a new Color with the same four channels.
---@return Color
function Color:copy() end

--- Writes this colour's four channels into an existing Color, overwriting it.
---@param color Color
function Color:copyTo(color) end

--- Parses a string into a Color or returns nil. The code tries, in this order: hex (starts with #), packed integer, space-separated vector of 3 or more numbers, brand colour via g_vehicleMaterialManager if present, then preset name. Note: the in-code doc lists a different order. ignoreAlpha forces alpha to 1.
---@param inputString string
---@param ignoreAlpha boolean?
---@return Color
function Color.parseFromString(inputString, ignoreAlpha) end

--- Looks up a preset colour by name, case-insensitive (name uppercased, then read from Color.PRESETS); nil for non-strings or unknown names.
---@param presetName string
---@return Color
function Color.fromPresetName(presetName) end

--- Unpacks a 32-bit integer (or numeric string) into a Color, with red in the lowest byte and alpha in the highest, each divided by 255. Returns nil if it is not a number.
---@param packedValue integer
---@return Color
function Color.fromPackedValue(packedValue) end

--- Packs the colour into a 32-bit integer (red lowest byte, alpha highest), each channel scaled by 255 and rounded up with math.ceil.
---@return integer
function Color:toPackedValue() end

--- Builds a Color from a hex string with or without a leading #, interpreting it as the packed layout (not plain RRGGBB order). Returns nil for non-strings or unparsable text.
---@param hexString string
---@return Color
function Color.fromHex(hexString) end

--- Returns the packed value as a hex string, optionally prefixed with #. Note: the format is %x without zero padding, so the length can vary.
---@param includeHash boolean
---@return string
function Color:toHex(includeHash) end

--- Builds a Color from an array of channels in 0..1. Returns nil if the argument is not a table or is shorter than minLength; entries beyond maxLength are replaced by defaults (0, alpha 1).
---@param vector table
---@param minLength integer?
---@param maxLength integer?
---@return Color
function Color.fromVector(vector, minLength, maxLength) end

--- Returns r, g, b, a as four values in 0..1.
---@return number
---@return number
---@return number
---@return number
function Color:unpack() end

--- Returns r, g, b as three values in 0..1.
---@return number
---@return number
---@return number
function Color:unpack3() end

--- Returns a new array {r, g, b}.
---@return table
function Color:toVector3() end

--- Returns a new array {r, g, b, a}.
---@return table
function Color:toVector4() end

--- Builds a Color from 0..255 integers by dividing by 255; missing r, g, b default to 0 and alpha to 255.
---@param r integer
---@param g integer
---@param b integer
---@param a integer?
---@return Color
function Color.fromRGBA(r, g, b, a) end

--- Returns the four channels as integers 0..255, scaled by 255 and rounded up with math.ceil.
---@return integer
---@return integer
---@return integer
---@return integer
function Color:unpackRGBA() end

--- Like fromVector but for 0..255 values: returns nil for an invalid or too short table, ignores entries beyond maxLength, then calls fromRGBA.
---@param vector table
---@param minLength integer?
---@param maxLength integer?
---@return Color
function Color.fromVectorRGBA(vector, minLength, maxLength) end

--- Returns a new array of three integers 0..255 (red, green, blue), rounded up.
---@return table
function Color:toVectorRGB() end

--- Returns a new array of four integers 0..255 (red, green, blue, alpha), rounded up.
---@return table
function Color:toVectorRGBA() end

--- Linear interpolation between two colours on all four channels via MathUtil.lerp; alpha 0 gives the first, 1 the second. Returns a new Color.
---@param first Color
---@param second Color
---@param alpha number
---@return Color
function Color.blend(first, second, alpha) end

--- Builds an array from a key of 1 to 4 channel letters (for example rg); returns nil if the key is not a string, has a bad length or contains a letter that is not a field of the colour.
---@param key string
---@return table
function Color:swizzle(key) end

--- Writes r, g, b to a network stream as three 10-bit unsigned values (each clamped to 0..1 and scaled by 1023); alpha is not sent.
---@param streamId integer
---@param r number
---@param g number
---@param b number
function Color.writeStreamRGB(streamId, r, g, b) end
