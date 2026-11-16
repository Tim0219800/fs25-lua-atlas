---@meta
-- FS25 1.25.1.0 : triggers/LoanTrigger.lua (generated stub, FS25 Lua Atlas)

--- Map trigger (usually a bank) that lets the local player open the finances screen. It is only enabled in career missions (FSCareerMissionInfo) and shows a symbol, the first child of the trigger node, only to players belonging to a farm. Includes LoanTriggerActivatable, the on-foot interaction prompt. Client-side behaviour; the finances GUI itself is not in this file.
---@class LoanTrigger
LoanTrigger = {}

--- Map trigger (usually a bank) that lets the local player open the finances screen. It is only enabled in career missions (FSCareerMissionInfo) and shows a symbol, the first child of the trigger node, only to players belonging to a farm. Includes LoanTriggerActivatable, the on-foot interaction prompt. Client-side behaviour; the finances GUI itself is not in this file.
---@class LoanTriggerActivatable
LoanTriggerActivatable = {}

--- Map-load entry point for a loan trigger node: builds a LoanTrigger and adds it to the mission's non-updateable objects.
---@param id integer
function LoanTrigger:onCreate(id) end

--- Creates the trigger: on a client registers the physics callback, takes the first child node as the symbol, creates the activatable, subscribes to PLAYER_FARM_CHANGED and sets initial icon visibility.
---@param name integer
---@return table
function LoanTrigger.new(name) end

--- Unsubscribes from messages, removes the physics trigger if any, clears the symbol reference and removes the activatable.
function LoanTrigger:delete() end

--- Opens the InGameMenu and publishes GUI_INGAME_OPEN_FINANCES_SCREEN so the menu switches to the finances page.
function LoanTrigger:openFinanceMenu() end

--- On enter or leave of the local player's root node, adds or removes the activatable. Only acts when the trigger is enabled and the mission is a career mission.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function LoanTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Shows the symbol only if the trigger is enabled, the mission is a career and the local farm is not the spectator farm; hides it otherwise.
function LoanTrigger:updateIconVisibility() end

--- Message handler: refreshes the icon visibility when the farm of the local player changed; other players are ignored.
---@param player any
function LoanTrigger:playerFarmChanged(player) end

--- Creates the activatable bound to a loan trigger, with the localized text of action_checkFinances.
---@param loanTrigger any
function LoanTriggerActivatable.new(loanTrigger) end

--- Returns true when the trigger is enabled, the local player is not in a vehicle and the local farm is not the spectator farm.
function LoanTriggerActivatable:getIsActivatable() end

--- Runs the action by opening the finances menu through the owning trigger.
function LoanTriggerActivatable:run() end
