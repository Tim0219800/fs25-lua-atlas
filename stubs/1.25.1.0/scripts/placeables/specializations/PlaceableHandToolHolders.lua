---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableHandToolHolders.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for placeables that contain hand tool holders (racks where hand tools are hung). In this SDK dump only the event registration stub and a setName override are present; the loading of the holders themselves is UNVERIFIED.
---@class PlaceableHandToolHolders
PlaceableHandToolHolders = {}

--- Empty body in this dump: registers no event. Any intended events are UNVERIFIED.
---@param vehicleType any
function PlaceableHandToolHolders.registerEvents(vehicleType) end

--- Overrides setName: calls the parent, then forwards the new name to every hand tool holder in spec.handToolHolders so their display matches the placeable.
---@param superFunc any
---@param name any
---@param noEventSend any
function PlaceableHandToolHolders:setName(superFunc, name, noEventSend) end
