# placeables/specializations/rollercoaster/RollercoasterActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/rollercoaster/RollercoasterActivatable.md)*

Source: `dataS/scripts/placeables/specializations/rollercoaster/RollercoasterActivatable.lua` — FS25 1.25.1.0

✍ Activatable object that lets the local player ride a rollercoaster placeable: it shows the localized ride action text and, when triggered, sends a request event to the server. It has no base class and relies on `getCanEnter` and `getFreeSeatIndex` of the rollercoaster.

- **RollercoasterActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `RollercoasterActivatable.new(rollercoaster: table)` | 16 | ✍ Creates the activatable for a rollercoaster and loads the `action_rideRollercoaster` text as activate text. |
| `RollercoasterActivatable:getIsActivatable()` | 27 | ✍ Returns whether the rollercoaster currently accepts a new passenger, via its `getCanEnter`. |
| `RollercoasterActivatable:run()` | 33 | ✍ If entry is allowed and a free seat exists, sends a RollercoasterPassengerEnterRequestEvent for `g_localPlayer` to the server connection. The seat index is only checked locally; the server picks the final seat. |
