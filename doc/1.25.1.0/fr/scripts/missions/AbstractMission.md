# missions/AbstractMission.lua

*[English version](../../../scripts/missions/AbstractMission.md)*

Source: `dataS/scripts/missions/AbstractMission.lua` — FS25 1.25.1.0

✍ Classe de base (sous-classe d'Object, donc objet réseau) de toutes les missions de contrat. Elle contient le statut (MissionStatus), l'état de fin, la récompense, l'avancement, une date de fin optionnelle et les véhicules prêtés, et gère le XML de sauvegarde, les flux réseau, l'enchaînement CREATED, PREPARING, RUNNING, FINISHED, DISMISSED et le versement. Les missions concrètes surchargent des hooks comme getCompletion, getReward, getMissionTypeName et getVehicleSize. Elle dialogue avec g_missionManager, g_messageCenter, g_farmManager et la barre de progression du HUD. Environment et MissionManager sont absents du dump (NON VÉRIFIÉ).

- **AbstractMission** hérite de `Object` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AbstractMission.new(isServer: any, isClient: any, title: any, description: any, customMt: any)` | 44 | ✍ Crée une mission avec titre et description, statut CREATED, récompense et avancement nuls, et listes de véhicules vides. Alloue un drapeau dirty, s'abonne à FARM_DELETED et SAVEGAME_LOADED, et incrémente le compteur d'instances de son type dans g_missionManager. |
| `AbstractMission:init()` | 76 | ✍ Initialise la mission en choisissant un groupe de véhicules et son identifiant via getVehicleGroup. Retourne true ; les sous-classes l'étendent avec leur propre préparation. |
| `AbstractMission:onSavegameLoaded()` | 89 | ✍ Gestionnaire de message après le chargement d'une sauvegarde : appelle reactivate si la mission avait été démarrée. |
| `AbstractMission:reactivate()` | 97 | ✍ Restaure les hooks d'exécution après chargement : si des véhicules ont été générés, s'abonne à VEHICLE_RESET pour suivre les véhicules remplacés. |
| `AbstractMission:getMapHotspots()` | 105 | ✍ Hook retournant les points d'intérêt de carte de la mission ; la base retourne nil. |
| `AbstractMission:delete()` | 111 | ✍ Supprime la mission : appelle le delete du parent, retire l'accès (supprime les véhicules prêtés sur le serveur), se désabonne des messages, se retire de g_missionManager, publie MISSION_DELETED et décrémente le compteur d'instances du type. |
| `AbstractMission:saveToXMLFile(xmlFile: any, key: any)` | 130 | ✍ Écrit uniqueId, statut, état de fin, identifiant de ferme, identifiant actif, récompense, remboursement, avancement, coût de vol, drapeau de génération, groupe de véhicules, identifiants uniques des véhicules et date de fin sous la clé. Les sous-classes ajoutent leurs champs. |
| `AbstractMission:loadFromXMLFile(xmlFile: any, key: any)` | 165 | ✍ Lit les données écrites par saveToXMLFile. Retourne false (avec un log) si le statut est invalide, si le groupe de véhicules ne correspond plus à la variante ou si aucun groupe n'est trouvé. Met en file les identifiants de véhicules à rattacher et marque les véhicules manquants à régénérer pour les missions non terminées. |
| `AbstractMission:writeStream(streamId: any, connection: any)` | 230 | ✍ Synchronisation initiale serveur vers client : écrit l'état du parent, l'identifiant de type, la récompense, le remboursement, le statut, le drapeau de génération et l'identifiant de groupe, puis l'identifiant de ferme si démarrée, l'identifiant actif ou le coût de vol et l'état de fin selon le statut, et la date de fin. |
| `AbstractMission:readStream(streamId: any, connection: any)` | 261 | ✍ Pendant client de writeStream : lit ces champs dans le même ordre, puis enregistre la mission dans g_missionManager.missions et publie MISSION_GENERATED à la frame suivante. |
| `AbstractMission:writeUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 299 | ✍ Écrit la mise à jour en direct : statut courant et avancement en flottant. Le masque dirty est ignoré. |
| `AbstractMission:readUpdateStream(streamId: any, timestamp: any, connection: any)` | 306 | ✍ Lit la mise à jour en direct : applique le statut via setStatus et mémorise l'avancement. |
| `AbstractMission:update(dt: any)` | 329 | ✍ Mise à jour par frame. Rattache les véhicules sauvegardés par identifiant unique et régénère les manquants. Serveur : termine la préparation quand les véhicules sont prêts, fait échouer la mission si le chargement a échoué, et termine une mission en cours en cas de délai dépassé ou de validation échouée. Les clients de la ferme propriétaire ont une barre de progression au HUD. |
| `AbstractMission:updateTick(dt: any)` | 408 | ✍ Serveur uniquement, en cours de mission : recalcule l'avancement via getCompletion environ toutes les 2,5 s de temps de mission, termine avec SUCCESS à 0,995 ou plus, et lève le drapeau dirty quand la valeur a changé. |
| `AbstractMission:start(spawnVehicles: any)` | 430 | ✍ Démarre la mission : appelle prepare, active l'objet et diffuse MissionStartedEvent depuis le serveur. Retourne true. |
| `AbstractMission:prepare(spawnVehicles: any)` | 443 | ✍ Passe le statut à PREPARING. Sur le serveur, si demandé et que des véhicules sont définis, les génère et s'abonne à VEHICLE_RESET. |
| `AbstractMission:getIsPrepared()` | 454 | ✍ Retourne true si aucun véhicule n'a été généré, ou si le nombre de véhicules chargés égale le nombre attendu. |
| `AbstractMission:finishedPreparing()` | 464 | ✍ Fait passer la mission de PREPARING à RUNNING. |
| `AbstractMission:started()` | 470 | ✍ Hook vide pour les sous-classes, appelé quand la mission a démarré. |
| `AbstractMission:finish(finishState: any)` | 475 | ✍ Passe le statut à FINISHED et fixe l'état de fin ; retire l'accès aux véhicules sauf en cas de succès. Sur le serveur, il compte un succès dans les stats de la ferme, calcule le coût de vol et diffuse MissionFinishedEvent. Retire aussi la barre de progression et publie MissionFinishedEvent localement. |
| `AbstractMission:dismiss()` | 500 | ✍ Fait passer la mission à DISMISSED une seule fois. Après un succès, il retire l'accès aux véhicules ; sur le serveur, il verse à la ferme la récompense totale (éventuellement négative) en MoneyType.MISSIONS si non nulle. |
| `AbstractMission:calculateStealingCost()` | 528 | ✍ Hook calculant la pénalité appliquée après la fin ; la base retourne 0. |
| `AbstractMission:getUniqueId() → string` | 535 | ✍ Retourne la chaîne d'identifiant unique de la mission (nil tant qu'elle n'est pas définie). |
| `AbstractMission:setUniqueId(uniqueId: string)` | 542 | ✍ Mémorise l'identifiant unique. Il ne doit être défini qu'une fois ; les builds de debug vérifient que c'est une chaîne et qu'il était nil. |
| `AbstractMission:spawnVehicles()` | 550 | ✍ Appelle spawnVehicle pour chaque entrée de vehiclesToLoad et met spawnedVehicles à true s'il y en avait au moins une. |
| `AbstractMission:spawnVehicle(info: any)` | 560 | ✍ Lance le chargement asynchrone d'un véhicule (nom de fichier et configurations optionnelles) aux places d'apparition de la boutique, avec l'état de propriété MISSION et la ferme de la mission comme propriétaire. Appelle onSpawnedVehicle à la fin ; rien ne se passe si les données sont invalides. |
| `AbstractMission:onSpawnedVehicle(vehicles: any, vehicleLoadState: any, loadingInfo: any)` | 582 | ✍ Callback du chargement de véhicule. En cas de succès, ajoute usure et temps de fonctionnement aléatoires (environ 30 à 70 heures) à chaque véhicule et le suit. En cas d'échec, marque la mission comme ayant échoué au chargement, supprime les véhicules chargés, annule les chargements en attente et vide les listes. |
| `AbstractMission:getStealingCosts()` | 630 | ✍ Hook retournant le coût de vol ; la base retourne 0. getActualStealingCosts l'utilise. |
| `AbstractMission:getVehicleCosts()` | 636 | ✍ Retourne le coût des véhicules prêtés : nombre de véhicules multiplié par AbstractMission.VEHICLE_USE_COST et par un facteur de difficulté (0,7 plus 0,3 fois la difficulté économique). Retourne 0 sans véhicules. |
| `AbstractMission:getReward()` | 651 | ✍ Hook retournant la récompense de base ; la base retourne 0. |
| `AbstractMission:getReimbursement()` | 657 | ✍ Retourne le montant de remboursement mémorisé. |
| `AbstractMission:calculateReimbursement()` | 663 | ✍ Hook vide, appelé depuis removeAccess sur le serveur, pour que les sous-classes calculent un remboursement. |
| `AbstractMission:getActualVehicleCosts()` | 668 | ✍ Retourne les coûts des véhicules seulement si des véhicules ont réellement été générés, sinon 0. |
| `AbstractMission:getActualReward()` | 678 | ✍ Retourne la récompense seulement si l'état de fin est SUCCESS, sinon 0. |
| `AbstractMission:getActualStealingCosts()` | 688 | ✍ Retourne les coûts de vol applicables, actuellement identiques à getStealingCosts. |
| `AbstractMission:getTotalReward()` | 694 | ✍ Versement net : récompense réelle moins coûts des véhicules moins coûts de vol plus remboursement. Utilisé par dismiss. |
| `AbstractMission:validate(event: any)` | 705 | ✍ Retourne si la mission peut encore se poursuivre, ce qui n'est faux que si le délai est dépassé. Les sous-classes l'étendent ; un résultat faux fait échouer la mission en cours. |
| `AbstractMission:isTimedOut()` | 712 | ✍ Retourne true si une date de fin existe et qu'il ne reste plus de minutes ; false s'il n'y a pas de date de fin. |
| `AbstractMission:getMinutesLeft()` | 723 | ✍ Retourne les minutes de jeu restantes jusqu'à la date de fin (jour et heure en ms) d'après l'environnement courant, ou nil sans date de fin. Dépend de champs d'Environment absents du dump (NON VÉRIFIÉ). |
| `AbstractMission:setDefaultEndDate()` | 755 | ✍ Fixe la date de fin à la dernière milliseconde du dernier jour de la période courante, calculée depuis daysPerPeriod et le jour dans la période. |
| `AbstractMission:setEndDateByOffset(dayTimeOffset: any)` | 770 | ✍ Fixe la date de fin à partir du jour courant plus un décalage d'heure en ms, résolu via environment:getDayAndDayTime. |
| `AbstractMission:setEndDate(endDay: any, endDayTime: any)` | 781 | ✍ Mémorise la date de fin sous forme de table avec endDay (jour monotone) et endDayTime (ms). |
| `AbstractMission:getIsInProgress()` | 790 | ✍ Retourne true tant que le statut est PREPARING ou RUNNING. |
| `AbstractMission:getIsRunning()` | 796 | ✍ Retourne true quand le statut est RUNNING. |
| `AbstractMission:getWasRunning()` | 802 | ✍ Retourne true si le statut est RUNNING, FINISHED ou DISMISSED. |
| `AbstractMission:getIsReadyToStart()` | 808 | ✍ Retourne true quand le statut est CREATED. |
| `AbstractMission:getWasStarted()` | 814 | ✍ Retourne true quand le statut est autre que CREATED. |
| `AbstractMission:getIsFinished()` | 820 | ✍ Retourne true quand le statut est FINISHED. |
| `AbstractMission:getInfo()` | 826 | ✍ Retourne la table d'informations de la mission. |
| `AbstractMission:getLocation()` | 832 | ✍ Hook retournant un texte de lieu ; la base retourne une chaîne vide. |
| `AbstractMission:getDescription()` | 838 | ✍ Retourne la description donnée à la construction. |
| `AbstractMission:getDetails()` | 844 | ✍ Retourne une liste de lignes titre/valeur pour l'écran des contrats ; la base ajoute la ligne des coûts de véhicules formatés si non démarrée ou si des véhicules ont été générés. |
| `AbstractMission:getFinishedDetails()` | 856 | ✍ Retourne les lignes du résumé de mission terminée : récompense, remboursement, coûts des véhicules et coûts de vol (coûts affichés en argent négatif). |
| `AbstractMission:getTitle()` | 868 | ✍ Retourne le titre de la mission. |
| `AbstractMission:getNPC()` | 874 | ✍ Hook retournant le PNJ associé à la mission ; la base retourne nil. |
| `AbstractMission:getExtraProgressText()` | 880 | ✍ Hook retournant un texte supplémentaire affiché près de la barre de progression ; la base retourne une chaîne vide. |
| `AbstractMission:getCompletion()` | 886 | ✍ Hook retournant l'avancement de 0 à 1 ; la base retourne 0. La mission réussit dès qu'il atteint environ 0,995. |
| `AbstractMission:farmDestroyed(farmId: any)` | 892 | ✍ Gestionnaire de FARM_DELETED : si la ferme supprimée est celle de la mission, demande à g_missionManager de supprimer la mission. |
| `AbstractMission:getMissionTypeName()` | 900 | ✍ Hook retournant le nom du type de mission ; la base retourne nil. Utilisé dans le constructeur pour compter les instances, les sous-classes doivent donc le surcharger. |
| `AbstractMission:onVehicleReset(oldVehicle: any, newVehicle: any)` | 906 | ✍ Gestionnaire de VEHICLE_RESET, serveur uniquement : si l'ancien véhicule appartenait à la mission, le remplace par le nouveau. |
| `AbstractMission:getVehicleSize()` | 917 | ✍ Hook retournant la classe de taille des véhicules ; la base retourne "small". |
| `AbstractMission:getVehicleGroupFromIdentifier(identifier: any)` | 923 | ✍ Recherche un groupe de véhicules prêtés par identifiant pour ce type de mission et cette taille via g_missionManager. |
| `AbstractMission:getVehicleGroup() → array, integer` | 931 | ✍ Choisit un groupe de véhicules au hasard pour le type, la taille et la variante de la mission via g_missionManager. Retourne la liste de véhicules (ou nil) et l'identifiant du groupe. |
| `AbstractMission:getVehicleVariant()` | 938 | ✍ Hook retournant le nom de variante de véhicule requis ; nil signifie aucun filtre. |
| `AbstractMission:getVariant()` | 944 | ✍ Hook retournant la variante de la mission ; la base retourne nil. |
| `AbstractMission:removeAccess()` | 950 | ✍ Serveur uniquement : appelle calculateReimbursement, puis supprime chaque véhicule prêté qui n'est pas déjà en cours de suppression et vide la liste. |
| `AbstractMission:hasLeasableVehicles()` | 965 | ✍ Retourne true quand la mission a une liste de véhicules à prêter (vehiclesToLoad n'est pas nil). |
| `AbstractMission:isSpawnSpaceAvailable()` | 971 | ✍ Vérifie que chaque véhicule à charger tient aux places d'apparition de la boutique, avec la taille de l'article de boutique et des dimensions minimales d'apparition. Les places sont marquées utilisées temporairement pendant le test puis libérées. Retourne un booléen. |
| `AbstractMission:getIsWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 1010 | ✍ Hook demandant si une zone de travail peut opérer à une position pour une ferme et un véhicule ; la base retourne toujours true. |
| `AbstractMission:getWorldPosition()` | 1016 | ✍ Hook retournant x et z monde de la mission ; la base retourne 0, 0. |
| `AbstractMission.loadMapData(xmlFile: any, baseDirectory: any)` | 1022 | ✍ Hook statique appelé avec le XML de carte et le dossier de base pour charger les données du type de mission ; vide dans la classe de base. |
| `AbstractMission.unloadMapData()` | 1027 | ✍ Hook statique appelé au déchargement de la carte pour libérer les données du type de mission ; vide dans la classe de base. |
| `AbstractMission.tryGenerateMission()` | 1032 | ✍ Hook statique que les sous-classes implémentent pour tenter de créer une nouvelle mission de leur type ; vide ici et ne retourne rien. |
| `AbstractMission.canRun()` | 1037 | ✍ Hook statique que les sous-classes implémentent pour indiquer si ce type de mission peut tourner sur la carte courante ; vide ici et ne retourne rien (nil). |

## Messages

- s'abonne à `MessageType.FARM_DELETED` (l.65)
- s'abonne à `MessageType.SAVEGAME_LOADED` (l.66)
- s'abonne à `MessageType.VEHICLE_RESET` (l.99)
- s'abonne à `MessageType.VEHICLE_RESET` (l.448)
- publie `MessageType.MISSION_DELETED` (l.119)
- publie `MessageType.MISSION_GENERATED` (l.294)
