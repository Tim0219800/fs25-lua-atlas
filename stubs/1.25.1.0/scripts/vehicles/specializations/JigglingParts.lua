---@meta
-- FS25 1.25.1.0 : vehicles/specializations/JigglingParts.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that makes parts such as sowing coulters shake while working, by driving shader parameters (frequency and amplitude) on a node. The shake speed follows the vehicle speed and the amplitude fades in and out. A part can be tied to a ground reference node so it only jiggles while that node touches the ground (needs the GroundReference specialization for this).
---@class JigglingParts
JigglingParts = {}

--- Always returns true: no prerequisite on other specializations.
---@param specializations any
function JigglingParts.prerequisitesPresent(specializations) end

--- Registers the XML schema of a jiggling part: node, speed scale, shader parameter names, component indices, amplitude scale and ground reference node index. The base path constant is defined outside this file (UNVERIFIED).
function JigglingParts.initSpecialization() end

--- Registers loadJigglingPartsFromXML, isJigglingPartActive and updateJigglingPart on the vehicle type.
---@param vehicleType any
function JigglingParts.registerFunctions(vehicleType) end

--- Subscribes the specialization to onLoad and onUpdate.
---@param vehicleType any
function JigglingParts.registerEventListeners(vehicleType) end

--- Loads all jigglingPart entries from vehicle.jigglingParts. If none is valid, removes the onUpdate listener.
---@param savegame any
function JigglingParts:onLoad(savegame) end

--- Each frame, updates active parts with ground contact, and lets inactive parts fade out while their amplitude is still above zero.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function JigglingParts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one jiggling part (node, speed and amplitude scales, shader parameter names and components, reference node index) and initialises its state. Returns false with a warning if the node is missing.
---@param jigglingPart any
---@param xmlFile any
---@param key any
function JigglingParts:loadJigglingPartsFromXML(jigglingPart, xmlFile, key) end

--- Resolves the linked ground reference node on first call (warning if not found) and returns false if that node is not touching the ground, true otherwise.
---@param jigglingPart any
function JigglingParts:isJigglingPartActive(jigglingPart) end

--- Advances the shake phase in proportion to the vehicle speed, ramps the amplitude up or down (about 100 ms), then writes current and previous-frame values to the node's shader parameters (previous one used for motion data).
---@param jigglingPart any
---@param dt any
---@param groundContact any
function JigglingParts:updateJigglingPart(jigglingPart, dt, groundContact) end
