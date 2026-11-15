# vehicles/specializations/Cultivator.lua

Source: `dataS/scripts/vehicles/specializations/Cultivator.lua` — FS25 1.25.1.0

✍ Spécialisation des outils de travail du sol (cultivateur, déchaumeur à disques, herse rotative, sous-soleuse, outils de vigne). AUCUN effet, particule ni animation propre : le fichier ne charge qu'un échantillon sonore de travail (client). La terre/poussière soulevée vient de WorkParticles (WorkParticles.lua:238 : actif si getDoGroundManipulation() est vrai et que l'outil est sur un champ ; Cultivator ne surcharge pas getDoGroundManipulation, donc valeur par défaut vrai, WorkParticles.lua:311, quel que soit l'état de travail de ce script). TRAVAIL : processCultivatorArea efface les traces de pneus (aussi sur client lointain), puis, sauf client plus loin que Cultivator.CLIENT_DM_UPDATE_RADIUS (constante non définie ici : NON VÉRIFIÉ), appelle selon useDeepMode FSDensityMapUtil.updateCultivatorArea (mode cultivateur) ou updateDiscHarrowArea (mode herse/déchaumeur), avec l'angle de l'outil, les options limitToField et limitFruitDestructionToField, puis updateVineCultivatorArea ; si isSubsoiler, updateSubsoilerArea en plus. Les corps FSDensityMapUtil sont absents du dump : conséquences exactes sur le terrain NON VÉRIFIÉES. isWorking = vitesse > 0.5. CONDITIONS de zone : active seulement après 2000 ms suivant l'attelage et, par défaut, si l'outil est abaissé (onlyActiveWhenLowered) ; spec.isEnabled (vrai à l'initialisation ; rien dans ce fichier ne le modifie) conditionne l'appel de cultivation. À noter : updateCultivatorEnabledState et getIsCultivationEnabled sont enregistrées (Cultivator.lua:87-88) mais aucune fonction de ce nom n'est définie dans le dump, alors que onStateChange (ligne 504) et SowingMachine.lua:1208-1209 les appellent (définition possiblement hors du dump, NON VÉRIFIÉ ; échec possible à l'exécution, non vérifié en jeu). L'allumage n'est testé que pour les herses motrices (isPowerHarrow : onStateChange propage TURN_ON/TURN_OFF entre tracteur et outil attelé, côté serveur). MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : aucune variable ni flux ; les surfaces sont accumulées par passe (workAreaParameters) et envoyées aux statistiques de ferme côté serveur seulement (cultivatedHectares, cultivatedTime). dt : sert uniquement au temps cultivé (dt/60000, en minutes) et la durée d'activation est mesurée en temps de jeu. Les multiplicateurs de salissure et d'usure utilisent spec.speedLimit, champ non défini dans ce fichier (d'autres outils utilisent self.speedLimit) : si absent, la division échouerait (non vérifié en jeu, NON VÉRIFIÉ). POINTS D'EXTENSION : fonctions registerFunctions (processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState, getIsCultivationEnabled) ; surcharges doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type CULTIVATOR), getIsWorkAreaActive, loadWorkModeFromXML (#useDeepMode), getAIImplementUseVineSegment ; événements onLoad, onDelete, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onStateChange, onWorkModeChanged. Pour un mod de poussière de travail du sol : la seule donnée propre à ce script utile aux effets est spec.isWorking et le mode profond/plat ; la couleur et les particules sont gérées ailleurs (WorkParticles). Vitesse limite par défaut : 15.

