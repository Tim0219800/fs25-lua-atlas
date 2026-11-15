---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TreeSaw.lua (stub généré, atlas Lua FS25)

---@class TreeSaw
TreeSaw = {}

---@param specializations table
---@return boolean
function TreeSaw.prerequisitesPresent(specializations) end

function TreeSaw.initSpecialization() end

---@param vehicleType any
function TreeSaw.registerEventListeners(vehicleType) end

---@param savegame table
function TreeSaw:onLoad(savegame) end

function TreeSaw:onDelete() end

---@param streamId integer
---@param timestamp integer
---@param connection table
function TreeSaw:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function TreeSaw:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreeSaw:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreeSaw:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreeSaw:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function TreeSaw:onDeactivate() end

function TreeSaw:onTurnedOn() end

function TreeSaw:onTurnedOff() end
