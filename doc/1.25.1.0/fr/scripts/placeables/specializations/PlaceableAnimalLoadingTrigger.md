# placeables/specializations/PlaceableAnimalLoadingTrigger.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableAnimalLoadingTrigger.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableAnimalLoadingTrigger.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable (`spec_animalLoadingTrigger`) qui crée un `AnimalLoadingTrigger` depuis la section XML `placeable.animalLoadingTrigger` afin de charger des animaux dans des remorques au niveau du placeable. Elle supprime le déclencheur avec le placeable. Le comportement du déclencheur est dans `AnimalLoadingTrigger`, pas dans ce fichier.

- **PlaceableAnimalLoadingTrigger** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableAnimalLoadingTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Vérification des prérequis ; retourne toujours true. |
| `PlaceableAnimalLoadingTrigger.registerEventListeners(placeableType: any)` | 24 | ✍ S'abonne aux événements de placeable `onLoad` et `onDelete`. |
| `PlaceableAnimalLoadingTrigger.registerFunctions(placeableType: any)` | 31 | ✍ Vide ; cette spécialisation n'enregistre aucune nouvelle fonction. |
| `PlaceableAnimalLoadingTrigger.registerOverwrittenFunctions(placeableType: any)` | 36 | ✍ Vide ; cette spécialisation ne surcharge aucune fonction de placeable. |
| `PlaceableAnimalLoadingTrigger.registerXMLPaths(schema: any, basePath: any)` | 41 | ✍ Enregistre les chemins XML `.animalLoadingTrigger` en déléguant à `AnimalLoadingTrigger.registerXMLPaths`. |
| `PlaceableAnimalLoadingTrigger.registerSavegameXMLPaths(schema: any, basePath: any)` | 49 | ✍ Vide ; cette spécialisation ne sauvegarde rien. |
| `PlaceableAnimalLoadingTrigger:onLoad(savegame: table)` | 55 | ✍ Crée un `AnimalLoadingTrigger` selon le rôle serveur/client et le charge depuis le XML. Si le chargement échoue, le déclencheur est supprimé et laissé à nil. |
| `PlaceableAnimalLoadingTrigger:onDelete()` | 67 | ✍ Supprime le déclencheur de chargement d'animaux, s'il existe, et efface la référence. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
