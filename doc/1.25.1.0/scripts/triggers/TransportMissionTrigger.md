# triggers/TransportMissionTrigger.lua

*[Version française](../../fr/scripts/triggers/TransportMissionTrigger.md)*

Source: `dataS/scripts/triggers/TransportMissionTrigger.lua` — FS25 1.25.1.0

✍ Map trigger node used by transport missions: it registers itself with the mission manager and forwards object enter and leave events to the mission currently assigned to it. The assignment method setMission is called in the constructor but not defined in this file (UNVERIFIED, probably in a gap of the dump). It reads a user attribute named index from the node.

- **TransportMissionTrigger** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `TransportMissionTrigger:onCreate(id: integer)` | 19 | ✍ Map-load entry point for a transport mission trigger node: builds a TransportMissionTrigger and adds it to the mission's non-updateable objects. |
| `TransportMissionTrigger.new(id: integer) → table` | 27 | ✍ Creates the trigger: reads the `index` user attribute, registers the physics callback, enables it, registers with g_missionManager and calls setMission(nil) to hide it until a mission is assigned. |
| `TransportMissionTrigger:delete()` | 47 | ✍ Removes the physics trigger and unregisters itself from the mission manager. |
| `TransportMissionTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 71 | ✍ If enabled and a mission is assigned, forwards enter events to mission:objectEnteredTrigger and leave events to mission:objectLeftTrigger with the trigger and the other node id. |
