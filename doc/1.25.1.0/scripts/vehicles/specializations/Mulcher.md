# vehicles/specializations/Mulcher.lua

Source : `dataS/scripts/vehicles/specializations/Mulcher.lua` — FS25 1.25.1.0

✍ Spécialisation des broyeurs (de fanes, de chaumes, de couvert, de vignes). C'est l'une des rares spécialisations de ce lot avec un vrai système d'effets par zone de travail. EFFETS : vehicle.mulcher.effects.effect(?), chargés par g_effectManager:loadEffect ; chaque entrée a workAreaIndex (zone liée), activeDirection (0 = toutes, sinon doit égaler movingDirection) et une durée d'activité de 250 ms. Le type de remplissage transmis à l'effet est fixe : spec.effectFillType = WHEAT (setEffectTypeInfo avec ce seul argument) ; aucune lecture de la culture réellement broyée ni de son stade. Pour les effets de classe CultivatorMotionPathEffect, autoTurnOffSpeed est forcé à -infini (l'arrêt est donc piloté par ce script, pas par la vitesse). Les classes d'effets et EffectManager sont absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (serveur ou client à distance <= Mulcher.CLIENT_DM_UPDATE_RADIUS, constante non définie ici, NON VÉRIFIÉ) : dans processMulcherArea, si l'appel FSDensityMapUtil.updateMulcherArea renvoie une surface réellement modifiée > 0 ET que la vitesse est > 0.5, les effets de cette zone dont la direction convient sont (re)armés : activeTime = temps courant + 250 ms et démarrage s'ils étaient arrêtés. Autrement dit, la poussière/les débris ne partent que lorsque de la matière est réellement broyée dans la carte de densité (pas simplement en roulant). ARRÊT : onUpdateTick (côté serveur uniquement) coupe les effets expirés. RÉSEAU : booléen par effet envoyé au flux initial (onWriteStream) et en mise à jour via effectDirtyFlag ; le client applique setEffectTypeInfo + startEffects/stopEffects à la réception. Un client ne calcule donc pas l'effet lui-même, sauf s'il fait aussi tourner processMulcherArea. À noter : onLoad retire l'écouteur onUpdateTick quand l'instance n'est pas client (Mulcher.lua:173) alors que cette fonction ne s'exécute que côté serveur ; sur un serveur dédié, l'expiration des effets ne serait donc jamais traitée et isActive resterait vrai, ce qui empêcherait tout nouveau drapeau d'arrêt (non vérifié en jeu). MÉTÉO/HUMIDITÉ : aucune lecture. CARTES : eraseTireTrack (toujours, même client lointain), updateMulcherArea (corps absent du dump), getStoneArea pour l'usure. isWorking = moins de 500 ms écoulées depuis le dernier broyage réel (g_time) ; getDoGroundManipulation (surcharge) renvoie faux si pas isWorking, ce que WorkParticles.lua:238 consulte pour ses particules de sol. dt : activeTime en millisecondes de temps de jeu, indépendant du FPS. POINTS D'EXTENSION : fonctions processMulcherArea ; surcharges doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment, loadWorkAreaFromXML (type MULCHER) ; événements onLoad, onPostLoad, onDelete, flux réseau, onUpdateTick, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Vitesse limite par défaut : 15.

