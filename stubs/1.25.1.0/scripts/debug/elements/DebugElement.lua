---@meta
-- FS25 1.25.1.0 : debug/elements/DebugElement.lua (generated stub, FS25 Lua Atlas)

--- DebugElement is the base class of all Debug* elements: it stores position, colour, optional text, visibility, clip distance and whether to hide when a GUI is open. Setters return self so they can be chained, and `addToManager` registers the element with `g_debugManager`, which calls `getShouldBeDrawn` and `draw` each frame.
---@class DebugElement
DebugElement = {}

--- Creates an element at the origin with a white colour, no text, visible, no clip distance and hidden while a GUI is open. Subclasses pass their own metatable.
---@param customMt table?
---@return table
function DebugElement.new(customMt) end

--- Tells the manager whether to call `draw`: false when invisible, when a GUI other than ConstructionScreen is shown and hiding is on, or when the active camera is farther than the clip distance. Note: the invisible case returns nil, not false.
---@return boolean
function DebugElement:getShouldBeDrawn() end

--- Empty base implementation; subclasses override it to render.
function DebugElement:draw() end

--- Registers the element with `g_debugManager`, optionally in a named group, with a lifetime in ms and a per-group maximum count (oldest removed first). Returns self.
---@param groupId string?
---@param lifetime number?
---@param maxCount integer?
---@return DebugElement
function DebugElement:addToManager(groupId, lifetime, maxCount) end

--- Replaces the colour with a new Color built from r, g, b and an optional alpha, each from 0 to 1. Returns self.
---@param r number
---@param g number
---@param b number
---@param a number?
---@return DebugElement
function DebugElement:setColorRGBA(r, g, b, a) end

--- Shows or hides the element. Returns self.
---@param isVisible boolean
---@return DebugElement
function DebugElement:setIsVisible(isVisible) end

--- Chooses whether the element stays visible while a GUI is open (stored inverted as `hideWhenGuiIsOpen`). The method name contains a typo, Visbile. Returns self.
---@param isVisible boolean
---@return DebugElement
function DebugElement:setVisbileWhenGUIOpen(isVisible) end

--- Sets the maximum camera distance at which the element is drawn; nil disables clipping. Returns self.
---@param clipDistance number?
---@return DebugElement
function DebugElement:setClipDistance(clipDistance) end
