---@meta
-- FS25 1.25.1.0 : vehicles/wheels/Wheel.lua (stub généré, atlas Lua FS25)

--- Classe (pas une spécialisation) qui représente une roue complète : elle ne contient presque pas de logique propre et orchestre des sous-objets créés dans Wheel.new (Wheel.lua:53-58) : physics (WheelPhysics), steering (WheelSteering), destruction (WheelDestruction), effects (WheelEffects) et debug (WheelDebug), plus les roues visuelles (WheelVisual) et cales (WheelChock) chargées en XML. Appelée par la spécialisation Wheels : Wheels:onUpdate (Wheels.lua:844-846) lit une fois par frame g_currentMission.environment.weather:getGroundWetness() et le passe à Wheel:update(dt, currentUpdateIndex, groundWetness) ; Wheels:onUpdateTick (Wheels.lua:935) fait de même pour Wheel:updateTick. C'est le seul accès météo de ce fichier : une valeur groundWetness, dont l'origine (Weather) est absente du dump : NON VÉRIFIÉ. Serveur/client : sur le serveur, Wheel:update lance physics:serverUpdate (contact sol, friction, frein, direction) seulement si le véhicule est dans la physique ; sur le client, physics:clientUpdate (lecture du type de sol seulement). La partie visuelle (position de roue, rotation, suspension, direction, effets) n'est exécutée que si le véhicule est plus proche que Wheel.VISUAL_WHEEL_UPDATE_DISTANCE (valeur non définie dans ce fichier : NON VÉRIFIÉ) ou si force est vrai ; les seuils de mise à jour Wheel.STEERING_ANGLE_THRESHOLD et Wheel.SUSPENSION_THRESHOLD ne sont pas non plus définis ici. Le pas de temps dt (ms) est transmis tel quel ; Wheels.lua:633 (onLoadFinished) appelle update avec dt = 99999 et force pour initialiser les positions. Particularité de répartition de charge : chaque roue a un updateIndex de 1 à 4 ((index-1) mod 4 + 1) utilisé par WheelPhysics pour ne mesurer le contact qu'une frame sur quatre. Points d'extension pour un moddeur : aucune fonction enregistrée ; accès via vehicle.spec_wheels.wheels[i] (objet Wheel) et ses champs physics / effects / destruction ; surcharge directe de Wheel.* (partagé par toutes les roues) possible.
---@class Wheel
Wheel = {}

--- Crée la roue : stocke véhicule, XML, objet XML de roue, indices ; initialise frein, état de synchronisation de contact (syncContactState = false) et les cinq sous-objets physics, steering, destruction, effects, debug.
---@param vehicle any
---@param xmlFile any
---@param baseKey any
---@param wheelKey any
---@param wheelIndex any
---@param configIndex any
---@param indexToParentIndex any
---@param baseDirectory any
---@param customMt any
function Wheel.new(vehicle, xmlFile, baseKey, wheelKey, wheelIndex, configIndex, indexToParentIndex, baseDirectory, customMt) end

