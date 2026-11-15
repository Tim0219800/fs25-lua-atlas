# vehicles/specializations/StonePicker.lua

Source : `dataS/scripts/vehicles/specializations/StonePicker.lua` — FS25 1.25.1.0

✍ Spécialisation des ramasse-pierres : ramasse les pierres de la carte de densité des pierres (stoneSystem) et les verse dans une unité de remplissage de type STONE. EFFETS (client) : deux groupes chargés par g_effectManager:loadEffect, effects (vehicle.stonePicker.effects : pierres éjectées/ramassées) et soilEffects (vehicle.stonePicker.soilEffects : terre soulevée par l'outil). Classes d'effets et EffectManager absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (calculé côté serveur dans onEndWorkAreaProcessing, puis diffusé) : l'effet pierres est actif si de la surface a été touchée dans les 500 derniers ms (lastChangedAreaTime) ; l'effet de terre (soilEffects) est actif si l'outil travaille (isWorking : vitesse > 0.5 lors d'un traitement de zone) ET que le véhicule est sur un champ (self.isOnField). Le serveur n'appelle setStonePickerEffectsState que si l'un des trois éléments (pierres, stade 1-3, terre) a changé, puis lève dirtyFlag. DONNÉES TRANSMISES : pour les pierres, setEffectTypeInfo(effets, FillType.STONE, nil, growthState) où growthState = clamp(floor(stoneFactor + 0.49), 1, 3) (stade de densité de pierres lu par updateStonePickerArea) ; pour la terre, simple start/stop sans type. CONDITIONS de zone : le traitement de zone ne se fait que si l'outil est allumé (si needsActivation, vrai par défaut), qu'il n'est pas plein (freeCapacity > 0, sauf IA), après 2000 ms depuis l'attelage et, par défaut, abaissé. Le plein arrête aussi l'outil (onFillUnitFillLevelChanged, serveur). TERRAIN : updateStonePickerArea (corps absent du dump, NON VÉRIFIÉ) renvoie facteur de pierres, surface touchée et totale ; litres = surface en m2 (getFruitPixelsToSqm) * stoneSystem:getLitersPerSqm() * facteur, ajoutés à l'unité de remplissage en fin de passe. eraseTireTrack toujours appelé ; hors client lointain (> StonePicker.CLIENT_DM_UPDATE_RADIUS, constante non définie ici, NON VÉRIFIÉ) le traitement est sauté. MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : flux initial et flux de mise à jour (effet pierres, stade sur 2 bits, effet terre) ; le client applique donc l'état du serveur via setStonePickerEffectsState sans le recalculer. dt : fenêtre de 500 ms mesurée avec g_time, indépendante du FPS. getDoGroundManipulation (surcharge) renvoie faux si pas isWorking : consulté par WorkParticles.lua:238 pour les particules de sol. Les multiplicateurs de salissure/usure ne comptent que la marche avant (movingDirection > 0) ; la salissure lit spec.speedLimit (champ non défini dans ce fichier, la ligne d'usure lit self.speedLimit : NON VÉRIFIÉ). POINTS D'EXTENSION : fonction processStonePickerArea et setStonePickerEffectsState ; surcharges doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type STONEPICKER), getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn ; événements de flux, onFillUnitFillLevelChanged, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Enregistre aussi une stratégie IA (AIDriveStrategyStonePicker). Vitesse limite par défaut : 10.

