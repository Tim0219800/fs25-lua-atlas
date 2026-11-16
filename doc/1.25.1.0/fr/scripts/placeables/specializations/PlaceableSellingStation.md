# placeables/specializations/PlaceableSellingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableSellingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSellingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable sans prérequis qui encapsule un SellingStation (lieu où les joueurs vendent des types de remplissage, par exemple un marché ou une usine). Elle crée la station depuis placeable.sellingStation, l'enregistre auprès de storageSystem et economyManager de g_currentMission à la pose, la transmet aux clients et relaie le chargement/la sauvegarde. La classe SellingStation n'est pas dans ce fichier.

- **PlaceableSellingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSellingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Retourne toujours true. |
| `PlaceableSellingStation.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre getSellingStation sur le type de placeable. |
| `PlaceableSellingStation.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Surcharge collectPickObjects. |
| `PlaceableSellingStation.registerEventListeners(placeableType: any)` | 36 | ✍ Abonne à onLoad, onDelete, onFinalizePlacement, onReadStream et onWriteStream. |
| `PlaceableSellingStation.registerXMLPaths(schema: any, basePath: any)` | 46 | ✍ Déclare le schéma XML en déléguant à SellingStation.registerXMLPaths sous placeable.sellingStation. |
| `PlaceableSellingStation.registerSavegameXMLPaths(schema: any, basePath: any)` | 54 | ✍ Déclare les chemins XML de sauvegarde via SellingStation.registerSavegameXMLPaths. |
| `PlaceableSellingStation.initSpecialization()` | 62 | ✍ Ajoute le type de spécification de boutique sellingStationFillTypes (icône d'entrée) pour les placeables, avec les fonctions de chargement et d'accès de SellingStation. |
| `PlaceableSellingStation:onLoad(savegame: table)` | 69 | ✍ Crée le SellingStation et le charge depuis placeable.sellingStation, rattaché au nœud du premier composant ; le placeable est stocké dans owningPlaceable. La valeur de retour de load est ignorée. |
| `PlaceableSellingStation:onDelete()` | 80 | ✍ Retire la station du système de stockage et du gestionnaire d'économie, puis la supprime. |
| `PlaceableSellingStation:onFinalizePlacement()` | 91 | ✍ Enregistre la station comme objet réseau et l'ajoute au système de stockage (comme station de déchargement) et au gestionnaire d'économie. |
| `PlaceableSellingStation:onReadStream(streamId: any, connection: any)` | 100 | ✍ Synchronisation initiale côté client : lit l'identifiant d'objet et les données de la station, puis termine son enregistrement auprès de g_client. |
| `PlaceableSellingStation:onWriteStream(streamId: any, connection: any)` | 110 | ✍ Synchronisation initiale côté serveur : écrit l'identifiant d'objet et les données de la station et l'enregistre dans le flux de cette connexion. |
| `PlaceableSellingStation:getSellingStation()` | 120 | ✍ Retourne l'objet SellingStation de ce placeable. |
| `PlaceableSellingStation:collectPickObjects(superFunc: any, node: any)` | 126 | ✍ Ignore le nœud s'il s'agit du nœud racine de remplissage exact d'un déclencheur de déchargement ; sinon délègue à l'implémentation parente. |
| `PlaceableSellingStation:loadFromXMLFile(xmlFile: any, key: any)` | 144 | ✍ Transmet le chargement de la sauvegarde à la station de vente. |
| `PlaceableSellingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 151 | ✍ Transmet l'écriture de la sauvegarde à la station de vente. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getSellingStation` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
