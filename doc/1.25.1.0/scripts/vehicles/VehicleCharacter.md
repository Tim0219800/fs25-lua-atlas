# vehicles/VehicleCharacter.lua

Source : `dataS/scripts/vehicles/VehicleCharacter.lua` — FS25 1.25.1.0

- **VehicleCharacter** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleCharacter.new(vehicle: any, customMt: any)` | 17 |  |
| `VehicleCharacter:load(xmlFile: any, xmlNode: any)` | 34 |  |
| `VehicleCharacter:getParentComponent()` | 71 |  |
| `VehicleCharacter:loadCharacter(playerStyle: any, asyncCallbackObject: any, asyncCallbackFunction: any, asyncCallbackArguments: any)` | 77 |  |
| `VehicleCharacter:characterLoaded(loadingState: any, arguments: any)` | 100 |  |
| `VehicleCharacter:delete()` | 196 |  |
| `VehicleCharacter:unloadCharacter()` | 202 |  |
| `VehicleCharacter:setDirty(setAllDirty: any)` | 219 |  |
| `VehicleCharacter:updateIKChains()` | 231 |  |
| `VehicleCharacter:setIKChainPoseByTarget(target: any, poseId: any)` | 237 |  |
| `VehicleCharacter:setSpineDirty(acc: any)` | 250 |  |
| `VehicleCharacter:updateVisibility()` | 265 |  |
| `VehicleCharacter:setCharacterVisibility(isVisible: any)` | 277 |  |
| `VehicleCharacter:setAllowCharacterUpdate(state: any)` | 290 |  |
| `VehicleCharacter:getAllowCharacterUpdate()` | 296 |  |
| `VehicleCharacter:update(dt: any)` | 302 |  |
| `VehicleCharacter:getIKChainTargets()` | 335 |  |
| `VehicleCharacter:setIKChainTargets(targets: any, force: any)` | 341 |  |
| `VehicleCharacter:getPlayerStyle()` | 356 |  |
| `VehicleCharacter.registerCharacterXMLPaths(schema: any, basePath: any, name: any)` | 366 |  |
