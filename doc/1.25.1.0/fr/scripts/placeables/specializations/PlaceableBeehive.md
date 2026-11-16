# placeables/specializations/PlaceableBeehive.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableBeehive.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBeehive.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une ruche. Elle lit le rayon d'action et la production de miel quotidienne dans le XML, s'enregistre auprès de `g_currentMission.beehiveSystem`, joue des effets et un son d'ambiance tant que le système indique que les FX sont actifs, et produit du miel que le système confie à un générateur de palettes. Elle compte aussi les ruches possédées pour un succès à l'achat.

- **PlaceableBeehive** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBeehive.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : cette spécialisation n'a aucune spécialisation prérequise. |
| `PlaceableBeehive.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre les fonctions de placeable `getBeehiveInfluenceFactor`, `updateBeehiveState` et `getHoneyAmountToSpawn`. |
| `PlaceableBeehive.registerOverwrittenFunctions(placeableType: any)` | 32 | ✍ Surcharge la fonction `updateInfo` du placeable pour ajouter des lignes de ruche au HUD d'informations. |
| `PlaceableBeehive.registerEventListeners(placeableType: any)` | 38 | ✍ S'abonne aux événements `onLoad`, `onDelete`, `onFinalizePlacement` et `onBuy`. |
| `PlaceableBeehive.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Déclare les clés XML `beehive#actionRadius` et `beehive#litersHoneyPerDay`, ainsi que les chemins d'effets et de l'échantillon sonore `idle` sous `beehive`. |
| `PlaceableBeehive:onLoad(savegame: table)` | 61 | ✍ Lit le rayon d'action (25 par défaut) et le miel par jour (10 par défaut, stocké par heure), met en cache le rayon au carré et la position monde, et prépare les entrées du HUD. Côté client, charge aussi les effets et le son d'ambiance. |
| `PlaceableBeehive:onDelete()` | 96 | ✍ Supprime les effets et les échantillons sonores, et retire cette ruche de `beehiveSystem`. |
| `PlaceableBeehive:onFinalizePlacement()` | 106 | ✍ Enregistre l'heure du jeu courante comme dernier instant de production, ajoute la ruche à `beehiveSystem` et met à jour son état. |
| `PlaceableBeehive:getBeehiveInfluenceFactor(wx: any, wz: any)` | 118 | ✍ Renvoie un facteur entre 0 et 1 pour une position monde (wx, wz) : 0 hors du rayon d'action, sinon une valeur décroissant avec le carré de la distance (environ 0,15 en bordure). |
| `PlaceableBeehive:updateBeehiveState()` | 131 | ✍ Copie l'indicateur de production de `beehiveSystem` et, quand l'indicateur FX change, démarre ou arrête les effets et le son d'ambiance côté client. |
| `PlaceableBeehive:getHoneyAmountToSpawn()` | 153 | ✍ Renvoie les litres de miel produits depuis le dernier appel (heures écoulées plafonnées à 1, multipliées par `environment.timeAdjustment`) et remet le minuteur à zéro ; renvoie 0 si la production est inactive. |
| `PlaceableBeehive:updateInfo(superFunc: any, infoTable: any)` | 166 | ✍ Ajoute la ligne de portée au HUD d'informations et, pour la ferme propriétaire locale, affiche soit un avertissement indiquant l'absence d'emplacement de palettes, soit une note sur l'apparition du miel à cet emplacement. |
| `PlaceableBeehive:onBuy()` | 185 | ✍ Compte les ruches de la ferme locale et transmet le nombre au gestionnaire de succès (`NumBeehives`). À noter : la comparaison utilise l'id de la ferme locale, nommé `serverFarmId` dans le code. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getBeehiveInfluenceFactor` | 25 |
| registerFunction | `updateBeehiveState` | 26 |
| registerFunction | `getHoneyAmountToSpawn` | 27 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onBuy` | 42 |
