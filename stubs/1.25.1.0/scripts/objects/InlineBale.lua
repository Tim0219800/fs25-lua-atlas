---@meta
-- FS25 1.25.1.0 : objects/InlineBale.lua (stub généré, atlas Lua FS25)

---@class InlineBale : Object
InlineBale = {}

---@class InlineBaleActivatable
InlineBaleActivatable = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function InlineBale.new(isServer, isClient, customMt) end

function InlineBale:delete() end

---@param configFileName configFileName
---@return table
function InlineBale:loadFromConfigXML(configFileName) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function InlineBale:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
function InlineBale:saveToXMLFile(xmlFile, key) end

---@param streamId integer
---@param connection table
function InlineBale:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function InlineBale:writeStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function InlineBale:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function InlineBale:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
function InlineBale:readBales(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function InlineBale:writeBales(streamId, connection, dirtyMask) end

---@param dt number
function InlineBale:update(dt) end

---@param dt number
function InlineBale:updateTick(dt) end

---@param bale any
---@param baleType any
function InlineBale:addBale(bale, baleType) end

---@param bale any
---@param baleType any
function InlineBale:getIsBaleAllowed(bale, baleType) end

---@param spawnNode any
---@param color any
function InlineBale:replacePendingBale(spawnNode, color) end

function InlineBale:getPendingBale() end

function InlineBale:connectPendingBale() end

---@param bale any
function InlineBale:connectBale(bale) end

---@param bale1 any
---@param bale2 any
function InlineBale:createBaleJoint(bale1, bale2) end

---@param dt any
function InlineBale:updateBaleJoints(dt) end

---@param jointIndex any
---@param alpha any
function InlineBale:setBaleJointLimits(jointIndex, alpha) end

---@param bale1 any
---@param bale2 any
---@param filename any
function InlineBale:loadBaleConnector(bale1, bale2, filename) end

---@param bale any
function InlineBale:removeBaleConnector(bale) end

---@param wrapper any
---@param wrappingNode any
function InlineBale:setCurrentWrapperInfo(wrapper, wrappingNode) end

function InlineBale:getNumberOfBales() end

function InlineBale:getBales() end

---@param state any
function InlineBale:setWrappingState(state) end

---@param delay any
function InlineBale:wakeUp(delay) end

function InlineBale:getCanInteract() end

function InlineBale:getInteractionPosition() end

function InlineBale:getCanBeOpened() end

---@param x any
---@param y any
---@param z any
function InlineBale:openBaleAtPosition(x, y, z) end

---@param bale any
---@param isFirst any
---@param replaceBale any
function InlineBale:openBale(bale, isFirst, replaceBale) end

---@param bale any
function InlineBale:onBaleDeleted(bale) end

---@param inlineBale any
function InlineBaleActivatable.new(inlineBale) end

function InlineBaleActivatable:getIsActivatable() end

function InlineBaleActivatable:run() end
