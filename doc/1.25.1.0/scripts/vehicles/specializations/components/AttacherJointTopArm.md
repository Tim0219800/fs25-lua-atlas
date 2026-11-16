# vehicles/specializations/components/AttacherJointTopArm.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/AttacherJointTopArm.md)*

Source: `dataS/scripts/vehicles/specializations/components/AttacherJointTopArm.lua` — FS25 1.25.1.0

✍ Visual top link (upper link) of a three-point attacher joint. It can be loaded from a shared XML/i3d asset linked to a vehicle node, or built from nodes already in the vehicle, and it re-aims itself at a target node each update, stretching its translation and scale parts to match the distance. It also applies brand material templates and object changes. Purely cosmetic and client-side; `RENAMED_UPPER_LINKS` and `xmlSchema` are used here but not defined in this file (UNVERIFIED where they are set).

- **AttacherJointTopArm** (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `AttacherJointTopArm.new(vehicle: any, customMt: any)` | 27 | ✍ Creates a top arm object bound to a vehicle with default settings: z scale -1, mount arm and brand decal enabled, no visibility toggle, empty component and change-object tables. |
| `AttacherJointTopArm:delete()` | 45 | ✍ Deletes the top arm node and releases the shared i3d load request if any. |
| `AttacherJointTopArm:setCallback(callback: any, callbackTarget: any)` | 59 | ✍ Stores a callback (and optional target) that is invoked with the success flag when loading finishes. |
| `AttacherJointTopArm:onFinished(success: any)` | 66 | ✍ Called when loading ends: deletes the temporary XML file, runs `finalize` and then calls the registered callback with the success flag. |
| `AttacherJointTopArm.loadFromVehicleXML(vehicle: any, key: any)` | 85 | ✍ Builds a top arm from a vehicle XML key: either from `#baseNode` plus `#filename` (an XML asset, with warnings for i3d paths and renamed upper links) or from existing `#rotationNode`/`#translationNode` nodes. Then reads zScale, visibility, mount arm, material templates and object changes. Returns the top arm or nil. |
| `AttacherJointTopArm:loadFromXML(linkNode: any, xmlFilename: any, baseDirectory: any)` | 144 | ✍ Loads the top arm definition XML, reads its i3d filename and starts the asynchronous shared i3d load (via the vehicle when present). Returns false and finishes with failure if the XML or filename is missing. |
| `AttacherJointTopArm:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 180 | ✍ Async i3d callback: links the root node under the link node, resolves translation, scale, decal and mount-arm nodes, hides unused parts and applies brand materials. Note: the decal material built from the brightness of the main material is never assigned to `self.decalMaterial`, so it has no effect. |
| `AttacherJointTopArm:finalize()` | 258 | ✍ Computes the reference distance and default translation of the translating part, and the reference length of the scaled part, used later by `update`. |
| `AttacherJointTopArm:setIsActive(isActive: any)` | 273 | ✍ Switches between attached and detached pose: sets mount-arm rotation, optionally toggles visibility, resets rotation, translation and scale when inactive, and applies the configured object changes. |
| `AttacherJointTopArm:update(dt: any, targetNode: any)` | 300 | ✍ Aims the top arm node at `targetNode` (direction plus an up vector depending on whether the node is in the front or rear half of the vehicle) and adjusts translation and scale to the current distance. |
| `AttacherJointTopArm.registerVehicleXMLPaths(schema: any, baseKey: any)` | 334 | ✍ Registers the vehicle-side XML paths for a top arm (filename, baseNode, zScale, visibility, mount arm, material templates, decal, fallback nodes) plus object-change paths. |
| `AttacherJointTopArm.registerXMLPaths(schema: any)` | 360 | ✍ Registers the XML paths of the top arm asset file (`topArm.*`: filename, root, translation, scale, brand decal and mount arm nodes) and i3d mappings. |
