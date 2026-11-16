---@meta
-- FS25 1.25.1.0 : triggers/TransportMissionTrigger.lua (generated stub, FS25 Lua Atlas)

--- Map trigger node used by transport missions: it registers itself with the mission manager and forwards object enter and leave events to the mission currently assigned to it. The assignment method setMission is called in the constructor but not defined in this file (UNVERIFIED, probably in a gap of the dump). It reads a user attribute named index from the node.
---@class TransportMissionTrigger
TransportMissionTrigger = {}

--- Map-load entry point for a transport mission trigger node: builds a TransportMissionTrigger and adds it to the mission's non-updateable objects.
---@param id integer
function TransportMissionTrigger:onCreate(id) end

--- Creates the trigger: reads the `index` user attribute, registers the physics callback, enables it, registers with g_missionManager and calls setMission(nil) to hide it until a mission is assigned.
---@param id integer
---@return table
function TransportMissionTrigger.new(id) end

--- Removes the physics trigger and unregisters itself from the mission manager.
function TransportMissionTrigger:delete() end

--- If enabled and a mission is assigned, forwards enter events to mission:objectEnteredTrigger and leave events to mission:objectLeftTrigger with the trigger and the other node id.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function TransportMissionTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
