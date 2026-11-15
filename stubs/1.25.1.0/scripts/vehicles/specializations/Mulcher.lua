---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Mulcher.lua (stub généré, atlas Lua FS25)

--- Spécialisation des broyeurs (de fanes, de chaumes, de couvert, de vignes). C'est l'une des rares spécialisations de ce lot avec un vrai système d'effets par zone de travail. EFFETS : vehicle.mulcher.effects.effect(?), chargés par g_effectManager:loadEffect ; chaque entrée a workAreaIndex (zone liée), activeDirection (0 = toutes, sinon doit égaler movingDirection) et une durée d'activité de 250 ms. Le type de remplissage transmis à l'effet est fixe : spec.effectFillType = WHEAT (setEffectTypeInfo avec ce seul argument) ; aucune lecture de la culture réellement broyée ni de son stade. Pour les effets de classe CultivatorMotionPathEffect, autoTurnOffSpeed est forcé à -infini (l'arrêt est donc piloté par ce script, pas par la vitesse). Les classes d'effets et EffectManager sont absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (serveur ou client à distance <= Mulcher.CLIENT_DM_UPDATE_RADIUS, constante non définie ici, NON VÉRIFIÉ) : dans processMulcherArea, si l'appel FSDensityMapUtil.updateMulcherArea renvoie une surface réellement modifiée > 0 ET que la vitesse est > 0.5, les effets de cette zone dont la direction convient sont (re)armés : activeTime = temps courant + 250 ms et démarrage s'ils étaient arrêtés. Autrement dit, la poussière/les débris ne partent que lorsque de la matière est réellement broyée dans la carte de densité (pas simplement en roulant). ARRÊT : onUpdateTick (côté serveur uniquement) coupe les effets expirés. RÉSEAU : booléen par effet envoyé au flux initial (onWriteStream) et en mise à jour via effectDirtyFlag ; le client applique setEffectTypeInfo + startEffects/stopEffects à la réception. Un client ne calcule donc pas l'effet lui-même, sauf s'il fait aussi tourner processMulcherArea. À noter : onLoad retire l'écouteur onUpdateTick quand l'instance n'est pas client (Mulcher.lua:173) alors que cette fonction ne s'exécute que côté serveur ; sur un serveur dédié, l'expiration des effets ne serait donc jamais traitée et isActive resterait vrai, ce qui empêcherait tout nouveau drapeau d'arrêt (non vérifié en jeu). MÉTÉO/HUMIDITÉ : aucune lecture. CARTES : eraseTireTrack (toujours, même client lointain), updateMulcherArea (corps absent du dump), getStoneArea pour l'usure. isWorking = moins de 500 ms écoulées depuis le dernier broyage réel (g_time) ; getDoGroundManipulation (surcharge) renvoie faux si pas isWorking, ce que WorkParticles.lua:238 consulte pour ses particules de sol. dt : activeTime en millisecondes de temps de jeu, indépendant du FPS. POINTS D'EXTENSION : fonctions processMulcherArea ; surcharges doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment, loadWorkAreaFromXML (type MULCHER) ; événements onLoad, onPostLoad, onDelete, flux réseau, onUpdateTick, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Vitesse limite par défaut : 15.
---@class Mulcher
Mulcher = {}

--- Déclare le type de zone mulcher et le schéma XML : effets (vehicle.mulcher.effects.effect(?) avec workAreaIndex/activeDirection) et sons idle/work. Non relu clé par clé.
function Mulcher.initSpecialization() end

--- Exige WorkArea et GroundReference.
---@param specializations table
---@return boolean
function Mulcher.prerequisitesPresent(specializations) end

--- Enregistre processMulcherArea sur le type de véhicule.
---@param vehicleType any
function Mulcher.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment et loadWorkAreaFromXML.
---@param vehicleType any
function Mulcher.registerOverwrittenFunctions(vehicleType) end

--- S'abonne notamment à onLoad, onPostLoad, onDelete, aux quatre événements de flux réseau, onUpdateTick, onDeactivate et aux événements de traitement de zone (liste exacte non relue).
---@param vehicleType any
function Mulcher.registerEventListeners(vehicleType) end

