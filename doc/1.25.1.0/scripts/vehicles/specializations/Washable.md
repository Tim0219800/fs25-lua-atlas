# vehicles/specializations/Washable.lua

Source: `dataS/scripts/vehicles/specializations/Washable.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule (sans prérequis) qui gère la SALETÉ (boue/poussière accumulée) et l'HUMIDITÉ de surface des véhicules, via des paramètres de shader sur leurs nœuds. C'est la référence vanilla pour tout mod d'humidité/boue. MODÈLE : chaque « washable node » (nodeData) regroupe des nœuds I3D et porte dirtAmount (0..1), wetness (0..1), une couleur de saleté et une fonction de mise à jour updateFunc. Le nœud global (index 1) couvre tous les nœuds portant le paramètre de shader « scratches_dirt_snow_wetness » (composantes : y = saleté, w = humidité, d'après les setShaderParameter) ; les nœuds sans ce paramètre sont traités comme « mudNodes » (shader avec « mudAmount », « wetness », « dirtColor »). D'autres spécialisations (par ex. Wheels via validateWashableNode) créent des nœuds locaux avec leur propre fonction. SERVEUR / CLIENT : la simulation se fait uniquement sur le serveur (onUpdateTick) ; les valeurs sont envoyées aux clients (saleté et humidité quantifiées, couleur si changée) et appliquées aux shaders sur chaque machine par setNodeDirtAmount / setNodeWetness avec seuils d'envoi (Washable.SEND_THRESHOLD et SEND_THRESHOLD_WETNESS, définies hors de ce fichier : NON VÉRIFIÉ). DONNÉES MÉTÉO LUES : (1) onUpdateTick lit weather:getRainFallScale(), getTimeSinceLastRain() et getCurrentTemperature() (Washable.lua:~290-295 ; seulement si le véhicule autorise le lavage par la pluie, type WASHTYPE_RAIN non bloqué) et les passe à updateFunc ; (2) getDirtMultiplier lit weather:getGroundWetness() (Washable.lua:685) pour accélérer l'encrassement sur champ : x(1 + wetness x wetMultiplier). Unités et plages de ces valeurs : implémentation de Weather absente du dump, NON VÉRIFIÉ ; les seuils codés ici (pluie > 0.1, temps depuis la dernière pluie < 30, température > 0) suggèrent respectivement une échelle 0..1, des minutes de jeu et des degrés Celsius (hypothèse non vérifiée). L'HUMIDITÉ (wetness) n'est PAS calculée ici par la météo : updateWetness est appelée de l'extérieur par VehicleSystem:update (VehicleSystem.lua:~155-175) avec dt multiplié par l'échelle de temps effective. PAS DE TEMPS : onUpdateTick utilise le dt reçu directement (ms) ; l'accélération du temps n'y apparaît pas explicitement (NON VÉRIFIÉ si dt déjà mis à l'échelle ailleurs), alors que updateWetness reçoit dt x timeScale. Constantes XML par véhicule (vehicle.washable#...) : dirtDuration (défaut 90 min), washDuration (1), rainWashDuration (10 min), wetDuration (10), dryDuration (120 min), workMultiplier (4), fieldMultiplier (2), wetMultiplier (5), blockedWashTypes. Option de partie : missionInfo.dirtInterval règle la vitesse de salissure (1 = aucune, 2 = x0.25, 3 = x0.5, 4 et autres = x1). Points d'extension pour un moddeur : toutes les fonctions de la spécialisation sont des registerFunction (remplaçables par type de véhicule) ; validateWashableNode est le crochet prévu pour attribuer une logique à un nœud (renvoie global/fonction/index/paramètres) ; addWashableNode / addWashableNodes pour ajouter des nœuds a posteriori ; getDirtMultiplier et getWorkDirtMultiplier pour changer la vitesse d'encrassement ; setNodeDirtAmount, setNodeWetness et setNodeDirtColor pour agir sur l'apparence synchronisée. Ce que le vanilla ne fait PAS ici : aucune lecture du vent, et aucune évaporation liée à la température ou à l'ensoleillement (le séchage est un taux fixe modulé par la saleté et la vitesse).

- **Washable** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Washable.prerequisitesPresent(specializations: any)` | 30 | ✍ Aucun prérequis. |
| `Washable.initSpecialization()` | 36 | ✍ Déclare les clés de sauvegarde dirtNode (#amount, #snowScale, #wetness) et le schéma XML de la spécialisation. |
| `Washable.registerFunctions(vehicleType: any)` | 59 | ✍ Enregistre l'ensemble des fonctions publiques (saleté, humidité, gestion des nœuds, durées) comme fonctions de véhicule ; toutes sont remplaçables par un mod. |
| `Washable.registerEventListeners(vehicleType: any)` | 89 | ✍ Abonne la spécialisation à onLoad, onLoadFinished, flux réseau (lecture/écriture initiaux et de mise à jour) et onUpdateTick. |
| `Washable:onLoad(savegame: any)` | 101 | ✍ Lit les paramètres XML (durées, multiplicateurs, types de lavage bloqués, wetnessIgnoreNode : nœuds ignorés pour l'humidité) et crée le nœud global avec Washable.updateDirtAmount comme fonction. Retire l'écouteur onUpdateTick en configuration de magasin (SHOP_CONFIG). |
| `Washable:onLoadFinished(savegame: any)` | 158 | ✍ Ajoute tous les nœuds lavables des composants, puis restaure saleté, humidité et données propres aux nœuds depuis la sauvegarde ; remet tout à zéro sans sauvegarde ou si l'option de saleté est désactivée (intervalle 1). |
| `Washable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 190 | ✍ Sauvegarde, par nœud, saleté, humidité et données propres (par ex. snowScale des roues). |
| `Washable:onReadStream(streamId: any, connection: any)` | 207 | ✍ Client : lit saleté, humidité et couleur de tous les nœuds (état initial). |
| `Washable:onWriteStream(streamId: any, connection: any)` | 213 | ✍ Serveur : écrit saleté, humidité et couleur de tous les nœuds (état initial). |
| `Washable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 219 | ✍ Client : lit les valeurs des nœuds si le drapeau de mise à jour est présent. |
| `Washable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 232 | ✍ Serveur : écrit les valeurs des nœuds si le drapeau sale de la spécialisation est levé. |
| `Washable.readWashableNodeData(self: any, streamId: any, connection: any)` | 243 | ✍ Décode, pour chaque nœud, saleté et humidité (quantifiées avec SEND_NUM_BITS / SEND_NUM_BITS_WETNESS, valeurs définies hors fichier : NON VÉRIFIÉ) et couleur optionnelle, puis applique aux shaders. |
| `Washable.writeWashableNodeData(self: any, streamId: any, connection: any)` | 265 | ✍ Encode les mêmes valeurs ; l'indicateur colorChanged n'est remis à faux qu'après l'écriture de la couleur. |
| `Washable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 284 | ✍ Serveur seulement, par tick. Calcule lastDirtMultiplier = getDirtMultiplier x intervalle de saleté de la partie x Platform.gameplay.dirtDurationScale. Si le lavage par la pluie est autorisé, lit rainFallScale, temps depuis la dernière pluie et température courante. Appelle la fonction de chaque nœud avec (dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) et applique les variations de saleté et d'humidité renvoyées. |
| `Washable:cleanVehicle(amount: any)` | 313 | ✍ Nettoie le véhicule (lavage) : retire la quantité demandée (multipliée par cleaningMultiplier du nœud, 4 pour la boue de roue) et ajoute 5 fois cette quantité d'humidité, de façon forcée (synchronisée). |
| `Washable:updateDirtAmount(nodeData: any, dt: any, allowsWashingByRain: any, rainScale: any, timeSinceLastRain: any, temperature: any)` | 325 | ✍ Fonction par défaut du nœud global. Sous pluie (rainScale > 0.1, temps depuis la dernière pluie < 30, température > 0) et si la saleté dépasse 0.5 et que le véhicule n'est pas sur un champ ou roule à moins de 1 km/h (d'après le seuil codé), la pluie lave : variation -(dt / rainWashDuration). Le multiplicateur de salissure est multiplié par 2.5 sous cette pluie (la boue éclabousse davantage). À noter : comme la salissure est ensuite affectée sans addition (affectation et non cumul) lorsque dirtMultiplier n'est pas nul, le lavage par la pluie calculé juste avant est écrasé dès que le véhicule se salit (non vérifié en jeu). |
| `Washable:addDirtAmount(dirtAmount: any, force: any)` | 351 | ✍ Ajoute une quantité de saleté à tous les nœuds (borne 0..1), avec option force pour synchroniser. |
| `Washable:setDirtAmount(dirtAmount: any)` | 361 | ✍ Fixe la saleté de tous les nœuds ; pour les nœuds de roue (wheelDirtNode non nul) convertit la valeur avec (x - 0.75) / 0.25 car la boue de roue est gérée à part. |
| `Washable:getDirtAmount()` | 377 | ✍ Renvoie la saleté du nœud global (index 1), 0 sans nœud. |
| `Washable:setNodeDirtAmount(nodeData: any, dirtAmount: any, force: any)` | 389 | ✍ Borne la saleté (0..1) et, au-delà du seuil d'envoi ou si forcé, l'applique au paramètre de shader « scratches_dirt_snow_wetness » (composante y) des nœuds et au paramètre « mudAmount » des mudNodes (fondu à partir de 75 % de saleté pour les maillages de boue du véhicule ; direct pour les roues). Lève le drapeau réseau côté serveur. |
| `Washable:getNodeDirtAmount(nodeData: any)` | 420 | ✍ Renvoie la saleté d'un nœud. |
| `Washable:setNodeDirtColor(nodeData: any, r: any, g: any, b: any, force: any)` | 426 | ✍ Change la couleur de saleté (paramètre de shader « dirtColor ») des nœuds et mudNodes si l'écart dépasse le seuil ou si forcé ; marque la couleur à envoyer et lève le drapeau réseau côté serveur. |
| `Washable:updateWetness(isRaining: any, dt: any)` | 449 | ✍ Appelée de l'extérieur (VehicleSystem:update). Sous pluie : humidité + dt x wetDuration x (1 + min(vitesse km/h / 10, 1)). Sans pluie : sèche de dt x dryDuration x facteur (0.5 à 1, plus lent si le véhicule est très sale) x (1 + min(vitesse km/h / 10, 1)). Le séchage ne dépend d'aucune donnée de soleil, température ou vent. |
| `Washable:getIsWet()` | 471 | ✍ Vrai si au moins un nœud a une humidité positive. |
| `Washable:addWetnessAmount(amount: any)` | 483 | ✍ Ajoute de l'humidité à tous les nœuds (utilisé aussi par la commande console gsVehicleAddWetness). |
| `Washable:setNodeWetness(nodeData: any, wetness: any, force: any)` | 494 | ✍ Borne l'humidité (0..1) et l'applique à la composante humidité du shader « scratches_dirt_snow_wetness » et au paramètre « wetness » des mudNodes, hors nœuds exclus via wetnessIgnoreNode ; seuil d'envoi propre ; lève le drapeau réseau côté serveur. |
| `Washable:addAllSubWashableNodes(rootNode: any)` | 521 | ✍ Parcourt récursivement un nœud racine pour y trouver ceux qui portent un des paramètres de shader Washable.SHADER_PARAMETERS (définis hors de ce fichier) et les ajoute, puis réapplique la saleté courante à tous les nœuds. |
| `Washable:addWashableNodes(nodes: any)` | 532 | ✍ Ajoute une liste de nœuds lavables. |
| `Washable:addWashableNode(node: any)` | 540 | ✍ Interroge validateWashableNode et range le nœud dans le nœud global ou dans un nœud local selon la réponse. |
| `Washable:validateWashableNode(node: any)` | 551 | ✍ Par défaut, tous les nœuds sont globaux (renvoie vrai, nil). Surchargée par Wheels et par d'autres spécialisations (non relues) pour attribuer une logique propre. |
| `Washable:addToGlobalWashableNode(node: any)` | 557 | ✍ Ajoute un nœud au nœud global, avec indicateur d'utilisation de l'humidité faux si un parent est déclaré dans wetnessIgnoreNode ; distingue nœuds à saleté « classique » et nœuds de boue d'après le paramètre de shader présent. |
| `Washable:getWashableNodeByCustomIndex(customIndex: any)` | 582 | ✍ Renvoie le nœud lavable local associé à un index personnalisé (par ex. un objet roue). |
| `Washable:addToLocalWashableNode(node: any, updateFunc: any, customIndex: any, extraParams: any)` | 588 | ✍ Crée (ou complète, si l'index personnalisé existe déjà) un nœud lavable local : tables nodes/mudNodes, saleté et humidité à zéro, couleur par défaut = environment:getDirtColors (NON VÉRIFIÉ, Environment absent du dump), fonction de mise à jour et paramètres supplémentaires copiés dans le nœud. |
| `Washable:removeAllSubWashableNodes(rootNode: any)` | 653 | ✍ Retire récursivement les nœuds lavables d'un nœud racine. |
| `Washable:removeWashableNode(node: any)` | 661 | ✍ Retire un nœud de tous les nœuds lavables. |
| `Washable:getDirtMultiplier()` | 674 | ✍ Multiplicateur de salissure : 0 sous 1 km/h (d'après le seuil codé sur getLastSpeed), x fieldMultiplier sur champ (self.isOnField), et sur champ avec sol humide x(1 + groundWetness x wetMultiplier) d'après weather:getGroundWetness(). |
| `Washable:getWorkDirtMultiplier()` | 696 | ✍ Renvoie workMultiplier (défaut 4), utilisé par les outils de travail pour salir plus vite. |
| `Washable:getWashDuration()` | 704 | ✍ Renvoie la durée de lavage en ms. |
| `Washable.getIntervalMultiplier()` | 712 | ✍ Convertit l'option de partie dirtInterval en facteur : 1 -> 0, 2 -> 0.25, 3 -> 0.5, 4 -> 1 (autre -> 1). |
| `Washable:getAllowsWashingByType(type: any)` | 727 | ✍ Vrai si le type de lavage (par ex. WASHTYPE_RAIN) n'est pas bloqué dans le XML du véhicule. |
| `Washable:updateDebugValues(values: any)` | 734 | ✍ Débogage : ajoute à une liste de valeurs le multiplicateur de saleté et, par nœud, les variations horaires de saleté et d'humidité estimées avec les données météo courantes. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `cleanVehicle` | 60 |
| registerFunction | `updateDirtAmount` | 61 |
| registerFunction | `addDirtAmount` | 62 |
| registerFunction | `setDirtAmount` | 63 |
| registerFunction | `getDirtAmount` | 64 |
| registerFunction | `setNodeDirtAmount` | 65 |
| registerFunction | `getNodeDirtAmount` | 66 |
| registerFunction | `setNodeDirtColor` | 67 |
| registerFunction | `updateWetness` | 68 |
| registerFunction | `getIsWet` | 69 |
| registerFunction | `addWetnessAmount` | 70 |
| registerFunction | `setNodeWetness` | 71 |
| registerFunction | `addAllSubWashableNodes` | 72 |
| registerFunction | `addWashableNodes` | 73 |
| registerFunction | `addWashableNode` | 74 |
| registerFunction | `validateWashableNode` | 75 |
| registerFunction | `addToGlobalWashableNode` | 76 |
| registerFunction | `getWashableNodeByCustomIndex` | 77 |
| registerFunction | `addToLocalWashableNode` | 78 |
| registerFunction | `removeAllSubWashableNodes` | 79 |
| registerFunction | `removeWashableNode` | 80 |
| registerFunction | `getDirtMultiplier` | 81 |
| registerFunction | `getWorkDirtMultiplier` | 82 |
| registerFunction | `getWashDuration` | 83 |
| registerFunction | `getAllowsWashingByType` | 84 |
| registerEventListener | `onLoad` | 90 |
| registerEventListener | `onLoadFinished` | 91 |
| registerEventListener | `onReadStream` | 92 |
| registerEventListener | `onWriteStream` | 93 |
| registerEventListener | `onReadUpdateStream` | 94 |
| registerEventListener | `onWriteUpdateStream` | 95 |
| registerEventListener | `onUpdateTick` | 96 |
