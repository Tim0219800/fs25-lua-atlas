---@meta
-- FS25 1.25.1.0 : gui/elements/TimerElement.lua (generated stub, FS25 Lua Atlas)

--- Clock-like circular timer element (value 0 to 1) built from a front image, two background halves, two value halves and a marker that orbits at a given radius. Derived from GuiElement. The source file itself marks it as not in use. Note: timerOffset is never assigned in this file, so draw would fail on it unless set elsewhere (UNVERIFIED).
---@class TimerElement : GuiElement
TimerElement = {}

--- Constructor. Initialises value 0, unit timer/marker sizes, radius and empty overlays for front, backgrounds, values and marker.
---@param target any
---@param custom_mt any
function TimerElement.new(target, custom_mt) end

--- Deletes all six overlays, then calls the parent delete.
function TimerElement:delete() end

--- Loads the image/bgImage/valueImage/markerImage overlays plus timerSize, markerSize, value and radius from XML, creates the overlays and sets the initial value.
---@param xmlFile any
---@param key any
function TimerElement:loadFromXML(xmlFile, key) end

--- Loads the same overlays and the sizes, value and radius from a GUI profile. Does not create the overlays or set UVs here.
---@param profile any
---@param applyProfile any
function TimerElement:loadProfile(profile, applyProfile) end

--- Copies sizes, offset, radius, value and all overlays from a source element. Note: it indexes src.timerOffset, which is nil unless assigned elsewhere.
---@param src any
function TimerElement:copyAttributes(src) end

--- Clamps the value to 0..1 and rotates the UVs of the first value and first background overlays so the pie fill matches it.
---@param newValue any
function TimerElement:setValue(newValue) end

--- Writes the eight UV coordinates of an overlay as a quad rotated by the given angle in radians around its centre.
---@param overlay any
---@param rotation any
function TimerElement:updateUVs(overlay, rotation) end

--- Draws the background and value halves according to whether the value is above or below one half, then the front image and the marker placed on an ellipse of the configured radius.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TimerElement:draw(clipX1, clipY1, clipX2, clipY2) end