--- Charge sons et effets (une table par effet avec zone, direction, fenêtre de 250 ms, états actif/envoyé), fixe effectFillType à WHEAT, déclare les besoins IA (cultures dont le stade broyé est défini, remplacements de mauvaises herbes) et le multiplicateur d'usure de pierres ; retire onUpdateTick si pas client ou sans effet.
---@param savegame table
function Mulcher:onLoad(savegame) end

--- Rattache chaque effet à sa zone de travail (workAreaToEffects) et retire ceux dont workAreaIndex est invalide (avec avertissement XML).
---@param savegame any
function Mulcher:onPostLoad(savegame) end

--- Libère sons et effets.
function Mulcher:onDelete() end

--- Reçoit l'état actif de chaque effet à la connexion : démarre (avec effectFillType) ou arrête l'effet.
---@param streamId any
---@param connection any
function Mulcher:onReadStream(streamId, connection) end

--- Écrit l'état actif de chaque effet.
---@param streamId any
---@param connection any
function Mulcher:onWriteStream(streamId, connection) end

--- Côté client : si le drapeau est présent, lit l'état de chaque effet et le démarre ou l'arrête.
---@param streamId any
---@param timestamp any
---@param connection any
function Mulcher:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit l'état des effets quand effectDirtyFlag est levé.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Mulcher:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Serveur seulement : désactive les effets dont la fenêtre de 250 ms est expirée, lève effectDirtyFlag et appelle stopEffects. Retiré de l'abonnement si l'instance n'est pas client ou sans effet (voir module).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Mulcher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Efface les traces de pneus, applique le broyage à la carte de densité (updateMulcherArea) et, si de la surface réelle est traitée à vitesse > 0.5, arme/démarre les effets de la zone (direction permitting) puis lève le drapeau réseau. Met à jour lastWorkTime (g_time), isWorking (< 500 ms) et la lecture de pierres. Renvoie surface réelle et totale.
---@param workArea any
---@param dt any
function Mulcher:processMulcherArea(workArea, dt) end

--- Applique la limite de vitesse dès que la chaîne d'outils est abaissée.
---@param superFunc any
---@return boolean
function Mulcher:doCheckSpeedLimit(superFunc) end

--- Renvoie faux tant que isWorking est faux ; sinon délègue au parent. Interrogé par WorkParticles pour ses particules de sol.
---@param superFunc any
---@return boolean
function Mulcher:getDoGroundManipulation(superFunc) end

--- Ajoute la salissure de travail pondérée par la vitesse quand isWorking (lit spec.speedLimit, champ de la table de spécialisation que ce fichier ne définit nulle part, alors que d'autres outils lisent self.speedLimit : à noter, peut être fourni ailleurs, NON VÉRIFIÉ).
---@param superFunc any
---@return number
function Mulcher:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée par vitesse et par le multiplicateur de pierres.
---@param superFunc any
---@return number
function Mulcher:getWearMultiplier(superFunc) end

--- Dit si l'IA doit traiter un segment de vigne : vrai si plus de 1 % de la surface du segment est couverte par l'outil.
---@param superFunc any
---@param placeable any
---@param segment any
---@param segmentSide any
function Mulcher:getAIImplementUseVineSegment(superFunc, placeable, segment, segmentSide) end

--- Force le type de zone MULCHER si le type lu est DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function Mulcher:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Coupe sons et effets.
function Mulcher:onDeactivate() end

--- Remet isWorking et isWorkingIdle à faux avant la passe.
---@param dt any
function Mulcher:onStartWorkAreaProcessing(dt) end

--- Client : démarre/arrête le son de travail (selon isWorking) et le son de ralenti (selon isWorkingIdle, vitesse > 0.5).
---@param dt any
function Mulcher:onEndWorkAreaProcessing(dt) end

--- Paramètres de parcours IA : bordures d'abord, segment initial travaillé.
---@param fieldCourseSettings any
function Mulcher:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Limite de vitesse par défaut : 15.
---@return number
function Mulcher.getDefaultSpeedLimit() end
