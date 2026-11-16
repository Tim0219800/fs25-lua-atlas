# vehicles/specializations/AIVehicleObstacle.lua

*[English version](../../../../scripts/vehicles/specializations/AIVehicleObstacle.md)*

Source: `dataS/scripts/vehicles/specializations/AIVehicleObstacle.lua` — FS25 1.25.1.0

✍ Spécialisation destinée à faire d'un véhicule un obstacle pour la navigation IA. Dans ce dump du SDK, seuls le test des prérequis et l'enregistrement des écouteurs subsistent ; tous les corps des gestionnaires (onLoad, onDelete, onUpdate, onEnterVehicle, onLeaveVehicle) sont supprimés, le comportement réel est donc NON VÉRIFIÉ.

- **AIVehicleObstacle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIVehicleObstacle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours vrai : aucune spécialisation prérequise. |
| `AIVehicleObstacle.registerEventListeners(vehicleType: any)` | 42 | ✍ Abonne la spécialisation à onLoad, onDelete, onUpdate, onEnterVehicle et onLeaveVehicle. Les corps des gestionnaires ne sont pas dans le dump (NON VÉRIFIÉ). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onUpdate` | 45 |
| registerEventListener | `onEnterVehicle` | 46 |
| registerEventListener | `onLeaveVehicle` | 47 |
