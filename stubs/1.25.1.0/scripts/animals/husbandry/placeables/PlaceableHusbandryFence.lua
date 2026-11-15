---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryFence.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHusbandryFence
PlaceableHusbandryFence = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryFence.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryFence.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryFence.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryFence.registerEventListeners(placeableType) end

---@param schema XMLSchema
---@param basePath string
function PlaceableHusbandryFence.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandryFence.registerSavegameXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryFence:onLoad(savegame) end

---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableHusbandryFence:onFenceI3DLoaded(i3dNode, failedReason, args) end

function PlaceableHusbandryFence:onDelete() end

---@param streamId any
---@param connection any
function PlaceableHusbandryFence:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandryFence:onWriteStream(streamId, connection) end

---@param xmlFile XMLFile
---@param key string
function PlaceableHusbandryFence:loadFromXMLFile(xmlFile, key) end

function PlaceableHusbandryFence:onPreFinalizePlacement() end

---@return boolean
function PlaceableHusbandryFence:updateHusbandryFence() end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param rotX any
---@param rotY any
---@param rotZ any
function PlaceableHusbandryFence:setPreviewPosition(superFunc, x, y, z, rotX, rotY, rotZ) end

function PlaceableHusbandryFence:getHasCustomizableFence() end

function PlaceableHusbandryFence:getFence() end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableHusbandryFence:getCanBePlacedAt(superFunc, x, y, z, farmId) end
