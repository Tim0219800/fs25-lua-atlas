# missions/field/AbstractFieldMission.lua

*[English version](../../../../scripts/missions/field/AbstractFieldMission.md)*

Source: `dataS/scripts/missions/field/AbstractFieldMission.lua` — FS25 1.25.1.0

✍ Classe de base de tous les contrats de champ (labour, semis, ramassage de cailloux, récolte, etc.), sous-classe de AbstractMission. Elle lie une mission à un Field, crée le hotspot de carte, prépare et termine le champ via des FieldUpdateTask (serveur), mesure l'avancement avec des modificateurs de density map découpés en partitions, enregistre le polygone du champ dans la carte des missions du MissionManager, calcule la récompense par hectare et gère sauvegarde, chargement et flux réseau. Les sous-classes surchargent createModifier, getRewardPerHa, getMissionTypeName, etc.

- **AbstractFieldMission** hérite de `AbstractMission` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AbstractFieldMission.new(isServer: any, isClient: any, title: any, description: any, customMt: any)` | 31 | ✍ Constructeur. Appelle AbstractMission.new puis initialise des types de zone de travail vides, un multiplicateur d'argent à 1, absence de la carte des missions, 0 pour cent fait et aucun modificateur, filtre ou hotspot. |
| `AbstractFieldMission:init(field: any)` | 50 | ✍ Lie la mission au champ donné avec setField puis appelle l'init du parent et renvoie son résultat. |
| `AbstractFieldMission:setField(field: any)` | 57 | ✍ Mémorise le champ, informe le champ de la mission, construit le titre d'avancement avec l'id du champ, notifie g_fieldManager:onFieldMissionStarted et crée le hotspot de carte. |
| `AbstractFieldMission:createMapHotspot()` | 73 | ✍ Crée un AbstractFieldMissionHotspot si nécessaire, le dirige vers le champ et le stocke comme seule entrée de mapHotspots. |
| `AbstractFieldMission:getField()` | 86 | ✍ Renvoie le Field sur lequel porte la mission. |
| `AbstractFieldMission:getMapHotspots()` | 92 | ✍ Renvoie la liste des hotspots de carte de cette mission. |
| `AbstractFieldMission:getWorldPosition()` | 98 | ✍ Renvoie la position monde de l'indicateur du champ (les deux valeurs de field:getIndicatorPosition). |
| `AbstractFieldMission:getLocation()` | 104 | ✍ Renvoie le texte localisé contract_farmland formaté avec le nom du champ. |
| `AbstractFieldMission:reactivate()` | 111 | ✍ Recrée le modificateur d'achèvement avec createModifier puis appelle le reactivate du parent. Utilisé quand une mission sauvegardée redevient active. |
| `AbstractFieldMission:delete()` | 119 | ✍ Retire le champ de la carte des missions et le hotspot, supprime le hotspot, détache la mission du champ, notifie g_fieldManager:onFieldMissionDeleted et appelle le delete du parent. |
| `AbstractFieldMission:saveToXMLFile(xmlFile: any, key: any)` | 141 | ✍ Appelle le parent, écrit l'id du champ et, pendant PREPARING avec une tâche de préparation terminée, sauvegarde aussi cette tâche avec son nom de classe sous field.preparingTask. |
| `AbstractFieldMission:loadFromXMLFile(xmlFile: any, key: any)` | 154 | ✍ Retrouve l'id de champ sauvegardé (renvoie false avec un avertissement s'il manque), le lie, appelle le chargement du parent, restaure et met en file une tâche de préparation sauvegardée et réinscrit le champ dans la carte des missions si PREPARING ou RUNNING. |
| `AbstractFieldMission:writeStream(streamId: any, connection: any)` | 194 | ✍ Réseau : écrit l'id du champ en int32 puis les données de flux du parent. |
| `AbstractFieldMission:readStream(streamId: any, connection: any)` | 202 | ✍ Réseau : lit l'id du champ, lie le champ, lit les données du parent et ajoute le champ à la carte des missions si PREPARING ou RUNNING. Échouerait sur un champ nil si l'id est inconnu. |
| `AbstractFieldMission:update(dt: any)` | 217 | ✍ Appelle l'update du parent ; en état RUNNING pour la ferme du joueur local et si le hotspot n'est pas encore ajouté, ajoute les hotspots. |
| `AbstractFieldMission:start(spawnVehicles: any)` | 227 | ✍ Appelle le start du parent (avec ou sans véhicules prêtés) ; en cas de succès, inscrit le champ dans la carte des missions. Renvoie false si le parent refuse. |
| `AbstractFieldMission:prepare(spawnVehicles: any)` | 239 | ✍ Appelle le prepare du parent puis prepareField (serveur) et createModifier. |
| `AbstractFieldMission:prepareField()` | 248 | ✍ Serveur seulement : construit la tâche de préparation via getFieldPreparingTask, la marque comme non sauvegardée et la met en file avec g_fieldManager:addFieldUpdateTask. |
| `AbstractFieldMission:getFieldPreparingTask()` | 260 | ✍ Tâche de préparation par défaut : une FieldUpdateTask créée à partir de l'état actuel du champ avec la hauteur effacée. Renvoie nil si l'état du champ n'est pas valide. Les sous-classes la surchargent. |
| `AbstractFieldMission:getIsPrepared()` | 275 | ✍ Vrai quand le parent indique préparé et que la tâche de préparation est absente ou terminée. |
| `AbstractFieldMission:finishField()` | 289 | ✍ Serveur seulement : obtient la tâche de fin via getFieldFinishTask, lui affecte le champ et la met en file dans le gestionnaire de champs. |
| `AbstractFieldMission:getFieldFinishTask()` | 301 | ✍ Tâche de fin par défaut : une FieldUpdateTask issue de l'état actuel du champ, ou nil si l'état n'est pas valide. Les sous-classes fixent des valeurs d'état avant de l'appeler. |
| `AbstractFieldMission:started()` | 312 | ✍ Rappel quand la mission a démarré : ajoute le champ à la carte des missions. |
| `AbstractFieldMission:finish(finishState: any)` | 318 | ✍ Appelle le finish du parent, retire le hotspot et, pour la ferme de la mission, affiche une notification en jeu de réussite, d'échec ou de dépassement de délai avec l'id du champ. |
| `AbstractFieldMission:dismiss()` | 337 | ✍ Appelé quand une mission terminée quitte le tableau : met en file la tâche de fin du champ puis appelle le dismiss du parent. |
| `AbstractFieldMission:removeAccess()` | 344 | ✍ Retire le champ de la carte des missions puis appelle le removeAccess du parent. |
| `AbstractFieldMission:validate()` | 351 | ✍ Renvoie false si la validation du parent échoue, si le champ est nil ou si le champ a désormais un propriétaire ; true sinon. |
| `AbstractFieldMission:createModifier()` | 365 | ✍ Crochet vide ; les sous-classes y créent completionModifier et completionFilter. |
| `AbstractFieldMission:initializeModifier()` | 370 | ✍ Applique le polygone du champ au modificateur d'achèvement et découpe le champ selon Z en partitions d'environ SQM_PER_PARTITION mètres carrés, chacune avec son cache de résultat. Ne fait rien sans modificateur. |
| `AbstractFieldMission:setPartitionRegion(partitionIndex: any)` | 425 | ✍ Restreint le modificateur d'achèvement à la plage Z de la partition donnée. Ne fait rien avec une seule partition ou aucune. |
| `AbstractFieldMission:getPartitionCompletion(partitionIndex: any)` | 438 | ✍ Définit la région de la partition et renvoie pixels cumulés, surface et surface totale du filtre d'achèvement. Renvoie 0, 0, 0 sans modificateur. |
| `AbstractFieldMission:getCompletion()` | 452 | ✍ Renvoie l'achèvement du champ divisé par AbstractMission.SUCCESS_FACTOR, de sorte qu'atteindre le facteur de réussite compte comme complet. |
| `AbstractFieldMission:getFieldCompletion()` | 460 | ✍ Mesure une partition par appel (tourniquet) pour répartir le coût des density maps sur les updates, mémorise son résultat, met à jour fieldPercentageDone et le renvoie. Initialise le modificateur au premier appel. updateFieldPercentageDone n'est pas dans ce fichier : NON VÉRIFIÉ. |
| `AbstractFieldMission:getVehicleSize()` | 519 | ✍ Renvoie "small", "medium" ou "large" selon la surface du champ comparée aux constantes FIELD_SIZE_MEDIUM et FIELD_SIZE_LARGE, pour choisir les groupes de véhicules prêtés. |
| `AbstractFieldMission:getDetails()` | 533 | ✍ Renvoie la liste de détails du parent plus deux lignes : nom du champ et surface formatée du champ. |
| `AbstractFieldMission:getRewardPerHa()` | 544 | ✍ Récompense par hectare par défaut (1) ; les sous-classes la surchargent avec la valeur du XML de la carte. |
| `AbstractFieldMission:getReward()` | 550 | ✍ Renvoie la récompense du parent plus récompense par hectare fois surface du champ, multipliée par un facteur de difficulté 1,3 moins 0,1 fois economicDifficulty. |
| `AbstractFieldMission:getFarmlandId()` | 565 | ✍ À noter : renvoie l'id du champ (field:getId) et non un id de parcelle, malgré le nom. Renvoie nil sans champ. |
| `AbstractFieldMission:addToMissionMap()` | 577 | ✍ Écrit l'id actif de cette mission dans la carte des missions sur le polygone du champ, une seule fois (suivi par isInMissionMap). Sert à retrouver la mission depuis une position x/z. |
| `AbstractFieldMission:removeFromMissionMap()` | 586 | ✍ Efface le polygone du champ de la carte des missions (id 0) s'il avait été ajouté. |
| `AbstractFieldMission:updateMissionMap(missionId: any)` | 595 | ✍ Appelle g_missionManager:setMissionMapActiveMissionId avec le polygone de density map du champ et l'id de mission donné. |
| `AbstractFieldMission:getNPC()` | 602 | ✍ Renvoie le PNJ de la parcelle du champ (self.field.farmland:getNPC ; getNPC n'est pas défini dans Farmland.lua de ce dump). |
| `AbstractFieldMission:getIsWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 608 | ✍ Vrai quand la mission est en cours et que le type de zone de travail est nil ou l'un de ses workAreaTypes. Les arguments position, ferme et véhicule ne sont pas utilisés. |
| `AbstractFieldMission:addHotspots()` | 614 | ✍ Ajoute le hotspot de carte de la mission à la mission courante et met isHotspotAdded. |
| `AbstractFieldMission:removeHotspot()` | 623 | ✍ Retire le hotspot de carte de la mission courante et efface isHotspotAdded. |
