---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FoliageBending.lua (stub généré, atlas Lua FS25)

---@class FoliageBending
FoliageBending = {}

---@param specializations any
function FoliageBending.prerequisitesPresent(specializations) end

function FoliageBending.initSpecialization() end

function FoliageBending.postInitSpecialization() end

---@param vehicleType any
function FoliageBending.registerFunctions(vehicleType) end

---@param vehicleType any
function FoliageBending.registerEventListeners(vehicleType) end

---@param savegame any
function FoliageBending:onPostLoad(savegame) end

function FoliageBending:onDelete() end

---@param xmlFile any
---@param key any
---@param bendingNode any
function FoliageBending:loadBendingNodeFromXML(xmlFile, key, bendingNode) end

---@param xmlFile any
---@param key any
function FoliageBending:loadBendingNodeModifierFromXML(xmlFile, key) end

function FoliageBending:activateBendingNodes() end

function FoliageBending:deactivateBendingNodes() end

---@param index any
function FoliageBending:getFoliageBendingNodeByIndex(index) end

function FoliageBending:onActivate() end

function FoliageBending:onDeactivate() end
