# vehicles/specializations/FillUnit.lua

*[English version](../../../../scripts/vehicles/specializations/FillUnit.md)*

Source: `dataS/scripts/vehicles/specializations/FillUnit.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui donne à un véhicule ou un outil une ou plusieurs unités de remplissage (réservoirs, trémies, palettes, carburant, etc.). Elle gère par unité la capacité, le niveau et le type de remplissage, valide les types de remplissage et d'outils acceptés, synchronise les niveaux vers les clients, les sauvegarde et les recharge, pilote plans de remplissage, effets, animations, alarmes et tableaux de bord, et fournit le déchargement en palettes. Elle n'a aucun prérequis, se configure via la configuration fillUnit du XML du véhicule et définit aussi l'aide FillActivatable pour le remplissage depuis des triggers. FillVolume et de nombreuses autres spécialisations s'appuient dessus. Le serveur détient les niveaux de référence ; les clients les reçoivent par flux réseau.

- **FillUnit** (l.16)
- **FillActivatable** (l.3302)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillUnit.initSpecialization()` | 33 | ✍ Enregistre la configuration de véhicule fillUnit, les caractéristiques de boutique « capacity » et « fillTypes », tout le schéma XML des unités de remplissage (capacité, types, plans, alarmes, effets, tableaux de bord, déchargement, extras de niveleur et d'attache) ainsi que les clés de sauvegarde (index, type, niveau). |
| `FillUnit.registerUnitDisplaySchema(schema: any, key: any)` | 181 | ✍ Enregistre sur une clé donnée les deux attributs XML shopDisplayUnit et unitTextOverride, utilisés pour afficher une capacité en boutique dans une unité autre que le litre. |
| `FillUnit.prerequisitesPresent(specializations: any)` | 188 | ✍ Retourne toujours true : cette spécialisation n'exige aucune autre spécialisation. |
| `FillUnit.registerEvents(vehicleType: any)` | 194 | ✍ Déclare les événements émis par cette spécialisation, comme onFillUnitFillLevelChanged, onChangedFillType, onAlarmTriggerChanged, les événements d'ajout, changement et retrait de trigger de remplissage et ceux de déchargement. |
| `FillUnit.registerFunctions(vehicleType: any)` | 208 | ✍ Enregistre sur le type de véhicule toutes les fonctions des unités de remplissage (accesseurs, gestion des triggers, chargement XML, déchargement, aide au débogage) pour les appeler sur les instances. |
| `FillUnit.registerOverwrittenFunctions(vehicleType: any)` | 281 | ✍ Surcharge des fonctions de base du véhicule pour tenir compte du remplissage : masse des composants, infos HUD, autorisation de repli, trajet ferroviaire automatique, outils mobiles, prise de force, mise en marche, boîte d'infos, niveleurs et attaches. |
| `FillUnit.registerEventListeners(vehicleType: any)` | 300 | ✍ Abonne la spécialisation aux événements du véhicule : chargement, post-chargement, suppression, flux de lecture/écriture et de mise à jour, tick, post-mise à jour, affichage, désactivation, enregistrement des actions et changement de cible de déversement. |
| `FillUnit:onLoad(savegame: any)` | 318 | ✍ Lit la configuration fillUnit choisie, construit chaque unité de remplissage et chaque zone de déchargement depuis le XML, crée l'état du trigger de remplissage et son FillActivatable, et charge sons, effets et animations côté client. Une unité invalide met le chargement du véhicule en ERROR. |
| `FillUnit:onPostLoad(savegame: any)` | 413 | ✍ Serveur uniquement : restaure les niveaux depuis la sauvegarde (en respectant la réinitialisation des véhicules) ou applique les niveaux de départ, puis met à jour les alarmes. Sans unité de remplissage, retire les écouteurs de flux, de mise à jour et d'affichage. |
| `FillUnit:onDelete()` | 490 | ✍ Nettoie à la suppression : retire l'activable de remplissage, prévient les triggers que le véhicule disparaît, supprime sons d'alarme, gyrophares, effets, animations et enregistrements de nœuds de remplissage exact, et libère les échantillons sonores. |
| `FillUnit:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 532 | ✍ Écrit dans la sauvegarde une entrée par unité marquée à sauvegarder (index, nom du type de remplissage, niveau). |
| `FillUnit:saveStatsToXMLFile(xmlFile: any, key: any)` | 549 | ✍ Écrit dans le XML de statistiques les listes (séparées par des espaces) des noms de types de remplissage et des niveaux (3 décimales) de toutes les unités. |
| `FillUnit:onReadStream(streamId: any, connection: any)` | 571 | ✍ Côté client, à la connexion initiale : lit l'indicateur de remplissage puis, pour chaque unité synchronisée, le niveau, le type et le dernier type valide envoyés par le serveur. |
| `FillUnit:onWriteStream(streamId: any, connection: any)` | 593 | ✍ Côté serveur, à la connexion initiale : écrit l'indicateur de remplissage et, pour chaque unité synchronisée, le niveau en flottant 32 bits, le type et le dernier type valide. |
| `FillUnit:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 612 | ✍ Côté client, mise à jour incrémentale : lit niveau (flottant complet ou fraction quantifiée de la capacité) et type par unité, applique la différence via addFillUnitFillLevel et vide l'unité si le type est inconnu. |
| `FillUnit:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 655 | ✍ Côté serveur, mise à jour incrémentale : si le drapeau dirty est actif, écrit pour chaque unité synchronisée le dernier niveau envoyé (flottant complet ou quantifié sur synchronizationNumBits), le type et le dernier type valide. |
| `FillUnit:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 684 | ✍ Serveur : pendant un remplissage par trigger, transfère litres par seconde multiplié par le temps écoulé via trigger:fillVehicle et arrête si rien n'est livré. Client : met à jour nœuds de mesure et alarmes, et arrête effets et animations de remplissage après leur délai. |
| `FillUnit:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 745 | ✍ Exécute puis vide les rappels de visée du nœud de remplissage exact enregistrés par d'autres véhicules, en ignorant ceux supprimés entre-temps. |
| `FillUnit:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 758 | ✍ Affiche le texte HUD supplémentaire demandant de remplir d'abord l'outil quand getDrawFirstFillText retourne true (ici elle retourne false). |
| `FillUnit:onDeactivate()` | 767 | ✍ Arrête un remplissage par trigger en cours sans envoyer d'événement et remet à zéro l'intensité des nœuds de mesure. |
| `FillUnit:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 780 | ✍ Client : enregistre l'action d'entrée UNLOAD si le véhicule définit des zones de déchargement ; en build de développement console sur serveur, enregistre aussi trois actions de débogage des unités. |
| `FillUnit:onDischargeTargetObjectChanged(dischargeObject: any)` | 809 | ✍ Rafraîchit la disponibilité de l'action de déchargement, car une cible de déversement peut entrer en conflit avec le déchargement de palettes. |
| `FillUnit:getDrawFirstFillText()` | 816 | ✍ Point d'extension retournant false par défaut ; d'autres spécialisations peuvent le surcharger pour demander l'indication HUD « remplir d'abord l'outil ». |
| `FillUnit:getFillUnits()` | 822 | ✍ Retourne le tableau de toutes les unités de remplissage du véhicule (référence directe, pas une copie). |
| `FillUnit:getFillUnitByIndex(fillUnitIndex: any)` | 829 | ✍ Retourne la table de l'unité de remplissage pour un index, ou nil si l'index n'existe pas. |
| `FillUnit:getFillUnitExists(fillUnitIndex: any)` | 839 | ✍ Retourne true si l'index fourni est non nil et correspond à une unité existante. |
| `FillUnit:getFillUnitCapacity(fillUnitIndex: any)` | 846 | ✍ Retourne la capacité d'une unité en litres (math.huge si illimitée), ou nil si l'index est inconnu. |
| `FillUnit:getFillUnitFreeCapacity(fillUnitIndex: integer, fillTypeIndex: integer, farmId: integer)` | 859 | ✍ Retourne la capacité moins le niveau actuel, ou 0 si l'option de limite de remplissage est active et que la masse maximale est atteinte (sauf si l'unité l'ignore). Les arguments type et ferme sont inutilisés. Nil si l'unité est inconnue. |
| `FillUnit:getIsFillAllowedFromFarm(farmId: any)` | 878 | ✍ Retourne toujours true ici ; l'identifiant de ferme est ignoré. D'autres spécialisations peuvent la surcharger pour restreindre le remplissage par ferme. |
| `FillUnit:getFillUnitFillLevel(fillUnitIndex: any)` | 884 | ✍ Retourne le niveau de remplissage actuel d'une unité en litres, ou nil si l'index est inconnu. |
| `FillUnit:getFillUnitFillLevelPercentage(fillUnitIndex: any)` | 894 | ✍ Retourne le niveau divisé par la capacité sous forme de fraction de 0 à 1 (0 si la capacité n'est pas positive), ou nil si l'unité est inconnue. |
| `FillUnit:getFillUnitFillType(fillUnitIndex: any)` | 910 | ✍ Retourne l'index du type de remplissage actuellement contenu (FillType.UNKNOWN si vide), ou nil si l'unité est inconnue. |
| `FillUnit:getFillUnitLastValidFillType(fillUnitIndex: any)` | 920 | ✍ Retourne le dernier type de remplissage ayant eu un niveau positif dans l'unité, conservé après vidage. Nil si l'unité est inconnue. |
| `FillUnit:getFillUnitFirstSupportedFillType(fillUnitIndex: any)` | 930 | ✍ Retourne une première clé quelconque de la table des types supportés (via next en Lua, ordre non garanti), ou nil. |
| `FillUnit:getFillUnitExactFillRootNode(fillUnitIndex: any)` | 940 | ✍ Retourne le nœud racine de remplissage exact d'une unité, utilisé pour le ciblage précis par les effets de remplissage, ou nil. |
| `FillUnit:getFillUnitRootNode(fillUnitIndex: any)` | 950 | ✍ Retourne le nœud racine de remplissage d'une unité (par défaut le nœud du premier composant au chargement), ou nil si l'unité est inconnue. |
| `FillUnit:getFillUnitAutoAimTargetNode(fillUnitIndex: any)` | 960 | ✍ Retourne le nœud cible de visée automatique d'une unité (nil si le XML n'en définit pas), ou nil si l'index d'unité est inconnu. |
| `FillUnit:getFillUnitSupportsFillType(fillUnitIndex: any, fillType: any)` | 970 | ✍ Indique si un type de remplissage figure dans l'ensemble supporté de l'unité (valeur stockée, true ou nil), false si l'unité est inconnue. |
| `FillUnit:getFillUnitSupportsToolType(fillUnitIndex: any, toolType: any)` | 980 | ✍ Indique si un type d'outil est supporté par l'unité ; tous sont activés au chargement, donc normalement true. False si l'unité est inconnue. |
| `FillUnit:getFillUnitSupportsToolTypeAndFillType(fillUnitIndex: any, toolType: any, fillType: any)` | 990 | ✍ Combine getFillUnitSupportsToolType et getFillUnitSupportsFillType : vrai seulement si les deux sont acceptés. |
| `FillUnit:getFillUnitSupportedFillTypes(fillUnitIndex: any)` | 997 | ✍ Retourne la table des types de remplissage supportés (clés = index de types) d'une unité, ou nil. |
| `FillUnit:getFillUnitSupportedToolTypes(fillUnitIndex: any)` | 1007 | ✍ Retourne la table des types d'outils supportés d'une unité, ou nil si l'unité est inconnue. |
| `FillUnit:getFillUnitAllowsFillType(fillUnitIndex: any, fillType: any)` | 1017 | ✍ Vrai si le type est supporté et soit identique au type courant, soit l'unité est presque vide (fraction du niveau sous le seuil de changement), ce qui permet de changer de type. |
| `FillUnit:getFillTypeChangeThreshold(fillUnitIndex: any)` | 1033 | ✍ Retourne le seuil de changement de type en fraction, ou en litres (capacité multipliée par la fraction) si un index d'unité est fourni. La fraction par défaut est 0,05. |
| `FillUnit:getFirstValidFillUnitToFill(fillType: any, ignoreCapacity: any)` | 1044 | ✍ Retourne l'index de la première unité qui accepte le type et a de la place (ou n'importe laquelle si ignoreCapacity est vrai), ou nil sinon. |
| `FillUnit:getFillUnitCanBeFilled(fillUnitIndex: any, fillType: any, ignoreCapacity: any)` | 1059 | ✍ Retourne true si l'unité donnée accepte le type et dispose de place, ou si ignoreCapacity est vrai. |
| `FillUnit:setFillUnitFillType(fillUnitIndex: any, fillTypeIndex: any)` | 1071 | ✍ Change directement le type de remplissage d'une unité et émet onChangedFillType (ancien et nouvel index) s'il diffère. Ne modifie pas le niveau. |
| `FillUnit:setFillUnitFillTypeToDisplay(fillUnitIndex: any, fillTypeIndex: any, isPersistent: any)` | 1082 | ✍ Remplace le type de remplissage affiché au HUD pour une unité ; la valeur est effacée au vidage sauf si isPersistent est vrai. |
| `FillUnit:setFillUnitFillLevelToDisplay(fillUnitIndex: any, fillLevel: any, isPersistent: any)` | 1092 | ✍ Remplace le niveau affiché au HUD pour une unité ; effacé au vidage sauf si isPersistent est vrai. |
| `FillUnit:setFillUnitCapacityToDisplay(fillUnitIndex: any, capacity: any)` | 1102 | ✍ Remplace la capacité affichée au HUD pour une unité sans modifier la capacité réelle. |
| `FillUnit:setFillUnitCapacity(fillUnitIndex: any, capacity: any, noEventSend: any)` | 1111 | ✍ Modifie la capacité réelle d'une unité et, si elle change, envoie SetFillUnitCapacityEvent (sauf noEventSend) pour la synchroniser. |
| `FillUnit:setFillUnitForcedMaterialFillType(fillUnitIndex: any, forcedMaterialFillType: any)` | 1124 | ✍ Force la matière affichée pour le plan de remplissage de l'unité et, si FillVolume est présent, ses volumes, indépendamment du vrai type. Purement visuel. |
| `FillUnit:getFillUnitForcedMaterialFillType(fillUnitIndex: any)` | 1139 | ✍ Retourne le type de matière d'affichage forcé d'une unité, ou FillType.UNKNOWN si aucun n'est défini. |
| `FillUnit:setFillUnitInTriggerRange(fillUnitIndex: any, isInRange: any)` | 1150 | ✍ Point d'extension vide dans cette spécialisation ; d'autres peuvent le surcharger pour réagir à l'entrée ou la sortie d'une unité dans la portée d'un trigger. |
| `FillUnit:updateAlarmTriggers(alarmTriggers: any, fillLevelDelta: any)` | 1155 | ✍ Réévalue chaque alarme fournie d'après le niveau et, pour les alarmes directionnelles, d'après le signe du dernier changement de niveau, puis applique l'état obtenu. |
| `FillUnit:getAlarmTriggerIsActive(alarmTrigger: any)` | 1178 | ✍ Retourne true si la fraction de niveau de l'unité est comprise (bornes incluses) entre minFillLevel et maxFillLevel de l'alarme. Divise par la capacité, donc une unité illimitée donne 0. |
| `FillUnit:setAlarmTriggerState(alarmTrigger: any, state: any)` | 1191 | ✍ Lors d'un changement d'état, lance ou arrête le son d'alarme, commute les gyrophares (arrêt automatique possible après activeDuration), suit l'alarme active et émet onAlarmTriggerChanged. |
| `FillUnit:getFillUnitIndexFromNode(node: any)` | 1230 | ✍ Retourne l'index de l'unité propriétaire du nœud de remplissage exact fourni, ou nil. |
| `FillUnit:getFillUnitExtraDistanceFromNode(node: any)` | 1242 | ✍ Retourne la distance d'effet supplémentaire configurée pour un nœud de remplissage exact, 0 par défaut. |
| `FillUnit:getFillUnitFromNode(node: any)` | 1249 | ✍ Retourne la table de l'unité propriétaire du nœud de remplissage exact fourni, ou nil. |
| `FillUnit:emptyAllFillUnits(ignoreDeleteOnEmptyFlag: any)` | 1256 | ✍ Vide toutes les unités en ajoutant moins l'infini à leur niveau ; avec ignoreDeleteOnEmptyFlag, le véhicule n'est pas supprimé même s'il est configuré pour l'être une fois vide. |
| `FillUnit:loadFillUnitUnloadingFromXML(xmlFile: any, key: any, entry: any, index: any)` | 1273 | ✍ Lit une zone de déchargement depuis le XML : nœud (par défaut le nœud racine), largeur (15 par défaut) et décalage. Retourne toujours true. À noter : l'index passé par onLoad est inutilisé. |
| `FillUnit:getFillUnitUnloadPalletFilename(fillUnitIndex: any)` | 1283 | ✍ Retourne le nom de fichier XML de palette du type courant de l'unité, ou nil si elle est vide. |
| `FillUnit:getFillUnitHasMountedPalletsToUnload()` | 1295 | ✍ Point d'extension retournant false par défaut ; surchargé par les véhicules transportant des palettes montées déchargeables. |
| `FillUnit:getFillUnitMountedPalletsToUnload()` | 1301 | ✍ Point d'extension retournant nil par défaut ; surchargé pour fournir la liste des palettes montées à décharger. |
| `FillUnit:getFillUnitUnloadingTasks()` | 1307 | ✍ Construit la liste des tâches de déchargement, une par unité déchargeable non vide ayant une palette, avec index d'unité, type, niveau et fichier de palette. |
| `FillUnit:getFillUnitEmptyOnReset()` | 1325 | ✍ Retourne true par défaut : les unités sans niveau de départ sont vidées à la réinitialisation des véhicules au lieu d'être chargées depuis la sauvegarde. |
| `FillUnit:getAllowLoadTriggerActivation(rootVehicle: any)` | 1331 | ✍ Retourne true seulement si le véhicule racine est celui dans lequel se trouve le joueur local, donc seul son propre véhicule peut être rempli depuis un trigger. |
| `FillUnit:addExactFillRootAimToUpdate(vehicle: any, func: any)` | 1345 | ✍ Met en file un rappel pour un autre véhicule, exécuté une seule fois lors du prochain post-update de ce véhicule, pour la visée du nœud de remplissage exact. |
| `FillUnit:unloadFillUnits(ignoreWarning: any)` | 1352 | ✍ Client : demande au serveur via FillUnitUnloadEvent. Serveur : place les palettes montées et fait apparaître de nouvelles palettes sur les zones de déchargement en les remplissant avec le contenu, puis émet onFillUnitUnloaded et diffuse FillUnitUnloadedEvent. Notifie en cas de manque de place. |
| `FillUnit:addFillUnitFillLevel(farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 1485 | ✍ Fonction centrale pour ajouter ou retirer des litres dans une unité ; retourne le delta réellement appliqué. Vérifie l'accès de la ferme, la limite de masse et le support des types d'outil et de remplissage, peut changer de type, met à jour synchronisation, masse, plans, alarmes, effets, animations et tableaux de bord, émet onFillUnitFillLevelChanged et peut supprimer le véhicule une fois vide. |
| `FillUnit:setFillUnitLastValidFillType(fillUnitIndex: any, fillType: any, force: any)` | 1760 | ✍ Définit le dernier type valide d'une unité et sa copie envoyée, puis lève le drapeau dirty pour synchroniser, si la valeur diffère. |
| `FillUnit:loadFillUnitFromXML(xmlFile: any, key: any, entry: any, index: any)` | 1772 | ✍ Charge une unité depuis le XML : capacité, types ou catégories supportés (un des deux est obligatoire, sinon échec), niveau de départ, nœuds, bits réseau, options HUD, animations et, côté client, alarmes, nœuds de mesure, plan, matériaux, effets et valeurs de tableau de bord. À noter : useMaxStateIfEmpty vaut false ici alors que le schéma documente true. |
| `FillUnit:loadAlarmTrigger(xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 2061 | ✍ Charge une alarme depuis le XML : fractions min et max obligatoires, son d'alarme, gyrophares et direction. Retourne false si un niveau requis manque. À noter : needsTurnOn et turnOffInTrigger sont déclarés dans le schéma mais non lus ici. |
| `FillUnit:loadMeasurementNode(xmlFile: any, key: any, entry: any)` | 2095 | ✍ Charge un nœud de mesure (jauge pilotée par shader) depuis le XML ; retourne false avec un avertissement si le nœud manque. |
| `FillUnit:updateMeasurementNodes(fillUnit: any, dt: any, setActive: any, forcedIntensity: any)` | 2112 | ✍ Pilote les paramètres shader fillLevel et prevFillLevel des nœuds de mesure avec un minuteur de visibilité de 5 secondes et une intensité renforcée par la vitesse du véhicule au-delà d'environ 10 km/h. Utilisé côté client. |
| `FillUnit:loadFillPlane(xmlFile: any, key: any, fillPlane: any, fillUnit: any)` | 2137 | ✍ Charge le plan de remplissage d'une unité : nœuds mobiles avec courbes d'animation (images clés ou Y min/max), assigne le matériau de base « fillPlane » et les tableaux de textures du terrain, et résout le type par défaut. Retourne false si absent ou si le type par défaut est invalide. |
| `FillUnit:setFillPlaneForcedFillType(fillUnitIndex: any, forcedFillType: any)` | 2241 | ✍ Mémorise un type forcé sur le plan de remplissage de l'unité, s'il existe. Usage visuel. À noter : updateFillUnitFillPlane ne lit pas cette valeur dans ce fichier. |
| `FillUnit:updateFillUnitFillPlane(fillUnit: any)` | 2252 | ✍ Positionne, oriente, met à l'échelle et affiche les nœuds du plan selon la fraction de niveau via les courbes, et règle l'index de texture fillTypeId du shader quand le type change. À noter : lastFillPlaneType n'est jamais mis à jour, donc le paramètre shader est réécrit à chaque appel. |
| `FillUnit:loadFillTypeMaterials(xmlFile: any, key: any)` | 2279 | ✍ Lit la liste fillTypeMaterials : soit un nœud cible et un nœud de référence dont le matériau est copié, soit un nom d'emplacement de matériau et une texture diffuse personnalisée. Les entrées invalides sont ignorées avec avertissement. Retourne la liste. |
| `FillUnit:updateFillTypeMaterials(fillTypeMaterials: any, fillTypeIndex: any)` | 2332 | ✍ Pour chaque entrée correspondant au nouveau type, copie le matériau du nœud de référence sur le nœud cible ou remplace la texture diffuse de l'emplacement depuis un fichier sur les nœuds du véhicule. |
| `FillUnit:updateFillUnitAutoAimTarget(fillUnit: any)` | 2352 | ✍ Déplace le nœud cible de visée automatique selon Z entre startZ et endZ en fonction du niveau au-dessus du pourcentage de départ (inversion possible). |
| `FillUnit:addFillUnitTrigger(trigger: table, fillTypeIndex: integer, fillUnitIndex: any)` | 2371 | ✍ Enregistre un trigger de remplissage qui atteint actuellement le véhicule. Le premier enregistre l'activable de remplissage et, sur les plateformes à remplissage automatique, démarre le remplissage. Émet onAddedFillUnitTrigger et retrie les triggers. |
| `FillUnit:removeFillUnitTrigger(trigger: table)` | 2391 | ✍ Désenregistre un trigger de remplissage, arrête le remplissage côté serveur s'il était actif, retire l'activable s'il n'en reste aucun, émet onRemovedFillUnitTrigger et retrie. |
| `FillUnit:updateFillUnitTriggers()` | 2415 | ✍ Trie les triggers (ceux remplissables d'abord, puis unités les plus pleines), met à jour le type de l'activable depuis le premier et émet onFillUnitTriggerChanged quand le trigger sélectionné change. |
| `FillUnit:setFillUnitIsFilling(isFilling: any, noEventSend: any)` | 2450 | ✍ Démarre ou arrête le remplissage depuis un trigger. Sauf noEventSend, envoie SetFillUnitIsFillingEvent. Choisit le premier trigger activable, bascule les sons, émet onFillUnitIsFillingStateChanged et retrie à l'arrêt. |
| `FillUnit:setFillSoundIsPlaying(isPlaying: any)` | 2495 | ✍ Démarre ou arrête l'échantillon sonore de remplissage selon l'argument, en n'agissant que si l'état de lecture diffère. |
| `FillUnit:getIsFillUnitActive(fillUnitIndex: any)` | 2510 | ✍ Retourne true par défaut ; point d'extension que d'autres spécialisations peuvent surcharger pour désactiver une unité. |
| `FillUnit:getAdditionalComponentMass(superFunc: any, component: any)` | 2518 | ✍ Surcharge la fonction du véhicule : ajoute la masse du contenu de chaque unité (niveau multiplié par la masse par litre du type) au composant correspondant au nœud de masse de l'unité. |
| `FillUnit:getFillLevelInformation(superFunc: function, display: table)` | 2537 | ✍ Surcharge la fonction du véhicule : ajoute une entrée HUD par unité visible (type, niveau, capacité, précision, indicateur de maximum, style), fusionne parent et enfant et affiche l'unique type supporté quand l'unité est vide. |
| `FillUnit:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 2588 | ✍ Surcharge l'autorisation de repli : si le repli en charge est interdit, retourne false avec un texte d'avertissement quand une unité dépasse son seuil (pour le type configuré le cas échéant) ; sinon délègue au parent. |
| `FillUnit:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 2603 | ✍ Surcharge le contrôle d'aptitude du train : retourne false si une unité marquée blocksAutomatedTrainTravel n'est pas vide, sinon délègue au parent. |
| `FillUnit:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 2616 | ✍ Étend le chargement des outils mobiles avec les attributs fillUnitIndex, minFillLevel et maxFillLevel après réussite du chargeur parent. |
| `FillUnit:getIsMovingToolActive(superFunc: any, movingTool: any)` | 2630 | ✍ Surcharge l'activité des outils mobiles : si lié à une unité, retourne false quand la fraction est supérieure à minFillLevel ou inférieure à maxFillLevel. À noter : la condition semble inversée par rapport aux contrôles du niveleur et de l'attache, et min et max valent nil par défaut, ce qui planterait si seul l'index est défini. |
| `FillUnit:getDoConsumePtoPower(superFunc: any)` | 2643 | ✍ Surcharge la consommation de prise de force : vrai aussi pendant le remplissage par trigger si consumePtoPower est configuré. |
| `FillUnit:getIsPowerTakeOffActive(superFunc: any)` | 2650 | ✍ Surcharge l'activité de la prise de force : vrai aussi pendant le remplissage par trigger si consumePtoPower est configuré. |
| `FillUnit:getCanBeTurnedOn(superFunc: any)` | 2657 | ✍ Surcharge l'autorisation de mise en marche : retourne false tant qu'une alarme active a turnOffInTrigger, sinon délègue au parent. À noter : loadAlarmTrigger ne lit jamais ce drapeau depuis le XML. |
| `FillUnit:showInfo(superFunc: any, box: any)` | 2671 | ✍ Surcharge la boîte d'informations : liste le niveau total par type (avec unité et précision) pour les unités visibles dans le HUD d'infos, reconstruit seulement si le cache est invalide, puis appelle le parent. |
| `FillUnit:loadLevelerNodeFromXML(superFunc: any, levelerNode: any, xmlFile: any, key: any)` | 2717 | ✍ Étend le chargement des nœuds de niveleur avec fillUnitIndex (1 par défaut) et des limites min et max de fraction de remplissage. |
| `FillUnit:getIsLevelerPickupNodeActive(superFunc: any, levelerNode: any)` | 2727 | ✍ Surcharge l'activité de ramassage du niveleur : retourne false si la fraction de la unité liée est hors de la plage min/max du nœud, sinon délègue au parent. |
| `FillUnit:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer)` | 2742 | ✍ Étend le chargement des attaches avec fillUnitIndex, fillUnitTopArmOnly, minFillLevel et maxFillLevel quand un index d'unité est configuré. |
| `FillUnit:getIsAttacherJointCompatible(superFunc: any, vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 2755 | ✍ Surcharge la compatibilité d'attache : retourne false avec un texte d'avertissement quand la fraction de l'unité liée est hors de la plage autorisée (pour le mode bras supérieur seul, seulement si l'outil a un nœud de référence haut). |
| `FillUnit:debugGetSupportedFillTypesPerFillUnit()` | 2770 | ✍ Aide au débogage retournant une table associant chaque index d'unité à son ensemble de types supportés. |
| `FillUnit.addFillTypeSources(sources: any, currentVehicle: any, excludeVehicle: any, fillTypes: any)` | 2780 | ✍ Parcourt récursivement un véhicule et ses outils attelés (en ignorant le véhicule exclu) et remplit sources[type] avec des entrées véhicule et index d'unité pour les unités supportant les types voulus. |
| `FillUnit.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 2809 | ✍ Chargeur de caractéristique boutique : lit les capacités par configuration d'unités (ou la valeur storeData), en les convertissant selon l'unité d'affichage. Retourne une liste de configurations ou nil. |
| `FillUnit.getSpecValueCapacity(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2874 | ✍ Accesseur de caractéristique boutique : calcule le texte de capacité pour la configuration choisie ou une plage min à max sur les configurations sélectionnables, en utilisant la capacité réelle de l'objet si disponible. Peut retourner des valeurs plutôt que du texte avec returnValues. |
| `FillUnit.getCapacityFromXml(xmlFile: any)` | 2965 | ✍ Retourne la plus grande capacité d'unité trouvée dans les configurations d'un fichier XML de véhicule, 0 s'il n'y en a pas. |
| `FillUnit.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 2980 | ✍ Chargeur de caractéristique boutique : collecte les noms de types et catégories de toutes les configurations (hors unités masquées ou de capacité nulle), les valeurs storeData, les fruits et les types d'andain issus d'un convertisseur, dans une table descriptive. |
| `FillUnit.getFillTypeNamesFromXML(xmlFile: any)` | 3078 | ✍ Lit tous les noms de types et de catégories des unités à capacité positive ou non précisée d'un XML de véhicule et les retourne en deux chaînes séparées par des espaces. |
| `FillUnit.getSpecValueFillTypes(storeItem: any, realItem: any, configurations: any)` | 3113 | ✍ Accesseur de caractéristique boutique : résout le descripteur chargé (pour la configuration choisie le cas échéant) en liste d'index de types via catégories, noms, fruits, catégories de fruits ou types d'andain. Nil si rien. |
| `FillUnit.loadSpecValueFillUnitMassData(xmlFile: any, customEnvironment: any, baseDir: any)` | 3155 | ✍ Collecte les données servant à estimer la masse initiale : réservoirs de consommateurs de la première configuration et unités ayant niveau et type de départ dans la première configuration d'unités. |
| `FillUnit.getSpecValueStartFillUnitMassByMassData(fillUnitMassData: any)` | 3189 | ✍ Additionne capacité multipliée par masse par litre sur les données collectées, avec le premier type de chaque liste de catégories ou noms. Retourne la masse totale (unités de masse du jeu). |
| `FillUnit.actionEventConsoleFillUnitNext(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3214 | ✍ Action de débogage : pour le véhicule sélectionné, vide l'unité 1 et la remplit de 100 litres du type supporté suivant. Enregistrée seulement sur les builds de développement console. |
| `FillUnit.actionEventConsoleFillUnitInc(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3242 | ✍ Action de débogage : ajoute 1000 litres à l'unité 1 du véhicule sélectionné, en choisissant un type supporté si elle est vide. |
| `FillUnit.actionEventConsoleFillUnitDec(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3255 | ✍ Action de débogage : retire 1000 litres de l'unité 1 du véhicule sélectionné. |
| `FillUnit.actionEventUnload(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3264 | ✍ Rappel d'entrée de l'action UNLOAD : appelle unloadFillUnits sur le véhicule. |
| `FillUnit.updateUnloadActionDisplay(self: any)` | 3270 | ✍ Active l'action de déchargement seulement si une unité déchargeable contient quelque chose avec une palette ou si des palettes montées existent, et qu'aucune cible de déversement n'est définie. |
| `FillActivatable.new(vehicle: any)` | 3306 | ✍ Crée l'objet d'aide utilisé par le système d'activables pour démarrer et arrêter le remplissage depuis un trigger pour un véhicule donné ; démarre avec un type inconnu. |
| `FillActivatable:getIsActivatable()` | 3318 | ✍ Vrai si le véhicule est actif pour la saisie, a une unité pouvant recevoir le type courant avec plus de 1 litre libre, supporte l'outil trigger, et qu'un trigger est activable ; met aussi à jour le texte d'invite. |
| `FillActivatable:run()` | 3344 | ✍ Bascule l'état de remplissage par trigger du véhicule et met à jour le texte d'invite. |
| `FillActivatable:activate()` | 3352 | ✍ Appelé à l'entrée du joueur dans la portée : enregistre l'objet comme dessinable pour que draw soit appelé à chaque image. |
| `FillActivatable:deactivate()` | 3358 | ✍ Appelé à la sortie de la portée : retire l'objet des éléments dessinables de la mission. |
| `FillActivatable:draw()` | 3364 | ✍ Affiche le contexte carburant du HUD pour le véhicule quand le type de l'activable est le carburant. |
| `FillActivatable:updateActivateText(isFilling: any)` | 3372 | ✍ Définit le texte d'invite sur la chaîne d'arrêt ou de démarrage du remplissage avec la description du type de véhicule. |
| `FillActivatable:setFillType(fillTypeIndex: any)` | 3383 | ✍ Définit l'index du type de remplissage concerné par cet activable, utilisé pour vérifier si une unité peut le recevoir. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onFillUnitFillLevelChanged` | 195 |
| registerEvent | `onChangedFillType` | 196 |
| registerEvent | `onAlarmTriggerChanged` | 197 |
| registerEvent | `onAddedFillUnitTrigger` | 198 |
| registerEvent | `onFillUnitTriggerChanged` | 199 |
| registerEvent | `onRemovedFillUnitTrigger` | 200 |
| registerEvent | `onFillUnitIsFillingStateChanged` | 201 |
| registerEvent | `onFillUnitUnloadPallet` | 202 |
| registerEvent | `onFillUnitUnloaded` | 203 |
| registerFunction | `getDrawFirstFillText` | 209 |
| registerFunction | `getFillUnits` | 210 |
| registerFunction | `getFillUnitByIndex` | 211 |
| registerFunction | `getFillUnitExists` | 212 |
| registerFunction | `getFillUnitCapacity` | 213 |
| registerFunction | `getFillUnitFreeCapacity` | 214 |
| registerFunction | `getIsFillAllowedFromFarm` | 215 |
| registerFunction | `getFillUnitFillLevel` | 216 |
| registerFunction | `getFillUnitFillLevelPercentage` | 217 |
| registerFunction | `getFillUnitFillType` | 218 |
| registerFunction | `getFillUnitLastValidFillType` | 219 |
| registerFunction | `getFillUnitFirstSupportedFillType` | 220 |
| registerFunction | `getFillUnitExactFillRootNode` | 221 |
| registerFunction | `getFillUnitRootNode` | 222 |
| registerFunction | `getFillUnitAutoAimTargetNode` | 223 |
| registerFunction | `getFillUnitSupportsFillType` | 224 |
| registerFunction | `getFillUnitSupportsToolType` | 225 |
| registerFunction | `getFillUnitSupportsToolTypeAndFillType` | 226 |
| registerFunction | `getFillUnitSupportedFillTypes` | 227 |
| registerFunction | `getFillUnitSupportedToolTypes` | 228 |
| registerFunction | `getFillUnitAllowsFillType` | 229 |
| registerFunction | `getFillTypeChangeThreshold` | 230 |
| registerFunction | `getFirstValidFillUnitToFill` | 231 |
| registerFunction | `getFillUnitCanBeFilled` | 232 |
| registerFunction | `setFillUnitFillType` | 233 |
| registerFunction | `setFillUnitFillTypeToDisplay` | 234 |
| registerFunction | `setFillUnitFillLevelToDisplay` | 235 |
| registerFunction | `setFillUnitCapacityToDisplay` | 236 |
| registerFunction | `setFillUnitCapacity` | 237 |
| registerFunction | `setFillUnitForcedMaterialFillType` | 238 |
| registerFunction | `getFillUnitForcedMaterialFillType` | 239 |
| registerFunction | `setFillUnitInTriggerRange` | 240 |
| registerFunction | `updateAlarmTriggers` | 241 |
| registerFunction | `getAlarmTriggerIsActive` | 242 |
| registerFunction | `setAlarmTriggerState` | 243 |
| registerFunction | `getFillUnitIndexFromNode` | 244 |
| registerFunction | `getFillUnitExtraDistanceFromNode` | 245 |
| registerFunction | `getFillUnitFromNode` | 246 |
| registerFunction | `addFillUnitFillLevel` | 247 |
| registerFunction | `setFillUnitLastValidFillType` | 248 |
| registerFunction | `loadFillUnitFromXML` | 249 |
| registerFunction | `loadAlarmTrigger` | 250 |
| registerFunction | `loadMeasurementNode` | 251 |
| registerFunction | `updateMeasurementNodes` | 252 |
| registerFunction | `loadFillPlane` | 253 |
| registerFunction | `setFillPlaneForcedFillType` | 254 |
| registerFunction | `updateFillUnitFillPlane` | 255 |
| registerFunction | `loadFillTypeMaterials` | 256 |
| registerFunction | `updateFillTypeMaterials` | 257 |
| registerFunction | `updateFillUnitAutoAimTarget` | 258 |
| registerFunction | `addFillUnitTrigger` | 259 |
| registerFunction | `removeFillUnitTrigger` | 260 |
| registerFunction | `setFillUnitIsFilling` | 261 |
| registerFunction | `setFillSoundIsPlaying` | 262 |
| registerFunction | `getIsFillUnitActive` | 263 |
| registerFunction | `updateFillUnitTriggers` | 264 |
| registerFunction | `emptyAllFillUnits` | 265 |
| registerFunction | `unloadFillUnits` | 266 |
| registerFunction | `loadFillUnitUnloadingFromXML` | 267 |
| registerFunction | `getFillUnitUnloadPalletFilename` | 268 |
| registerFunction | `getFillUnitHasMountedPalletsToUnload` | 269 |
| registerFunction | `getFillUnitMountedPalletsToUnload` | 270 |
| registerFunction | `getFillUnitUnloadingTasks` | 271 |
| registerFunction | `getFillUnitEmptyOnReset` | 272 |
| registerFunction | `getAllowLoadTriggerActivation` | 273 |
| registerFunction | `addExactFillRootAimToUpdate` | 274 |
| registerFunction | `debugGetSupportedFillTypesPerFillUnit` | 275 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 282 |
| registerOverwrittenFunction | `getFillLevelInformation` | 283 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 284 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 285 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 286 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 287 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 288 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 289 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 290 |
| registerOverwrittenFunction | `showInfo` | 291 |
| registerOverwrittenFunction | `loadLevelerNodeFromXML` | 292 |
| registerOverwrittenFunction | `getIsLevelerPickupNodeActive` | 293 |
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 294 |
| registerOverwrittenFunction | `getIsAttacherJointCompatible` | 295 |
| registerEventListener | `onLoad` | 301 |
| registerEventListener | `onPostLoad` | 302 |
| registerEventListener | `onDelete` | 303 |
| registerEventListener | `onReadStream` | 304 |
| registerEventListener | `onWriteStream` | 305 |
| registerEventListener | `onReadUpdateStream` | 306 |
| registerEventListener | `onWriteUpdateStream` | 307 |
| registerEventListener | `onUpdateTick` | 308 |
| registerEventListener | `onPostUpdate` | 309 |
| registerEventListener | `onDraw` | 310 |
| registerEventListener | `onDeactivate` | 311 |
| registerEventListener | `onRegisterActionEvents` | 312 |
| registerEventListener | `onDischargeTargetObjectChanged` | 313 |
