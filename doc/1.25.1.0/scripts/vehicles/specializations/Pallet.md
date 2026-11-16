# vehicles/specializations/Pallet.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Pallet.md)*

Source: `dataS/scripts/vehicles/specializations/Pallet.lua` — FS25 1.25.1.0

✍ Specialization for pallets and big bags whose visible content follows a fill unit. It has no prerequisites. It flags the vehicle as a pallet without player input, shows or hides content objects according to fill percentage, supplies mesh nodes for tension belts, can age-blend pallet textures, and counts toward the pallet slot limit. It is also loaded as an auto-loadable cargo item.

- **Pallet** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Pallet.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no other specialization is required. |
| `Pallet.initSpecialization()` | 23 | ✍ Registers the XML paths under vehicle.pallet (fill unit, shape node, link nodes, i3d file, textures, content objects, straps, unload sound) and the savegame pallet age. |
| `Pallet.registerFunctions(vehicleType: any)` | 54 | ✍ Registers five vehicle functions. Note: onPalletI3DFileLoaded and updatePalletStraps are registered from Pallet but no such functions are defined in this file, so those entries are nil. |
| `Pallet.registerOverwrittenFunctions(vehicleType: any)` | 64 | ✍ Overrides getMeshNodes, loadComponentFromXML, auto-load size and auto-load, vehicle overview and reset flags, map hotspot visibility and empty-on-reset. |
| `Pallet.registerEventListeners(vehicleType: any)` | 77 | ✍ Subscribes to pre-load, load, post-load, delete and fill unit fill level changed events. |
| `Pallet:onPreLoad(savegame: any)` | 87 | ✍ Sets isPallet to true and disables player input on the vehicle. |
| `Pallet:onLoad(savegame: table)` | 95 | ✍ Reads the XML: validates the shape node, optionally loads a shared visual pallet i3d into the link nodes, collects textures, the pallet age (random unless in shop config), content objects (hidden at start), straps and the unload sound. Registers with the pallet slot limit and sets fork joint limits. |
| `Pallet:onPostLoad(savegame: any)` | 227 | ✍ If textures are defined, applies one diffuse map to the pallet node, or blends two textures by the pallet age through a custom map and a blendScale parameter. |
| `Pallet:onDelete()` | 255 | ✍ Deletes the sound samples on the client, releases the shared i3d request and removes the pallet from the slot limit. |
| `Pallet:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 271 | ✍ Saves the pallet age to the savegame. |
| `Pallet:loadComponentFromXML(superFunc: any, component: any, xmlFile: any, key: any, rootPosition: any, i: any)` | 278 | ✍ If the platform has no dynamic pallets, turns a dynamic component into a kinematic rigid body, then calls the parent. |
| `Pallet:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 290 | ✍ Shows content objects in proportion to the fill percentage (at least one when non-empty), plays the unload sound when an object disappears and flags the tension belt nodes as dirty. |
| `Pallet:getMeshNodes(superFunc: any)` | 326 | ✍ Rebuilds the cached tension belt mesh list when dirty and returns it if not empty; otherwise defers to the parent. |
| `Pallet:collectPalletTensionBeltNodes(nodes: any)` | 343 | ✍ Appends to the given table the base tension belt nodes, the visible content objects usable as belt meshes, and extra mesh nodes of the tension belt object spec if present. |
| `Pallet:setPalletTensionBeltNodesDirty()` | 371 | ✍ Marks the cached tension belt mesh list as outdated. |
| `Pallet:getInfoBoxTitle()` | 463 | ✍ Returns the localized pallet title for the info box. |
| `Pallet:getAutoLoadSize(superFunc: any)` | 469 | ✍ Returns the vehicle's length, height and width as x, y, z, swapping length and width because pallets are loaded rotated by 90 degrees. |
| `Pallet:autoLoad(superFunc: any, autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 481 | ✍ Mounts the pallet kinematically on the auto loader node at the cell centre, rotated 90 degrees about Y, and always returns true. |
| `Pallet:getShowInVehiclesOverview(superFunc: any)` | 496 | ✍ Always false: pallets are not listed in the vehicles overview. |
| `Pallet:getCanBeReset(superFunc: any)` | 502 | ✍ Always false: pallets cannot be reset. |
| `Pallet:getIsMapHotspotVisible(superFunc: any)` | 508 | ✍ Always false: pallets have no visible map hotspot. |
| `Pallet:getFillUnitEmptyOnReset(superFunc: any)` | 514 | ✍ Always false: the fill unit is not emptied on reset. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onPalletI3DFileLoaded` | 55 |
| registerFunction | `getInfoBoxTitle` | 56 |
| registerFunction | `collectPalletTensionBeltNodes` | 57 |
| registerFunction | `setPalletTensionBeltNodesDirty` | 58 |
| registerFunction | `updatePalletStraps` | 59 |
| registerOverwrittenFunction | `getMeshNodes` | 65 |
| registerOverwrittenFunction | `loadComponentFromXML` | 66 |
| registerOverwrittenFunction | `getAutoLoadSize` | 67 |
| registerOverwrittenFunction | `autoLoad` | 68 |
| registerOverwrittenFunction | `getShowInVehiclesOverview` | 69 |
| registerOverwrittenFunction | `getCanBeReset` | 70 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 71 |
| registerOverwrittenFunction | `getFillUnitEmptyOnReset` | 72 |
| registerEventListener | `onPreLoad` | 78 |
| registerEventListener | `onLoad` | 79 |
| registerEventListener | `onPostLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onFillUnitFillLevelChanged` | 82 |
