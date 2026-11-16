# placeables/specializations/PlaceableHeapSpawner.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableHeapSpawner.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableHeapSpawner.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui fait apparaître en continu un type de remplissage sous forme de tas dans des zones rectangulaires, à un débit en litres par heure de jeu, avec effets, sons et noeuds d'animation optionnels côté client. Le serveur maintient le placeable actif pour que son tick de mise à jour fasse l'apparition ; les gestionnaires onUpdateTick et onDelete sont enregistrés mais sans corps dans le dump du SDK (NON VÉRIFIÉ).

- **PlaceableHeapSpawner** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHeapSpawner.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableHeapSpawner.registerEventListeners(placeableType: any)` | 24 | ✍ Abonne la spécialisation aux événements de chargement, finalisation du placement, tick de mise à jour et suppression. |
| `PlaceableHeapSpawner.registerXMLPaths(schema: any, basePath: any)` | 33 | ✍ Déclare chaque spawnArea : noeuds début, largeur et hauteur de la zone, fillType, litersPerHour, noeuds d'effet, sons work/work2/dropping et noeuds d'animation. |
| `PlaceableHeapSpawner:onLoad(savegame: table)` | 51 | ✍ Lit chaque zone, en ignorant avec une erreur loguée celles sans noeud, sans type de remplissage valide ou sans litersPerHour positif (150 par défaut). Stocke des litres par milliseconde. Côté client, charge et démarre effets, trois échantillons sonores en boucle et animations. |
| `PlaceableHeapSpawner:onFinalizePlacement(savegame: any)` | 123 | ✍ Sur le serveur, réveille la boucle de mise à jour pour que l'apparition puisse commencer. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onFinalizePlacement` | 26 |
| registerEventListener | `onUpdateTick` | 27 |
| registerEventListener | `onDelete` | 28 |
