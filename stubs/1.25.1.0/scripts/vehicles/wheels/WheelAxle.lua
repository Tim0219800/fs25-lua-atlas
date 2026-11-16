---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelAxle.lua (generated stub, FS25 Lua Atlas)

--- Describes a pair of wheels forming an axle, with optional load-dependent ('dynamic') suspension: spring and damping multipliers, and optionally a component joint, are blended according to the axle load. Loaded from the vehicle wheel XML; created by the vehicle wheel code with the owning vehicle.
---@class WheelAxle
WheelAxle = {}

--- Creates an axle object bound to the given vehicle.
---@param vehicle any
---@param customMt any
function WheelAxle.new(vehicle, customMt) end

--- Empty cleanup function; the axle owns no resources.
function WheelAxle:delete() end

--- Reads the two wheel nodes (`#wheel1`, `#wheel2`), resolves the wheels and loads the optional dynamicSuspension settings. Returns false (with an XML error if a node is missing) when the wheels cannot be found.
---@param xmlFile any
---@param key any
function WheelAxle:loadFromXML(xmlFile, key) end

--- Per-frame update: computes the combined tire load, smooths a 0..1 alpha toward it and, when it changed enough, applies lerped spring/damping multipliers to both wheels and the optional component joint. Note: it reads `self.maxLoad`, which is never set (the XML value is in `dynamicSuspension.maxLoad`), so the XML maxLoad appears ignored here.
---@param dt any
function WheelAxle:update(dt) end

--- Returns the column headers used by the vehicle wheel debug table for axles.
function WheelAxle.getDebugValueHeader() end

--- Appends this axle's debug values (wheel indices, load, max load, alpha, spring/damping multipliers, joint data) to the given debug table columns; only writes when dynamic suspension exists.
---@param debugTable any
function WheelAxle:fillDebugValues(debugTable) end

--- Registers the XML schema paths for an axle: the two wheel nodes and the dynamicSuspension and componentJoint attributes.
---@param schema any
---@param key any
function WheelAxle.registerXMLPaths(schema, key) end
