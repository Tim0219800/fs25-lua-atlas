# vehicles/specializations/HydraulicHammer.lua

*[English version](../../../../scripts/vehicles/specializations/HydraulicHammer.md)*

Source: `dataS/scripts/vehicles/specializations/HydraulicHammer.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour un marteau hydraulique qui casse des objets destructibles de la carte. Elle requiert TurnOnVehicle et AnimatedVehicle. Une fois allumée, elle lance périodiquement un court rayon depuis un nœud de travail, interroge le système d'objets destructibles de la mission pour trouver l'objet touché, vérifie l'accès au terrain pour la ferme propriétaire et ajoute des dégâts à chaque coup. Côté client, elle joue effets, sons (hauteur modulée par la progression), nœuds d'animation et une animation de coup facultative. La classe du système d'objets destructibles n'est pas dans ce dump (NON VÉRIFIÉ).

- **HydraulicHammer** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HydraulicHammer.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie true seulement si le type de véhicule possède TurnOnVehicle et AnimatedVehicle. |
| `HydraulicHammer.initSpecialization()` | 24 | ✍ Enregistre le schéma XML sous vehicle.hydraulicHammer : nœud de travail (nœud de raycast, nœud aligné, dégâts, intervalle de coup, distance de raycast, types supportés), effets, sons start/stop/idle/work avec facteur de hauteur selon la progression, nœuds d'animation et animation de coup. |
| `HydraulicHammer.registerFunctions(vehicleType: any)` | 53 | ✍ Enregistre hydraulicHammerRaycastCallback comme fonction de véhicule. |
| `HydraulicHammer.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Surcharge getDirtMultiplier, getWearMultiplier et getConsumingLoad pour tenir compte des coups récents. |
| `HydraulicHammer.registerEventListeners(vehicleType: any)` | 67 | ✍ Abonne à onLoad, onDelete, onUpdate, onDeactivate, onTurnedOn et onTurnedOff. |
| `HydraulicHammer:onLoad(savegame: table)` | 79 | ✍ Charge les réglages du nœud de travail (dégâts par coup, plage d'intervalle de coup en ms, distance du rayon, types destructibles supportés), le masque de collision des objets statiques et, côté client, effets, sons, nœuds d'animation et animation de coup. À noter : les valeurs par défaut du code (dégâts 1, distance 0,4) diffèrent de celles du schéma (5, 0,3). |
| `HydraulicHammer:onDelete()` | 136 | ✍ Supprime les échantillons sonores, les nœuds d'animation et les effets du nœud de travail. |
| `HydraulicHammer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 148 | ✍ Tant qu'il est allumé et dès que l'instant du prochain coup est atteint, arrête les effets et lance un raycast au plus proche le long de l'axe -Y du nœud de travail contre les objets statiques. Le callback traite le coup. |
| `HydraulicHammer:hydraulicHammerRaycastCallback(actorId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 166 | ✍ Callback du raycast. Trouve l'objet destructible touché, refuse (avec un avertissement au conducteur) si la ferme n'a pas accès au terrain ou si le type n'est pas supporté, sinon ajoute des dégâts et joue animation de coup, son à hauteur modulée et effets, puis planifie le prochain coup. Renvoie false pour stopper les callbacks suivants une fois traité. |
| `HydraulicHammer:onDeactivate()` | 223 | ✍ Client uniquement : arrête les effets du nœud de travail quand le véhicule est désactivé. |
| `HydraulicHammer:onTurnedOn()` | 232 | ✍ Client uniquement : arrête tous les sons, joue le son de démarrage puis le son de ralenti à sa suite, et démarre les nœuds d'animation. |
| `HydraulicHammer:onTurnedOff()` | 244 | ✍ Client uniquement : arrête effets, sons, nœuds d'animation et animation de coup, et joue le son d'arrêt. |
| `HydraulicHammer:getDirtMultiplier(superFunc: any) → number` | 262 | ✍ Ajoute le multiplicateur de salissure de travail à la valeur du parent si un coup a eu lieu dans les 500 dernières ms. |
| `HydraulicHammer:getWearMultiplier(superFunc: any) → number` | 276 | ✍ Ajoute le multiplicateur d'usure de travail à la valeur du parent si un coup a eu lieu dans les 500 dernières ms. |
| `HydraulicHammer:getConsumingLoad(superFunc: any)` | 289 | ✍ Ajoute une unité de charge (valeur et compteur) au résultat du parent tant qu'un coup a eu lieu dans les 500 dernières ms. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `hydraulicHammerRaycastCallback` | 54 |
| registerOverwrittenFunction | `getDirtMultiplier` | 60 |
| registerOverwrittenFunction | `getWearMultiplier` | 61 |
| registerOverwrittenFunction | `getConsumingLoad` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onUpdate` | 70 |
| registerEventListener | `onDeactivate` | 71 |
| registerEventListener | `onTurnedOn` | 72 |
| registerEventListener | `onTurnedOff` | 73 |
