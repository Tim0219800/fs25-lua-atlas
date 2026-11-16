# vehicles/specializations/WoodHarvesterLight.lua

*[English version](../../../../scripts/vehicles/specializations/WoodHarvesterLight.md)*

Source: `dataS/scripts/vehicles/specializations/WoodHarvesterLight.lua` — FS25 1.25.1.0

✍ Spécialisation d'abatteuse simplifiée (automatique). Elle exige TurnOnVehicle et AutomaticArmControlHarvester, qui fournissent l'alignement du bras et l'arbre cible. Quand la tête est allumée et qu'un arbre (hors souche) se trouve dans le nœud de coupe, elle joue une animation de coupe, supprime l'arbre entier, fait apparaître un tas de grumes de pin sur un emplacement libre voisin et plante une souche de pin. Un type de configuration `woodHarvesterLight` est ajouté. La déclaration de la table de classe est absente des lignes du dump.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterLight.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Renvoie true seulement si le type de véhicule possède TurnOnVehicle et AutomaticArmControlHarvester. |
| `WoodHarvesterLight.initSpecialization()` | 31 | ✍ Ajoute le type de configuration `woodHarvesterLight` et enregistre les chemins XML : nœud de coupe, animations de coupe et de saisie, réglages du générateur de grumes, effets et son de coupe. |
| `WoodHarvesterLight.registerFunctions(vehicleType: any)` | 61 | ✍ Enregistre `updateLogSpawner`, `onWoodHarversterLogSpawnerCallback`, `spawnLogHeap` et `spawnTreeStump` sur le type de véhicule. |
| `WoodHarvesterLight.registerOverwrittenFunctions(vehicleType: any)` | 70 | ✍ Surcharge `getSupportsAutoTreeAlignment`, `getAutoAlignHasValidTree` et `getAreControlledActionsAllowed`. |
| `WoodHarvesterLight.registerEventListeners(vehicleType: any)` | 78 | ✍ S'abonne à onLoad, onDelete, onUpdate, onTurnedOn et onTurnedOff. |
| `WoodHarvesterLight:onLoad(savegame: any)` | 88 | ✍ Lit le nœud de coupe, les animations et le générateur de grumes ; le modèle de grume est fixé à `data/maps/trees/logs/pineLog.i3d` (taille 0,4 x 5, volume 0,66). Charge effets et son côté client. Retire les écouteurs de mise à jour et d'allumage si aucun nœud de coupe n'existe. |
| `WoodHarvesterLight:onDelete()` | 145 | ✍ Client : supprime les effets et échantillons sonores de coupe. |
| `WoodHarvesterLight:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 156 | ✍ Allumée, trouve un arbre non-souche dans le nœud de coupe et, sauf alignement du bras en cours, joue l'animation de coupe ; à mi-course elle supprime l'arbre, crée le tas de grumes et la souche (si le volume est non nul), met à jour statistiques, succès et conseils, et rejoue les actions contrôlées si disponibles. Alimente toujours le générateur de grumes avec la cible d'alignement courante. À noter : aucune vérification serveur dans la branche de coupe (NON VÉRIFIÉ : où la mise à jour s'exécute exactement). |
| `WoodHarvesterLight:onTurnedOn()` | 254 | ✍ Joue l'animation de saisie vers l'avant. |
| `WoodHarvesterLight:onTurnedOff()` | 261 | ✍ Joue l'animation de saisie à l'envers et, côté client, arrête effets et sons. |
| `WoodHarvesterLight:getSupportsAutoTreeAlignment(superFunc: any)` | 273 | ✍ Renvoie toujours true. |
| `WoodHarvesterLight:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 279 | ✍ Renvoie deux booléens : si un arbre se trouve actuellement dans le nœud de coupe, et si le rayon respecte le maximum configuré. |
| `WoodHarvesterLight:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 288 | ✍ Au démarrage de la séquence d'actions, renvoie false avec un avertissement si l'arbre est invalide (accès refusé, mauvais type, trop épais), hors de portée, ou s'il n'y a pas de zone libre pour les grumes. L'arrêt reste toujours permis ; sinon s'en remet au parent. |
| `WoodHarvesterLight:updateLogSpawner(tx: any, ty: any, tz: any, radius: any)` | 315 | ✍ À chaque appel, exploite le résultat du test de recouvrement asynchrone précédent et cherche une zone libre près de l'arbre (côtés, puis derrière, par pas de 2 jusqu'à `maxSpawnWidth`). Lance le test `overlapBoxAsync` suivant et conserve la dernière zone valide et son orientation. |
| `WoodHarvesterLight:onWoodHarversterLogSpawnerCallback(nodeId: any, ...: any)` | 382 | ✍ Callback de recouvrement : tout contact avec autre chose qu'un groupe de terrain marque la zone testée comme bloquée et passe au candidat suivant. Efface toujours l'indicateur d'attente. |
| `WoodHarvesterLight:spawnLogHeap(splitTypeIndex: any, treeVolume: any)` | 398 | ✍ Si une zone valide existe, crée des grumes pour un arbre : nombre égal au volume de l'arbre divisé par le volume d'une grume (au moins 1), appartenant à la ferme du véhicule. `splitTypeIndex` n'est pas utilisé. |
| `WoodHarvesterLight.spawnLogs(filename: any, numTrees: any, bx: any, by: any, bz: any, bry: any, lDiameter: any, lLength: any, farmId: any)` | 411 | ✍ Calcule les positions d'une pile de grumes dans une zone (une rangée de base sur le terrain plus une rangée haute posée entre elles) et crée un `ForestryLog` par position à partir du fichier donné, avec la ferme indiquée comme propriétaire. |
| `WoodHarvesterLight:spawnTreeStump(x: any, y: any, z: any)` | 481 | ✍ Plante un arbre `pineStump` à la position donnée via `g_treePlantManager` si ce type d'arbre existe. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateLogSpawner` | 62 |
| registerFunction | `onWoodHarversterLogSpawnerCallback` | 63 |
| registerFunction | `spawnLogHeap` | 64 |
| registerFunction | `spawnTreeStump` | 65 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 71 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 72 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 73 |
| registerEventListener | `onLoad` | 79 |
| registerEventListener | `onDelete` | 80 |
| registerEventListener | `onUpdate` | 81 |
| registerEventListener | `onTurnedOn` | 82 |
| registerEventListener | `onTurnedOff` | 83 |
