# vehicles/specializations/Leveler.lua

*[English version](../../../../scripts/vehicles/specializations/Leveler.md)*

Source: `dataS/scripts/vehicles/specializations/Leveler.lua` — FS25 1.25.1.0

✍ Spécialisation pour les lames/niveleuses qui poussent et étalent des matières en vrac (ensilage, fourrage haché, tas) sur le terrain à carte de hauteur, surtout dans les silos couloirs. Requiert FillUnit et BunkerSiloInteractor. Chaque `vehicle.leveler.levelerNode` ramasse de la matière en avançant dans le sens de ramassage, la dépose le long d'une ligne et devant la lame, et peut lisser le sol. La simulation tourne côté serveur ; le client reçoit seulement un pourcentage de matière déplacée pour piloter les effets.

- **Leveler** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Leveler.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Renvoie vrai seulement si le type de véhicule possède les spécialisations FillUnit et BunkerSiloInteractor. |
| `Leveler.initSpecialization()` | 29 | ✍ Enregistre le schéma XML du leveler : nœud, largeur, largeurs et décalages de dépose, nombre de contrôles de hauteur, options de lissage, index de fill unit, zones d'occlusion, force, `ignoreFarmlandState` et chemins d'effets. |
| `Leveler.registerFunctions(vehicleType: any)` | 76 | ✍ Enregistre `getIsLevelerPickupNodeActive`, `loadLevelerNodeFromXML` et `onLevelerRaycastCallback` sur le type de véhicule. |
| `Leveler.registerOverwrittenFunctions(vehicleType: any)` | 84 | ✍ Surcharge `getIsAttacherJointControlDampingAllowed` pour que l'amortissement de l'attache dépende de la position du leveler. |
| `Leveler.registerEventListeners(vehicleType: any)` | 90 | ✍ S'abonne aux événements onLoad, onDelete, onReadUpdateStream, onWriteUpdateStream et onUpdate. |
| `Leveler:onLoad(savegame: table)` | 101 | ✍ Lit les réglages du leveler et toutes les entrées `levelerNode`, initialise l'état de lissage de la quantité déplacée, le nœud de force et les effets (client). Retire l'écouteur onUpdate si aucun nœud valide. À noter : la valeur par défaut de `maxFillLevelPerMS` est 35 ici mais 20 dans le schéma. |
| `Leveler:onDelete()` | 163 | ✍ Supprime les effets du leveler. |
| `Leveler:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 174 | ✍ Côté client : si le serveur a signalé un changement, lit depuis le flux le pourcentage de matière déplacée quantifié. |
| `Leveler:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 188 | ✍ Côté serveur : écrit un indicateur et, si le dirty flag est levé, le pourcentage de matière déplacée quantifié pour les clients. |
| `Leveler:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 202 | ✍ Client : démarre ou arrête les effets selon le pourcentage déplacé. Serveur : pour chaque nœud, vérifie l'accès au terrain, ramasse la matière sur la carte de hauteur en avançant dans le sens de ramassage, la dépose sous et devant la lame, lisse le sol, met à jour le pourcentage et applique une force de traînée. Lève le dirty flag en cas de changement. |
| `Leveler:loadLevelerNodeFromXML(levelerNode: table, xmlFile: XMLFile, key: string) → boolean` | 444 | ✍ Charge un nœud de leveler (géométrie, largeurs et décalages de dépose, zones d'occlusion, lissage, fill unit) dans la table donnée et crée un repère de référence. Renvoie faux si le nœud ou la fill unit est absent. |
| `Leveler:getIsLevelerPickupNodeActive(levelerNode: table) → boolean` | 519 | ✍ Renvoie vrai si le véhicule ne peut pas être attelé ou est actuellement attelé à un autre véhicule ; le ramassage n'est actif que dans ce cas. |
| `Leveler:getIsAttacherJointControlDampingAllowed(superFunc: any) → boolean` | 526 | ✍ Surcharge : l'amortissement n'est autorisé que si la fonction parente l'autorise et que la carte de hauteur contient de la matière à la position de chaque nœud. |
| `Leveler.onLevelerRaycastCallback(levelerNode: integer, hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 557 | ✍ Callback de raycast (appelé avec la table du nœud, pas le véhicule). Si le rayon se termine sans toucher d'objet autre que le terrain, il enregistre les zones d'occlusion et dépose le contenu restant devant la lame, le reliquat étant repris plus tard. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsLevelerPickupNodeActive` | 77 |
| registerFunction | `loadLevelerNodeFromXML` | 78 |
| registerFunction | `onLevelerRaycastCallback` | 79 |
| registerOverwrittenFunction | `getIsAttacherJointControlDampingAllowed` | 85 |
| registerEventListener | `onLoad` | 91 |
| registerEventListener | `onDelete` | 92 |
| registerEventListener | `onReadUpdateStream` | 93 |
| registerEventListener | `onWriteUpdateStream` | 94 |
| registerEventListener | `onUpdate` | 95 |
