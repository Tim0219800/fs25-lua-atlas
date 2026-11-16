# ai/AISystem.lua

*[English version](../../../scripts/ai/AISystem.md)*

Source: `dataS/scripts/ai/AISystem.lua` — FS25 1.25.1.0

✍ Système d'IA central d'une mission : il possède côté serveur la carte de navigation des véhicules (carte de coûts, splines de route, zones de blocage, obstacles physiques) et tient la liste des jobs IA actifs, de leurs véhicules et des agents de chemin. Il démarre, arrête et met à jour les jobs, diffuse les événements de job, charge les réglages de map depuis le XML indiqué par map.aiSystem#filename et enregistre des commandes console de triche/débogage (préfixe gs). Les appels moteur comme createVehicleNavigationMap ne sont pas dans le dump (NON VÉRIFIÉ) ; getRoadSplines, COSTMAP_MAX_VALUE et NEXT_JOB_ID sont utilisés ici mais définis ailleurs.

- **AISystem** (l.25)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AISystem.onCreateAIRoadSpline(_: integer, node: integer)` | 32 | ✍ Callback onCreate I3D : lit les attributs utilisateur maxWidth, maxTurningRadius et maxHeight d'un noeud et l'enregistre comme spline de route IA dans le système d'IA de la mission courante. |
| `AISystem.new(isServer: boolean, mission: table, customMt: table?) → AISystem` | 47 | ✍ Constructeur. Initialise les listes vides d'agents, de jobs et de splines différées, le nom du fichier de carte de coûts (vehicleNavigationCostmap.dat) et crée le schéma XML du fichier de réglages IA. |
| `AISystem:registerXMLPaths(schema: any)` | 73 | ✍ Enregistre les chemins de schéma du fichier de réglages IA de la map : angle de pente maximal, nom et canal de la couche d'info des zones bloquées, hauteur maximale des véhicules, hauteur des splines et indicateur de circulation à gauche. |
| `AISystem:delete()` | 84 | ✍ Nettoyage. Sur le serveur, termine les suppressions en attente et arrête tous les jobs actifs avec un message d'erreur inconnue. Supprime la carte de navigation et la carte de bits de planification, retire le marqueur de débogage, se désabonne des messages et retire les commandes console. |
| `AISystem:loadMapData(xmlFile: integer, missionInfo: table?, baseDirectory: string?)` | 141 | ✍ Enregistre les commandes console si les commandes de triche sont actives, fixe des valeurs par défaut (cellules de 1 m, pente de 15 degrés, couche navigationCollision, hauteur de véhicule 4 m), puis les remplace avec le XML de réglages IA de la map s'il est indiqué. Initialise l'état de débogage et la liste des splines de route. |
| `AISystem:addRoadSpline(spline: integer, maxWidth: number?, maxTurningRadius: number?, maxHeight: number?)` | 219 | ✍ Ajoute une spline et ses sous-splines au réseau routier IA. Sur le serveur, avant l'existence de la carte de navigation, la demande est mise en file. Les splines avec isAISpline à false sont ignorées ; largeur, hauteur et rayon de braquage ont des valeurs par défaut ; la visibilité suit l'option de débogage. |
| `AISystem:removeRoadSpline(spline: integer)` | 261 | ✍ Serveur uniquement. Retire une spline de la carte de navigation, la masque et la retire de la liste ; si la carte n'existe pas encore, la retire plutôt de la file différée. |
| `AISystem:addBlockingRegion(x: number, y: number, z: number, rx: number, ry: number, rz: number, sizeX: number, sizeY: number, sizeZ: number, stopDistance: number, callbackFuncName: string, callbackTarget: table?) → integer?` | 295 | ✍ Serveur uniquement. Ajoute à la carte de navigation une zone de blocage en forme de boîte (position, rotation, taille, distance d'arrêt, nom et cible du callback) et retourne son id. Retourne nil sur les clients ou, avec un avertissement, si la carte n'est pas initialisée. |
| `AISystem:removeBlockingRegion(blockingRegionId: integer)` | 315 | ✍ Serveur uniquement. Retire une zone de blocage par id ; ne fait rien si la carte ou l'id est absent. |
| `AISystem:setBlockingRegionState(blockingRegionId: integer, isBlocking: boolean)` | 331 | ✍ Serveur uniquement. Active ou désactive une zone de blocage par id. Journalise un avertissement si la carte de navigation n'est pas initialisée. |
| `AISystem:onTerrainLoad(terrainNode: any)` | 348 | ✍ Serveur uniquement. Crée la carte de navigation des véhicules à partir du terrain, ajoute les splines du trafic et les splines différées et tente de charger la carte de coûts depuis la sauvegarde. Si aucune n'est chargée, s'abonne au démarrage de mission pour scanner la carte. Publie AI_SYSTEM_LOADED après 2 frames et retourne true. |
| `AISystem:onMissionStarted(isNewSavegame: any)` | 385 | ✍ Gestionnaire de démarrage de mission utilisé si aucune carte de coûts sauvegardée n'a été trouvée : le journalise et demande au moteur de scanner toute la zone de la carte pour construire les coûts de navigation. |
| `AISystem:loadFromXMLFile(xmlFilename: any)` | 393 | ✍ Charge depuis un fichier XML la cible IA de débogage sauvegardée (position et direction) si les six valeurs existent. Ne fait rien si le fichier ne peut pas être chargé. |
| `AISystem:save(xmlFilename: any, usedModNames: any)` | 421 | ✍ Écrit la cible IA de débogage dans un nouveau fichier XML aiSystem, mais n'enregistre le fichier que si une cible existe. L'argument usedModNames n'est pas utilisé. |
| `AISystem:getNavigationMapFilename()` | 447 | ✍ Retourne le nom du fichier de carte de coûts (vehicleNavigationCostmap.dat). |
| `AISystem:getNavigationMap() → integer` | 454 | ✍ Retourne le handle moteur de la carte de navigation, ou nil sur les clients ou avant le chargement du terrain. |
| `AISystem:update(dt: any)` | 460 | ✍ Mise à jour par frame. Finalise les suppressions de jobs en attente (publie AI_JOB_REMOVED), puis met à jour chaque job actif et, sur le serveur pendant que la mission tourne, met à jour son coût. |
| `AISystem:onClientJoined(connection: any)` | 482 | ✍ Envoie un AIJobStartEvent pour chaque job actif à la connexion d'un client qui vient de rejoindre. |
| `AISystem:setAreaDirty(minX: number, maxX: number, minZ: number, maxZ: number)` | 494 | ✍ Marque un rectangle (minX, maxX, minZ, maxZ en mètres monde) de la carte de coûts de navigation pour réévaluation, par exemple après le changement d'objets statiques. Ne fait rien sans carte. |
| `AISystem:addAgent(agentId: any, vehicle: any)` | 505 | ✍ Enregistre un véhicule pour un identifiant d'agent de chemin. |
| `AISystem:removeAgent(agentId: any)` | 511 | ✍ Retire le véhicule enregistré pour un identifiant d'agent. |
| `AISystem:getVehicleByAgent(agentId: any)` | 517 | ✍ Retourne le véhicule enregistré pour un identifiant d'agent, ou nil. |
| `AISystem:removeJob(job: any)` | 523 | ✍ Met un job en file pour suppression ; il est réellement retiré au début de la prochaine mise à jour. |
| `AISystem:addJob(job: any)` | 529 | ✍ Ajoute un job à la liste des jobs actifs. Ne démarre pas le job ; utiliser startJob pour cela. |
| `AISystem:getNumActiveJobs()` | 535 | ✍ Retourne le nombre de jobs actifs. |
| `AISystem:getActiveJobs()` | 541 | ✍ Retourne la liste des jobs actifs elle-même (pas une copie). |
| `AISystem:startJob(job: any, startFarmId: any)` | 547 | ✍ Serveur uniquement (assert). Attribue au job le prochain identifiant, diffuse un AIJobStartEvent aux clients et démarre le job localement via startJobInternal. |
| `AISystem:startJobInternal(job: any, startFarmId: any)` | 561 | ✍ Démarre le job pour la ferme, l'ajoute à la liste active et publie AI_JOB_STARTED. Appelé directement sur les clients à la réception de l'événement de démarrage. |
| `AISystem:stopJob(job: any, aiMessage: any)` | 570 | ✍ Arrête un job avec un message IA. Sur le serveur, l'arrête localement et diffuse un AIJobStopEvent ; sur un client, envoie l'événement d'arrêt au serveur. |
| `AISystem:stopJobInternal(job: any, aiMessage: any)` | 583 | ✍ Arrête le job localement, le met en file pour suppression et publie AI_JOB_STOPPED avec le message. |
| `AISystem:skipCurrentTask(job: any)` | 592 | ✍ Côté client : envoie au serveur un AIJobSkipTaskEvent pour le job. Utilise la connexion serveur du client, donc ne doit pas être appelé sur un serveur dédié. |
| `AISystem:skipCurrentTaskInternal(job: any)` | 602 | ✍ Demande au job de passer sa tâche courante localement. |
| `AISystem:stopJobById(jobId: any, aiMessage: any, noEventSend: any)` | 608 | ✍ Arrête le job d'identifiant donné s'il existe et retourne true, sinon false. À noter : l'argument noEventSend est transmis mais stopJob ne l'utilise pas. |
| `AISystem:getJobById(jobId: any)` | 620 | ✍ Retourne le job actif d'identifiant donné, ou nil. |
| `AISystem:addJobVehicle(vehicle: any)` | 632 | ✍ Ajoute un véhicule à la liste des véhicules utilisés par les jobs actifs (sans doublon). |
| `AISystem:removeJobVehicle(vehicle: any)` | 638 | ✍ Retire un véhicule de la liste des véhicules utilisés par les jobs actifs. |
| `AISystem:getAILimitedReached()` | 644 | ✍ Vrai si le nombre de véhicules de jobs a atteint la limite maxNumHirables de la mission. |
| `AISystem:drawDebug()` | 674 | ✍ Affichage de débogage : rend le coût de navigation, en texte coloré, pour les cellules à moins de 15 cellules de la caméra ou du véhicule courant. Les cellules bloquantes sont rouges ; les autres vont du vert au rouge selon le coût. Ignoré si l'affichage des coûts est désactivé ou si une interface est ouverte (sauf l'écran de construction). |
| `AISystem:addObstacle(node: integer, centerOffsetX: number?, centerOffsetY: number?, centerOffsetZ: number?, sizeX: number?, sizeY: number?, sizeZ: number?, brakeAcceleration: number?, isPassable: boolean?)` | 741 | ✍ Serveur uniquement. Enregistre un noeud comme obstacle physique dans la carte de navigation avec un décalage de centre, une taille et une accélération de freinage (valeurs absentes à 0) et le marque éventuellement non franchissable (franchissable par défaut). |
| `AISystem:removeObstacle(node: integer)` | 763 | ✍ Serveur uniquement. Retire l'obstacle physique d'un noeud de la carte de navigation. |
| `AISystem:setObstacleIsPassable(node: integer, isPassable: boolean)` | 773 | ✍ Serveur uniquement. Définit si un noeud obstacle enregistré peut être traversé. |
| `AISystem:consoleCommandShowPlanningDebug()` | 836 | ✍ Commande console (gsAIPlanningDebug) : bascule l'indicateur de débogage de la planification et journalise son nouvel état. |
| `AISystem:consoleCommandAIShowCosts()` | 843 | ✍ Commande console (gsAICostsShow), serveur uniquement : bascule l'affichage des coûts de navigation par cellule via le debug manager. |
| `AISystem:consoleCommandAISetTarget(offsetX: any, offsetZ: any)` | 861 | ✍ Commande console (gsAISetTarget), serveur uniquement : place la cible IA de débogage à la position et direction du joueur ou du véhicule, décalée par des offsets optionnels avant et latéral, et pose un marqueur drapeau de débogage. |
| `AISystem:consoleCommandAISetLastTarget()` | 913 | ✍ Commande console (gsAISetLastTarget), serveur uniquement : replace le marqueur de débogage existant sur la dernière cible mémorisée, s'il y en a une. |
| `AISystem:consoleCommandAIStart()` | 937 | ✍ Commande console (gsAIStart), serveur uniquement : crée un job GOTO pour le véhicule où se trouve le joueur local, vers la cible de débogage, le valide pour la ferme du joueur et le démarre. Retourne un texte d'état ou d'erreur. |
| `AISystem:consoleCommandAIEnableDebug()` | 991 | ✍ Commande console (gsAIEnableDebug) : bascule l'indicateur de débogage IA et retourne sa nouvelle valeur. Fonctionne aussi sur les clients. |
| `AISystem:consoleCommandAIToggleSplineVisibility()` | 998 | ✍ Commande console (gsAISplinesShow), serveur uniquement : bascule l'affichage de débogage des splines de route IA (et du noeud racine du trafic) en couleurs. À noter : elle parcourt getRoadSplines() avec pairs et prend la clé comme spline, ce qui semble incohérent avec la liste roadSplines dont les splines sont des valeurs (getRoadSplines n'est pas dans le dump). |
| `AISystem:consoleCommandAIToggleAINodeDebug()` | 1037 | ✍ Commande console (gsAIStationsShow) : bascule des gizmos sur les noeuds IA des stations de déchargement et de chargement, avec un avertissement : les placeables rechargés ne sont pas rafraîchis automatiquement. |
| `AISystem:consoleCommandAIShowObstacles()` | 1080 | ✍ Commande console (gsAIObstaclesShow), serveur uniquement : bascule le rendu de débogage moteur des obstacles de la carte de navigation. |
| `AISystem:consoleCommandAISetAreaDirty(width: any)` | 1093 | ✍ Commande console (gsAICostsUpdate), serveur uniquement : marque un carré de la largeur donnée (30 par défaut, borné entre 2 et la taille du terrain) autour de la caméra pour recalcul de la carte de coûts. |
| `AISystem:consoleCommandAICostmapExport(imageFormatStr: any)` | 1107 | ✍ Commande console (gsAICostsExport), serveur uniquement : écrit la carte de coûts, avec les splines, sous forme d'image nommée navigationMap dans le dossier de sauvegarde ; format issu de BitmapUtil.FORMAT (PIXELMAP par défaut). Retourne une erreur si le dossier de sauvegarde n'existe pas. |
| `AISystem:consoleCommandAICheckSplineInterference(stepLength: any, heightOffset: any, defaultSplineWidth: any, defaultSplineHeight: any)` | 1207 | ✍ Commande console (gsAISplinesCheckInterference), serveur uniquement : parcourt chaque spline IA et teste des boîtes de chevauchement le long de celle-ci contre les objets hors terrain, véhicules et routes, en journalisant chaque collision et en dessinant des boîtes de débogage. Paramètres : longueur de pas, décalage de hauteur, largeur et hauteur par défaut. |
| `AISystem.getAgentStateName(index: any)` | 1324 | ✍ Retourne le nom de l'entrée AgentState correspondant à un index, ou le texte UNKNOWN. AgentState est défini hors du dump. |

## Messages

- publie `MessageType.AI_JOB_REMOVED` (l.94)
- publie `MessageType.AI_SYSTEM_LOADED` (l.377)
- publie `MessageType.AI_JOB_REMOVED` (l.468)
- publie `MessageType.AI_JOB_STARTED` (l.565)
- publie `MessageType.AI_JOB_STOPPED` (l.587)
