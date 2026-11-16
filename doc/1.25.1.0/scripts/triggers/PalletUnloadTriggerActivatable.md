# triggers/PalletUnloadTriggerActivatable.lua

*[Version française](../../fr/scripts/triggers/PalletUnloadTriggerActivatable.md)*

Source: `dataS/scripts/triggers/PalletUnloadTriggerActivatable.lua` — FS25 1.25.1.0

✍ Activatable (interaction prompt) used by PalletUnloadTrigger when automatic unloading is off. It shows an unload action while pallets are in range and the local player, or the vehicle the player drives, is in the trigger. Client side.

- **PalletUnloadTriggerActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PalletUnloadTriggerActivatable.new(palletUnloadTrigger: any)` | 15 | ✍ Creates the activatable for the owning pallet trigger, with the localized text of button_unload. |
| `PalletUnloadTriggerActivatable:getIsActivatable()` | 26 | ✍ Returns true only if the owner is enabled, no GUI is open, the player may access the owner, at least one pallet is in range, and the player is in range on foot or driving a vehicle in range. |
| `PalletUnloadTriggerActivatable:run()` | 61 | ✍ Runs the action by calling unloadPallets on the owner with the local farm id. |
| `PalletUnloadTriggerActivatable:getDistance(x: any, y: any, z: any)` | 68 | ✍ Returns the distance from the given world position to the owner's trigger node, or math.huge if the owner has no trigger node. |