- **Mulcher** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Mulcher.initSpecialization()` | 26 | ✍ Déclare le type de zone mulcher et le schéma XML : effets (vehicle.mulcher.effects.effect(?) avec workAreaIndex/activeDirection) et sons idle/work. Non relu clé par clé. |
| `Mulcher.prerequisitesPresent(specializations: table) → boolean` | 46 | ✍ Exige WorkArea et GroundReference. |
| `Mulcher.registerFunctions(vehicleType: any)` | 52 | ✍ Enregistre processMulcherArea sur le type de véhicule. |
| `Mulcher.registerOverwrittenFunctions(vehicleType: any)` | 58 | ✍ Surcharge doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment et loadWorkAreaFromXML. |
| `Mulcher.registerEventListeners(vehicleType: any)` | 68 | ✍ S'abonne notamment à onLoad, onPostLoad, onDelete, aux quatre événements de flux réseau, onUpdateTick, onDeactivate et aux événements de traitement de zone (liste exacte non relue). |
| `Mulcher:onLoad(savegame: table)` | 86 | ✍ Charge sons et effets (une table par effet avec zone, direction, fenêtre de 250 ms, états actif/envoyé), fixe effectFillType à WHEAT, déclare les besoins IA (cultures dont le stade broyé est défini, remplacements de mauvaises herbes) et le multiplicateur d'usure de pierres ; retire onUpdateTick si pas client ou sans effet. |
| `Mulcher:onPostLoad(savegame: any)` | 180 | ✍ Rattache chaque effet à sa zone de travail (workAreaToEffects) et retire ceux dont workAreaIndex est invalide (avec avertissement XML). |
| `Mulcher:onDelete()` | 200 | ✍ Libère sons et effets. |
| `Mulcher:onReadStream(streamId: any, connection: any)` | 216 | ✍ Reçoit l'état actif de chaque effet à la connexion : démarre (avec effectFillType) ou arrête l'effet. |
| `Mulcher:onWriteStream(streamId: any, connection: any)` | 230 | ✍ Écrit l'état actif de chaque effet. |
| `Mulcher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 239 | ✍ Côté client : si le drapeau est présent, lit l'état de chaque effet et le démarre ou l'arrête. |
| `Mulcher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 257 | ✍ Côté serveur : écrit l'état des effets quand effectDirtyFlag est levé. |
| `Mulcher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 270 | ✍ Serveur seulement : désactive les effets dont la fenêtre de 250 ms est expirée, lève effectDirtyFlag et appelle stopEffects. Retiré de l'abonnement si l'instance n'est pas client ou sans effet (voir module). |
| `Mulcher:processMulcherArea(workArea: any, dt: any)` | 285 | ✍ Efface les traces de pneus, applique le broyage à la carte de densité (updateMulcherArea) et, si de la surface réelle est traitée à vitesse > 0.5, arme/démarre les effets de la zone (direction permitting) puis lève le drapeau réseau. Met à jour lastWorkTime (g_time), isWorking (< 500 ms) et la lecture de pierres. Renvoie surface réelle et totale. |
| `Mulcher:doCheckSpeedLimit(superFunc: any) → boolean` | 337 | ✍ Applique la limite de vitesse dès que la chaîne d'outils est abaissée. |
| `Mulcher:getDoGroundManipulation(superFunc: any) → boolean` | 344 | ✍ Renvoie faux tant que isWorking est faux ; sinon délègue au parent. Interrogé par WorkParticles pour ses particules de sol. |
| `Mulcher:getDirtMultiplier(superFunc: any) → number` | 357 | ✍ Ajoute la salissure de travail pondérée par la vitesse quand isWorking (lit spec.speedLimit, champ de la table de spécialisation que ce fichier ne définit nulle part, alors que d'autres outils lisent self.speedLimit : à noter, peut être fourni ailleurs, NON VÉRIFIÉ). |
| `Mulcher:getWearMultiplier(superFunc: any) → number` | 371 | ✍ Ajoute l'usure de travail pondérée par vitesse et par le multiplicateur de pierres. |
| `Mulcher:getAIImplementUseVineSegment(superFunc: any, placeable: any, segment: any, segmentSide: any)` | 389 | ✍ Dit si l'IA doit traiter un segment de vigne : vrai si plus de 1 % de la surface du segment est couverte par l'outil. |
| `Mulcher:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 406 | ✍ Force le type de zone MULCHER si le type lu est DEFAULT. |
| `Mulcher:onDeactivate()` | 418 | ✍ Coupe sons et effets. |
| `Mulcher:onStartWorkAreaProcessing(dt: any)` | 434 | ✍ Remet isWorking et isWorkingIdle à faux avant la passe. |
| `Mulcher:onEndWorkAreaProcessing(dt: any)` | 443 | ✍ Client : démarre/arrête le son de travail (selon isWorking) et le son de ralenti (selon isWorkingIdle, vitesse > 0.5). |
| `Mulcher:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 475 | ✍ Paramètres de parcours IA : bordures d'abord, segment initial travaillé. |
| `Mulcher.getDefaultSpeedLimit() → number` | 483 | ✍ Limite de vitesse par défaut : 15. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processMulcherArea` | 53 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 59 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 60 |
| registerOverwrittenFunction | `getDirtMultiplier` | 61 |
| registerOverwrittenFunction | `getWearMultiplier` | 62 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
| registerEventListener | `onReadUpdateStream` | 74 |
| registerEventListener | `onWriteUpdateStream` | 75 |
| registerEventListener | `onUpdateTick` | 76 |
| registerEventListener | `onDeactivate` | 77 |
| registerEventListener | `onStartWorkAreaProcessing` | 78 |
| registerEventListener | `onEndWorkAreaProcessing` | 79 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 80 |
