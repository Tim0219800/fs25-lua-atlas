---@meta
-- FS25 1.25.1.0 : vehicles/specializations/GroundAdjustedNodes.lua (generated stub, FS25 Lua Atlas)

---@class GroundAdjustedNodes
GroundAdjustedNodes = {}

---@param specializations any
function GroundAdjustedNodes.prerequisitesPresent(specializations) end

function GroundAdjustedNodes.initSpecialization() end

---@param schema any
---@param basePath any
function GroundAdjustedNodes.registerNodeXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function GroundAdjustedNodes.registerAdjustNodeXMLPaths(schema, basePath) end

---@param vehicleType any
function GroundAdjustedNodes.registerFunctions(vehicleType) end

---@param vehicleType any
function GroundAdjustedNodes.registerEventListeners(vehicleType) end

---@param savegame any
function GroundAdjustedNodes:onLoad(savegame) end

---@param savegame any
function GroundAdjustedNodes:onLoadFinished(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function GroundAdjustedNodes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param groundAdjustedNode any
function GroundAdjustedNodes:loadGroundAdjustedNodeFromXML(xmlFile, key, groundAdjustedNode) end

---@param xmlFile any
---@param key any
---@param groundAdjustedNode any
---@param raycastNode any
function GroundAdjustedNodes:loadGroundAdjustedRaycastNodeFromXML(xmlFile, key, groundAdjustedNode, raycastNode) end

---@param xmlFile any
---@param key any
---@param groundAdjustedNode any
---@param adjustNode any
---@param required any
function GroundAdjustedNodes:loadGroundAdjustedAdjustNodeFromXML(xmlFile, key, groundAdjustedNode, adjustNode, required) end

---@param groundAdjustedNode any
---@param adjustNode any
function GroundAdjustedNodes:initGroundAdjustedAdjustNode(groundAdjustedNode, adjustNode) end

---@param dt any
function GroundAdjustedNodes:updateGroundAdjustedRaycasts(dt) end

---@param groundAdjustedNode any
---@param dt any
function GroundAdjustedNodes:updateGroundAdjustedNode(groundAdjustedNode, dt) end

---@param groundAdjustedNode any
---@param ignoreAttachState any
function GroundAdjustedNodes:getIsGroundAdjustedNodeActive(groundAdjustedNode, ignoreAttachState) end

function GroundAdjustedNodes:onRegisterAnimationValueTypes() end
