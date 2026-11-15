---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Suspensions.lua (stub généré, atlas Lua FS25)

---@class Suspensions
Suspensions = {}

---@param specializations any
function Suspensions.prerequisitesPresent(specializations) end

function Suspensions.initSpecialization() end

---@param vehicleType any
function Suspensions.registerFunctions(vehicleType) end

---@param vehicleType any
function Suspensions.registerEventListeners(vehicleType) end

---@param savegame any
function Suspensions:onLoad(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Suspensions:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param suspensionNode any
function Suspensions:loadSuspensionNodeFromXML(xmlFile, key, suspensionNode) end

---@param suspensionIndex any
function Suspensions:getSuspensionNodeFromIndex(suspensionIndex) end

---@param suspensionNode any
function Suspensions:getIsSuspensionNodeActive(suspensionNode) end

---@param suspensionNode any
---@param character any
function Suspensions:setSuspensionNodeCharacter(suspensionNode, character) end

---@param isControlling any
function Suspensions:onEnterVehicle(isControlling) end

---@param character any
function Suspensions:onVehicleCharacterChanged(character) end

---@param collisionNode any
---@param xmlFile any
---@param nodeName any
function Suspensions.subCollisionErrorFunction(collisionNode, xmlFile, nodeName) end

function Suspensions:getSuspensionModfier() end
