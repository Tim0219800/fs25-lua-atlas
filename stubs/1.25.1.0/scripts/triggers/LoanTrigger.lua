---@meta
-- FS25 1.25.1.0 : triggers/LoanTrigger.lua (stub généré, atlas Lua FS25)

---@class LoanTrigger
LoanTrigger = {}

---@class LoanTriggerActivatable
LoanTriggerActivatable = {}

---@param id integer
function LoanTrigger:onCreate(id) end

---@param name integer
---@return table
function LoanTrigger.new(name) end

function LoanTrigger:delete() end

function LoanTrigger:openFinanceMenu() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function LoanTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

function LoanTrigger:updateIconVisibility() end

---@param player any
function LoanTrigger:playerFarmChanged(player) end

---@param loanTrigger any
function LoanTriggerActivatable.new(loanTrigger) end

function LoanTriggerActivatable:getIsActivatable() end

function LoanTriggerActivatable:run() end
