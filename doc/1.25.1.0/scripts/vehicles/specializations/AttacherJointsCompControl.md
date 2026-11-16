# vehicles/specializations/AttacherJointsCompControl.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AttacherJointsCompControl.md)*

Source: `dataS/scripts/vehicles/specializations/AttacherJointsCompControl.lua` — FS25 1.25.1.0

✍ Vehicle specialization that stiffens or softens the translation springs of a chosen component joint depending on the mass of the implement hanging on an attacher joint. It requires the AttacherJoints specialization. It adds a `dependentComponentJoint` block to each attacher joint in the vehicle XML and smooths changes with a ValueInterpolator. Everything runs on the server only.


## Functions

| Function | Line | Description |
|---|---|---|
| `AttacherJointsCompControl.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type includes the AttacherJoints specialization. |
| `AttacherJointsCompControl.initSpecialization()` | 25 | ✍ Registers the XML schema entries for the `dependentComponentJoint` block of an attacher joint: joint index, spring and damping factors, reference mass and attach/detach interpolation times. |
| `AttacherJointsCompControl.registerFunctions(vehicleType: any)` | 43 | ✍ Registers the three vehicle functions of this specialization: setDependentComponentJointBaseFactors, addDependentComponentJointData and updateDependentComponentJointValues. |
| `AttacherJointsCompControl.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Overrides `addToPhysics` and `loadAttacherJointFromXML` on the vehicle type so the joint factors are initialised and read from XML. |
| `AttacherJointsCompControl.registerEventListeners(vehicleType: any)` | 58 | ✍ Subscribes the vehicle to the `onPreLoad` and `onStateChange` events. |
| `AttacherJointsCompControl:onPreLoad(savegame: table)` | 66 | ✍ Creates the empty table of dependent joint data. On a non-server instance it removes the `onStateChange` listener, since the logic is server only. |
| `AttacherJointsCompControl:onStateChange(state: any, data: any)` | 78 | ✍ On an ATTACH or DETACH vehicle state change, recomputes the dependent joint spring and damping factors. |
| `AttacherJointsCompControl:setDependentComponentJointBaseFactors(componentJointIndex: any, transSpringFactor: any, transDampingFactor: any, overwrite: any)` | 86 | ✍ Server only. Sets the base spring and damping factors of a component joint, either replacing them or multiplying the current ones, so other code can scale the joint independently of attached tools. |
| `AttacherJointsCompControl:addDependentComponentJointData(componentJointIndex: any)` | 103 | ✍ Gets or creates the data record for a component joint index, with getter and setter callbacks that apply spring and damping factors to the three translation limits. Returns nil and logs an XML warning if the index is unknown. |
| `AttacherJointsCompControl:updateDependentComponentJointValues(forceUpdate: any, skipInterpolation: any)` | 155 | ✍ Recomputes target factors from the mass of each attached implement (capped at the reference mass) and starts a ValueInterpolator, or applies them at once if `skipInterpolation` is set. Note: the detach test compares the damping target with itself, so its damping half is always true. |
| `AttacherJointsCompControl:addToPhysics(superFunc: any) → boolean` | 204 | ✍ Calls the parent function and, on the server, immediately applies the joint factors without interpolation. Returns false if the parent failed. |
| `AttacherJointsCompControl:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer)` | 222 | ✍ After the parent load, on the server only, reads the `dependentComponentJoint` block of the attacher joint and stores its factors, reference mass and interpolation times. Returns false if the parent failed. |
| `AttacherJointsCompControl:updateDebugValues(values: any)` | 250 | ✍ Adds debug display rows: implement mass against reference mass, spring and damping factors per attacher joint, and base and current factors per component joint. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setDependentComponentJointBaseFactors` | 44 |
| registerFunction | `addDependentComponentJointData` | 45 |
| registerFunction | `updateDependentComponentJointValues` | 46 |
| registerOverwrittenFunction | `addToPhysics` | 52 |
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 53 |
| registerEventListener | `onPreLoad` | 59 |
| registerEventListener | `onStateChange` | 60 |
