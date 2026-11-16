---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIDischargeable.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles that unload material under AI control. In this dump almost the whole file is empty: only two functions remain, so the rest of the behaviour (spec_aiDischargeable fields, the stoppedAIDischarge function, registrations) is UNVERIFIED. The visible code overrides automatic discharge during AI work and reacts to the discharge state returning to OFF.
---@class AIDischargeable
AIDischargeable = {}

--- Override: returns false while the AI is active and the platform enables automatic discharge, because the AI triggers unloading itself at the unloading point; otherwise defers to the parent function.
---@param superFunc any
---@param dischargeNode any
function AIDischargeable:getDischargeNodeAutomaticDischarge(superFunc, dischargeNode) end

--- Event handler: when an AI discharge is running with a current discharge node and the state goes back to DISCHARGE_STATE_OFF, calls stoppedAIDischarge (defined outside the visible dump, UNVERIFIED).
---@param state any
function AIDischargeable:onDischargeStateChanged(state) end
