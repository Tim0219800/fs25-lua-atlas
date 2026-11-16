# vehicles/specializations/AIDrivable.lua

*[English version](../../../../scripts/vehicles/specializations/AIDrivable.md)*

Source: `dataS/scripts/vehicles/specializations/AIDrivable.lua` — FS25 1.25.1.0

✍ Spécialisation qui rend un véhicule conduisible utilisable par les assistants IA : elle porte l'agent de navigation (dimensions, limites de freinage et d'accélération centripète, rayon de braquage, remorques attelées) et le pilote vers une cible à chaque image côté serveur. Elle exige AIVehicle, AIJobVehicle et Drivable, charge le nœud XML optionnel vehicle.ai.agent (surchargeable par configuration) et déclenche les événements onAIDrivablePrepare, onAIDriveableStart, onAIDriveableActive et onAIDriveableEnd. L'agent de navigation est créé par des fonctions moteur comme createVehicleNavigationAgent, dont le comportement est NON VÉRIFIÉ ici.

- **AIDrivable** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDrivable.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Renvoie vrai uniquement si le type de véhicule possède AIVehicle, AIJobVehicle et Drivable. |
| `AIDrivable.initSpecialization()` | 33 | ✍ Déclare les chemins XML vehicle.ai.agent dans le schéma du véhicule. |
| `AIDrivable.postInitSpecialization()` | 42 | ✍ Une fois toutes les configurations connues, déclare les chemins XML aiAgent sous chaque clé de configuration de véhicule, via un enregistrement partagé, pour que chaque option puisse surcharger les valeurs de l'agent. |
| `AIDrivable.registerAgentXMLPaths(schema: any, basePath: any)` | 56 | ✍ Déclare sous un chemin de base les attributs de l'agent : width, length, lengthOffset, height, frontOffset, indices ou nœuds des roues avant, maxBrakeAcceleration, maxCentripetalAcceleration et maxTurningRadius. |
| `AIDrivable.registerEvents(vehicleType: any)` | 71 | ✍ Enregistre les événements de véhicule onAIDrivablePrepare, onAIDriveableStart, onAIDriveableActive et onAIDriveableEnd (à noter les deux orthographes, Drivable et Driveable). |
| `AIDrivable.registerFunctions(vehicleType: any)` | 81 | ✍ Ajoute au type de véhicule les fonctions de la spécialisation : commandes console, création et suppression de l'agent, gestion de la cible, aides pour le nœud racine IA, taille de l'agent et données de pièces attelées, et dessin de débogage. |
| `AIDrivable.registerOverwrittenFunctions(vehicleType: any)` | 113 | ✍ Surcharge getCanStartAIVehicle, getIsAIJobSupported, getCanHaveAIVehicleObstacle, getIsAIReadyToDrive et getIsAIPreparingToDrive. |
| `AIDrivable.registerEventListeners(vehicleType: any)` | 123 | ✍ Abonne la spécialisation aux rappels de chargement, post-chargement, mise à jour, entrée et sortie du véhicule, et changement de vitesse du régulateur. |
| `AIDrivable:onLoad(savegame: table)` | 135 | ✍ Initialise l'état d'exécution (cible, limites de vitesse, minuteur de blocage, listes de pièces attelées, données de pose), charge les informations de l'agent depuis le XML et crée les objets de débogage (boîte et gizmo). |
| `AIDrivable:onPostLoad()` | 181 | ✍ Met en cache les décalages des points d'attelage par rapport au nœud racine IA. Si le XML définit un agent, complète largeur, hauteur et longueur manquantes d'après la taille du véhicule et déduit frontOffset de la position Z moyenne des roues avant indiquées. Fixe ensuite l'indicateur de validité et recalcule la boîte englobante du nœud racine. |
| `AIDrivable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 255 | ✍ Serveur uniquement, tant qu'une cible est définie : détecte le blocage (plus de 5 s à l'arrêt) et diffuse AIVehicleIsBlockedEvent au changement. Conduit soit manuellement vers le point, soit selon la courbure fournie par l'agent de navigation, en réagissant à son état (conduite, planification, bloqué, cible atteinte, inaccessible), puis déclenche onAIDriveableActive. |
| `AIDrivable:createAgent(helperIndex: any)` | 353 | ✍ Serveur uniquement : actualise les données de pièces attelées, crée l'agent de navigation du moteur avec la taille, le rayon de braquage et les limites de freinage du véhicule, l'enregistre dans le système IA et marque les obstacles à recalculer. Met aussi en place les outils de débogage si le débogage IA est actif. Le paramètre helperIndex n'est pas utilisé. |
| `AIDrivable:deleteAgent()` | 401 | ✍ Arrête l'exécution IA, coupe le régulateur de vitesse, libère le dump de débogage et retire puis supprime l'agent de navigation s'il existe, puis marque les obstacles à recalculer. |
| `AIDrivable:setAITarget(task: any, x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, maxSpeed: any, useManualDriving: any)` | 427 | ✍ Démarre la conduite IA vers une position et une direction du monde pour une tâche, avec limite de vitesse et mode manuel optionnels. Sur le serveur en mode navigation, il définit la cible de l'agent ; déclenche onAIDriveableStart. |
| `AIDrivable:reachedAITarget()` | 484 | ✍ Serveur uniquement : prévient la tâche courante via son rappel onTargetReached. |
| `AIDrivable:unsetAITarget()` | 496 | ✍ Efface l'état d'exécution, la tâche et l'indicateur de conduite manuelle, arrête la conduite (stopAIDriving est défini hors du dump visible, NON VÉRIFIÉ) et déclenche onAIDriveableEnd. |
| `AIDrivable:getAIRootNode()` | 515 | ✍ Renvoie le nœud servant de repère à l'IA : le nœud du premier composant. |
| `AIDrivable:setAIRootNodeDirty()` | 521 | ✍ Recalcule la boîte de taille du véhicule dans l'espace local du nœud racine IA (min et max sur chaque axe) et la stocke ; à appeler quand la taille du véhicule change. |
| `AIDrivable:getAIRootNodeMinZOffset()` | 557 | ✍ Renvoie l'étendue Z minimale de la boîte englobante dans l'espace du nœud racine IA. |
| `AIDrivable:getAIRootNodeMaxZOffset()` | 564 | ✍ Renvoie l'étendue Z maximale de la boîte englobante dans l'espace du nœud racine IA. |
| `AIDrivable:getAIRootNodeBoundingBox()` | 571 | ✍ Renvoie la boîte sous forme de centre monde (x, y, z), quaternion monde (x, y, z, w) et demi-dimensions (x, y, z), soit 10 valeurs. |
| `AIDrivable:getAIAllowsBackwards()` | 587 | ✍ Renvoie faux par défaut : l'agent de navigation est créé sans marche arrière. |
| `AIDrivable:onEnterVehicle(isControlling: any)` | 593 | ✍ Sur le serveur, quand le joueur prend le contrôle, enregistre les commandes console gsAISetTurnRadius, gsAIMoveVehicle et gsAIClearPath (cette dernière pointe vers une fonction absente du dump, NON VÉRIFIÉ). |
| `AIDrivable:onLeaveVehicle(wasEntered: any)` | 603 | ✍ Retire les trois commandes console quand le joueur qui contrôlait le véhicule le quitte. |
| `AIDrivable:onCruiseControlSpeedChanged(speed: any, speedReverse: any)` | 613 | ✍ Mémorise la nouvelle vitesse du régulateur comme plafond de vitesse de l'IA (la vitesse en marche arrière est ignorée). |
| `AIDrivable:getIsAIReadyToDrive(superFunc: any)` | 620 | ✍ Surcharge : renvoie faux ainsi que le véhicule fautif si un autre véhicule de l'arbre attelé n'est pas prêt à rouler ; sinon délègue au parent. |
| `AIDrivable:getIsAIPreparingToDrive(superFunc: any)` | 636 | ✍ Surcharge : renvoie vrai si un autre véhicule de l'arbre attelé se prépare encore à rouler ; sinon délègue au parent. |
| `AIDrivable:drawDebugAIAgent()` | 652 | ✍ Rendu de débogage : dessine la boîte de taille de l'agent, le repère avant, le texte d'état ou de distance, les lignes de rayon de braquage du véhicule et de ses roues, et des informations sur le rayon de référence. Non prévu pour la production. |
| `AIDrivable:loadAgentInfoFromXML(xmlFile: any, agent: any)` | 800 | ✍ Lit les attributs de vehicle.ai.agent dans la table fournie (par défaut : lengthOffset 0, frontOffset 3, freinage max 5, centripète max 1), puis applique les surcharges du nœud aiAgent de chaque configuration choisie. Met isDefined si un tel nœud existe. |
| `AIDrivable:getAIAgentSize()` | 841 | ✍ Renvoie largeur, longueur, décalage de longueur, décalage avant et hauteur de l'agent, agrandis par les outils attelés ; renvoie cinq nil si les informations de l'agent sont invalides. |
| `AIDrivable:getAIAgentMaxBrakeAcceleration()` | 862 | ✍ Renvoie l'accélération de freinage maximale configurée de l'agent. |
| `AIDrivable:updateAIAgentAttachments()` | 870 | ✍ Réinitialise et reconstruit les données de pièces attelées en collectant les véhicules attelés (collectAIAgentAttachments est défini hors du dump visible, NON VÉRIFIÉ), puis met à jour les décalages de remorques et les données de pose. |
| `AIDrivable:addAIAgentAttachment(attachmentData: any, level: any)` | 890 | ✍ Enregistre un objet attelé dans la chaîne courante à un niveau donné et élargit la largeur et la hauteur maximales des pièces attelées de l'agent. |
| `AIDrivable:startNewAIAgentAttachmentChain()` | 908 | ✍ Passe à une nouvelle chaîne de pièces attelées, mais seulement si la chaîne courante contient déjà des éléments. |
| `AIDrivable:updateAIAgentAttachmentOffsetData()` | 917 | ✍ Construit la liste plate de données de remorques transmise à l'agent (décalages d'attelage, décalage du centre, indicateur de collision) pour les chaînes de remorques articulées, jusqu'à la limite de remorques. Les pièces rigides allongent à la place la longueur de l'agent vers l'avant ou l'arrière. |
| `AIDrivable:updateAIAgentPoseData()` | 988 | ✍ Remplit le tableau de pose transmis à l'agent de navigation : position et direction monde du nœud racine IA, puis de chaque centre de rotation de remorque, jusqu'à la limite. Supprime les entrées excédentaires. |
| `AIDrivable:prepareForAIDriving()` | 1028 | ✍ Déclenche onAIDrivablePrepare et onAIImplementPrepareForTransport via raiseAIEvent pour que les outils se préparent au transport (raiseAIEvent n'est pas dans le dump, NON VÉRIFIÉ). |
| `AIDrivable:getAITurningRadius(minRadius: any)` | 1034 | ✍ Renvoie le rayon minimal fourni sans modification ; point d'extension que d'autres spécialisations peuvent surcharger pour ajuster le rayon de braquage de l'IA. |
| `AIDrivable:getCanStartAIVehicle(superFunc: any)` | 1040 | ✍ Surcharge : renvoie faux si les informations de l'agent sont invalides (aucune taille connue), sinon délègue au parent. |
| `AIDrivable:getIsAIJobSupported(superFunc: any, jobName: any)` | 1051 | ✍ Surcharge : renvoie faux pour tout travail quand les informations de l'agent sont invalides, sinon délègue au parent avec le nom du travail. |
| `AIDrivable:consoleCommandSetTurnRadius(turnRadius: any)` | 1081 | ✍ Commande console de débogage : règle l'entrée de direction pour obtenir le rayon de braquage donné (10 par défaut) en écrivant l'axe latéral de Drivable. |
| `AIDrivable:consoleCommandMove(distance: any)` | 1100 | ✍ Commande console de débogage : retire temporairement le véhicule et ses véhicules attelés de la physique, décale tous les composants latéralement d'une distance, ajuste la direction en conséquence et les remet en physique. À noter : distance est utilisé sans conversion depuis la chaîne de la console. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIDrivablePrepare` | 72 |
| registerEvent | `onAIDriveableStart` | 73 |
| registerEvent | `onAIDriveableActive` | 74 |
| registerEvent | `onAIDriveableEnd` | 75 |
| registerFunction | `consoleCommandSetTurnRadius` | 82 |
| registerFunction | `consoleCommandMove` | 83 |
| registerFunction | `consoleCommandClearPath` | 84 |
| registerFunction | `createAgent` | 85 |
| registerFunction | `deleteAgent` | 86 |
| registerFunction | `setAITarget` | 87 |
| registerFunction | `unsetAITarget` | 88 |
| registerFunction | `stopAIDriving` | 89 |
| registerFunction | `reachedAITarget` | 90 |
| registerFunction | `getAIRootNode` | 91 |
| registerFunction | `setAIRootNodeDirty` | 92 |
| registerFunction | `getAIRootNodeMinZOffset` | 93 |
| registerFunction | `getAIRootNodeMaxZOffset` | 94 |
| registerFunction | `getAIRootNodeBoundingBox` | 95 |
| registerFunction | `getAIAllowsBackwards` | 96 |
| registerFunction | `drawDebugAIAgent` | 97 |
| registerFunction | `debugGetAgentHasSpaceAt` | 98 |
| registerFunction | `loadAgentInfoFromXML` | 99 |
| registerFunction | `getAIAgentSize` | 100 |
| registerFunction | `getAIAgentMaxBrakeAcceleration` | 101 |
| registerFunction | `updateAIAgentAttachments` | 102 |
| registerFunction | `addAIAgentAttachment` | 103 |
| registerFunction | `startNewAIAgentAttachmentChain` | 104 |
| registerFunction | `updateAIAgentAttachmentOffsetData` | 105 |
| registerFunction | `updateAIAgentPoseData` | 106 |
| registerFunction | `prepareForAIDriving` | 107 |
| registerFunction | `getAITurningRadius` | 108 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 114 |
| registerOverwrittenFunction | `getIsAIJobSupported` | 115 |
| registerOverwrittenFunction | `getCanHaveAIVehicleObstacle` | 116 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 117 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 118 |
| registerEventListener | `onLoad` | 124 |
| registerEventListener | `onPostLoad` | 125 |
| registerEventListener | `onUpdate` | 126 |
| registerEventListener | `onEnterVehicle` | 127 |
| registerEventListener | `onLeaveVehicle` | 128 |
| registerEventListener | `onCruiseControlSpeedChanged` | 129 |
