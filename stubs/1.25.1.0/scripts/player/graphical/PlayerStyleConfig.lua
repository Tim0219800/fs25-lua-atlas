---@meta
-- FS25 1.25.1.0 : player/graphical/PlayerStyleConfig.lua (generated stub, FS25 Lua Atlas)

---@class PlayerStyleConfig
PlayerStyleConfig = {}

---@param index integer
---@return boolean
function PlayerStyleConfig:ENABLED_GETTER_FILTER(index) end

---@param index integer
---@param gear PlayerStyleItem
---@return boolean
function PlayerStyleConfig:NOT_HIDDEN_GETTER_FILTER(index, gear) end

---@param index integer
---@param hair PlayerStyleItem
---@return boolean
function PlayerStyleConfig:NOT_FOR_HAT_GETTER_FILTER(index, hair) end

---@param index integer
---@return boolean
function PlayerStyleConfig:SELECTED_GETTER_FILTER(index) end

---@param index integer
---@return boolean
function PlayerStyleConfig:NO_ONEPIECE_GETTER_FILTER(index) end

---@param index integer
---@param beard PlayerStyleItem
---@return boolean
function PlayerStyleConfig:BEARD_FACE_GETTER_FILTER(index, beard) end

---@param itemName string
---@return integer
function PlayerStyleConfig:getItemNameIndex(itemName) end

---@param item PlayerStyleItem
---@return integer
function PlayerStyleConfig:getItemIndex(item) end

---@return PlayerStyleItem
function PlayerStyleConfig:getSelectedItem() end
