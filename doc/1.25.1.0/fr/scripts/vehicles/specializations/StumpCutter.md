# vehicles/specializations/StumpCutter.lua

*[English version](../../../../scripts/vehicles/specializations/StumpCutter.md)*

Source: `dataS/scripts/vehicles/specializations/StumpCutter.lua` — FS25 1.25.1.0

✍ Spécialisation des broyeurs de souches qui broient les troncs (split shapes) et nettoient des zones décoratives de la density map. Elle exige TurnOnVehicle et déclare un type de zone de travail « stumpCutter ». Chaque cut node cherche un split shape dans son plan de coupe, puis le serveur coupe ou broie après des minuteries ; le client pilote effets de copeaux, sons et animations. Elle ajoute aussi salissure, usure et charge moteur pendant la coupe.

- **StumpCutter** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StumpCutter.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true uniquement si le type de véhicule possède aussi la spécialisation TurnOnVehicle. |
| `StumpCutter.initSpecialization()` | 25 | ✍ Enregistre le type de zone de travail « stumpCutter » et le schéma XML : cut nodes (taille, minuteries, seuils, index de zone de travail, durée, effets), sons, effets globaux et animation nodes. |
| `StumpCutter.registerFunctions(vehicleType: any)` | 60 | ✍ Enregistre crushSplitShape, stumpCutterSplitShapeCallback et processStumpCutterArea sur le type de véhicule. |
| `StumpCutter.registerOverwrittenFunctions(vehicleType: any)` | 68 | ✍ Surcharge getDirtMultiplier, getWearMultiplier, getCultivatorLimitToField, getPlowLimitToField, getPlowForceLimitToField et getConsumingLoad. |
| `StumpCutter.registerEventListeners(vehicleType: any)` | 79 | ✍ S'abonne à onLoad, onDelete, onUpdateTick, onDeactivate, onTurnedOn et onTurnedOff. |
| `StumpCutter:onLoad(savegame: table)` | 91 | ✍ Lit chaque vehicle.stumpCutter.cutNode(i) (node, tailles de coupe, minuteries, seuils, index de zone de travail, effets) jusqu'au premier manquant, et charge sur les clients sons, effets globaux et animations. Avertit pour les anciennes clés XML FS17 à FS22. |
| `StumpCutter:onDelete()` | 170 | ✍ Supprime les échantillons sonores, les animations, les effets globaux et ceux de chaque cut node. |
| `StumpCutter:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 188 | ✍ Quand le véhicule est allumé, traite un cut node par tick en rotation : cherche un split shape dans son plan ; côté serveur, décompte puis broie l'arbre ou le scinde. Les clients lancent ou arrêtent les effets de copeaux et le son de travail. |
| `StumpCutter:onDeactivate()` | 311 | ✍ Client uniquement : arrête les effets globaux et ceux de chaque cut node. |
| `StumpCutter:onTurnedOn()` | 324 | ✍ Client uniquement : arrête les sons en cours, joue le son start suivi de idle et lance les animation nodes. |
| `StumpCutter:onTurnedOff()` | 337 | ✍ Client uniquement : remet à zéro le fondu de travail, arrête tous les effets et sons, joue le son stop et arrête les animations. |
| `StumpCutter:crushSplitShape(shape: integer)` | 355 | ✍ Serveur uniquement : supprime le split shape et marque une zone carrée de 10 m autour comme modifiée dans la carte de collision de hauteur et le système d'IA. |
| `StumpCutter:stumpCutterSplitShapeCallback(shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 375 | ✍ Callback de splitShape. Broie la partie haute si elle fait moins de 1 m, sinon l'enregistre auprès du gestionnaire d'arbres. La partie basse est broyée si le centre de coupe est sous le terrain, sinon conservée comme forme courante. |
| `StumpCutter:processStumpCutterArea(workArea: any, dt: any)` | 402 | ✍ Callback de zone de travail : pour les cut nodes liés à cette zone, nettoie la zone décorative de la density map (FSDensityMapUtil.clearDecoArea) et met à jour leur dernier temps de travail. Renvoie surface et surface totale ; 0, 0 pour un client éloigné. À noter : CLIENT_DM_UPDATE_RADIUS n'est pas défini dans ce fichier (origine NON VÉRIFIÉ). |
| `StumpCutter:getDirtMultiplier(superFunc: any) → number` | 432 | ✍ Surcharge ajoutant le multiplicateur de salissure de travail tant qu'un split shape est mémorisé dans l'état de la spécialisation. |
| `StumpCutter:getWearMultiplier(superFunc: any) → number` | 446 | ✍ Surcharge ajoutant le multiplicateur d'usure de travail tant qu'un split shape est mémorisé dans l'état de la spécialisation. |
| `StumpCutter:getCultivatorLimitToField(superFunc: any) → boolean` | 460 | ✍ Surcharge qui renvoie toujours false. |
| `StumpCutter:getPlowLimitToField() → boolean` | 467 | ✍ Renvoie false : le broyeur de souches n'est pas limité aux champs pour la logique de charrue. |
| `StumpCutter:getPlowForceLimitToField() → boolean` | 474 | ✍ Renvoie true : le choix de limitation au champ est imposé. |
| `StumpCutter:getConsumingLoad(superFunc: any)` | 480 | ✍ Surcharge qui ajoute une entrée de charge : 1 si un cut node a travaillé dans les 500 dernières ms, sinon 0 (ralenti), et incrémente le compteur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `crushSplitShape` | 61 |
| registerFunction | `stumpCutterSplitShapeCallback` | 62 |
| registerFunction | `processStumpCutterArea` | 63 |
| registerOverwrittenFunction | `getDirtMultiplier` | 69 |
| registerOverwrittenFunction | `getWearMultiplier` | 70 |
| registerOverwrittenFunction | `getCultivatorLimitToField` | 71 |
| registerOverwrittenFunction | `getPlowLimitToField` | 72 |
| registerOverwrittenFunction | `getPlowForceLimitToField` | 73 |
| registerOverwrittenFunction | `getConsumingLoad` | 74 |
| registerEventListener | `onLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onUpdateTick` | 82 |
| registerEventListener | `onDeactivate` | 83 |
| registerEventListener | `onTurnedOn` | 84 |
| registerEventListener | `onTurnedOff` | 85 |
