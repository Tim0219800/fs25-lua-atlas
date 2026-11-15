---@meta
-- FS25 1.25.1.0 : triggers/ShopTrigger.lua (generated stub, FS25 Lua Atlas)

---@class ShopTrigger
ShopTrigger = {}

---@class ShopTriggerActivatable
ShopTriggerActivatable = {}

---@param id integer
function ShopTrigger:onCreate(id) end

---@param node integer
---@return table
function ShopTrigger.new(node) end

function ShopTrigger:delete() end

function ShopTrigger:openShop() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function ShopTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

function ShopTrigger:updateIconVisibility() end

---@param player any
function ShopTrigger:playerFarmChanged(player) end

function ShopTrigger:onTriggerVisibilityChanged() end

---@param shopTrigger any
function ShopTriggerActivatable.new(shopTrigger) end

function ShopTriggerActivatable:getIsActivatable() end

function ShopTriggerActivatable:run() end
