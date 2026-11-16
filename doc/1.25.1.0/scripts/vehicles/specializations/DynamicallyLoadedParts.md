# vehicles/specializations/DynamicallyLoadedParts.lua

*[Version française](../../../fr/scripts/vehicles/specializations/DynamicallyLoadedParts.md)*

Source: `dataS/scripts/vehicles/specializations/DynamicallyLoadedParts.lua` — FS25 1.25.1.0

✍ Vehicle specialization with no prerequisites that loads extra i3D files at vehicle load time and attaches a chosen node from each one to a node of the vehicle (for example wheel chocks). Each part is declared under vehicle.dynamicallyLoadedParts in the vehicle XML. Loading goes through the shared i3D system and is asynchronous.

- **DynamicallyLoadedParts** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `DynamicallyLoadedParts.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: this specialization can be added to any vehicle type. |
| `DynamicallyLoadedParts.initSpecialization()` | 21 | ✍ Registers the XML schema keys of each dynamicallyLoadedPart: filename, node, linkNode, position, rotationNode, rotation, shaderParameterName and shaderParameter. |
| `DynamicallyLoadedParts.registerFunctions(vehicleType: any)` | 40 | ✍ Registers the vehicle function onDynamicallyPartI3DLoaded, used as the callback when an i3D part finishes loading. |
| `DynamicallyLoadedParts.registerEventListeners(vehicleType: any)` | 46 | ✍ Subscribes the specialization to the onLoad and onDelete vehicle events. |
| `DynamicallyLoadedParts:onLoad(savegame: any)` | 53 | ✍ Iterates the dynamicallyLoadedPart XML entries and starts a shared sub-i3D load for each one that has a filename, remembering the request ids. Entries without a filename produce an XML warning. |
| `DynamicallyLoadedParts:onDelete()` | 79 | ✍ Releases every shared i3D load request made in onLoad and clears the list. |
| `DynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 92 | ✍ Load callback: finds the part node and the link node, refuses link nodes that are already runtime-loaded references, applies position, rotation and an optional shader parameter, links the node to the vehicle and deletes the loaded root. Returns true on success, false/nil on failure. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onDynamicallyPartI3DLoaded` | 41 |
| registerEventListener | `onLoad` | 47 |
| registerEventListener | `onDelete` | 48 |
