# vehicles/specializations/StumpCutterLight.lua

*[English version](../../../../scripts/vehicles/specializations/StumpCutterLight.md)*

Source: `dataS/scripts/vehicles/specializations/StumpCutterLight.lua` — FS25 1.25.1.0

✍ Spécialisation simplifiée de broyeur de souches (exige TurnOnVehicle) qui retire les souches trouvées près d'un node de référence. Le serveur lance des tests de recouvrement sphérique asynchrones sur la collision des arbres puis, après un délai, replante chaque souche trouvée comme nouvel arbre et supprime la souche. Elle bloque aussi les actions contrôlées quand aucune souche n'est à portée. À noter : le dump ne contient pas la ligne « StumpCutterLight = {} » dans ce fichier (création de la table NON VÉRIFIÉ).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StumpCutterLight.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true uniquement si le type de véhicule possède aussi la spécialisation TurnOnVehicle. |
| `StumpCutterLight.initSpecialization()` | 25 | ✍ Enregistre le schéma XML : node de référence de coupe, rayon de coupe (1 par défaut), durée de coupe (1 par défaut) et les effets sous vehicle.stumpCutterLight. |
| `StumpCutterLight.registerFunctions(vehicleType: any)` | 40 | ✍ Enregistre removeTreeStump et stumpCutterLightOverlapCallback sur le type de véhicule. |
| `StumpCutterLight.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Surcharge getAreControlledActionsAllowed, getDirtMultiplier, getWearMultiplier et getConsumingLoad. |
| `StumpCutterLight.registerEventListeners(vehicleType: any)` | 56 | ✍ S'abonne à onLoad, onDelete, onUpdate, onDeactivate, onTurnedOn et onTurnedOff. |
| `StumpCutterLight:onLoad(savegame: table)` | 68 | ✍ Lit le node, le rayon et la durée de coupe, initialise la liste de souches, charge les effets sur les clients et le texte d'avertissement « aucune souche à portée ». Retire les écouteurs inutiles selon le côté (onUpdate sur les clients, écouteurs d'effets sur un serveur sans client). |
| `StumpCutterLight:onDelete()` | 104 | ✍ Supprime les effets. |
| `StumpCutterLight:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 114 | ✍ Serveur uniquement. Allumé, accumule la minuterie de coupe si des souches sont trouvées et, une fois dépassée sans recouvrement en attente, les retire toutes et éteint (via les actions contrôlées sur les plateformes à contrôle automatique). Lance un nouveau recouvrement sphérique asynchrone si aucun n'est en cours. |
| `StumpCutterLight:onDeactivate()` | 158 | ✍ Arrête les effets. |
| `StumpCutterLight:onTurnedOn()` | 166 | ✍ Règle le type de remplissage des effets sur copeaux de bois et lance les effets. |
| `StumpCutterLight:onTurnedOff()` | 175 | ✍ Arrête les effets. |
| `StumpCutterLight:removeTreeStump(shapeId: integer)` | 183 | ✍ Serveur uniquement. Replante un arbre du même type que la souche à sa position avec un lacet aléatoire, incrémente la statistique plantedTreeCount de la ferme, puis supprime le node de la souche. |
| `StumpCutterLight:stumpCutterLightOverlapCallback(objectId: any, ...: any)` | 203 | ✍ Callback du recouvrement asynchrone : retient l'objet s'il s'agit d'un mesh split shape avec l'attribut utilisateur isTreeStump, puis marque le test comme terminé. Ignoré si le véhicule est supprimé. |
| `StumpCutterLight:getAreControlledActionsAllowed(superFunc: any)` | 218 | ✍ Surcharge : renvoie false avec le texte « aucune souche à portée » quand aucune souche n'est trouvée ; sinon délègue au parent. |
| `StumpCutterLight:getDirtMultiplier(superFunc: any) → number` | 230 | ✍ Surcharge ajoutant le multiplicateur de salissure de travail quand le véhicule est allumé. |
| `StumpCutterLight:getWearMultiplier(superFunc: any) → number` | 243 | ✍ Surcharge ajoutant le multiplicateur d'usure de travail quand le véhicule est allumé. |
| `StumpCutterLight:getConsumingLoad(superFunc: any)` | 255 | ✍ Surcharge qui ajoute une entrée de charge : 1 si allumé, sinon 0, et incrémente le compteur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `removeTreeStump` | 41 |
| registerFunction | `stumpCutterLightOverlapCallback` | 42 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 48 |
| registerOverwrittenFunction | `getDirtMultiplier` | 49 |
| registerOverwrittenFunction | `getWearMultiplier` | 50 |
| registerOverwrittenFunction | `getConsumingLoad` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onDelete` | 58 |
| registerEventListener | `onUpdate` | 59 |
| registerEventListener | `onDeactivate` | 60 |
| registerEventListener | `onTurnedOn` | 61 |
| registerEventListener | `onTurnedOff` | 62 |
