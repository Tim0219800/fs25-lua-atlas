# objects/SunAdmirer.lua

*[Version française](../../fr/scripts/objects/SunAdmirer.md)*

Source: `dataS/scripts/objects/SunAdmirer.lua` — FS25 1.25.1.0

✍ Map object whose node is visible only when the sun is out and it is not raining. It subscribes to the day/night message and optionally switches the collision mask with the visibility (user attribute `switchCollision`).

- **SunAdmirer** (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `SunAdmirer:onCreate(id: integer)` | 14 | ✍ i3d onCreate callback: creates the object for the node and registers it as a non-updateable in the current mission. |
| `SunAdmirer.new(id: integer) → table` | 22 | ✍ Constructor: reads the `switchCollision` user attribute (default false), stores the original collision mask if enabled, shows the node, and subscribes to `MessageType.DAY_NIGHT_CHANGED`. Note: `setVisibility` is not defined in this file (UNVERIFIED, probably defined elsewhere). |
| `SunAdmirer:delete()` | 41 | ✍ Unsubscribes this object from all message center subscriptions. |
| `SunAdmirer:onWeatherChanged()` | 55 | ✍ Message handler: when the mission environment exists, sets visibility to true only if the sun is on and the weather reports no rain. Weather internals are UNVERIFIED (class absent from the dump). |

## Messages

- subscribes `MessageType.DAY_NIGHT_CHANGED` (l.34)
