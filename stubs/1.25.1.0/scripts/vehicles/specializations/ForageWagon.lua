---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ForageWagon.lua (stub généré, atlas Lua FS25)

--- Spécialisation de la remorque autochargeuse (ramassage d'andains d'herbe/foin/ensilage dans la carte de hauteur, DensityMapHeightUtil). Prérequis : FillUnit, TurnOnVehicle, Pickup, WorkArea. EFFETS (client) : fillEffects (vehicle.forageWagon.fillEffect, flux de matière) et startFillEffect (vehicle.forageWagon.startFillEffect, effet de démarrage de remplissage avec retard et fondu) chargés par g_effectManager:loadEffect ; classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT : le serveur arme spec.fillTimer = 500 ms dès qu'un ramassage de litres a eu lieu dans la passe (onEndWorkAreaProcessing) ; onUpdateTick décompte ce temps avec dt et isFilling reste vrai tant qu'il est positif ; tout changement d'isFilling lève dirtyFlag et appelle setFillEffectActive. Le client reçoit isFilling et le type de remplissage (FillTypeManager.SEND_NUM_BITS bits) par les flux initial et de mise à jour et appelle lui-même setFillEffectActive. L'effet reçoit comme type spec.lastFillType (le dernier type de matière ramassée), pas de stade de croissance, pas de largeur ; la densité du startFillEffect est modulée par le niveau de remplissage (onFillUnitFillLevelChanged : 1 - niveau/fillStartFadeOff). CONDITIONS : zone active si l'outil est allumé et si Pickup autorise le ramassage (allowPickingUp, spécialisation Pickup non relue : le critère abaissé/contact sol y est donc NON VÉRIFIÉ ici). Les autres sources montrent seulement doCheckSpeedLimit lié à allumé ET abaissé. RAMASSAGE : processForageWagonArea tire, sur la ligne de la zone (rayon 0.5), les litres de chaque type supporté (tipToGroundAroundLine avec -infini = aspiration), mémorise le premier type trouvé (forcedFillType), traite les andains herbe/foin humide-sec comme interchangeables, applique côté serveur les additifs (+5 % pondéré du niveau d'additif disponible) et cumule les litres ; workArea.pickupParticlesActive est posé selon pickupLiters > 0 (champ lu probablement par Pickup : NON VÉRIFIÉ). La surface retournée = largeur de ligne * lastMovedDistance, seulement en marche avant. Ce script ne lit aucune donnée météo ni humidité, et ne modifie pas de carte de densité terrain autre que la hauteur (pas de carte de culture). Remarque : processForageWagonArea n'a pas de garde de distance client (contrairement aux outils de sol), mais seul le serveur remplit le véhicule. dt : fillTimer en ms de temps de jeu. POINTS D'EXTENSION : fonctions processForageWagonArea, setFillEffectActive, fillForageWagon ; surcharges loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit, getConsumingLoad ; événements de flux, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate, onFillUnitFillLevelChanged. Vitesse limite par défaut : 20.
---@class ForageWagon
ForageWagon = {}

--- Déclare le type de zone forageWagon et le schéma XML : indices de zone/unité/load info, additifs (unité, usage, types), défilement UV du volume, maxPickupLitersPerSecond, fillEffect et startFillEffect. Non relu clé par clé.
function ForageWagon.initSpecialization() end

--- Exige FillUnit, TurnOnVehicle, Pickup et WorkArea.
---@param specializations any
function ForageWagon.prerequisitesPresent(specializations) end

--- Enregistre processForageWagonArea, setFillEffectActive et fillForageWagon.
---@param vehicleType any
function ForageWagon.registerFunctions(vehicleType) end

--- Surcharge loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit et getConsumingLoad.
---@param vehicleType any
function ForageWagon.registerOverwrittenFunctions(vehicleType) end

--- S'abonne aux événements de flux, à onLoad, onDelete, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate et onFillUnitFillLevelChanged (liste exacte non relue).
---@param vehicleType any
function ForageWagon.registerEventListeners(vehicleType) end

