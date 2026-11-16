# missions/MissionManager.lua

*[English version](../../../scripts/missions/MissionManager.md)*

Source: `dataS/scripts/missions/MissionManager.lua` — FS25 1.25.1.0

✍ Gestionnaire des contrats (missions), sous-classe de AbstractManager. Il garde les types de mission enregistrés et leurs données, la liste des missions générées et actives, une carte d'accès aux missions par pixel (InfoLayer) et les groupes de véhicules prêtés pour les missions de champ. Sur le serveur, il génère des missions selon une minuterie, les démarre, annule et clôt, et les sauvegarde et charge. Les classes de mission s'enregistrent via registerMissionType (fait ailleurs).

- **MissionManager** hérite de `AbstractManager` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MissionManager.new(customMt: any) → table` | 77 | ✍ Constructeur. Définit une carte de missions de 512 par 512 avec 4 canaux, au-dessus de AbstractManager.new. |
| `MissionManager:initDataStructures()` | 89 | ✍ Réinitialise les listes de missions, les tables de types, l'index des ids uniques, la carte des missions, les indices et la minuterie de génération, les tables de groupes de véhicules et le compteur de missions générées. |
| `MissionManager:delete()` | 111 | ✍ Retire l'élément de debug bit vector map du gestionnaire de debug s'il existe. |
| `MissionManager:loadMapData(xmlFile: any) → boolean` | 120 | ✍ Lit map.missions dans le XML de la carte (activation, maxNumInstances par type, vehicleFilename), crée la carte des missions, appelle le loadMapData de chaque classe de mission, ajoute le gestionnaire comme updateable sur le serveur, charge les groupes de véhicules (carte, puis fichiers en attente des mods et DLC) et enregistre les commandes de test gsMission*. Ne renvoie rien (pas true) quand les missions sont désactivées. |
| `MissionManager:unloadMapData()` | 174 | ✍ Se désabonne des messages, retire l'updateable, appelle le unloadMapData de chaque classe de mission, détruit la carte des missions, retire les commandes gsMission* et appelle le parent. |
| `MissionManager:saveToXMLFile(xmlFilename: string) → boolean` | 200 | ✍ Écrit le fichier des missions : métadonnées par type, numéro de version, puis chaque mission sous missions.<typeName>(n). À noter : renvoie toujours false, même en cas de succès. |
| `MissionManager:loadFromXMLFile(xmlFilename: string)` | 231 | ✍ Lit les missions sauvegardées si la version correspond à MissionManager.VERSION (sinon avertit et ignore). Crée chaque mission depuis la classe de son type, la charge, l'enregistre et l'ajoute, ou la met en file de suppression si le chargement échoue ou si sa ferme n'existe plus. |
| `MissionManager:getCanStartNewMissionGeneration()` | 297 | ✍ Vrai quand aucune génération n'est en cours, que le nombre de missions est inférieur à MAX_MISSIONS et que la minuterie de génération est passée sous zéro. |
| `MissionManager:update(dt: string)` | 304 | ✍ Serveur seulement, si la plateforme gère les missions : diminue la minuterie de génération de dt multiplié par l'échelle de temps effective, met à jour les missions et fait avancer la génération, un type de mission par frame. |
| `MissionManager:updateMissions(dt: any)` | 325 | ✍ Met en file de suppression les missions CREATED dont validate échoue, puis supprime toutes les missions de la file. L'argument dt n'est pas utilisé. |
| `MissionManager:startMissionGeneration()` | 342 | ✍ Publie MISSION_GENERATION_START, choisit un type de mission de départ au hasard et marque la génération comme en cours. |
| `MissionManager:finishMissionGeneration()` | 351 | ✍ Publie MISSION_GENERATION_END, remet la minuterie à MISSION_GENERATION_INTERVAL et efface l'indicateur de génération en cours. |
| `MissionManager:generateMission()` | 359 | ✍ Une étape de génération : demande tryGenerateMission au type courant, enregistre la mission renvoyée, passe au type suivant (avec bouclage) et termine après un succès ou un cycle complet. |
| `MissionManager:registerMission(mission: any, missionType: any)` | 394 | ✍ Définit le type de la mission, l'enregistre, l'ajoute à la liste et publie MISSION_GENERATED avec elle. |
| `MissionManager:addMission(mission: any)` | 403 | ✍ Ajoute une mission à la liste et à l'index des ids uniques en lui donnant un id unique si elle n'en a pas. Avertit et ignore une mission dont l'id unique existe déjà. |
| `MissionManager:removeMission(mission: any)` | 421 | ✍ Retire une mission de la liste et de l'index des ids uniques. |
| `MissionManager:markMissionForDeletion(mission: any)` | 432 | ✍ Ajoute la mission à la file de suppression, traitée dans updateMissions. |
| `MissionManager:getMissionByUniqueId(uniqueId: any)` | 438 | ✍ Renvoie la mission portant l'id unique donné, ou nil. |
| `MissionManager:startMission(mission: any, farmId: any, spawnVehicles: any)` | 444 | ✍ Serveur seulement (assert). Démarre une mission pour une ferme et renvoie un MissionStartState : NO_ACCESS pour les spectateurs, LIMIT_REACHED, ALREADY_STARTED, PENDING_MISSION si une autre se prépare, NOT_AVAILABLE_ANYMORE (mission supprimée), CANNOT_BE_STARTED_NOW, ou OK après publication de MissionStartedEvent. |
| `MissionManager:cancelMission(mission: any)` | 492 | ✍ Serveur seulement (assert). Termine une mission non terminée avec MissionFinishState.CANCELED et renvoie true ; false sinon. |
| `MissionManager:dismissMission(mission: any)` | 507 | ✍ Serveur seulement (assert). Appelle dismiss sur la mission (règlement financier) puis la supprime. Renvoie true. |
| `MissionManager:getMissions()` | 519 | ✍ Renvoie la liste interne de toutes les missions (pas une copie). |
| `MissionManager:getMissionsByFarmId(farmId: any)` | 525 | ✍ Renvoie une liste filtrée des missions sans ferme ou appartenant à la ferme donnée, utilisée par le menu des contrats. |
| `MissionManager:getIsMissionRunningOnFarmland(farmland: any)` | 534 | ✍ Vrai si une mission dont getFarmlandId correspond à l'id de la parcelle est en cours. False pour une parcelle nil. Pour les missions de champ, cette valeur est l'id du champ (voir AbstractFieldMission). |
| `MissionManager:getMissionsByType(typeIndex: any)` | 567 | ✍ Renvoie les missions instances de la classe du type de mission à l'index donné, ou nil si l'index est inconnu. |
| `MissionManager:hasFarmReachedMissionLimit(farmId: any)` | 580 | ✍ Vrai quand le nombre de missions démarrées de la ferme atteint MAX_MISSIONS_PER_FARM. |
| `MissionManager:createMissionMap()` | 594 | ✍ Crée l'InfoLayer d'accès aux missions ; sur le serveur, le définit comme masque de croissance pour que les champs de mission ne poussent pas. Crée éventuellement une vue de debug. |
| `MissionManager:destroyMissionMap()` | 622 | ✍ Sur le serveur, réinitialise le masque de croissance, puis supprime la carte des missions. |
| `MissionManager:setMissionMapActiveMissionId(area: any, missionId: any)` | 637 | ✍ Écrit un id de mission dans la carte des missions sur la zone donnée (polygone) ; ne fait rien sans carte. |
| `MissionManager:getMissionMapActiveMissionIdAtWorldPosition(worldX: any, worldZ: any)` | 645 | ✍ Renvoie l'id de mission active stocké dans la carte à une position monde X/Z, ou 0 sans carte. |
| `MissionManager:getMissionAtWorldPosition(worldX: any, worldZ: any) → mission` | 656 | ✍ Renvoie la mission dont l'id actif est stocké à la position monde, ou nil. |
| `MissionManager:getMissionByActiveMissionId(activeMissionId: any)` | 668 | ✍ Recherche linéaire de la mission portant l'activeMissionId donné ; nil sinon. |
| `MissionManager:getFreeActiveMissionId()` | 680 | ✍ Renvoie le premier id de 1 à MAX_MISSIONS non utilisé par une mission, ou 0 si tous sont pris. |
| `MissionManager:getIsMissionWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 692 | ✍ Vrai si la mission à la position appartient à la ferme et que son getIsWorkAllowed accepte le type de zone de travail et le véhicule. |
| `MissionManager:registerMissionType(classObject: any, name: any, defaultMaxNumInstances: any)` | 706 | ✍ Ajoute un type de mission (nom, classe, typeId séquentiel, données avec numInstances et maxNumInstances, maximum 2 par défaut) et l'indexe par nom en majuscules. Ignoré si la classe ou le nom est nil. |
| `MissionManager:unregisterMissionType(name: any)` | 725 | ✍ Retire un type de la liste. À noter : utilise self.missionType (singulier, nil) au lieu de self.missionTypes, donc une correspondance provoquerait une erreur ; nameToMissionType reste inchangé. |
| `MissionManager:getMissionType(name: any)` | 738 | ✍ Renvoie la table du type de mission pour un nom (insensible à la casse), ou nil. |
| `MissionManager:getMissionTypeById(id: any)` | 744 | ✍ Renvoie le type de mission à l'index donné de la liste, ou nil. |
| `MissionManager:getMissionTypeDataByName(name: any)` | 750 | ✍ Renvoie la table de données (numInstances, maxNumInstances, plus les valeurs ajoutées par la classe) d'un type par nom ; nil avec une erreur de dev si le nom est nil, ou nil si inconnu. |
| `MissionManager:getMissionBySplitShape(shape: any)` | 770 | ✍ Renvoie la première mission dont getIsMissionSplitShape accepte la forme, ou nil. Nil pour une forme nil ou 0. |
| `MissionManager:getIsShapeCutAllowed(shape: any, x: any, z: any, farmId: any)` | 788 | ✍ Interroge les missions dans l'ordre et renvoie la première réponse non nil de getIsShapeCutAllowed, ou nil si aucune ne tranche. |
| `MissionManager:getIsMissionDestructible(farmId: any, nodeId: any)` | 803 | ✍ Vrai si une mission indique via getDestructibleIsInMissionArea que le noeud est dans sa zone pour cette ferme. |
| `MissionManager:addPendingMissionVehiclesFile(filename: any, baseDirectory: any)` | 817 | ✍ Met en file un fichier XML de véhicules de mission et son répertoire de base, utilisé par les mods et DLC, pour chargement dans loadMapData. |
| `MissionManager:loadVehicleGroups(xmlFilename: any, baseDirectory: any)` | 823 | ✍ Analyse un XML missionVehicles : par type de mission, des groupes par taille (medium par défaut) avec rewardScale, variant et véhicules (fichier d'article de boutique plus configurations). Les groupes invalides sont ignorés avec erreurs. Renvoie false si le fichier ne peut pas être chargé. |
| `MissionManager:getRandomVehicleGroup(missionType: string, size: string, variant: string) → array, integer` | 935 | ✍ Renvoie une liste de véhicules aléatoire pour un type de mission, une taille et une variante optionnelle, plus l'identifiant du groupe. Renvoie nil et 1 si rien ne correspond. |
| `MissionManager:getVehicleGroupFromIdentifier(missionType: string, fieldSize: string, identifier: integer) → array?, number, string?` | 966 | ✍ Recherche sûre côté client d'un groupe par type, taille de champ et identifiant. Renvoie véhicules, rewardScale, un message d'erreur et le groupe ; avec véhicules nil, rewardScale 1 et un message s'il manque. |
| `MissionManager:assignGenerationTime(mission: any)` | 987 | ✍ Donne à la mission un generationTime croissant (compteur par exécution, non sauvegardé) servant à trier les missions de façon identique sur serveur et clients. |

## Messages

- publie `MessageType.MISSION_GENERATION_START` (l.343)
- publie `MessageType.MISSION_GENERATION_END` (l.352)
- publie `MessageType.MISSION_GENERATED` (l.398)
