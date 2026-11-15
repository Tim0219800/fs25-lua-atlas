---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cultivator.lua (stub généré, atlas Lua FS25)

--- Spécialisation des outils de travail du sol (cultivateur, déchaumeur à disques, herse rotative, sous-soleuse, outils de vigne). AUCUN effet, particule ni animation propre : le fichier ne charge qu'un échantillon sonore de travail (client). La terre/poussière soulevée vient de WorkParticles (WorkParticles.lua:238 : actif si getDoGroundManipulation() est vrai et que l'outil est sur un champ ; Cultivator ne surcharge pas getDoGroundManipulation, donc valeur par défaut vrai, WorkParticles.lua:311, quel que soit l'état de travail de ce script). TRAVAIL : processCultivatorArea efface les traces de pneus (aussi sur client lointain), puis, sauf client plus loin que Cultivator.CLIENT_DM_UPDATE_RADIUS (constante non définie ici : NON VÉRIFIÉ), appelle selon useDeepMode FSDensityMapUtil.updateCultivatorArea (mode cultivateur) ou updateDiscHarrowArea (mode herse/déchaumeur), avec l'angle de l'outil, les options limitToField et limitFruitDestructionToField, puis updateVineCultivatorArea ; si isSubsoiler, updateSubsoilerArea en plus. Les corps FSDensityMapUtil sont absents du dump : conséquences exactes sur le terrain NON VÉRIFIÉES. isWorking = vitesse > 0.5. CONDITIONS de zone : active seulement après 2000 ms suivant l'attelage et, par défaut, si l'outil est abaissé (onlyActiveWhenLowered) ; spec.isEnabled (vrai à l'initialisation ; rien dans ce fichier ne le modifie) conditionne l'appel de cultivation. À noter : updateCultivatorEnabledState et getIsCultivationEnabled sont enregistrées (Cultivator.lua:87-88) mais aucune fonction de ce nom n'est définie dans le dump, alors que onStateChange (ligne 504) et SowingMachine.lua:1208-1209 les appellent (définition possiblement hors du dump, NON VÉRIFIÉ ; échec possible à l'exécution, non vérifié en jeu). L'allumage n'est testé que pour les herses motrices (isPowerHarrow : onStateChange propage TURN_ON/TURN_OFF entre tracteur et outil attelé, côté serveur). MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : aucune variable ni flux ; les surfaces sont accumulées par passe (workAreaParameters) et envoyées aux statistiques de ferme côté serveur seulement (cultivatedHectares, cultivatedTime). dt : sert uniquement au temps cultivé (dt/60000, en minutes) et la durée d'activation est mesurée en temps de jeu. Les multiplicateurs de salissure et d'usure utilisent spec.speedLimit, champ non défini dans ce fichier (d'autres outils utilisent self.speedLimit) : si absent, la division échouerait (non vérifié en jeu, NON VÉRIFIÉ). POINTS D'EXTENSION : fonctions registerFunctions (processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState, getIsCultivationEnabled) ; surcharges doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type CULTIVATOR), getIsWorkAreaActive, loadWorkModeFromXML (#useDeepMode), getAIImplementUseVineSegment ; événements onLoad, onDelete, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onStateChange, onWorkModeChanged. Pour un mod de poussière de travail du sol : la seule donnée propre à ce script utile aux effets est spec.isWorking et le mode profond/plat ; la couleur et les particules sont gérées ailleurs (WorkParticles). Vitesse limite par défaut : 15.
---@class Cultivator
Cultivator = {}

--- Déclare le type de zone cultivator et le schéma XML (sons de travail, clé useDeepMode des modes de travail, options du noeud cultivator). Non relu clé par clé.
function Cultivator.initSpecialization() end

--- Exige la spécialisation WorkArea.
---@param specializations table
---@return boolean
function Cultivator.prerequisitesPresent(specializations) end

--- Enregistre processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState et getIsCultivationEnabled (ces deux dernières référencent Cultivator.updateCultivatorEnabledState / getIsCultivationEnabled, qui ne sont définies nulle part dans le dump : valeur nil probable, NON VÉRIFIÉ).
---@param vehicleType any
function Cultivator.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, loadWorkModeFromXML et getAIImplementUseVineSegment.
---@param vehicleType any
function Cultivator.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange et onWorkModeChanged (liste non relue ligne à ligne).
---@param vehicleType any
function Cultivator.registerEventListeners(vehicleType) end