- **StonePicker** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StonePicker.initSpecialization()` | 17 | ✍ Enregistre la stratégie de conduite IA AIDriveStrategyStonePicker, le type de zone stonePicker et le schéma XML (effets effects et soilEffects, sons, unité de remplissage, noeud de direction, needsActivation, onlyActiveWhenLowered). Non relu clé par clé. |
| `StonePicker.prerequisitesPresent(specializations: table) → boolean` | 46 | ✍ Exige FillUnit et WorkArea. |
| `StonePicker.registerFunctions(vehicleType: any)` | 53 | ✍ Enregistre processStonePickerArea et setStonePickerEffectsState (liste exacte non relue). |
| `StonePicker.registerOverwrittenFunctions(vehicleType: any)` | 60 | ✍ Surcharge doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn. |
| `StonePicker.registerEventListeners(vehicleType: any)` | 74 | ✍ S'abonne notamment à onLoad, onDelete, aux quatre événements de flux, onFillUnitFillLevelChanged, onAIFieldCourseSettingsInitialized, onPostAttach, onDeactivate et aux événements de traitement de zone. |
| `StonePicker:onLoad(savegame: table)` | 92 | ✍ Charge sons et deux groupes d'effets (client), lit unité de remplissage, noeud de charge, direction, needsActivation (vrai) et onlyActiveWhenLowered (vrai), initialise les paramètres de passe et, côté serveur, les exigences IA (plage semable, carte de pierres). |
| `StonePicker:onDelete()` | 154 | ✍ Libère effets effects et soilEffects. |
| `StonePicker:onReadStream(streamId: any, connection: any)` | 163 | ✍ Lit à la connexion l'état de l'effet pierres, le stade (2 bits) et l'état de l'effet terre, puis les applique. |
| `StonePicker:onWriteStream(streamId: any, connection: any)` | 172 | ✍ Écrit ces trois valeurs. |
| `StonePicker:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 181 | ✍ Côté client : si le drapeau est levé, lit et applique les trois valeurs. |
| `StonePicker:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 194 | ✍ Côté serveur : écrit les trois valeurs lorsque dirtyFlag est levé. |
| `StonePicker:processStonePickerArea(workArea: any, dt: any)` | 207 | ✍ Ignoré si l'outil n'est pas actif (isActive de la passe). Efface les traces de pneus, puis (hors client lointain) appelle updateStonePickerArea, calcule les litres ramassés, retient le stade de pierres 1-3, l'heure de dernière modification et met isWorking (vitesse > 0.5). Renvoie surface touchée et totale. |
| `StonePicker:setStonePickerEffectsState(state: any, growthState: any, stateSoil: any)` | 247 | ✍ Point central des effets : mémorise les trois états et, côté client, démarre/arrête l'effet pierres (avec FillType.STONE et le stade), l'effet terre et les sons associés. N'agit que sur changement d'état. |
| `StonePicker:doCheckSpeedLimit(superFunc: any) → boolean` | 294 | ✍ Applique la limite de vitesse quand l'outil est abaissé et, si activation requise, allumé. |
| `StonePicker:getDoGroundManipulation(superFunc: any) → boolean` | 302 | ✍ Renvoie faux si isWorking est faux ; sinon délègue. Interrogé par WorkParticles. |
| `StonePicker:getDirtMultiplier(superFunc: any) → number` | 315 | ✍ Ajoute la salissure de travail (marche avant, isWorking, outil allumé si requis), pondérée par la vitesse. |
| `StonePicker:getWearMultiplier(superFunc: any) → number` | 330 | ✍ Idem pour l'usure, sans facteur de pierres. |
| `StonePicker:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 347 | ✍ Force le type de zone STONEPICKER si le type lu est DEFAULT. |
| `StonePicker:getIsWorkAreaActive(superFunc: any, workArea: any)` | 359 | ✍ Pour STONEPICKER : inactive pendant le délai post-attelage, si non abaissée (quand exigé) ou si l'outil est plein (sauf IA). |
| `StonePicker:getCanBeTurnedOn(superFunc: any)` | 384 | ✍ Refuse l'allumage si l'outil est plein (sauf IA). |
| `StonePicker:getTurnedOnNotAllowedWarning(superFunc: any)` | 397 | ✍ Renvoie le texte d'avertissement « outil plein » dans ce cas. |
| `StonePicker:getCanToggleTurnedOn(superFunc: any)` | 410 | ✍ Interdit le basculement manuel si needsActivation est faux. |
| `StonePicker:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 421 | ✍ Serveur : éteint l'outil lorsque l'unité de remplissage devient pleine (hors IA). |
| `StonePicker:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 436 | ✍ Paramètres de parcours IA : bordures d'abord, segment initial travaillé, découpage des segments à 50, outil toujours actif. |
| `StonePicker:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 450 | ✍ Arme le délai d'activation de 2000 ms. |
| `StonePicker:onDeactivate()` | 457 | ✍ Coupe le son de travail (la fin du fichier n'arrête pas les effets : non vérifié en jeu). |
| `StonePicker:onStartWorkAreaProcessing(dt: any)` | 467 | ✍ Avant la passe : isWorking = faux, passe active si allumé (ou activation non requise), angle de la carte de densité, remise à zéro des litres et surfaces. |
| `StonePicker:onEndWorkAreaProcessing(dt: any)` | 485 | ✍ Serveur : statistiques de surface, décision des états d'effet (pierres < 500 ms, terre = isWorking et sur champ) avec diffusion réseau si changement, puis ajout des litres de pierres à l'unité de remplissage. |
| `StonePicker.getDefaultSpeedLimit() → number` | 515 | ✍ Limite de vitesse par défaut : 10. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processStonePickerArea` | 54 |
| registerFunction | `setStonePickerEffectsState` | 55 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 61 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 62 |
| registerOverwrittenFunction | `getDirtMultiplier` | 63 |
| registerOverwrittenFunction | `getWearMultiplier` | 64 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 65 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 66 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 67 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 68 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onPostAttach` | 81 |
| registerEventListener | `onDeactivate` | 82 |
| registerEventListener | `onStartWorkAreaProcessing` | 83 |
| registerEventListener | `onEndWorkAreaProcessing` | 84 |
| registerEventListener | `onFillUnitFillLevelChanged` | 85 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 86 |
