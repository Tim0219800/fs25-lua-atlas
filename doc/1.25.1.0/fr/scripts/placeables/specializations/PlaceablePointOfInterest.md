# placeables/specializations/PlaceablePointOfInterest.lua

*[English version](../../../../scripts/placeables/specializations/PlaceablePointOfInterest.md)*

Source: `dataS/scripts/placeables/specializations/PlaceablePointOfInterest.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable sans prérequis qui attache un ou plusieurs objets PointOfInterest à un placeable. Chaque point est lu sous placeable.pointOfInterest.point, instancié depuis la classe nommée dans le XML (PointOfInterest par défaut) et supprimé avec le placeable. Le propriétaire est transmis à chaque point. Le comportement d'un PointOfInterest est défini dans une autre classe, pas dans ce fichier.

- **PlaceablePointOfInterest** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceablePointOfInterest.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Retourne toujours true ; aucune autre spécialisation n'est requise. |
| `PlaceablePointOfInterest.registerXMLPaths(schema: any, basePath: any)` | 25 | ✍ Déclare le schéma XML de placeable.pointOfInterest.point(?) : un attribut class plus ce que PointOfInterest.registerXMLPaths ajoute. |
| `PlaceablePointOfInterest.registerOverwrittenFunctions(placeableType: any)` | 34 | ✍ Surcharge setOwnerFarmId du placeable. |
| `PlaceablePointOfInterest.registerEventListeners(placeableType: any)` | 40 | ✍ Abonne la spécialisation à onLoad et onDelete. |
| `PlaceablePointOfInterest:onLoad(savegame: table)` | 48 | ✍ Crée un objet point pour chaque entrée XML via ClassUtil.getClassObject sur le nom de classe, puis appelle son load. Une classe inconnue journalise une erreur ; les points dont le load échoue sont supprimés et ignorés. |
| `PlaceablePointOfInterest:onDelete()` | 71 | ✍ Supprime tous les points d'intérêt détenus par le placeable. |
| `PlaceablePointOfInterest:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 83 | ✍ Appelle le setOwnerFarmId parent, puis applique le même identifiant de ferme à chaque point d'intérêt. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