--- Lit noeud de direction, onlyActiveWhenLowered (vrai), isSubsoiler, isPowerHarrow, useDeepMode (vrai) ; charge le son de travail (client) ; initialise délai d'activation (2000 ms), isEnabled, limitToField et les accumulateurs de surface ; calcule les besoins IA.
---@param savegame table
function Cultivator:onLoad(savegame) end

--- Libère les échantillons sonores.
function Cultivator:onDelete() end

--- Efface les traces de pneus puis, si activé et hors client lointain, travaille le sol dans la carte de densité (cultivateur ou herse selon useDeepMode, plus vigne, plus sous-soleuse). Cumule surfaces réelle/statistique/totale, met isWorking (vitesse > 0.5). Renvoie surface réelle et totale.
---@param workArea any
---@param dt any
function Cultivator:processCultivatorArea(workArea, dt) end

--- Variante pour une zone dédiée aux vignes : appelle updateVineCultivatorArea si activé et dans le rayon ; renvoie toujours 0, 0.
---@param workArea any
---@param dt any
function Cultivator:processVineCultivatorArea(workArea, dt) end

--- Renvoie l'option limitToField (vrai par défaut).
---@return boolean
function Cultivator:getCultivatorLimitToField() end

--- Renvoie vrai ; point de surcharge pour désactiver les exigences IA.
---@return boolean
function Cultivator:getUseCultivatorAIRequirements() end

--- Définit les types de sol exigés par l'IA (profond ou plat), en excluant les sols roulés si un rouleau est attelé, ou les efface si un semoir est attelé. Sans lien avec les effets.
function Cultivator:updateCultivatorAIRequirements() end

--- Applique la limite de vitesse quand la chaîne d'outils est abaissée.
---@param superFunc any
---@return boolean
function Cultivator:doCheckSpeedLimit(superFunc) end

--- Ajoute la salissure de travail pondérée vitesse/limite quand isWorking (voir remarque sur spec.speedLimit dans le module).
---@param superFunc any
---@return number
function Cultivator:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée vitesse/limite quand isWorking (pas de facteur de pierres ici, contrairement à d'autres outils).
---@param superFunc any
---@return number
function Cultivator:getWearMultiplier(superFunc) end

--- Force le type de zone CULTIVATOR si le type lu est DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function Cultivator:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Pour CULTIVATOR : inactif pendant le délai post-attelage et, si exigé, tant que l'outil n'est pas abaissé.
---@param superFunc any
---@param workArea any
function Cultivator:getIsWorkAreaActive(superFunc, workArea) end

--- Étend le chargement d'un mode de travail : lit #useDeepMode.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param workMode any
function Cultivator:loadWorkModeFromXML(superFunc, xmlFile, key, workMode) end

--- Vrai si plus de 1 % de la surface du segment de vigne est couverte par l'outil.
---@param superFunc any
---@param placeable any
---@param segment any
---@param segmentSide any
function Cultivator:getAIImplementUseVineSegment(superFunc, placeable, segment, segmentSide) end

--- Arme le délai d'activation de 2000 ms.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Cultivator:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Coupe le son de travail.
function Cultivator:onDeactivate() end

--- Avant la passe : isWorking = faux ; calcule limitToField (forcé à vrai sans la permission createFields), l'angle de la carte de densité depuis le noeud de direction, et remet les surfaces à zéro.
---@param dt any
function Cultivator:onStartWorkAreaProcessing(dt) end

--- Serveur : met à jour les statistiques (cultivatedHectares, cultivatedTime) et la surface travaillée. Client : démarre/arrête le son selon isWorking. Aucun effet visuel.
---@param dt any
function Cultivator:onEndWorkAreaProcessing(dt) end

--- À l'attelage, au dételage ou au démarrage de ligne IA : recalcule exigences IA et état activé. Pour une herse motrice, serveur : propage l'allumage/extinction entre l'outil et son porteur ou ses outils attelés.
---@param state any
---@param data any
function Cultivator:onStateChange(state, data) end

--- Adopte useDeepMode du nouveau mode de travail et recalcule les besoins IA.
---@param workMode any
---@param oldWorkMode any
function Cultivator:onWorkModeChanged(workMode, oldWorkMode) end

--- Limite de vitesse par défaut : 15.
---@return number
function Cultivator.getDefaultSpeedLimit() end
