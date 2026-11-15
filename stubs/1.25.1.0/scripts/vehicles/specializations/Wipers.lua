---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Wipers.lua (stub généré, atlas Lua FS25)

--- Spécialisation d'essuie-glaces (prérequis : Enterable et AnimatedVehicle). Elle ne produit aucun effet de particules ni de goutte : elle joue des animations de véhicule (nom d'animation par essuie-glace, vehicle.wipers.wiper(?)#animName) dont la vitesse (state(?)#animSpeed) et la pause (#animPause, en secondes, converties en ms) dépendent de l'intensité de pluie. Seule donnée météo lue : g_currentMission.environment.weather:getRainFallScale() à chaque onUpdateTick, stockée dans spec.lastRainScale ; la valeur est comparée à un seuil de 0.01 puis répartie sur [0..1] en autant de tranches égales que d'états (state.maxRainValue = k / nombreÉtats), l'état retenu étant la première tranche dont le plafond est >= à la pluie. Le comportement de getRainFallScale (unité, plage, lissage) est dans Weather, absent du dump : NON VÉRIFIÉ. La logique ne s'exécute que si getIsControlled() est vrai (véhicule occupé/contrôlé) et que getIsActiveForWipers() est vrai ; elle n'a pas de garde isServer/isClient propre (les animations passent par AnimatedVehicle ; leur synchronisation est NON VÉRIFIÉE), seule la mise à jour du tableau de bord est limitée au client. La boucle d'animation : lecture jusqu'à la fin, puis retour inverse déclenché par onFinishAnimation, et prochaine passe retardée de 2 x durée/vitesse + pause (g_currentMission.time). Point d'extension : fonctions enregistrées loadWiperFromXML et getIsActiveForWipers (renvoie true ; surchargeable pour désactiver les essuie-glaces, par exemple hors cabine) ; événements écoutés onLoad, onRegisterDashboardValueTypes, onUpdateTick, onFinishAnimation ; commande console de forçage via Wipers.forcedState (global à toutes les instances). Valeur de dashboard exposée : « wipers » / « state » (champ lastState du plus riche des essuie-glaces). Utile pour un mod d'humidité : c'est un consommateur de getRainFallScale, pas une source d'effets visuels.
---@class Wipers
Wipers = {}

--- Exige les spécialisations Enterable et AnimatedVehicle.
---@param specializations any
function Wipers.prerequisitesPresent(specializations) end

--- Enregistre dans Vehicle.xmlSchema les clés vehicle.wipers.wiper(?)#animName, state(?)#animSpeed et state(?)#animPause, ainsi que les chemins de tableaux de bord vehicle.wipers.dashboards (valeur « state »).
function Wipers.initSpecialization() end

--- Expose au type de véhicule loadWiperFromXML et getIsActiveForWipers.
---@param vehicleType any
function Wipers.registerFunctions(vehicleType) end

--- Écoute onLoad, onRegisterDashboardValueTypes, onUpdateTick et onFinishAnimation.
---@param vehicleType any
function Wipers.registerEventListeners(vehicleType) end

--- Charge tous les essuie-glaces du XML (chacun avec lastValidState 1 et lastState 0), calcule hasWipers, initialise lastRainScale à 0 et retient l'essuie-glace qui a le plus d'états pour le tableau de bord. Sans essuie-glace valide, retire l'écouteur onUpdateTick.
---@param savegame any
function Wipers:onLoad(savegame) end

--- Déclare le type de valeur de tableau de bord wipers.state (lu dans lastState de l'essuie-glace principal, sans mise à jour par sondage).
function Wipers:onRegisterDashboardValueTypes() end

--- Si le véhicule est contrôlé : lit la pluie via weather:getRainFallScale(), détermine pour chaque essuie-glace l'état (0 si pluie <= 0.01 ou si getIsActiveForWipers est faux), l'écrase par Wipers.forcedState si celui-ci est différent de -1, lance l'animation à la vitesse de l'état quand le délai est écoulé et qu'elle ne joue pas, mémorise lastValidState, puis, côté client, met à jour la valeur de tableau de bord quand l'état change. À noter : Wipers.forcedState n'est pas initialisé dans ce fichier ; sa valeur initiale (attendue -1) vient d'ailleurs ou d'une partie stripée du dump (NON VÉRIFIÉ).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Wipers:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Quand l'animation d'un essuie-glace atteint la fin (temps 1), la rejoue en sens inverse à la vitesse du dernier état valide.
---@param name any
function Wipers:onFinishAnimation(name) end

--- Lit le nom d'animation (doit exister, sinon avertissement et échec), sa durée, et les états (animSpeed et animPause obligatoires ensemble). Calcule pour chaque état un plafond de pluie maxRainValue par tranches égales de 1/N. Renvoie false si l'animation est absente ou s'il n'y a aucun état.
---@param xmlFile any
---@param key any
---@param wiper any
function Wipers:loadWiperFromXML(xmlFile, key, wiper) end

--- Renvoie true par défaut ; point de surcharge pour autoriser ou non l'activation automatique selon la pluie.
function Wipers:getIsActiveForWipers() end

--- Commande console gsWiperStateSet : fixe Wipers.forcedState (-1 pour revenir à l'état déduit de la météo, 0..n pour forcer un état, borné à 999) et renvoie un message de confirmation ou d'erreur.
---@param state any
function Wipers:consoleSetWiperState(state) end
