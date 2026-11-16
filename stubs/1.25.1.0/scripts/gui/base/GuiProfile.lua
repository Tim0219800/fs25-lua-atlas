---@meta
-- FS25 1.25.1.0 : gui/base/GuiProfile.lua (generated stub, FS25 Lua Atlas)

--- A named bag of string properties that styles GuiElements, similar to a CSS class. Profiles are read from XML, can inherit from a parent profile (extends) and merge reusable trait profiles (with), and values are resolved up the parent chain through g_gui. Values are stored as strings and converted on read.
---@class GuiProfile
GuiProfile = {}

--- Creates an empty profile holding references to the loaded profiles and traits tables, used later for inheritance lookups.
---@param profiles table
---@param traits table
---@return New
function GuiProfile.new(profiles, traits) end

--- Reads name, extends and with attributes, copies values from the listed traits, then loads each child element as a name/value pair, replacing $preset_ references from presets. Returns false without a name; raises an error if the profile extends itself; stops at a Variant element.
---@param xmlFile integer
---@param key string
---@param presets table
---@param isTrait boolean?
---@param isVariant boolean?
---@return boolean
function GuiProfile:loadFromXML(xmlFile, key, presets, isTrait, isVariant) end

--- Returns the string value for a name, trying the name with the g_baseUIPostfix suffix first, then the plain name, then the parent profile. The literal string "nil" counts as unset; falls back to the default.
---@param name string
---@param default string
---@return string
function GuiProfile:getValue(name, default) end

--- Reads a value through getValue and returns true only when it equals "true" (case-insensitive), otherwise false for any other string; returns the default when the value is unset.
---@param name string
---@param default boolean
---@return boolean
function GuiProfile:getBool(name, default) end

--- Reads a value through getValue and converts it with tonumber, which yields nil for a non-numeric string; returns the default when the value is unset.
---@param name string
---@param default number
---@return number
function GuiProfile:getNumber(name, default) end
