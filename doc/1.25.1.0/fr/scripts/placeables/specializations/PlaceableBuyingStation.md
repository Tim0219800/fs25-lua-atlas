# placeables/specializations/PlaceableBuyingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableBuyingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBuyingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui encapsule un `BuyingStation` (chargé depuis `placeable.buyingStation`) où les joueurs chargent les marchandises achetées. Elle enregistre la station comme station de chargement dans le système de stockage, la synchronise vers les clients qui rejoignent et déclare une caractéristique de boutique affichant les types de remplissage vendus.

- **PlaceableBuyingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBuyingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableBuyingStation.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `getBuyingStation`. |
| `PlaceableBuyingStation.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Surcharge `collectPickObjects`. |
| `PlaceableBuyingStation.registerEventListeners(placeableType: any)` | 36 | ✍ S'abonne à `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream` et `onWriteStream`. |
| `PlaceableBuyingStation.registerXMLPaths(schema: any, basePath: any)` | 46 | ✍ Déclare les clés XML `buyingStation` en déléguant à `BuyingStation.registerXMLPaths`. |
| `PlaceableBuyingStation.initSpecialization()` | 54 | ✍ Ajoute le type de caractéristique de boutique `buyingStationFillTypes` (icône `shopListAttributeIconOutput`) pour les placeables, avec le chargeur et l'accesseur de valeur de `BuyingStation`. |
| `PlaceableBuyingStation:onLoad(savegame: table)` | 61 | ✍ Crée et charge le `BuyingStation` ; en cas de succès, le mémorise, définit son placeable propriétaire et l'enregistre comme station de chargement. En cas d'échec, journalise une erreur XML et le supprime. |
| `PlaceableBuyingStation:onDelete()` | 78 | ✍ Désenregistre la station de chargement du système de stockage et supprime le `BuyingStation`, s'il est chargé. |
| `PlaceableBuyingStation:onFinalizePlacement()` | 89 | ✍ Enregistre l'objet réseau `BuyingStation`, s'il est chargé. |
| `PlaceableBuyingStation:onReadStream(streamId: any, connection: any)` | 99 | ✍ Connexion côté client : lit l'id d'objet et le flux de la station d'achat et termine son enregistrement. |
| `PlaceableBuyingStation:onWriteStream(streamId: integer, connection: table)` | 112 | ✍ Connexion côté serveur : écrit l'id d'objet et le flux de la station d'achat et l'enregistre dans le flux de la connexion. |
| `PlaceableBuyingStation:collectPickObjects(superFunc: any, node: any)` | 123 | ✍ Ignore les nœuds de sélection qui sont un nœud de déclencheur de chargement de la station d'achat ; les autres nœuds sont transmis au parent. |
| `PlaceableBuyingStation:getBuyingStation()` | 138 | ✍ Renvoie l'objet `BuyingStation` (nil s'il n'a pas pu être chargé). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getBuyingStation` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
