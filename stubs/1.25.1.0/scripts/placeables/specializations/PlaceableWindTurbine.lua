---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWindTurbine.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation de placeable (prérequis : PlaceableIncomePerHour) qui fait tourner un rotor et orienter une tête d'éolienne selon le vent, et ajoute un revenu horaire proportionnel à la vitesse du rotor. DONNÉES VENT : la spécialisation ne lit pas le vent elle-même ; elle reçoit (windDirX, windDirZ, windVelocity, cirrusCloudSpeedFactor) via setWindValues, signature calquée sur un écouteur « wind changed ». L'unité de windVelocity est le m/s d'après le commentaire XML de #optimalWindSpeed (vitesse à laquelle le rotor atteint son régime max, défaut 15, borné à 1..200). Le seul accès à la source du vent est dans onDelete : g_currentMission.environment.weather.windUpdater:removeWindChangedListener(self) ; l'abonnement symétrique (addWindChangedListener) n'apparaît PAS dans ce fichier du dump : il devrait se trouver dans startWindTurbine, mais cette fonction est enregistrée (registerFunction) sans être définie dans ce fichier. À noter : finalizeConstruction est de même enregistrée comme surcharge sans définition ici (non vérifié en jeu : soit définition absente du dump, soit référence nil). WindUpdater et Weather sont absents du dump : NON VÉRIFIÉ pour tout ce qui concerne la fréquence d'appel et l'origine du vent. Aucune autre donnée météo (pluie, humidité, température) n'est lue. Effets : rotation du rotor pilotée par animationNodes (speedFunc renvoie rotSpeedFactor), son « idle » démarré dès que le facteur est > 0 (client uniquement) ; tête orientée à l'opposé du vent (rotation Y calculée sur -dirX, -dirZ) si #headAdjustToWind. Réseau : seule la rotation de tête (angle compressé) est écrite/lue dans le flux initial (onWriteStream/onReadStream) ; rotSpeedFactor n'est pas synchronisé, chaque machine le recalcule à partir du vent qu'elle reçoit (hypothèse non vérifiée : le vent est supposé identique sur les clients). Sauvegarde : #headRotation. Points d'extension pour un moddeur : fonctions registerFunction (updateHeadRotation, updateRotorRotSpeed, setWindValues, getWindTurbineLoad, startWindTurbine) surchargeables par type de placeable ; getIncomePerHour est une surcharge enregistrée ; getWindTurbineLoad est un bon point de lecture externe (facteur 0..1).
---@class PlaceableWindTurbine
PlaceableWindTurbine = {}

--- Exige la spécialisation PlaceableIncomePerHour dans le type de placeable.
---@param specializations table
---@return boolean
function PlaceableWindTurbine.prerequisitesPresent(specializations) end

--- Enregistre updateHeadRotation, updateRotorRotSpeed, setWindValues, getWindTurbineLoad et startWindTurbine (cette dernière n'est pas définie dans ce fichier : à noter, non vérifié en jeu).
---@param placeableType any
function PlaceableWindTurbine.registerFunctions(placeableType) end

--- Déclare les surcharges getIncomePerHour et finalizeConstruction ; seule la première est définie dans ce fichier.
---@param placeableType any
function PlaceableWindTurbine.registerOverwrittenFunctions(placeableType) end

--- Abonne la spécialisation à onLoad, onDelete, onFinalizePlacement, onReadStream et onWriteStream.
---@param placeableType any
function PlaceableWindTurbine.registerEventListeners(placeableType) end

--- Déclare les clés XML windTurbine : #headNode, #headAdjustToWind, #rotationNode, #optimalWindSpeed (m/s), #incomePerHour, #isFinalized, ainsi que sons et animationNodes. #rotationNode est déclaré mais jamais lu dans ce fichier (rotation assurée par les animationNodes).
---@param schema any
---@param basePath any
function PlaceableWindTurbine.registerXMLPaths(schema, basePath) end

--- Déclare la clé de sauvegarde #headRotation (angle courant de la tête).
---@param schema any
---@param basePath any
function PlaceableWindTurbine.registerSavegameXMLPaths(schema, basePath) end

--- Lit le XML : nœud de tête, option d'orientation au vent, vitesse de vent optimale (défaut 15 m/s, bornée 1..200), revenu horaire (défaut 0) et #isFinalized (défaut true). Côté client, charge le son « idle » et les animationNodes dont la vitesse suit rotSpeedFactor (initialement 1).
---@param savegame table
function PlaceableWindTurbine:onLoad(savegame) end

--- Retire le placeable des écouteurs de changement de vent de weather.windUpdater (appel non protégé : suppose l'existence de l'environnement), puis libère sons et animations. Source du vent non relue (WindUpdater absent du dump).
function PlaceableWindTurbine:onDelete() end

--- Appelle startWindTurbine si l'éolienne est déjà finalisée (#isFinalized) ; le contenu de startWindTurbine est absent de ce fichier.
function PlaceableWindTurbine:onFinalizePlacement() end

--- Client : lit l'angle de tête compressé si un nœud de tête existe. Le facteur de rotor n'est pas transmis.
---@param streamId any
---@param connection any
function PlaceableWindTurbine:onReadStream(streamId, connection) end

--- Serveur : écrit l'angle de tête compressé si un nœud de tête existe.
---@param streamId any
---@param connection any
function PlaceableWindTurbine:onWriteStream(streamId, connection) end

--- Restaure la rotation de tête depuis la sauvegarde (défaut 0) et l'applique.
---@param xmlFile any
---@param key any
function PlaceableWindTurbine:loadFromXMLFile(xmlFile, key) end

--- Écrit la rotation de tête dans la sauvegarde.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableWindTurbine:saveToXMLFile(xmlFile, key, usedModNames) end

--- Applique en rotation monde la valeur spec.headRotation autour de l'axe Y du nœud de tête (ne fait rien sans nœud de tête).
function PlaceableWindTurbine:updateHeadRotation() end

--- Calcule rotSpeedFactor = vitesse de vent / vitesse optimale, bornée à 0..1 ; côté client démarre ou arrête le son selon que le facteur est positif. Le vent n'est donc utilisé qu'à travers sa norme, sans rafale ni lissage dans ce fichier.
---@param windVelocity any
function PlaceableWindTurbine:updateRotorRotSpeed(windVelocity) end

--- Reçoit direction du vent (X, Z), vitesse et facteur de vitesse des cirrus (ce dernier ignoré ici). Oriente la tête à l'opposé de la direction si #headAdjustToWind, puis met à jour le rotor. Point d'entrée à surcharger ou à appeler pour observer le vent transmis aux écouteurs (provenance exacte NON VÉRIFIÉE).
---@param windDirX any
---@param windDirZ any
---@param windVelocity any
---@param cirrusCloudSpeedFactor any
function PlaceableWindTurbine:setWindValues(windDirX, windDirZ, windVelocity, cirrusCloudSpeedFactor) end

--- Renvoie le facteur de charge du rotor (0..1), c'est-à-dire rotSpeedFactor.
function PlaceableWindTurbine:getWindTurbineLoad() end

--- Surcharge : ajoute au revenu horaire parent le revenu configuré multiplié par le facteur de rotor ; revenu nul sans vent.
---@param superFunc any
function PlaceableWindTurbine:getIncomePerHour(superFunc) end
