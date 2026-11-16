# vehicles/specializations/VineDetector.lua

*[English version](../../../../scripts/vehicles/specializations/VineDetector.md)*

Source: `dataS/scripts/vehicles/specializations/VineDetector.lua` — FS25 1.25.1.0

✍ Spécialisation qui détecte les rangs de vigne devant une machine par un raycast asynchrone vers le bas depuis un nœud configuré (`vehicle.vineDetector.raycast`). Elle ne tourne que sur le serveur et utilise le masque de collision des objets statiques. Les rappels de détection et accesseurs (raycastCallbackVineDetection, getIsValidVinePlaceable, handleVinePlaceable, positions d'impact, etc.) sont enregistrés mais leurs corps ne sont pas dans ce dump (NON VÉRIFIÉ) ; les spécialisations de coupe et de prétaille les surchargent ou les utilisent.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VineDetector.initSpecialization()` | 15 | ✍ Enregistre les chemins XML `vehicle.vineDetector.raycast#node` et `#maxDistance` (1 par défaut). |
| `VineDetector.prerequisitesPresent(specializations: any)` | 25 | ✍ Renvoie toujours true : aucun prérequis. |
| `VineDetector.registerFunctions(vehicleType: any)` | 31 | ✍ Enregistre dix fonctions sur le type de véhicule (rappel de raycast, fin/annulation de détection, validation et traitement du placeable, accesseurs de position et de distance). Leurs implémentations ne sont pas dans ce fichier (NON VÉRIFIÉ). |
| `VineDetector.registerEventListeners(vehicleType: any)` | 46 | ✍ S'abonne à onLoad et onUpdate. |
| `VineDetector:onLoad(savegame: any)` | 54 | ✍ Charge le nœud de raycast (avertissement s'il manque) et la distance max, et initialise la table d'état du raycast (positions d'impact, distance, nœud courant) ainsi que le drapeau de détection active. |
| `VineDetector:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 77 | ✍ Serveur uniquement : tant que `getCanStartVineDetection` est vrai, lance un raycast asynchrone à la fois depuis le nœud selon sa direction -Y (rappel `raycastCallbackVineDetection`, masque STATIC_OBJECT). Quand la détection n'est plus permise, efface le placeable de vigne courant et appelle `finishedVineDetection`. Un TODO du source se demande si le masque suffit. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `raycastCallbackVineDetection` | 32 |
| registerFunction | `finishedVineDetection` | 33 |
| registerFunction | `clearCurrentVinePlaceable` | 34 |
| registerFunction | `cancelVineDetection` | 35 |
| registerFunction | `getIsValidVinePlaceable` | 36 |
| registerFunction | `handleVinePlaceable` | 37 |
| registerFunction | `getCanStartVineDetection` | 38 |
| registerFunction | `getFirstVineHitPosition` | 39 |
| registerFunction | `getCurrentVineHitPosition` | 40 |
| registerFunction | `getCurrentVineHitDistance` | 41 |
| registerEventListener | `onLoad` | 47 |
| registerEventListener | `onUpdate` | 48 |