- **Cultivator** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Cultivator.initSpecialization()` | 50 | ✍ Déclare le type de zone cultivator et le schéma XML (sons de travail, clé useDeepMode des modes de travail, options du noeud cultivator). Non relu clé par clé. |
| `Cultivator.prerequisitesPresent(specializations: table) → boolean` | 75 | ✍ Exige la spécialisation WorkArea. |
| `Cultivator.registerFunctions(vehicleType: any)` | 81 | ✍ Enregistre processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState et getIsCultivationEnabled (ces deux dernières référencent Cultivator.updateCultivatorEnabledState / getIsCultivationEnabled, qui ne sont définies nulle part dans le dump : valeur nil probable, NON VÉRIFIÉ). |
| `Cultivator.registerOverwrittenFunctions(vehicleType: any)` | 93 | ✍ Surcharge doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, loadWorkModeFromXML et getAIImplementUseVineSegment. |
| `Cultivator.registerEventListeners(vehicleType: any)` | 105 | ✍ S'abonne à onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange et onWorkModeChanged (liste non relue ligne à ligne). |
| `Cultivator:onLoad(savegame: table)` | 119 | ✍ Lit noeud de direction, onlyActiveWhenLowered (vrai), isSubsoiler, isPowerHarrow, useDeepMode (vrai) ; charge le son de travail (client) ; initialise délai d'activation (2000 ms), isEnabled, limitToField et les accumulateurs de surface ; calcule les besoins IA. |
| `Cultivator:onDelete()` | 160 | ✍ Libère les échantillons sonores. |
| `Cultivator:processCultivatorArea(workArea: any, dt: any)` | 169 | ✍ Efface les traces de pneus puis, si activé et hors client lointain, travaille le sol dans la carte de densité (cultivateur ou herse selon useDeepMode, plus vigne, plus sous-soleuse). Cumule surfaces réelle/statistique/totale, met isWorking (vitesse > 0.5). Renvoie surface réelle et totale. |
| `Cultivator:processVineCultivatorArea(workArea: any, dt: any)` | 210 | ✍ Variante pour une zone dédiée aux vignes : appelle updateVineCultivatorArea si activé et dans le rayon ; renvoie toujours 0, 0. |
| `Cultivator:getCultivatorLimitToField() → boolean` | 231 | ✍ Renvoie l'option limitToField (vrai par défaut). |
| `Cultivator:getUseCultivatorAIRequirements() → boolean` | 238 | ✍ Renvoie vrai ; point de surcharge pour désactiver les exigences IA. |
| `Cultivator:updateCultivatorAIRequirements()` | 244 | ✍ Définit les types de sol exigés par l'IA (profond ou plat), en excluant les sols roulés si un rouleau est attelé, ou les efface si un semoir est attelé. Sans lien avec les effets. |
| `Cultivator:doCheckSpeedLimit(superFunc: any) → boolean` | 326 | ✍ Applique la limite de vitesse quand la chaîne d'outils est abaissée. |
| `Cultivator:getDirtMultiplier(superFunc: any) → number` | 333 | ✍ Ajoute la salissure de travail pondérée vitesse/limite quand isWorking (voir remarque sur spec.speedLimit dans le module). |
| `Cultivator:getWearMultiplier(superFunc: any) → number` | 347 | ✍ Ajoute l'usure de travail pondérée vitesse/limite quand isWorking (pas de facteur de pierres ici, contrairement à d'autres outils). |
| `Cultivator:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 364 | ✍ Force le type de zone CULTIVATOR si le type lu est DEFAULT. |
| `Cultivator:getIsWorkAreaActive(superFunc: any, workArea: any)` | 376 | ✍ Pour CULTIVATOR : inactif pendant le délai post-attelage et, si exigé, tant que l'outil n'est pas abaissé. |
| `Cultivator:loadWorkModeFromXML(superFunc: any, xmlFile: any, key: any, workMode: any)` | 396 | ✍ Étend le chargement d'un mode de travail : lit #useDeepMode. |
| `Cultivator:getAIImplementUseVineSegment(superFunc: any, placeable: any, segment: any, segmentSide: any)` | 408 | ✍ Vrai si plus de 1 % de la surface du segment de vigne est couverte par l'outil. |
| `Cultivator:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 424 | ✍ Arme le délai d'activation de 2000 ms. |
| `Cultivator:onDeactivate()` | 431 | ✍ Coupe le son de travail. |
| `Cultivator:onStartWorkAreaProcessing(dt: any)` | 441 | ✍ Avant la passe : isWorking = faux ; calcule limitToField (forcé à vrai sans la permission createFields), l'angle de la carte de densité depuis le noeud de direction, et remet les surfaces à zéro. |
| `Cultivator:onEndWorkAreaProcessing(dt: any)` | 466 | ✍ Serveur : met à jour les statistiques (cultivatedHectares, cultivatedTime) et la surface travaillée. Client : démarre/arrête le son selon isWorking. Aucun effet visuel. |
| `Cultivator:onStateChange(state: any, data: any)` | 501 | ✍ À l'attelage, au dételage ou au démarrage de ligne IA : recalcule exigences IA et état activé. Pour une herse motrice, serveur : propage l'allumage/extinction entre l'outil et son porteur ou ses outils attelés. |
| `Cultivator:onWorkModeChanged(workMode: any, oldWorkMode: any)` | 546 | ✍ Adopte useDeepMode du nouveau mode de travail et recalcule les besoins IA. |
| `Cultivator.getDefaultSpeedLimit() → number` | 556 | ✍ Limite de vitesse par défaut : 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processCultivatorArea` | 82 |
| registerFunction | `processVineCultivatorArea` | 83 |
| registerFunction | `getCultivatorLimitToField` | 84 |
| registerFunction | `getUseCultivatorAIRequirements` | 85 |
| registerFunction | `updateCultivatorAIRequirements` | 86 |
| registerFunction | `updateCultivatorEnabledState` | 87 |
| registerFunction | `getIsCultivationEnabled` | 88 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 94 |
| registerOverwrittenFunction | `getDirtMultiplier` | 95 |
| registerOverwrittenFunction | `getWearMultiplier` | 96 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 97 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 98 |
| registerOverwrittenFunction | `loadWorkModeFromXML` | 99 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onDelete` | 107 |
| registerEventListener | `onPostAttach` | 108 |
| registerEventListener | `onDeactivate` | 109 |
| registerEventListener | `onStartWorkAreaProcessing` | 110 |
| registerEventListener | `onEndWorkAreaProcessing` | 111 |
| registerEventListener | `onStateChange` | 112 |
| registerEventListener | `onWorkModeChanged` | 113 |