--- Charge la roue : nœud repr obligatoire (sinon échec), nœuds drive/link (en crée un nouveau repr si le driveNode n'est pas fourni), ratio de translation de suspension, puis délègue à physics, steering, destruction et effects ; charge matériaux, cales de roue, roue visuelle principale et roues additionnelles (jumelées) en leur transmettant la masse supplémentaire. Renvoie false si la roue n'est pas dans un composant actif ou si un sous-chargement échoue.
function Wheel:loadFromXML() end

--- Calcule la largeur et le décalage totaux de la forme physique à partir des roues visuelles, puis finalise physics, destruction et effects et libère l'objet XML.
function Wheel:finalize() end

--- Post-chargement : propage aux roues visuelles, à physics et à effects.
function Wheel:postLoad() end

--- Libère roues visuelles, cales, effets (particules, traces) et débogage, ainsi que l'objet XML.
function Wheel:delete() end

--- Client : lit l'état réseau de la roue en le déléguant à physics:readStream (contact, position, suspension, rotation selon la configuration).
---@param streamId any
---@param updateInterpolation any
function Wheel:readStream(streamId, updateInterpolation) end

--- Serveur : écrit l'état réseau de la roue via physics:writeStream.
---@param streamId any
function Wheel:writeStream(streamId) end

--- Par frame. Serveur : physics:serverUpdate (si dans la physique) ; client : physics:clientUpdate. Puis, si le véhicule est proche (ou force), applique aux nœuds la direction, la rotation xDrive et la suspension issues de physics:getVisualInfo, met à jour les roues visuelles, la direction (WheelSteering), les cales, et appelle effects:update(dt, groundWetness, currentUpdateIndex). groundWetness est transmis tel quel aux effets de roue (particules humides/sèches, traces).
---@param dt any
---@param currentUpdateIndex any
---@param groundWetness any
---@param force any
function Wheel:update(dt, currentUpdateIndex, groundWetness, force) end

--- Client : interpole les données réseau de la roue (position, suspension, rotation) via physics:updateInterpolation.
---@param dt any
---@param interpolationAlpha any
function Wheel:updateInterpolation(dt, interpolationAlpha) end

--- Par tick : physics:updateTick (couleur du sol, saleté de piste, vitesse de rotation limitée) puis effects:updateTick avec groundWetness et la distance de mise à jour du véhicule.
---@param dt any
---@param groundWetness any
---@param currentUpdateDistance any
function Wheel:updateTick(dt, groundWetness, currentUpdateDistance) end

--- Serveur : fait appliquer par physics les changements de position/friction en attente (un seul recalcul par frame).
---@param dt any
function Wheel:postUpdate(dt) end

--- Fin de mise à jour : délègue à effects:onUpdateEnd (arrêt des effets).
---@param dt any
function Wheel:onUpdateEnd(dt) end

--- Met les cales de roue en position de stationnement forcée (update avec true) avant attelage.
function Wheel:onPreAttach() end

--- Remet les cales dans leur état normal (update avec false) après dételage.
function Wheel:onPostDetach() end

--- Crée la forme de roue dans le moteur physique avec la force de freinage donnée (via physics).
---@param brakeForce any
function Wheel:addToPhysics(brakeForce) end

--- Renvoie vers physics:updatePhysics pour appliquer frein/couple/direction au moteur physique.
---@param brakeForce any
function Wheel:updatePhysics(brakeForce) end

--- Retire la roue de la physique (via physics).
function Wheel:removeFromPhysics() end

--- Masse de la roue : masse physique plus masse supplémentaire des roues visuelles (t).
function Wheel:getMass() end

--- Transmet à physics et steering les limites et vitesses de rotation de direction.
---@param rotMin any
---@param rotMax any
---@param rotSpeed any
---@param rotSpeedNeg any
---@param inverted any
function Wheel:setSteeringValues(rotMin, rotMax, rotSpeed, rotSpeedNeg, inverted) end

--- Mémorise la position de pédale (0..1) et applique frein = freinage véhicule x pédale.
---@param brakePedal any
function Wheel:setBrakePedal(brakePedal) end

--- Transmet à WheelDestruction le mode « care wheel » (pas de destruction de cultures).
---@param isCareWheel any
function Wheel:setIsCareWheel(isCareWheel) end

--- Renvoie le premier nœud de pneu trouvé parmi les roues visuelles, ou nil.
function Wheel:getFirstTireNode() end

--- Déclare les clés XML d'une roue (physics#repr, #driveNode, #linkNode, #transRatio, #material, #isLeft, #rimOffset, #filename, additionalWheel, wheelChock...) et enchaîne sur les registerXMLPaths des sous-classes (WheelPhysics, WheelSteering, WheelDestruction, WheelEffects, WheelVisual, WheelChock).
---@param schema XMLSchema
---@param key string
function Wheel.registerXMLPaths(schema, key) end
