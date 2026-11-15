---@meta
-- FS25 1.25.1.0 : placeables/BeehiveSystem.lua (generated stub, FS25 Lua Atlas)

---@class BeehiveSystem
BeehiveSystem = {}

---@param mission any
---@param customMt any
function BeehiveSystem.new(mission, customMt) end

function BeehiveSystem:delete() end

---@param beehiveToAdd any
function BeehiveSystem:addBeehive(beehiveToAdd) end

---@param beehive any
function BeehiveSystem:removeBeehive(beehive) end

function BeehiveSystem:onHourChanged() end

function BeehiveSystem:update() end

---@param farmId integer?
function BeehiveSystem:updateBeehivesOutput(farmId) end

function BeehiveSystem:updateState() end

function BeehiveSystem:updateBeehivesState() end

---@param farmId any
function BeehiveSystem:getFarmHasBeehive(farmId) end

function BeehiveSystem:getBeehives() end

---@param wx any
---@param wz any
function BeehiveSystem:getBeehiveInfluenceFactorAt(wx, wz) end

---@param beehivePalletSpawner any
function BeehiveSystem:addBeehivePalletSpawner(beehivePalletSpawner) end

---@param beehivePalletSpawner any
function BeehiveSystem:removeBeehivePalletSpawner(beehivePalletSpawner) end

---@param placeable any
function BeehiveSystem:showNoSpawnerWarning(placeable) end

---@param farmId any
function BeehiveSystem:getFarmBeehivePalletSpawner(farmId) end

function BeehiveSystem:consoleCommandBeehiveDebug() end
