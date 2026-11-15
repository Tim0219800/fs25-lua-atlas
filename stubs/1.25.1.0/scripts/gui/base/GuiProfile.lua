---@meta
-- FS25 1.25.1.0 : gui/base/GuiProfile.lua (stub généré, atlas Lua FS25)

---@class GuiProfile
GuiProfile = {}

---@param profiles table
---@param traits table
---@return New
function GuiProfile.new(profiles, traits) end

---@param xmlFile integer
---@param key string
---@param presets table
---@param isTrait boolean?
---@param isVariant boolean?
---@return boolean
function GuiProfile:loadFromXML(xmlFile, key, presets, isTrait, isVariant) end

---@param name string
---@param default string
---@return string
function GuiProfile:getValue(name, default) end

---@param name string
---@param default boolean
---@return boolean
function GuiProfile:getBool(name, default) end

---@param name string
---@param default number
---@return number
function GuiProfile:getNumber(name, default) end
