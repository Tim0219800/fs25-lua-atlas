---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableLights.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableLights
PlaceableLights = {}

---@class PlaceableLightsActivatable
PlaceableLightsActivatable = {}

---@param specializations table
---@return boolean
function PlaceableLights.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableLights.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableLights.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableLights.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableLights:onLoad(savegame) end

function PlaceableLights:onFinalizePlacement() end

---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableLights:sharedLightLoaded(i3dNode, failedReason, args) end

function PlaceableLights:onDelete() end

---@param streamId integer
---@param connection table
function PlaceableLights:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlaceableLights:onWriteStream(streamId, connection) end

function PlaceableLights:getUseHighProfile() end

---@param groupIndex any
---@param isActive any
---@param noEventSend any
function PlaceableLights:setGroupIsActive(groupIndex, isActive, noEventSend) end

---@param groupIndex any
---@param isActive any
function PlaceableLights:updateLightState(groupIndex, isActive) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableLights:lightsTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

function PlaceableLights:lightSetupChanged() end

---@param placeable any
function PlaceableLightsActivatable.new(placeable) end

---@param groupIndex any
function PlaceableLightsActivatable:setGroupIndex(groupIndex) end

function PlaceableLightsActivatable:run() end

function PlaceableLightsActivatable:updateActivateText() end

---@param x any
---@param y any
---@param z any
function PlaceableLightsActivatable:getDistance(x, y, z) end
