# vehicles/specializations/Windrower.lua

Source : `dataS/scripts/vehicles/specializations/Windrower.lua` — FS25 1.25.1.0

✍ Spécialisation des andaineurs : ramasse le fourrage étalé (types listés par vehicle.windrower#fillTypes / #fillTypeCategories) sur la zone de travail via la carte de hauteur (DensityMapHeightUtil.tipToGroundAroundLine avec -infini) et le redépose en andain dans une zone de dépôt (dropWindrowWorkAreaIndex). Même architecture que Tedder. EFFETS : animationNodes (client, démarrés à l'allumage) et liste vehicle.windrower.effects.effect(?) chargés par g_effectManager:loadEffect, chacun lié à une zone (workAreaIndex) et optionnellement à une zone de dépôt (dropAreaIndex), fenêtre d'activité 250 ms ; si l'effet expose setWorkAreaIndex, la zone lui est communiquée. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (serveur) : dans processWindrowerArea, quand la zone a ramassé des litres, si le dépôt a effectivement déposé de la matière (dropped > 0) et que la vitesse (getLastSpeed(true)) dépasse 0.5, les effets de la zone dont dropAreaIndex correspond sont armés (activeTime = temps + 250 ms), démarrés au besoin et recalés sur le type déposé (setEffectTypeInfo). Aucune densité réglée (contrairement à Tedder). Le type transmis est celui du dernier andain ramassé (lastValidPickupFillType), jamais un stade de culture. Chaque ramassage appelle aussi setTestAreaRequirements(nil, type, nil) avec le type ramassé (rôle exact dans le rendu NON VÉRIFIÉ : fonction hors fichier). CONDITIONS : isWorking = vitesse > 0.5 au traitement d'une zone ; doCheckSpeedLimit s'applique si allumé (ou sans TurnOnVehicle) et chaîne abaissée ; aucun test d'allumage dans la zone elle-même (getIsWorkAreaActive non surchargé ici : NON VÉRIFIÉ). Traitement sauté pour un client éloigné (> Windrower.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ). ARRÊT : onUpdateTick (côté serveur) coupe les effets expirés et lève effectDirtyFlag ; onTurnedOff coupe tout. Sur serveur dédié, g_effectManager est appelé sans garde isClient (inoffensif ? non vérifié). MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : types de remplissage par zone (fillTypesDirtyFlag) et booléen par effet (effectDirtyFlag), diffusés au flux initial et en mise à jour ; le client applique type et démarrage/arrêt. dt : 250 ms de temps de jeu ; pas de dt dans la physique du dépôt. À noter : onPostLoad utilise table.insert(spec.effects, i) au lieu de table.remove pour un indice invalide (Windrower.lua:171), vraisemblable faute (non vérifié en jeu). particleSystemIndex est lu dans loadWorkAreaFromXML mais jamais utilisé dans ce fichier (reliquat de l'ancien système de particules ; les clés vehicle.windrowerParticleSystems sont signalées obsolètes). POINTS D'EXTENSION : fonctions processWindrowerArea, processDropArea ; surcharges doCheckSpeedLimit, loadWorkAreaFromXML (type WINDROWER), getDirtMultiplier, getWearMultiplier ; événements onLoad, onPostLoad, flux, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Vitesse limite par défaut : 15.

- **Windrower** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Windrower.initSpecialization()` | 17 | ✍ Déclare le type de zone windrower et le schéma XML : effets, animationNodes, types de remplissage supportés, limitToLineHeight, sons. Non relu clé par clé. |
| `Windrower.prerequisitesPresent(specializations: any)` | 46 | ✍ Exige la spécialisation WorkArea (seule). |
| `Windrower.registerFunctions(vehicleType: any)` | 52 | ✍ Enregistre processWindrowerArea et processDropArea. |
| `Windrower.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Surcharge doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier et getWearMultiplier. |
| `Windrower.registerEventListeners(vehicleType: any)` | 68 | ✍ S'abonne à onLoad, onPostLoad, onDelete, aux quatre événements de flux, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing et onAIFieldCourseSettingsInitialized (liste non relue ligne à ligne). |
| `Windrower:onLoad(savegame: any)` | 86 | ✍ Charge animations et effets (client), lit limitToLineHeight et la liste des types supportés, initialise multiplicateur d'usure de pierres (type WINDROWER) et drapeaux réseau, déclare à l'IA les types de hauteur requis. |
| `Windrower:onPostLoad(savegame: any)` | 157 | ✍ Rattache chaque effet à sa zone de travail et à l'indice de type de la zone ; avertit si indice invalide (avec l'insertion fautive signalée dans le module). |
| `Windrower:onDelete()` | 178 | ✍ Libère animations et effets. |
| `Windrower:onReadStream(streamId: any, connection: any)` | 193 | ✍ Lit les types de remplissage par zone puis l'état de chaque effet ; démarre ou arrête les effets avec le type de la zone. |
| `Windrower:onWriteStream(streamId: any, connection: any)` | 217 | ✍ Écrit les types par zone puis l'état envoyé de chaque effet. |
| `Windrower:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 229 | ✍ Côté client : lit si présents types et états d'effets, applique démarrage/arrêt avec setEffectTypeInfo. |
| `Windrower:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 261 | ✍ Côté serveur : écrit types (fillTypesDirtyFlag) et états (effectDirtyFlag). |
| `Windrower:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 281 | ✍ Serveur : coupe les effets dont la fenêtre de 250 ms a expiré et lève effectDirtyFlag. |
| `Windrower:onTurnedOn()` | 301 | ✍ Client : lance le son de travail et les animationNodes. |
| `Windrower:onTurnedOff()` | 311 | ✍ Coupe tous les effets (sans garde client) et arrête les animations. |
| `Windrower:doCheckSpeedLimit(superFunc: any)` | 324 | ✍ Applique la limite de vitesse si la chaîne d'outils est abaissée et l'outil allumé (ou non allumable). |
| `Windrower.getDefaultSpeedLimit()` | 335 | ✍ Limite de vitesse par défaut : 15. |
| `Windrower:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 341 | ✍ Force le type WINDROWER si DEFAULT ; pour une zone WINDROWER lit particleSystemIndex (inutilisé) et la zone de dépôt, initialise litres et type, réserve un emplacement dans windrowerWorkAreaFillTypes. |
| `Windrower:getDirtMultiplier(superFunc: any)` | 370 | ✍ Ajoute la salissure de travail pondérée vitesse/limite quand isWorking. |
| `Windrower:getWearMultiplier(superFunc: any)` | 384 | ✍ Ajoute l'usure de travail pondérée vitesse/limite et par le multiplicateur de pierres. |
| `Windrower:onStartWorkAreaProcessing(dt: any, workAreas: any)` | 403 | ✍ Remet à zéro, pour chaque zone, type valide ramassé, litres ramassés et déposés ; isWorking = faux. |
| `Windrower:onEndWorkAreaProcessing(dt: any, workAreas: any)` | 415 | ✍ Client sans TurnOnVehicle : démarre/arrête le son de travail selon isWorking. Pas d'effet visuel ici. |
| `Windrower:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 435 | ✍ Paramètres de parcours IA : bordures d'abord, segment initial travaillé. |
| `Windrower:processWindrowerArea(workArea: any, dt: any)` | 442 | ✍ Ramasse l'andain sous la zone : cherche un type supporté (ou reprend le dernier type, herbe fraîche et sèche équivalentes), mémorise lastValidPickupFillType et appelle setTestAreaRequirements, cumule litres à déposer, dépose via processDropArea et, côté serveur à vitesse > 0.5 avec dépôt réel, met à jour le type par zone et arme/démarre les effets. Renvoie litres déposés et surface (largeur * distance parcourue). |
| `Windrower:processDropArea(dropArea: any, litersToDrop: any, fillType: any)` | 562 | ✍ Dépose les litres sur la ligne de la zone de dépôt (tipToGroundAroundLine), mémorise le décalage de ligne et renvoie les litres réellement déposés. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processWindrowerArea` | 53 |
| registerFunction | `processDropArea` | 54 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 60 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 61 |
| registerOverwrittenFunction | `getDirtMultiplier` | 62 |
| registerOverwrittenFunction | `getWearMultiplier` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
| registerEventListener | `onReadUpdateStream` | 74 |
| registerEventListener | `onWriteUpdateStream` | 75 |
| registerEventListener | `onUpdateTick` | 76 |
| registerEventListener | `onTurnedOn` | 77 |
| registerEventListener | `onTurnedOff` | 78 |
| registerEventListener | `onStartWorkAreaProcessing` | 79 |
| registerEventListener | `onEndWorkAreaProcessing` | 80 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 81 |
