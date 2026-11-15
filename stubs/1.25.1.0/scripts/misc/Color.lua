---@meta
-- FS25 1.25.1.0 : misc/Color.lua (stub généré, atlas Lua FS25)

---@class Color
Color = {}

---@param color Color
---@param key string
---@return any
function Color_mt.__index(color, key) end

---@param left (table|number|Color)
---@param right (table|number|Color)
---@return Color
function Color_mt.__mul(left, right) end

---@param r number
---@param g number
---@param b number
---@param a number?
---@return Color
function Color.new(r, g, b, a) end

---@return Color
function Color:copy() end

---@param color Color
function Color:copyTo(color) end

---@param inputString string
---@param ignoreAlpha boolean?
---@return Color
function Color.parseFromString(inputString, ignoreAlpha) end

---@param presetName string
---@return Color
function Color.fromPresetName(presetName) end

---@param packedValue integer
---@return Color
function Color.fromPackedValue(packedValue) end

---@return integer
function Color:toPackedValue() end

---@param hexString string
---@return Color
function Color.fromHex(hexString) end

---@param includeHash boolean
---@return string
function Color:toHex(includeHash) end

---@param vector table
---@param minLength integer?
---@param maxLength integer?
---@return Color
function Color.fromVector(vector, minLength, maxLength) end

---@return number
---@return number
---@return number
---@return number
function Color:unpack() end

---@return number
---@return number
---@return number
function Color:unpack3() end

---@return table
function Color:toVector3() end

---@return table
function Color:toVector4() end

---@param r integer
---@param g integer
---@param b integer
---@param a integer?
---@return Color
function Color.fromRGBA(r, g, b, a) end

---@return integer
---@return integer
---@return integer
---@return integer
function Color:unpackRGBA() end

---@param vector table
---@param minLength integer?
---@param maxLength integer?
---@return Color
function Color.fromVectorRGBA(vector, minLength, maxLength) end

---@return table
function Color:toVectorRGB() end

---@return table
function Color:toVectorRGBA() end

---@param first Color
---@param second Color
---@param alpha number
---@return Color
function Color.blend(first, second, alpha) end

---@param key string
---@return table
function Color:swizzle(key) end

---@param streamId integer
---@param r number
---@param g number
---@param b number
function Color.writeStreamRGB(streamId, r, g, b) end
