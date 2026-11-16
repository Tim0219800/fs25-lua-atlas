# vehicles/specializations/ManureBarrel.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ManureBarrel.md)*

Source: `dataS/scripts/vehicles/specializations/ManureBarrel.lua` — FS25 1.25.1.0

✍ Specialization for liquid manure barrels that can carry a spreading tool on one attacher joint. Requires Sprayer and AttacherJoints. While a tool is attached on the configured joint (`vehicle.manureBarrel#attacherJointIndex`), the barrel's own spreading effects and work areas are disabled so the attached tool does the work. No network code of its own.

- **ManureBarrel** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ManureBarrel.prerequisitesPresent(specializations: any)` | 15 | ✍ Returns true only if both Sprayer and AttacherJoints specializations are present. |
| `ManureBarrel.initSpecialization()` | 21 | ✍ Registers the XML path `vehicle.manureBarrel#attacherJointIndex`. |
| `ManureBarrel.registerOverwrittenFunctions(vehicleType: any)` | 32 | ✍ Overrides `getAreEffectsVisible` and `getIsWorkAreaActive`. |
| `ManureBarrel.registerEventListeners(vehicleType: any)` | 39 | ✍ Subscribes to onLoad, onPostAttachImplement and onPostDetachImplement. |
| `ManureBarrel:onLoad(savegame: any)` | 47 | ✍ Reads the attacher joint index of the tool joint and warns about the deprecated `toolAttachAnimName` element. |
| `ManureBarrel:onPostAttachImplement(attachable: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 57 | ✍ Remembers the attached implement when it is attached to the configured tool joint. |
| `ManureBarrel:onPostDetachImplement(implementIndex: any)` | 66 | ✍ Clears the remembered tool when the implement on the configured tool joint is detached. |
| `ManureBarrel:getAreEffectsVisible(superFunc: any)` | 84 | ✍ Override: returns false while a tool is attached on the tool joint, otherwise defers to the parent. |
| `ManureBarrel:getIsWorkAreaActive(superFunc: any, workArea: any)` | 96 | ✍ Override: returns false while a tool is attached on the tool joint, otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getAreEffectsVisible` | 33 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onPostAttachImplement` | 41 |
| registerEventListener | `onPostDetachImplement` | 42 |
