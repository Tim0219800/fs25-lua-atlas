# vehicles/specializations/IKChains.lua

*[Version française](../../../fr/scripts/vehicles/specializations/IKChains.md)*

Source: `dataS/scripts/vehicles/specializations/IKChains.lua` — FS25 1.25.1.0

✍ Vehicle specialization that loads inverse kinematics chains from vehicle.ikChains and updates them every frame through the IKUtil helper. Used to pose articulated parts such as arms or hoses between targets. The solving itself is in IKUtil, which is not covered here (UNVERIFIED).

- **IKChains** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `IKChains.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no prerequisite on other specializations. |
| `IKChains.initSpecialization()` | 21 | ✍ Registers the XML paths of an IK chain under vehicle.ikChains.ikChain through IKUtil. |
| `IKChains.registerEventListeners(vehicleType: any)` | 30 | ✍ Subscribes the specialization to onLoad and onUpdate. |
| `IKChains:onLoad(savegame: any)` | 37 | ✍ Loads every ikChain entry with IKUtil into the specialization's chain list. If none was loaded, removes the onUpdate listener. |
| `IKChains:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 58 | ✍ Each frame, asks IKUtil to update all loaded IK chains of the vehicle. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onUpdate` | 32 |
