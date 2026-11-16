---@meta
-- FS25 1.25.1.0 : forestry/TargetTreeMarker.lua (generated stub, FS25 Lua Atlas)

--- Plain class for the coloured ring or band drawn around a tree to show the target of a forestry tool. It loads a marker i3d, shows or hides it, sets its emissive color through a shader parameter, optionally pulses it with a sine-based flash in the per-frame update, and positions it on the tree with a width and radius.
---@class TargetTreeMarker
TargetTreeMarker = {}

--- Constructor. Stores the vehicle (may be nil) and link node; the marker starts inactive, not flashing, with a minimum flash intensity of 0.1.
---@param vehicle any
---@param linkNode any
---@param customMt any
function TargetTreeMarker.new(vehicle, linkNode, customMt) end

--- Registers the marker XML attributes: i3d filename, width, offset from the tree and emissive color.
---@param schema any
---@param baseKey any
function TargetTreeMarker.registerXMLPaths(schema, baseKey) end

--- Reads filename, width, offset and color, then starts an asynchronous shared i3d load through the vehicle if present, otherwise through g_i3DManager. onI3DLoaded completes the setup.
---@param xmlFile any
---@param key any
---@param baseDirectory any
function TargetTreeMarker:loadFromXML(xmlFile, key, baseDirectory) end

--- Deletes the marker node and releases the shared i3d if loaded, and removes the marker from mission updateables.
function TargetTreeMarker:delete() end

--- Stores the active state and shows or hides the marker node accordingly if it is loaded.
---@param isActive any
function TargetTreeMarker:setIsActive(isActive) end

--- Sets the RGB emissive color. When isFlashing is given and changes, it turns flashing on (registering for updates and restarting the timer) or off, and can set the minimum flash intensity.
---@param r any
---@param g any
---@param b any
---@param isFlashing any
---@param flashingMinIntensity any
function TargetTreeMarker:setColor(r, g, b, isFlashing, flashingMinIntensity) end

--- Flash animation: advances the timer by dt and scales the emissive color and alpha by a sine-based factor between the minimum intensity and 1. Only runs while flashing is enabled.
---@param dt any
function TargetTreeMarker:update(dt) end

--- Places the marker at a world position shifted along a direction by an offset (default minus half the width), orients it along that direction and writes the width and diameter (2 x radius) into the shader.
---@param x any
---@param y any
---@param z any
---@param dx any
---@param dy any
---@param dz any
---@param radius any
---@param offset any
function TargetTreeMarker:setPosition(x, y, z, dx, dy, dz, radius, offset) end

--- Callback of the shared i3d load. Takes the nested first child as marker node, links it under the link node, applies visibility and color, and deletes the temporary i3d root.
---@param i3dNode any
---@param failedReason any
function TargetTreeMarker:onI3DLoaded(i3dNode, failedReason) end
