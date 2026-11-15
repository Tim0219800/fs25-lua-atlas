---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableGreenhouse.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableGreenhouse
PlaceableGreenhouse = {}

function PlaceableGreenhouse.getRandomGrowthInterval() end

function PlaceableGreenhouse.getRandomWateringInterval() end

---@param specializations table
---@return boolean
function PlaceableGreenhouse.prerequisitesPresent(specializations) end

function PlaceableGreenhouse.initSpecialization() end

---@param placeableType any
function PlaceableGreenhouse.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableGreenhouse.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableGreenhouse.registerXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableGreenhouse:onLoad(savegame) end

---@param node any
---@param useRandomYRot any
function PlaceableGreenhouse:addPlantPlace(node, useRandomYRot) end

---@param xmlFilename any
function PlaceableGreenhouse:loadPlantFromXml(xmlFilename) end

---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableGreenhouse:plantI3DLoadedCallback(i3dNode, failedReason, args) end

function PlaceableGreenhouse:onDelete() end

function PlaceableGreenhouse:onFinalizePlacement() end

function PlaceableGreenhouse:onUpdate() end

---@param outputs any
---@param state any
function PlaceableGreenhouse:onOutputFillTypesChanged(outputs, state) end

---@param production any
---@param status any
function PlaceableGreenhouse:onProductionStatusChanged(production, status) end

function PlaceableGreenhouse:updatePlantDistribution() end

---@param fillType any
---@param plantPlace any
function PlaceableGreenhouse:setPlantAtPlace(fillType, plantPlace) end

function PlaceableGreenhouse:updatePlantsStage() end
