# triggers/LoadTrigger.lua

Source : `dataS/scripts/triggers/LoadTrigger.lua` — FS25 1.25.1.0

- **LoadTrigger** hérite de `Object` (l.13)
- **LoadTriggerActivatable** (l.699)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LoadTrigger.registerXMLPaths(schema: any, basePath: any)` | 19 |  |
| `LoadTrigger.new(isServer: any, isClient: any, customMt: any)` | 51 |  |
| `LoadTrigger:load(components: any, xmlFile: any, xmlNode: any, i3dMappings: any, rootNode: any)` | 61 |  |
| `LoadTrigger:delete()` | 209 |  |
| `LoadTrigger:setSource(object: any)` | 242 |  |
| `LoadTrigger:raiseActive()` | 253 |  |
| `LoadTrigger:loadTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 263 |  |
| `LoadTrigger:farmIdForFillableObject(fillableObject: any)` | 369 |  |
| `LoadTrigger:getIsFillableObjectAvailable()` | 384 |  |
| `LoadTrigger:toggleLoading()` | 432 |  |
| `LoadTrigger:onFillTypeSelection(fillType: any)` | 486 |  |
| `LoadTrigger:setIsLoading(isLoading: any, targetObject: any, fillUnitIndex: any, fillType: any, noEventSend: any)` | 498 |  |
| `LoadTrigger:getAllowsActivation(fillableObject: any)` | 512 |  |
| `LoadTrigger:startLoading(fillType: any, fillableObject: any, fillUnitIndex: any)` | 526 |  |
| `LoadTrigger:stopLoading()` | 550 |  |
| `LoadTrigger:update(dt: any)` | 579 |  |
| `LoadTrigger:getCurrentFillType()` | 622 |  |
| `LoadTrigger:getFillTargetNode()` | 628 |  |
| `LoadTrigger:setFillSoundIsPlaying(state: any)` | 638 |  |
| `LoadTrigger:onDeleteObject(vehicle: any)` | 661 |  |
| `LoadTrigger:getIsFillTypeSupported(fillType: any)` | 677 |  |
| `LoadTrigger:getSupportAILoading()` | 683 |  |
| `LoadTrigger:getAITargetPositionAndDirection()` | 689 |  |
| `LoadTriggerActivatable.new(loadTrigger: any)` | 703 |  |
| `LoadTriggerActivatable:setText(text: any)` | 714 |  |
| `LoadTriggerActivatable:getIsActivatable()` | 720 |  |
| `LoadTriggerActivatable:run()` | 726 |  |
