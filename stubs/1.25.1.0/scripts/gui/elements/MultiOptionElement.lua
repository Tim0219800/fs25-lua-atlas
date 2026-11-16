---@meta
-- FS25 1.25.1.0 : gui/elements/MultiOptionElement.lua (generated stub, FS25 Lua Atlas)

--- MultiOptionElement is a thin subclass of MultiTextOptionElement for multiple-choice text controls. It adds an empty options table and otherwise only forwards to the parent; the real behaviour lives in MultiTextOptionElement, which is not part of this file.
---@class MultiOptionElement : MultiTextOptionElement
MultiOptionElement = {}

--- Constructor. Builds a MultiTextOptionElement and adds an empty options table.
---@param target any
---@param custom_mt any
function MultiOptionElement.new(target, custom_mt) end

--- Only calls the parent loadFromXML, no extra keys.
---@param xmlFile any
---@param key any
function MultiOptionElement:loadFromXML(xmlFile, key) end

--- Only calls the parent loadProfile, no extra values.
---@param profile any
---@param applyProfile any
function MultiOptionElement:loadProfile(profile, applyProfile) end

--- Only calls the parent copyAttributes.
---@param src any
function MultiOptionElement:copyAttributes(src) end

--- Forwards the state and the force-event flag to the parent setState.
---@param state any
---@param forceEvent any
function MultiOptionElement:setState(state, forceEvent) end

--- Returns the current state field (selected option index).
function MultiOptionElement:getState() end
