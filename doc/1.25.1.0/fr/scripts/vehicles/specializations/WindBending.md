# vehicles/specializations/WindBending.lua

*[English version](../../../../scripts/vehicles/specializations/WindBending.md)*

Source: `dataS/scripts/vehicles/specializations/WindBending.lua` — FS25 1.25.1.0

✍ Spécialisation côté client qui fait plier des formes de type feuillage (par ex. végétation sur une coupe ou un chargement) selon le mouvement du véhicule, en alimentant le paramètre de shader `directionBend`. Aucun prérequis et aucune fonction propre ; elle ne réagit qu'à onLoad et onUpdate. Les nœuds se déclarent sous `vehicle.windBending.windBendingNodes.windBendingNode`.

- **WindBending** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WindBending.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : cette spécialisation n'a aucune spécialisation prérequise. |
| `WindBending.initSpecialization()` | 23 | ✍ Enregistre dans le schéma XML les chemins d'un nœud de courbure : `#node`, `#decalNode`, `#speedReferenceNode`, `#maxBending` (mètres, 0,15 par défaut), `#maxBendingNeg` et `#maxBendingSpeed` (km/h, 20 par défaut). |
| `WindBending.registerFunctions(vehicleType: any)` | 39 | ✍ Vide : la spécialisation n'ajoute aucune nouvelle fonction au véhicule. |
| `WindBending.registerEventListeners(vehicleType: any)` | 44 | ✍ Abonne le type de véhicule à onLoad et onUpdate. |
| `WindBending:onLoad(savegame: table)` | 52 | ✍ Client uniquement : lit chaque nœud configuré et ne le conserve que si c'est une forme possédant le paramètre de shader `directionBend` (sinon erreur XML journalisée). Retire l'écouteur onUpdate sur un serveur ou sans nœud valide. |
| `WindBending:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 94 | ✍ Pour chaque nœud, déduit une direction de mouvement à partir du déplacement du nœud de référence depuis le dernier appel, puis règle `directionBend` via `g_animationManager` avec une amplitude proportionnelle à la vitesse sur `maxBendingSpeed`. Utilise le maximum négatif en marche arrière. Le nœud de décalque reçoit les mêmes valeurs. À noter : la vitesse est calculée avec un facteur fixe de 10, pas avec dt. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 45 |
| registerEventListener | `onUpdate` | 46 |
