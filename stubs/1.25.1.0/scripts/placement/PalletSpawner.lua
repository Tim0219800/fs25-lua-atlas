---@meta
-- FS25 1.25.1.0 : placement/PalletSpawner.lua (stub généré, atlas Lua FS25)

---@class PalletSpawner
PalletSpawner = {}

---@param baseDirectory any
---@param customMt any
function PalletSpawner.new(baseDirectory, customMt) end

---@param components table
---@param xmlFile table
---@param key string
---@param customEnv string
---@param i3dMappings table
---@return boolean
function PalletSpawner:load(components, xmlFile, key, customEnv, i3dMappings) end

function PalletSpawner:delete() end

---@param palletFilename any
---@param limitFillTypeId any
function PalletSpawner:loadPalletFromFilename(palletFilename, limitFillTypeId) end

function PalletSpawner:getSupportedFillTypes() end

---@param farmId integer
---@param fillTypeId integer
---@param callback function
---@param callbackTarget table
function PalletSpawner:spawnPallet(farmId, fillTypeId, callback, callbackTarget) end

---@param farmId integer
---@param fillTypeId integer
---@param callback function
---@param callbackTarget table
function PalletSpawner:getOrSpawnPallet(farmId, fillTypeId, callback, callbackTarget) end

---@param fillTypeId integer
---@param callbackFunc function
---@param callbackTarget table
function PalletSpawner:getAllPallets(fillTypeId, callbackFunc, callbackTarget) end

---@param dt any
function PalletSpawner:update(dt) end

---@param location any
function PalletSpawner:onSpawnSearchFinished(location) end

---@param vehicles any
---@param vehicleLoadState any
function PalletSpawner:onFinishLoadingPallet(vehicles, vehicleLoadState) end

---@param node any
function PalletSpawner:onFindExistingPallet(node) end

---@param node any
function PalletSpawner:onFindPallet(node) end

---@param schema any
---@param basePath any
function PalletSpawner.registerXMLPaths(schema, basePath) end
