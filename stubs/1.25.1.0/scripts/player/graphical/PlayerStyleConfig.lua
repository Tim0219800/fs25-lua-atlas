---@meta
-- FS25 1.25.1.0 : player/graphical/PlayerStyleConfig.lua (generated stub, FS25 Lua Atlas)

--- Represents one slot of a PlayerStyle (face, beard, top and so on) with its item list, selected item and colour. It also defines the getter filters that decide which items of a slot are currently usable. Most of the class body (constructor, XML loading, streams) is absent from the SDK dump; only the filters and lookup helpers are documented.
---@class PlayerStyleConfig
PlayerStyleConfig = {}

--- Filter: returns true unless the owning style has marked this config as disabled for the current selection.
---@param index integer
---@return boolean
function PlayerStyleConfig:ENABLED_GETTER_FILTER(index) end

--- Filter: accepts an item only if its hidden flag is not set.
---@param index integer
---@param gear PlayerStyleItem
---@return boolean
function PlayerStyleConfig:NOT_HIDDEN_GETTER_FILTER(index, gear) end

--- Filter: accepts a hair style only if it is not the variant meant to be worn under a hat.
---@param index integer
---@param hair PlayerStyleItem
---@return boolean
function PlayerStyleConfig:NOT_FOR_HAT_GETTER_FILTER(index, hair) end

--- Filter: accepts only the item whose index equals the currently selected item index.
---@param index integer
---@return boolean
function PlayerStyleConfig:SELECTED_GETTER_FILTER(index) end

--- Filter: returns true only when no one-piece outfit is selected (its selected index is 0), used by top and bottom.
---@param index integer
---@return boolean
function PlayerStyleConfig:NO_ONEPIECE_GETTER_FILTER(index) end

--- Filter: accepts a beard that has no face restriction, or whose face name matches the currently selected face item.
---@param index integer
---@param beard PlayerStyleItem
---@return boolean
function PlayerStyleConfig:BEARD_FACE_GETTER_FILTER(index, beard) end

--- Looks up an item by its name and returns its position in this config, or nil if the name is nil, blank or unknown.
---@param itemName string
---@return integer
function PlayerStyleConfig:getItemNameIndex(itemName) end

--- Gives the position of an item within this config, or nil when no item is passed or it is not found. The empty item at index 0 is handled as a special case.
---@param item PlayerStyleItem
---@return integer
function PlayerStyleConfig:getItemIndex(item) end

--- Returns the currently selected item, or nil if the selected index has no item.
---@return PlayerStyleItem
function PlayerStyleConfig:getSelectedItem() end
