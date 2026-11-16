# vehicles/specializations/PowerTakeOffs.lua

*[Version française](../../../fr/scripts/vehicles/specializations/PowerTakeOffs.md)*

Source: `dataS/scripts/vehicles/specializations/PowerTakeOffs.lua` — FS25 1.25.1.0

✍ Specialization that builds and animates the visible PTO shafts. Output PTOs sit on a vehicle with attacher joints, input PTOs on an attachable, and local PTOs link two nodes of one vehicle. It requires AttacherJoints or Attachable, reads vehicle.powerTakeOffs (optionally per configuration), and loads the shaft model from a PTO XML/i3d file in three flavours: single joint, double joint or basic. It is mostly client-side visuals, linked to attach and detach events. PowerTakeOffs.DEFAULT_MAX_UPDATE_DISTANCE is used but not defined in the dump (UNVERIFIED).

- **PowerTakeOffs** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PowerTakeOffs.prerequisitesPresent(specializations: any)` | 18 | ✍ Returns true if the vehicle type has AttacherJoints or Attachable. |
| `PowerTakeOffs.initSpecialization()` | 25 | ✍ Registers the vehicle XML keys (output/input/local, ignoreInvalidJointIndices, maxUpdateDistance, sounds, moving part/tool PTO indices, dashboard index) and builds a separate XML schema for PTO shaft files (nodes, size, min length, max angle, materials, joint parts). |
| `PowerTakeOffs.registerXMLPaths(schema: any, basePath: any)` | 98 | ✍ Registers the output, input and local PTO XML paths below a given base path. |
| `PowerTakeOffs.registerOutputXMLPaths(schema: any, basePath: any)` | 106 | ✍ Registers XML attributes of an output PTO: output node, attacher joints (by index or node), ptoName, skip-to-input index, animation nodes, object changes and the dashboard state value. |
| `PowerTakeOffs.registerInputXMLPaths(schema: any, basePath: any)` | 120 | ✍ Registers XML attributes of an input PTO: input node, input attacher joints, detach node, aboveAttacher, material templates, predefined length, PTO config filename (default Walterscheid file), ptoName, animation nodes and object changes. |
| `PowerTakeOffs.registerFunctions(vehicleType: any)` | 153 | ✍ Adds the PTO API to the vehicle type: loaders, update, attach/detach, park, collision check, lookup by joint index and name, and the typed (single, double, basic) shaft functions. |
| `PowerTakeOffs.registerOverwrittenFunctions(vehicleType: any)` | 192 | ✍ Overrides loadExtraDependentParts and updateExtraDependentParts so moving parts and tools can drive PTO updates. |
| `PowerTakeOffs.registerEventListeners(vehicleType: any)` | 199 | ✍ Subscribes to onPreLoad, onLoad, onPostLoad, onDelete, onUpdateInterpolation, onUpdateEnd and the pre/post attach and pre detach implement events. |
| `PowerTakeOffs:onPreLoad(savegame: any)` | 213 | ✍ Stores the PTO configuration index returned by getPowerTakeOffConfigIndex. |
| `PowerTakeOffs:onLoad(savegame: any)` | 220 | ✍ Creates the output, input and local PTO tables, reads ignoreInvalidJointIndices and maxUpdateDistance, and on clients loads the turnedOn sounds. On a server without client it removes the interpolation listener. |
| `PowerTakeOffs:onPostLoad(savegame: any)` | 241 | ✍ Loads the PTOs from vehicle.powerTakeOffs, then from the selected configuration entry if it exists. Done after load so all attacher joints already exist. |
| `PowerTakeOffs:onDelete()` | 255 | ✍ Releases PTO XML files and shared i3d requests, deletes animation nodes and PTO nodes of outputs, inputs and local PTOs, and deletes the turnedOn sounds. |
| `PowerTakeOffs:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 322 | ✍ Client only, within maxUpdateDistance: updates input PTO shafts of connected vehicles in the same update loop, and those of attached implements. When the active state changes it starts or stops animations and the turnedOn sound. |
| `PowerTakeOffs:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 395 | ✍ Runs onUpdateInterpolation one last time before the physics goes to sleep. |
| `PowerTakeOffs:getPowerTakeOffConfigIndex()` | 402 | ✍ Returns 1 by default; meant to be overridden by a specialization that selects a PTO configuration. |
| `PowerTakeOffs:loadPowerTakeOffsFromXML(xmlFile: any, key: any)` | 408 | ✍ Iterates the output (if AttacherJoints), input (if Attachable) and local entries under a key and stores each successfully loaded PTO in its list. |
| `PowerTakeOffs:loadOutputPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffOutput: any)` | 439 | ✍ Loads one output PTO: output node (or skip-to-input index), attacher joints by index or node, name, animations and object changes, and registers a dashboard 'powerTakeOffs.state' value. Returns false if nothing valid is configured. |
| `PowerTakeOffs:loadInputPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffInput: any)` | 518 | ✍ Loads one input PTO: input node, input attacher joints, optional detach node (when Platform.gameplay.hasDetachedPowerTakeOffs), materials, name, animations, object changes and the shaft config file. Returns false without valid node or joints. |
| `PowerTakeOffs:loadLocalPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffLocal: any)` | 588 | ✍ Loads a local PTO between startNode and endNode of the same vehicle, with optional materials and predefined length, then loads its shaft config file. Returns false if a node is missing. |
| `PowerTakeOffs:placeLocalPowerTakeOff(powerTakeOff: any)` | 618 | ✍ Once the i3d is loaded, links the shaft to the end node the first time, computes its length, then updates its pose. |
| `PowerTakeOffs:updatePowerTakeOff(input: any, dt: any)` | 636 | ✍ Calls the shaft's own update function (single or double joint) if its i3d is loaded and it is linked or placed. |
| `PowerTakeOffs:updateAttachedPowerTakeOffs(dt: any, attacherVehicle: any)` | 646 | ✍ Updates the input PTO shafts of this implement that are connected to the given attacher vehicle, when both share the same update loop index. |
| `PowerTakeOffs:updatePowerTakeOffLength(input: any)` | 661 | ✍ Recomputes the shaft length through its distance function when the i3d is loaded. |
| `PowerTakeOffs:getOutputPowerTakeOffsByJointDescIndex(jointDescIndex: any)` | 671 | ✍ Returns the output PTOs linked to an attacher joint index. If one is a skip-to-input entry, the lookup is redirected to the attacher vehicle of this vehicle. |
| `PowerTakeOffs:getOutputPowerTakeOffs()` | 699 | ✍ Returns the table of output PTOs. |
| `PowerTakeOffs:getInputPowerTakeOffsByJointDescIndexAndName(jointDescIndex: any, ptoName: any)` | 705 | ✍ Returns input PTOs matching an input joint index and a PTO name. If none, follows skip-to-input outputs to the next implement in the chain. |
| `PowerTakeOffs:getInputPowerTakeOffs()` | 735 | ✍ Returns the table of input PTOs. |
| `PowerTakeOffs:getIsPowerTakeOffActive()` | 741 | ✍ Returns false by default; specializations override it to say when the shaft should animate and play sound. |
| `PowerTakeOffs:attachPowerTakeOff(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any)` | 747 | ✍ Pairs each output PTO of the joint with the matching input PTO (same ptoName) of the attached object and queues the mounting. Always returns true. |
| `PowerTakeOffs:detachPowerTakeOff(detachingVehicle: any, implement: any, jointDescIndex: any)` | 770 | ✍ Clears queued mountings, calls each connected input's detach function, stops output animations, resets the connections and turns off object changes. Always returns true. |
| `PowerTakeOffs:checkPowerTakeOffCollision(attacherJointNode: any, jointDescIndex: any, isTrailerAttacher: any)` | 809 | ✍ For trailer-type joints only, detaches the PTO if its output lies on the wrong side (below or above) of the attacher joint compared with the input's aboveAttacher setting. |
| `PowerTakeOffs:parkPowerTakeOff(input: any)` | 828 | ✍ Stores the shaft when unattached: hangs it on the detach node if there is one, otherwise hides both ends inside the vehicle. Resets the end offsets. |
| `PowerTakeOffs:onPreAttachImplement(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 854 | ✍ Calls attachPowerTakeOff just before an implement is attached. |
| `PowerTakeOffs:onPostAttachImplement(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 860 | ✍ After attach, runs the queued mountings for that joint: calls the input's attach function and enables the object changes of input and output. |
| `PowerTakeOffs:onPreDetachImplement(implement: any)` | 882 | ✍ Calls detachPowerTakeOff before an implement is detached and stops the turnedOn sound on clients. |
| `PowerTakeOffs:loadPowerTakeOffFromConfigFile(powerTakeOff: any, xmlFilename: any)` | 893 | ✍ Opens a PTO shaft XML file and requests its i3d asynchronously as a shared i3d, with onPowerTakeOffI3DLoaded as callback. Warns if the file or i3d name is missing. |
| `PowerTakeOffs:onPowerTakeOffI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 917 | ✍ Async callback: reads size, min length, max angle and offset, loads animations, applies materials, picks the single, double or basic loader, links the start node, parks or places the shaft, then deletes the temporary i3d node and XML file. |
| `PowerTakeOffs:loadSingleJointPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 982 | ✍ Loads the nodes of a single-joint shaft (joints, scale and translation parts, decal, link node), computes base lengths and sets the single-joint update, distance, attach and detach functions. |
| `PowerTakeOffs:updateSingleJointPowerTakeOff(powerTakeOff: any, dt: any)` | 1018 | ✍ Orients the start joint toward the link node, sets the end joint distance, and scales the scale part to match the span. |
| `PowerTakeOffs:loadDoubleJointPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 1033 | ✍ Loads the nodes of a double-joint shaft (two start and two end joints, scale and translation parts, decal, link node) and sets its update, distance, attach and detach functions. |
| `PowerTakeOffs:updateDoubleJointPowerTakeOff(powerTakeOff: any, dt: any)` | 1073 | ✍ Orients the four joints so both universal joints share the bend, sets the end joint distance and scales the scale part. |
| `PowerTakeOffs:loadBasicPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 1098 | ✍ Loads a basic shaft: only start and link nodes, with the typed attach and detach functions and no update function. |
| `PowerTakeOffs:updateDistanceOfTypedPowerTakeOff(powerTakeOff: any)` | 1108 | ✍ Scales the telescopic translation part to the current start-to-link distance (or predefined length) and fits or hides the decal depending on the available length. |
| `PowerTakeOffs:attachTypedPowerTakeOff(powerTakeOff: any, output: any)` | 1130 | ✍ If the attachment is valid, links the shaft between the output node and the input node, sets offsets, updates pose and length, shows it and marks it linked. |
| `PowerTakeOffs:detachTypedPowerTakeOff(powerTakeOff: any, output: any)` | 1150 | ✍ Parks the shaft via parkPowerTakeOff when it is detached. |
| `PowerTakeOffs:validatePowerTakeOffAttachment(powerTakeOff: any, output: any)` | 1156 | ✍ Returns false if a node is missing, the output-to-input distance is below minLength, or the vertical angle exceeds maxAngle; otherwise true. |
| `PowerTakeOffs:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1180 | ✍ After the parent loader, reads the powerTakeOffs#indices and #localIndices lists on a moving part or tool. Returns false if the parent failed. |
| `PowerTakeOffs:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1208 | ✍ After the parent update, refreshes the listed input and local PTOs of the part; an unknown index is dropped with a warning once loading has finished. |
| `PowerTakeOffs.consoleCommandTestConnection(vehicle: any, attacherJointIndex: any)` | 1242 | ✍ Debug console handler: for one attacher joint index, shows a magenta test shaft, object changes, a debug line and a label on matching outputs, and clears them on the others. |
| `PowerTakeOffs.consoleCommandDebug(_: any)` | 1295 | ✍ Debug console handler: lays out every PTO shaft XML found under data/shared/assets/powerTakeOffs in front of the player in three variants (plain, colored, animated and moving), using dummy vehicle objects. Replaces any previous debug set. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getPowerTakeOffConfigIndex` | 154 |
| registerFunction | `loadPowerTakeOffsFromXML` | 155 |
| registerFunction | `loadOutputPowerTakeOff` | 156 |
| registerFunction | `loadInputPowerTakeOff` | 157 |
| registerFunction | `loadLocalPowerTakeOff` | 158 |
| registerFunction | `placeLocalPowerTakeOff` | 159 |
| registerFunction | `updatePowerTakeOff` | 160 |
| registerFunction | `updateAttachedPowerTakeOffs` | 161 |
| registerFunction | `updatePowerTakeOffLength` | 162 |
| registerFunction | `getOutputPowerTakeOffsByJointDescIndex` | 163 |
| registerFunction | `getOutputPowerTakeOffs` | 164 |
| registerFunction | `getInputPowerTakeOffs` | 165 |
| registerFunction | `getInputPowerTakeOffsByJointDescIndexAndName` | 166 |
| registerFunction | `getIsPowerTakeOffActive` | 167 |
| registerFunction | `attachPowerTakeOff` | 168 |
| registerFunction | `detachPowerTakeOff` | 169 |
| registerFunction | `checkPowerTakeOffCollision` | 170 |
| registerFunction | `parkPowerTakeOff` | 171 |
| registerFunction | `loadPowerTakeOffFromConfigFile` | 173 |
| registerFunction | `onPowerTakeOffI3DLoaded` | 174 |
| registerFunction | `loadSingleJointPowerTakeOff` | 176 |
| registerFunction | `updateSingleJointPowerTakeOff` | 177 |
| registerFunction | `loadDoubleJointPowerTakeOff` | 179 |
| registerFunction | `updateDoubleJointPowerTakeOff` | 180 |
| registerFunction | `loadBasicPowerTakeOff` | 182 |
| registerFunction | `attachTypedPowerTakeOff` | 184 |
| registerFunction | `detachTypedPowerTakeOff` | 185 |
| registerFunction | `validatePowerTakeOffAttachment` | 187 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 193 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 194 |
| registerEventListener | `onPreLoad` | 200 |
| registerEventListener | `onLoad` | 201 |
| registerEventListener | `onPostLoad` | 202 |
| registerEventListener | `onDelete` | 203 |
| registerEventListener | `onUpdateInterpolation` | 204 |
| registerEventListener | `onUpdateEnd` | 205 |
| registerEventListener | `onPreAttachImplement` | 206 |
| registerEventListener | `onPostAttachImplement` | 207 |
| registerEventListener | `onPreDetachImplement` | 208 |
