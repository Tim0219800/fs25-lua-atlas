# internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les stations de base RTK de Precision Farming. Elle n'a ni chemin XML ni fonction propre et se contente d'enregistrer ou retirer le placeable auprès de l'extension IA de precision farming à la pose et à la suppression.

- **RTKStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RTKStation.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `RTKStation.registerFunctions(placeableType: any)` | 23 | ✍ Vide : la spécialisation n'ajoute aucune fonction au placeable. |
| `RTKStation.registerOverwrittenFunctions(placeableType: any)` | 28 | ✍ Vide : aucune fonction du placeable n'est surchargée. |
| `RTKStation.registerEventListeners(placeableType: any)` | 33 | ✍ Abonne le type de placeable à onFinalizePlacement et onDelete. |
| `RTKStation.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Vide : aucune clé XML n'est enregistrée. |
| `RTKStation:onFinalizePlacement(savegame: any)` | 45 | ✍ Enregistre cette station auprès de g_precisionFarming.aiExtension via registerRTKStation, si l'objet precision farming existe. Ce que fait l'extension ensuite est NON VÉRIFIÉ ici. |
| `RTKStation:onDelete()` | 53 | ✍ Retire cette station de g_precisionFarming.aiExtension à la suppression du placeable, si precision farming existe. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onDelete` | 35 |
