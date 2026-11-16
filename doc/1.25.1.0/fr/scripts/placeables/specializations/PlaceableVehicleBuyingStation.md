# placeables/specializations/PlaceableVehicleBuyingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableVehicleBuyingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableVehicleBuyingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour un point de vente de véhicules. Elle lit un déclencheur joueur, une liste d'articles de boutique avec prix et frais de transport, des places d'apparition et des messages de résultat, puis ouvre une boîte de dialogue de boutique via un VehicleBuyingStationActivatable si le joueur a la permission d'acheter des véhicules. Configurée sous `placeable.vehicleBuyingStation`.

- **PlaceableVehicleBuyingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableVehicleBuyingStation.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableVehicleBuyingStation:onLoad(savegame: table)` | 55 | ✍ Charge le nœud de déclencheur, les articles (prix par défaut celui de la boutique, frais de transport 15000), les places d'apparition, les messages, le titre et les textes, puis crée l'activable. Renvoie false sans place d'apparition. `vehicleShopCallback` et le callback du déclencheur ne sont pas définis dans ce fichier (NON VÉRIFIÉ). |
| `PlaceableVehicleBuyingStation:onDelete()` | 141 | ✍ Retire le nœud de déclencheur s'il a été créé. |
