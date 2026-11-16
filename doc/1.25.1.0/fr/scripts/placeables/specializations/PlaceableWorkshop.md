# placeables/specializations/PlaceableWorkshop.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableWorkshop.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWorkshop.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui transforme un bâtiment en atelier en créant un VehicleSellingPoint à partir de `placeable.workshop.sellingPoint`. Le point de vente est relié au placeable et sa ferme propriétaire reste synchronisée.

- **PlaceableWorkshop** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWorkshop.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableWorkshop.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Surcharge `setOwnerFarmId` sur le type de placeable. |
| `PlaceableWorkshop.registerEventListeners(placeableType: any)` | 30 | ✍ S'abonne à onLoad et onDelete. |
| `PlaceableWorkshop.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Déclare les clés XML du point de vente via `VehicleSellingPoint.registerXMLPaths` sous `.workshop.sellingPoint`. |
| `PlaceableWorkshop:onLoad(savegame: table)` | 46 | ✍ Crée et charge le VehicleSellingPoint, fixe sa ferme propriétaire et y stocke `owningPlaceable`. |
| `PlaceableWorkshop:onDelete()` | 57 | ✍ Supprime le point de vente s'il existe. |
| `PlaceableWorkshop:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 67 | ✍ Appelle le parent, puis propage la nouvelle ferme propriétaire au point de vente. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
