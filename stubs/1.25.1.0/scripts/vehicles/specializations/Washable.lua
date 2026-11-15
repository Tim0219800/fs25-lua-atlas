---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Washable.lua (stub généré, atlas Lua FS25)

--- Spécialisation de véhicule (sans prérequis) qui gère la SALETÉ (boue/poussière accumulée) et l'HUMIDITÉ de surface des véhicules, via des paramètres de shader sur leurs nœuds. C'est la référence vanilla pour tout mod d'humidité/boue. MODÈLE : chaque « washable node » (nodeData) regroupe des nœuds I3D et porte dirtAmount (0..1), wetness (0..1), une couleur de saleté et une fonction de mise à jour updateFunc. Le nœud global (index 1) couvre tous les nœuds portant le paramètre de shader « scratches_dirt_snow_wetness » (composantes : y = saleté, w = humidité, d'après les setShaderParameter) ; les nœuds sans ce paramètre sont traités comme « mudNodes » (shader avec « mudAmount », « wetness », « dirtColor »). D'autres spécialisations (par ex. Wheels via validateWashableNode) créent des nœuds locaux avec leur propre fonction. SERVEUR / CLIENT : la simulation se fait uniquement sur le serveur (onUpdateTick) ; les valeurs sont envoyées aux clients (saleté et humidité quantifiées, couleur si changée) et appliquées aux shaders sur chaque machine par setNodeDirtAmount / setNodeWetness avec seuils d'envoi (Washable.SEND_THRESHOLD et SEND_THRESHOLD_WETNESS, définies hors de ce fichier : NON VÉRIFIÉ). DONNÉES MÉTÉO LUES : (1) onUpdateTick lit weather:getRainFallScale(), getTimeSinceLastRain() et getCurrentTemperature() (Washable.lua:~290-295 ; seulement si le véhicule autorise le lavage par la pluie, type WASHTYPE_RAIN non bloqué) et les passe à updateFunc ; (2) getDirtMultiplier lit weather:getGroundWetness() (Washable.lua:685) pour accélérer l'encrassement sur champ : x(1 + wetness x wetMultiplier). Unités et plages de ces valeurs : implémentation de Weather absente du dump, NON VÉRIFIÉ ; les seuils codés ici (pluie > 0.1, temps depuis la dernière pluie < 30, température > 0) suggèrent respectivement une échelle 0..1, des minutes de jeu et des degrés Celsius (hypothèse non vérifiée). L'HUMIDITÉ (wetness) n'est PAS calculée ici par la météo : updateWetness est appelée de l'extérieur par VehicleSystem:update (VehicleSystem.lua:~155-175) avec dt multiplié par l'échelle de temps effective. PAS DE TEMPS : onUpdateTick utilise le dt reçu directement (ms) ; l'accélération du temps n'y apparaît pas explicitement (NON VÉRIFIÉ si dt déjà mis à l'échelle ailleurs), alors que updateWetness reçoit dt x timeScale. Constantes XML par véhicule (vehicle.washable#...) : dirtDuration (défaut 90 min), washDuration (1), rainWashDuration (10 min), wetDuration (10), dryDuration (120 min), workMultiplier (4), fieldMultiplier (2), wetMultiplier (5), blockedWashTypes. Option de partie : missionInfo.dirtInterval règle la vitesse de salissure (1 = aucune, 2 = x0.25, 3 = x0.5, 4 et autres = x1). Points d'extension pour un moddeur : toutes les fonctions de la spécialisation sont des registerFunction (remplaçables par type de véhicule) ; validateWashableNode est le crochet prévu pour attribuer une logique à un nœud (renvoie global/fonction/index/paramètres) ; addWashableNode / addWashableNodes pour ajouter des nœuds a posteriori ; getDirtMultiplier et getWorkDirtMultiplier pour changer la vitesse d'encrassement ; setNodeDirtAmount, setNodeWetness et setNodeDirtColor pour agir sur l'apparence synchronisée. Ce que le vanilla ne fait PAS ici : aucune lecture du vent, et aucune évaporation liée à la température ou à l'ensoleillement (le séchage est un taux fixe modulé par la saleté et la vitesse).
---@class Washable
Washable = {}

--- Aucun prérequis.
---@param specializations any
function Washable.prerequisitesPresent(specializations) end

--- Déclare les clés de sauvegarde dirtNode (#amount, #snowScale, #wetness) et le schéma XML de la spécialisation.
function Washable.initSpecialization() end

--- Enregistre l'ensemble des fonctions publiques (saleté, humidité, gestion des nœuds, durées) comme fonctions de véhicule ; toutes sont remplaçables par un mod.
---@param vehicleType any
function Washable.registerFunctions(vehicleType) end

--- Abonne la spécialisation à onLoad, onLoadFinished, flux réseau (lecture/écriture initiaux et de mise à jour) et onUpdateTick.
---@param vehicleType any
function Washable.registerEventListeners(vehicleType) end

--- Lit les paramètres XML (durées, multiplicateurs, types de lavage bloqués, wetnessIgnoreNode : nœuds ignorés pour l'humidité) et crée le nœud global avec Washable.updateDirtAmount comme fonction. Retire l'écouteur onUpdateTick en configuration de magasin (SHOP_CONFIG).
---@param savegame any
function Washable:onLoad(savegame) end

--- Ajoute tous les nœuds lavables des composants, puis restaure saleté, humidité et données propres aux nœuds depuis la sauvegarde ; remet tout à zéro sans sauvegarde ou si l'option de saleté est désactivée (intervalle 1).
---@param savegame any
function Washable:onLoadFinished(savegame) end

--- Sauvegarde, par nœud, saleté, humidité et données propres (par ex. snowScale des roues).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Washable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client : lit saleté, humidité et couleur de tous les nœuds (état initial).
---@param streamId any
---@param connection any
function Washable:onReadStream(streamId, connection) end

--- Serveur : écrit saleté, humidité et couleur de tous les nœuds (état initial).
---@param streamId any
---@param connection any
function Washable:onWriteStream(streamId, connection) end

--- Client : lit les valeurs des nœuds si le drapeau de mise à jour est présent.
---@param streamId any
---@param timestamp any
---@param connection any
function Washable:onReadUpdateStream(streamId, timestamp, connection) end

--- Serveur : écrit les valeurs des nœuds si le drapeau sale de la spécialisation est levé.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Washable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Décode, pour chaque nœud, saleté et humidité (quantifiées avec SEND_NUM_BITS / SEND_NUM_BITS_WETNESS, valeurs définies hors fichier : NON VÉRIFIÉ) et couleur optionnelle, puis applique aux shaders.
---@param self any
---@param streamId any
---@param connection any
function Washable.readWashableNodeData(self, streamId, connection) end

--- Encode les mêmes valeurs ; l'indicateur colorChanged n'est remis à faux qu'après l'écriture de la couleur.
---@param self any
---@param streamId any
---@param connection any
function Washable.writeWashableNodeData(self, streamId, connection) end

--- Serveur seulement, par tick. Calcule lastDirtMultiplier = getDirtMultiplier x intervalle de saleté de la partie x Platform.gameplay.dirtDurationScale. Si le lavage par la pluie est autorisé, lit rainFallScale, temps depuis la dernière pluie et température courante. Appelle la fonction de chaque nœud avec (dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) et applique les variations de saleté et d'humidité renvoyées.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Washable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Nettoie le véhicule (lavage) : retire la quantité demandée (multipliée par cleaningMultiplier du nœud, 4 pour la boue de roue) et ajoute 5 fois cette quantité d'humidité, de façon forcée (synchronisée).
---@param amount any
function Washable:cleanVehicle(amount) end

--- Fonction par défaut du nœud global. Sous pluie (rainScale > 0.1, temps depuis la dernière pluie < 30, température > 0) et si la saleté dépasse 0.5 et que le véhicule n'est pas sur un champ ou roule à moins de 1 km/h (d'après le seuil codé), la pluie lave : variation -(dt / rainWashDuration). Le multiplicateur de salissure est multiplié par 2.5 sous cette pluie (la boue éclabousse davantage). À noter : comme la salissure est ensuite affectée sans addition (affectation et non cumul) lorsque dirtMultiplier n'est pas nul, le lavage par la pluie calculé juste avant est écrasé dès que le véhicule se salit (non vérifié en jeu).
---@param nodeData any
---@param dt any
---@param allowsWashingByRain any
---@param rainScale any
---@param timeSinceLastRain any
---@param temperature any
function Washable:updateDirtAmount(nodeData, dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) end

--- Ajoute une quantité de saleté à tous les nœuds (borne 0..1), avec option force pour synchroniser.
---@param dirtAmount any
---@param force any
function Washable:addDirtAmount(dirtAmount, force) end

--- Fixe la saleté de tous les nœuds ; pour les nœuds de roue (wheelDirtNode non nul) convertit la valeur avec (x - 0.75) / 0.25 car la boue de roue est gérée à part.
---@param dirtAmount any
function Washable:setDirtAmount(dirtAmount) end

--- Renvoie la saleté du nœud global (index 1), 0 sans nœud.
function Washable:getDirtAmount() end

--- Borne la saleté (0..1) et, au-delà du seuil d'envoi ou si forcé, l'applique au paramètre de shader « scratches_dirt_snow_wetness » (composante y) des nœuds et au paramètre « mudAmount » des mudNodes (fondu à partir de 75 % de saleté pour les maillages de boue du véhicule ; direct pour les roues). Lève le drapeau réseau côté serveur.
---@param nodeData any
---@param dirtAmount any
---@param force any
function Washable:setNodeDirtAmount(nodeData, dirtAmount, force) end

--- Renvoie la saleté d'un nœud.
---@param nodeData any
function Washable:getNodeDirtAmount(nodeData) end

--- Change la couleur de saleté (paramètre de shader « dirtColor ») des nœuds et mudNodes si l'écart dépasse le seuil ou si forcé ; marque la couleur à envoyer et lève le drapeau réseau côté serveur.
---@param nodeData any
---@param r any
---@param g any
---@param b any
---@param force any
function Washable:setNodeDirtColor(nodeData, r, g, b, force) end

--- Appelée de l'extérieur (VehicleSystem:update). Sous pluie : humidité + dt x wetDuration x (1 + min(vitesse km/h / 10, 1)). Sans pluie : sèche de dt x dryDuration x facteur (0.5 à 1, plus lent si le véhicule est très sale) x (1 + min(vitesse km/h / 10, 1)). Le séchage ne dépend d'aucune donnée de soleil, température ou vent.
---@param isRaining any
---@param dt any
function Washable:updateWetness(isRaining, dt) end

--- Vrai si au moins un nœud a une humidité positive.
function Washable:getIsWet() end

--- Ajoute de l'humidité à tous les nœuds (utilisé aussi par la commande console gsVehicleAddWetness).
---@param amount any
function Washable:addWetnessAmount(amount) end

--- Borne l'humidité (0..1) et l'applique à la composante humidité du shader « scratches_dirt_snow_wetness » et au paramètre « wetness » des mudNodes, hors nœuds exclus via wetnessIgnoreNode ; seuil d'envoi propre ; lève le drapeau réseau côté serveur.
---@param nodeData any
---@param wetness any
---@param force any
function Washable:setNodeWetness(nodeData, wetness, force) end

--- Parcourt récursivement un nœud racine pour y trouver ceux qui portent un des paramètres de shader Washable.SHADER_PARAMETERS (définis hors de ce fichier) et les ajoute, puis réapplique la saleté courante à tous les nœuds.
---@param rootNode any
function Washable:addAllSubWashableNodes(rootNode) end

--- Ajoute une liste de nœuds lavables.
---@param nodes any
function Washable:addWashableNodes(nodes) end

--- Interroge validateWashableNode et range le nœud dans le nœud global ou dans un nœud local selon la réponse.
---@param node any
function Washable:addWashableNode(node) end

--- Par défaut, tous les nœuds sont globaux (renvoie vrai, nil). Surchargée par Wheels et par d'autres spécialisations (non relues) pour attribuer une logique propre.
---@param node any
function Washable:validateWashableNode(node) end

--- Ajoute un nœud au nœud global, avec indicateur d'utilisation de l'humidité faux si un parent est déclaré dans wetnessIgnoreNode ; distingue nœuds à saleté « classique » et nœuds de boue d'après le paramètre de shader présent.
---@param node any
function Washable:addToGlobalWashableNode(node) end

--- Renvoie le nœud lavable local associé à un index personnalisé (par ex. un objet roue).
---@param customIndex any
function Washable:getWashableNodeByCustomIndex(customIndex) end

--- Crée (ou complète, si l'index personnalisé existe déjà) un nœud lavable local : tables nodes/mudNodes, saleté et humidité à zéro, couleur par défaut = environment:getDirtColors (NON VÉRIFIÉ, Environment absent du dump), fonction de mise à jour et paramètres supplémentaires copiés dans le nœud.
---@param node any
---@param updateFunc any
---@param customIndex any
---@param extraParams any
function Washable:addToLocalWashableNode(node, updateFunc, customIndex, extraParams) end

--- Retire récursivement les nœuds lavables d'un nœud racine.
---@param rootNode any
function Washable:removeAllSubWashableNodes(rootNode) end

--- Retire un nœud de tous les nœuds lavables.
---@param node any
function Washable:removeWashableNode(node) end

--- Multiplicateur de salissure : 0 sous 1 km/h (d'après le seuil codé sur getLastSpeed), x fieldMultiplier sur champ (self.isOnField), et sur champ avec sol humide x(1 + groundWetness x wetMultiplier) d'après weather:getGroundWetness().
function Washable:getDirtMultiplier() end

--- Renvoie workMultiplier (défaut 4), utilisé par les outils de travail pour salir plus vite.
function Washable:getWorkDirtMultiplier() end

--- Renvoie la durée de lavage en ms.
function Washable:getWashDuration() end

--- Convertit l'option de partie dirtInterval en facteur : 1 -> 0, 2 -> 0.25, 3 -> 0.5, 4 -> 1 (autre -> 1).
function Washable.getIntervalMultiplier() end

--- Vrai si le type de lavage (par ex. WASHTYPE_RAIN) n'est pas bloqué dans le XML du véhicule.
---@param type any
function Washable:getAllowsWashingByType(type) end

--- Débogage : ajoute à une liste de valeurs le multiplicateur de saleté et, par nœud, les variations horaires de saleté et d'humidité estimées avec les données météo courantes.
---@param values any
function Washable:updateDebugValues(values) end
