---@meta
-- FS25 1.25.1.0 : objects/HelpIcons.lua (generated stub, FS25 Lua Atlas)

---@class HelpIcons
HelpIcons = {}

---@param id integer
function HelpIcons:onCreate(id) end

---@param name integer
---@return table
function HelpIcons.new(name) end

function HelpIcons:delete() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function HelpIcons:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param visible boolean
---@param clearIconStates boolean
function HelpIcons:showHelpIcons(visible, clearIconStates) end

---@param i integer
function HelpIcons:deleteHelpIcon(i) end
