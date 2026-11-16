# objects/WashingStation.lua

*[Version française](../../fr/scripts/objects/WashingStation.md)*

Source: `dataS/scripts/objects/WashingStation.lua` — FS25 1.25.1.0

✍ Washing station for vehicles: this file only declares the XML schema (trigger node, wash duration, price per wash, sounds, effects) and an activatable that lets a player start a wash. The wash itself (startWashing, effects, payment) is not in this file and is UNVERIFIED here. It extends Object.

- **WashingStation** inherits from `Object` (l.13)
- **WashingStationActivatable** (l.244)

## Functions

| Function | Line | Description |
|---|---|---|
| `WashingStation.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Registers the XML paths: vehicle trigger node, `#washDuration`, `#pricePerWash`, the `active` sound sample paths and the effect paths under `.effects`. |
| `WashingStationActivatable.new(washingStation: any, triggerNode: any)` | 248 | ✍ Creates an activatable for a washing station and its trigger node, with the localized `action_startWashing` text as prompt. |
| `WashingStationActivatable:getIsActivatable()` | 260 | ✍ Returns whether the local player's farm may access the washing station according to the mission access handler. |
| `WashingStationActivatable:run()` | 266 | ✍ Client side: sends a `WashingStationEvent` for this station to the server connection. |
| `WashingStationActivatable:getDistance(x: any, y: any, z: any)` | 272 | ✍ Returns the distance from the given point to the trigger node's world position. |