--- Initialise l'état de remplissage, lit indices de zone/unité/charge, additifs (usage par défaut 0.0000275 par litre, type GRASS_WINDROW), vitesses de défilement UV, débit maximal (500 l/s), charge les effets (client) et un tampon de litres sur 750 ms ; retire l'écouteur onFillUnitFillLevelChanged s'il n'y a pas de startFillEffect.
---@param savegame any
function ForageWagon:onLoad(savegame) end

--- Libère les deux groupes d'effets.
function ForageWagon:onDelete() end

--- Lit isFilling et le type de remplissage à la connexion et applique setFillEffectActive.
---@param streamId any
---@param connection any
function ForageWagon:onReadStream(streamId, connection) end

--- Écrit isFillingSent et lastFillType.
---@param streamId any
---@param connection any
function ForageWagon:onWriteStream(streamId, connection) end

--- Côté client : si le drapeau est levé, lit isFilling et le type, applique setFillEffectActive.
---@param streamId any
---@param timestamp any
---@param connection any
function ForageWagon:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit isFillingSent et lastFillType quand dirtyFlag est levé.
---@param streamId any
---@param connection any
---@param dirtyMask any
function ForageWagon:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Serveur : décompte fillTimer (dt), déduit isFilling, diffuse le changement et déclenche setFillEffectActive ; alimente le tampon de litres ramassés (charge moteur).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ForageWagon:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Ramasse l'andain sous la ligne de la zone (type forcé si déjà chargé, sinon premier type supporté qui donne des litres), gère l'additif côté serveur, marque pickupParticlesActive et lastPickUpLiters sur la zone, mémorise lastFillType (avec drapeau réseau) et calcule la surface en marche avant.
---@param workArea any
function ForageWagon:processForageWagonArea(workArea) end

--- Applique le type de remplissage courant aux deux groupes d'effets puis les démarre ou arrête. Point d'entrée unique des effets visuels ; appelé sur serveur et client.
---@param isActive any
function ForageWagon:setFillEffectActive(isActive) end

--- Serveur : verse dans l'unité de remplissage les litres accumulés ; si tout ne rentre pas, éteint l'outil et relève le ramasseur.
function ForageWagon:fillForageWagon() end

--- Lit l'option rotateOnlyIfFillLevelIncreased d'une pièce tournante.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function ForageWagon:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Fait tourner une pièce marquée rotateOnlyIfFillLevelIncreased seulement tant que isFilling.
---@param superFunc any
---@param speedRotatingPart any
function ForageWagon:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Vitesse de défilement UV du volume : valeur de chargement si isFilling, valeur de déchargement si déchargement en cours, sinon parent.
---@param superFunc any
---@param fillVolumeIndex any
function ForageWagon:getFillVolumeUVScrollSpeed(superFunc, fillVolumeIndex) end

--- Pour la zone de ramassage : inactive si l'outil n'est pas allumé ou si allowPickingUp est faux.
---@param superFunc any
---@param workArea any
function ForageWagon:getIsWorkAreaActive(superFunc, workArea) end

--- Applique la limite de vitesse si l'outil est allumé et abaissé.
---@param superFunc any
function ForageWagon:doCheckSpeedLimit(superFunc) end

--- Ajoute la charge de ramassage (litres sur 1 s / débit maximal) à la charge consommée.
---@param superFunc any
function ForageWagon:getConsumingLoad(superFunc) end

--- Avant la passe : force le type chargé s'il y a plus que le seuil de changement de type, arme éventuellement le délai de l'effet de démarrage et remet lastPickupLiters à zéro.
---@param dt any
function ForageWagon:onStartWorkAreaProcessing(dt) end

--- Serveur : si des litres ont été ramassés, laisse l'effet de démarrage s'écouler (retard), appelle fillForageWagon et arme fillTimer = 500 ms.
---@param dt any
---@param hasProcessed any
function ForageWagon:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Client : remet fillTimer à zéro et coupe les effets.
function ForageWagon:onTurnedOff() end

--- Client : remet fillTimer à zéro et coupe les effets.
function ForageWagon:onDeactivate() end

--- Client : règle la densité du startFillEffect selon le niveau de remplissage (fondu).
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function ForageWagon:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Limite de vitesse par défaut : 20.
function ForageWagon.getDefaultSpeedLimit() end
