# vehicles/specializations/ConnectedAttributes.lua

Source : `dataS/scripts/vehicles/specializations/ConnectedAttributes.lua` — FS25 1.25.1.0

- **LocalOffset** (l.634)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConnectedAttributes.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `ConnectedAttributes.initSpecialization()` | 32 |  |
| `ConnectedAttributes.registerFunctions(vehicleType: any)` | 85 |  |
| `ConnectedAttributes.registerOverwrittenFunctions(vehicleType: any)` | 90 |  |
| `ConnectedAttributes.registerEventListeners(vehicleType: any)` | 97 |  |
| `ConnectedAttributes:onLoad(savegame: any)` | 109 |  |
| `ConnectedAttributes:onLoadFinished(savegame: any)` | 384 |  |
| `ConnectedAttributes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 393 |  |
| `ConnectedAttributes:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 405 |  |
| `ConnectedAttributes:onPlayAnimation(animationName: any)` | 413 |  |
| `ConnectedAttributes:onUpdateAnimation(animationName: any)` | 429 |  |
| `ConnectedAttributes:onFinishAnimation(animationName: any)` | 445 |  |
| `ConnectedAttributes.updateAttribute(attribute: any, forceUpdate: any)` | 461 |  |
| `ConnectedAttributes:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 544 |  |
| `ConnectedAttributes:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 559 |  |
| `ConnectedAttributes:updateDebugValues(values: any)` | 575 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `loadExtraDependentParts` | 91 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 92 |
| registerEventListener | `onLoad` | 98 |
| registerEventListener | `onLoadFinished` | 99 |
| registerEventListener | `onUpdate` | 100 |
| registerEventListener | `onUpdateEnd` | 101 |
| registerEventListener | `onPlayAnimation` | 102 |
| registerEventListener | `onUpdateAnimation` | 103 |
| registerEventListener | `onFinishAnimation` | 104 |
