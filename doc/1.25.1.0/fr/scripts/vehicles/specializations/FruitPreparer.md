# vehicles/specializations/FruitPreparer.lua

*[English version](../../../../scripts/vehicles/specializations/FruitPreparer.md)*

Source: `dataS/scripts/vehicles/specializations/FruitPreparer.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils qui préparent les cultures avant la récolte, comme les broyeurs de fanes de pommes de terre et les effeuilleuses de betteraves. Elle ajoute un type de zone de travail fruitPreparer qui appelle FSDensityMapUtil.updateFruitPreparerArea pour les types de fruits configurés, suit un indicateur isWorking côté serveur synchronisé aux clients, et pilote sons et animations. Elle ajuste aussi salissure/usure, contrôle de limite de vitesse et réglages IA. Exige WorkArea et TurnOnVehicle.

- **FruitPreparer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FruitPreparer.initSpecialization()` | 17 | ✍ Enregistre le type de zone de travail « fruitPreparer » et les clés XML : type(s) de fruit, aiUsePreparedState, indice de zone de dépôt, nœuds d'animation, sons de travail et l'option moveOnlyIfPreparerCut des pièces à mouvement aléatoire. |
| `FruitPreparer.prerequisitesPresent(specializations: table) → boolean` | 42 | ✍ Exige les spécialisations WorkArea et TurnOnVehicle. |
| `FruitPreparer.registerFunctions(vehicleType: any)` | 48 | ✍ Enregistre processFruitPreparerArea sur le type de véhicule. |
| `FruitPreparer.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Enregistre des surcharges pour le chargement des zones de travail, la manipulation du sol, le contrôle de limite de vitesse, les exigences de fruits de l'IA, les multiplicateurs de salissure et d'usure et le chargement/activité des pièces à mouvement aléatoire. |
| `FruitPreparer.registerEventListeners(vehicleType: any)` | 67 | ✍ Abonne aux événements de chargement, suppression, flux de mise à jour, allumage/extinction, fin de traitement des zones de travail et réglages de parcours IA. |
| `FruitPreparer:onLoad(savegame: table)` | 81 | ✍ Charge les sons et nœuds d'animation côté client ainsi que la liste des types de fruits à préparer (fruitType et fruitTypes). Pour chacun, enregistre les exigences de fruits de l'IA depuis les stades de préparation du fruit, ou ses stades de récolte s'il n'en a pas. Avertit pour les types inconnus ou absents. |
| `FruitPreparer:onDelete()` | 142 | ✍ Supprime les échantillons sonores de travail et les nœuds d'animation. |
| `FruitPreparer:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 153 | ✍ Client : lit l'indicateur isWorking envoyé par le serveur. |
| `FruitPreparer:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 165 | ✍ Serveur : écrit l'indicateur isWorking pour les clients. |
| `FruitPreparer:onTurnedOn()` | 175 | ✍ Client : démarre le son de travail et les nœuds d'animation. |
| `FruitPreparer:onTurnedOff()` | 186 | ✍ Client : arrête les sons et les nœuds d'animation. |
| `FruitPreparer:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 200 | ✍ Surcharge qui appelle le parent et, pour les zones de travail de type FRUITPREPARER, lit fruitPreparer#dropWorkAreaIndex (avec vérification des anciens attributs). Renvoie le résultat du parent. |
| `FruitPreparer:getDoGroundManipulation(superFunc: any) → boolean` | 217 | ✍ Surcharge ne renvoyant le résultat du parent que lorsque le préparateur travaille réellement (isWorking). |
| `FruitPreparer:doCheckSpeedLimit(superFunc: any) → boolean` | 225 | ✍ Surcharge qui impose aussi la limite de vitesse quand l'outil est allumé et abaissé (chaîne d'outils abaissée ou outil abaissé) ; sinon utilise le résultat du parent. |
| `FruitPreparer:getAllowCutterAIFruitRequirements(superFunc: any)` | 243 | ✍ Surcharge renvoyant toujours false : les exigences de fruits de l'IA propres aux barres de coupe ne sont pas utilisées pour cet outil. |
| `FruitPreparer:getDirtMultiplier(superFunc: any)` | 249 | ✍ Surcharge qui ajoute le multiplicateur de salissure de travail, proportionnel à la vitesse rapportée à la limite, pendant que le préparateur travaille. |
| `FruitPreparer:getWearMultiplier(superFunc: any)` | 261 | ✍ Surcharge qui ajoute le multiplicateur d'usure de travail, proportionnel à la vitesse rapportée à la limite, pendant que le préparateur travaille. |
| `FruitPreparer:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 273 | ✍ Surcharge qui lit l'indicateur moveOnlyIfPreparerCut d'une pièce à mouvement aléatoire après le chargeur parent. |
| `FruitPreparer:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 283 | ✍ Surcharge qui, pour les pièces marquées moveOnlyIfPreparerCut, exige que le préparateur travaille en plus de la condition du parent. |
| `FruitPreparer.getDefaultSpeedLimit() → number` | 296 | ✍ Renvoie la limite de vitesse par défaut de ce type d'outil, 15 (unité non précisée ici, probablement km/h : NON VÉRIFIÉ). |
| `FruitPreparer:onEndWorkAreaProcessing(dt: any)` | 302 | ✍ Serveur : met isWorking à true si l'outil a préparé quelque chose dans les 500 dernières ms et lève le drapeau de modification quand cela change, pour informer les clients. |
| `FruitPreparer:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 315 | ✍ Configure le parcours de champ de l'IA pour traiter d'abord les fourrières et travailler le segment initial. |
| `FruitPreparer:processFruitPreparerArea(workArea: any)` | 322 | ✍ Applique FSDensityMapUtil.updateFruitPreparerArea pour chaque type de fruit configuré sur la zone de travail (éventuellement sur une zone de dépôt séparée), enregistre l'heure du dernier travail et renvoie 0 et la surface travaillée. Les clients au-delà de CLIENT_DM_UPDATE_RADIUS renvoient 0, 0. À noter : la surface travaillée est écrasée à chaque type de fruit, pas additionnée. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processFruitPreparerArea` | 49 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 55 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 56 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 57 |
| registerOverwrittenFunction | `getAllowCutterAIFruitRequirements` | 58 |
| registerOverwrittenFunction | `getDirtMultiplier` | 59 |
| registerOverwrittenFunction | `getWearMultiplier` | 60 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 61 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onReadUpdateStream` | 70 |
| registerEventListener | `onWriteUpdateStream` | 71 |
| registerEventListener | `onTurnedOn` | 72 |
| registerEventListener | `onTurnedOff` | 73 |
| registerEventListener | `onEndWorkAreaProcessing` | 74 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 75 |
