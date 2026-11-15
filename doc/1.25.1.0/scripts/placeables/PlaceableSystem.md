# placeables/PlaceableSystem.lua

Source : `dataS/scripts/placeables/PlaceableSystem.lua` — FS25 1.25.1.0

- **PlaceableSystem** (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSystem.new(mission: table, customMt: table?) → PlaceableSystem` | 27 |  |
| `PlaceableSystem:delete()` | 90 |  |
| `PlaceableSystem:deleteAll()` | 128 |  |
| `PlaceableSystem:addPlaceable(placeable: any)` | 297 |  |
| `PlaceableSystem:removePlaceable(placeable: any)` | 325 |  |
| `PlaceableSystem:addPendingPlaceableLoad(placeableLoadingData: any)` | 470 |  |
| `PlaceableSystem:removePendingPlaceableLoad(placeableLoadingData: any)` | 476 |  |
| `PlaceableSystem:canStartMission()` | 486 |  |
| `PlaceableSystem:addWeatherStation(weatherStation: any)` | 502 |  |
| `PlaceableSystem:removeWeatherStation(weatherStation: any)` | 508 |  |
| `PlaceableSystem:addBunkerSilo(bunkerSilo: any)` | 514 |  |
| `PlaceableSystem:removeBunkerSilo(bunkerSilo: any)` | 520 |  |
| `PlaceableSystem:getBunkerSilos()` | 526 |  |
| `PlaceableSystem:getExistingPlaceableByXMLFilename(xmlFilename: string, ownerFarmId: integer?, excludeBoughtWithFarmland: boolean?) → Placeable?` | 537 |  |
| `PlaceableSystem:getHasWeatherStation(farmId: any)` | 557 |  |
| `PlaceableSystem:addFarmhouse(farmhouse: any)` | 569 |  |
| `PlaceableSystem:removeFarmhouse(farmhouse: any)` | 575 |  |
| `PlaceableSystem:getFarmhouse(farmId: any)` | 581 |  |
| `PlaceableSystem:save(xmlFilename: any, usedModNames: any)` | 604 |  |
| `PlaceableSystem:saveToXML(xmlFile: any, usedModNames: any, savePreplaced: any)` | 615 |  |
| `PlaceableSystem:loadPlaceableFromXML(xmlFile: any, key: any, defaultItemsToSPFarm: any, preplacedData: any, callback: any, callbackTarget: any, callbackArguments: any)` | 762 |  |
| `PlaceableSystem:loadPlaceableFinished(placeable: any, loadingState: any, arguments: any)` | 832 |  |
| `PlaceableSystem:consoleCommandDeleteAllPlaceables(includePreplaced: any)` | 873 |  |
| `PlaceableSystem:consoleCommandReloadAllPlaceables()` | 894 |  |
| `PlaceableSystem:consoleCommandLoadAllPlaceables(modsOnly: string?)` | 973 |  |

## Messages

- publie `MessageType.PLACEABLE_ADDED` (l.317)
- publie `MessageType.PLACEABLE_REMOVED` (l.333)
