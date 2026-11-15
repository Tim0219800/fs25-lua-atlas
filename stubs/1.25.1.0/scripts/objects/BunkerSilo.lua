---@meta
-- FS25 1.25.1.0 : objects/BunkerSilo.lua (stub généré, atlas Lua FS25)

---@class BunkerSilo : Object
BunkerSilo = {}

---@class BunkerSiloActivatable
BunkerSiloActivatable = {}

---@param id integer
function BunkerSilo:onCreate(id) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function BunkerSilo.new(isServer, isClient, customMt) end

---@param components table
---@param xmlFile table
---@param key string
---@param i3dMappings table
---@return boolean
function BunkerSilo:load(components, xmlFile, key, i3dMappings) end

function BunkerSilo:delete() end

---@param streamId integer
---@param connection table
function BunkerSilo:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function BunkerSilo:writeStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function BunkerSilo:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function BunkerSilo:writeUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function BunkerSilo:loadFromXMLFile(xmlFile, key) end

---@param xmlFile XMLFile
---@param key string
---@param usedModNames table
function BunkerSilo:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt number
function BunkerSilo:update(dt) end

---@param dt number
function BunkerSilo:updateTick(dt) end

function BunkerSilo:updateFillLevel() end

---@param state boolean
---@param showNotification boolean
function BunkerSilo:setState(state, showNotification) end

---@param px number
---@param py number
---@param pz number
function BunkerSilo:openSilo(px, py, pz) end

---@param updateAtFront boolean
---@param offset number
---@param fillType integer
---@return number
function BunkerSilo:getBunkerAreaOffset(updateAtFront, offset, fillType) end

---@param switchAtFront boolean
---@param offset number
---@param length number
function BunkerSilo:switchFillTypeAtOffset(switchAtFront, offset, length) end

---@param ix number
---@param iy number
---@param iz number
---@return boolean
function BunkerSilo:getIsCloserToFront(ix, iy, iz) end

---@param showInformationOnly boolean
---@return boolean
function BunkerSilo:getCanInteract(showInformationOnly) end

---@return boolean
function BunkerSilo:getCanCloseSilo() end

---@return boolean
function BunkerSilo:getCanOpenSilo() end

function BunkerSilo:clearSiloArea() end

---@return number
---@return number
---@return number
function BunkerSilo:getInteractionPosition() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BunkerSilo:interactionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param self table
---@param vehicle table
---@param fillDelta integer
---@param fillType integer
---@param x any
---@param y any
---@param z any
function BunkerSilo.onChangedFillLevelCallback(self, vehicle, fillDelta, fillType, x, y, z) end

---@param schema any
---@param basePath any
function BunkerSilo.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function BunkerSilo.registerSavegameXMLPaths(schema, basePath) end
