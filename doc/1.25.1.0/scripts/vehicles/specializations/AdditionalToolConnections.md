# vehicles/specializations/AdditionalToolConnections.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AdditionalToolConnections.md)*

Source: `dataS/scripts/vehicles/specializations/AdditionalToolConnections.lua` — FS25 1.25.1.0

✍ Specialization for tools that have a moving part which must follow an extra connection point on the tractor's attacher joint (for example a second link arm). The tool declares vehicle.additionalToolConnections.connection entries with an id and a movingPartNode; the attacher joint declares additionalToolConnection entries with the same id and a target node. It requires AttacherJoints or Attachable. On attach the moving part's reference node is switched and object changes are enabled; on detach they are reverted.


## Functions

| Function | Line | Description |
|---|---|---|
| `AdditionalToolConnections.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true if the vehicle type has either AttacherJoints or Attachable. |
| `AdditionalToolConnections.initSpecialization()` | 24 | ✍ Registers the XML keys for the tool-side connections (id, movingPartNode, object changes) and, through a delayed registration, the additionalToolConnection id/node keys on each attacher joint. |
| `AdditionalToolConnections.registerFunctions(vehicleType: any)` | 42 | ✍ Empty: registers no new vehicle function. |
| `AdditionalToolConnections.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Overrides loadAttacherJointFromXML so that attacher joints also read their additional connections. |
| `AdditionalToolConnections.registerEventListeners(vehicleType: any)` | 53 | ✍ Subscribes to onPostLoad, onPostAttach and onPreDetach. |
| `AdditionalToolConnections:onPostLoad(savegame: any)` | 61 | ✍ Reads each connection, looks up its moving part and stores id, node and object changes (initially disabled). Logs an XML warning when the id, node or moving part is missing. |
| `AdditionalToolConnections:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer, ...: any)` | 95 | ✍ Override: calls the parent loader and, if it succeeds, fills attacherJoint.additionalToolConnections with id to node pairs. Returns false when the parent fails. |
| `AdditionalToolConnections:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: boolean)` | 120 | ✍ For each tool connection whose id exists on the used attacher joint, points the moving part's reference node at the joint's node and enables the object changes. |
| `AdditionalToolConnections:onPreDetach(attacherVehicle: table, implement: table)` | 141 | ✍ Before detaching, clears the reference node of every connection's moving part and disables the object changes. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 48 |
| registerEventListener | `onPostLoad` | 54 |
| registerEventListener | `onPostAttach` | 55 |
| registerEventListener | `onPreDetach` | 56 |
