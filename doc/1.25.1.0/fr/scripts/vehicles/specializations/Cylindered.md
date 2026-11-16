# vehicles/specializations/Cylindered.lua

*[English version](../../../../scripts/vehicles/specializations/Cylindered.md)*

Source: `dataS/scripts/vehicles/specializations/Cylindered.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui anime les parties articulées d'une machine : les moving tools (axes commandés par le joueur, comme les bras de chargeur, pilotés par rotation, translation ou animation) et les moving parts (nœuds passifs qui visent un point de référence, comme les vérins hydrauliques). Elle exige VehicleSettings et dialogue aussi avec AnimatedVehicle, Wheels, AttacherJoints, Dischargeable, Shovel et DynamicMountAttacher. Le serveur gère les entrées et les limites, les clients interpolent, les positions des outils sont synchronisées par le réseau et sauvegardées. Elle fournit aussi la commande de bras simplifiée (cinématique inverse à deux segments), les groupes de contrôle, les sons hydrauliques et d'action, et les valeurs de tableau de bord. Les constantes comme MOVING_TOOLS_XML_KEYS, SOUND_ACTION_* et SOUND_TYPE_* ne figurent pas dans ce dump (NON VÉRIFIÉ).

- **Cylindered** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Cylindered.prerequisitesPresent(specializations: table) → boolean` | 57 | ✍ Renvoie vrai seulement si le type de véhicule contient la spécialisation VehicleSettings ; Cylindered ne peut pas être ajoutée sans elle. |
| `Cylindered.initSpecialization()` | 63 | ✍ Enregistre le type de configuration boutique "cylindered" et déclare tous les chemins XML du véhicule (moving tools, moving parts, commande de bras, groupes de contrôle, tableaux de bord, extensions d'object change, activation de vidange, de pelle et de montage dynamique) ainsi que les clés de sauvegarde (translation, rotation, temps d'animation des outils). |
| `Cylindered.registerSoundXMLPaths(schema: any, baseKey: any)` | 153 | ✍ Déclare les chemins XML du son hydraulique et des sons d'action (noms d'actions, nœuds déclencheurs, facteur et durée de baisse de hauteur) sous la clé de base donnée. |
| `Cylindered.registerEasyArmControlXMLPaths(schema: any, key: any)` | 165 | ✍ Déclare les attributs XML du bloc de commande de bras simplifiée : nœuds racine, cible et référence, vitesse et accélération de la cible, réglages du ratio translation/rotation, nœuds de translation Z et de rotation X. |
| `Cylindered.registerMovingToolXMLPaths(schema: any, toolKey: any)` | 186 | ✍ Déclare tous les attributs XML d'un moving tool : limites et vitesses de rotation, translation et animation, commandes (axe, icône, groupe), consommation de puissance, limites d'attelage et de dételage, configurations requises, pièces dépendantes, roues, attaches, limites de remplissage et de pliage. Enchaîne aussi les enregistrements des joints, animations et outils dépendants. |
| `Cylindered.registerMovingPartXMLPaths(schema: any, partKey: any)` | 269 | ✍ Déclare tous les attributs XML d'une moving part : nœud, repère et points de référence, modes d'alignement (direction, ligne, ligne 3D, rotation, axe Y monde), distances et seuils, lissage, distance de mise à jour, pièces coulissantes et éléments dépendants. |
| `Cylindered.registerDependentComponentJointXMLPaths(schema: any, basePath: any)` | 343 | ✍ Déclare les chemins XML des joints de composants qui doivent suivre un moving tool ou une moving part : index du joint, drapeau d'avertissement ignoré et acteur d'ancrage. |
| `Cylindered.registerCopyLocalDirectionXMLPaths(schema: any, basePath: any)` | 351 | ✍ Déclare les chemins XML des entrées copyLocalDirectionPart (nœud, échelle de direction, échelle du vecteur haut) et de leurs joints de composants éventuels. |
| `Cylindered.registerDependentAnimationXMLPaths(schema: any, basePath: any)` | 361 | ✍ Déclare les chemins XML des animations dépendantes pilotées par la valeur d'un axe d'une pièce : nom de l'animation, axe, index de pièce coulissante, plage de valeurs et inversion. |
| `Cylindered.registerDependentMovingToolXMLPaths(schema: any, basePath: any)` | 373 | ✍ Déclare les chemins XML des moving tools dépendants : nœud, axe, facteur de vitesse, requiresMovement, points clés de limites selon la rotation et paires de limites min/max de translation ou de rotation. |
| `Cylindered.registerEvents(vehicleType: any)` | 391 | ✍ Enregistre l'événement de véhicule onMovingToolChanged, déclenché avec l'outil, la vitesse et dt chaque fois qu'un moving tool se déplace réellement. |
| `Cylindered.registerFunctions(vehicleType: any)` | 397 | ✍ Enregistre sur le type de véhicule les fonctions publiques de la spécialisation (chargement, mises à jour dirty, recherche par nœud, états actifs, commande simplifiée, mises à jour dépendantes, événements sonores, groupes de contrôle). |
| `Cylindered.registerOverwrittenFunctions(vehicleType: any)` | 443 | ✍ Surcharge des fonctions de véhicule existantes : autorisation de dételage, chargement et application des object changes, points d'accroche des nœuds de vidange, pelle et montage dynamique, repère de joint de composant, texte de schéma, multiplicateur d'usure, consommation PTO et charge consommée. |
| `Cylindered.registerEventListeners(vehicleType: any)` | 462 | ✍ Abonne la spécialisation aux événements du véhicule dont elle a besoin : cycle de vie, réseau, mise à jour, affichage, entrées, attelage, sélection, IA, réglages et valeurs d'animation. |
| `Cylindered:onLoad(savegame: table)` | 492 | ✍ Construit tout l'ensemble articulé à partir du XML du véhicule (clés de base et de configuration) : moving parts et tools, liens dépendants, groupes de contrôle avec sous-sélections, commande de bras, valeur de tableau de bord, sons, drapeaux dirty et réglage EASY_ARM_CONTROL. Avertit sur les entrées invalides et retire les outils dépendants non définis. |
| `Cylindered:onPostLoad(savegame: table)` | 703 | ✍ Applique les positions de départ, charge les dépendances d'attaches et de roues, restaure les positions d'outils sauvegardées bornées à leurs limites (sauf réinitialisation des véhicules), puis lance la mise à jour initiale. Retire les écouteurs d'événements inutiles (pas d'outils, pas de pièces, pas client). |
| `Cylindered:onLoadFinished(savegame: table)` | 876 | ✍ Termine la phase de chargement et purge l'historique des nœuds retardés des outils qui ont des données retardées en attente. |
| `Cylindered:onRegisterDashboardValueTypes()` | 890 | ✍ Enregistre la valeur de tableau de bord cylindered/movingTool (plage 0 à 1, repos 0,5) alimentée par getMovingToolDashboardState. |
| `Cylindered:onDelete()` | 901 | ✍ Libère les sons hydrauliques et d'action et supprime les icônes d'axe des moving tools. |
| `Cylindered:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 919 | ✍ Écrit dans la sauvegarde la translation, la rotation et le temps d'animation actuels de chaque moving tool sauvegardable, indexés dans l'ordre des seuls outils sauvegardables. |
| `Cylindered:onReadStream(streamId: integer, connection: Connection)` | 946 | ✍ Côté client à la connexion : si le serveur a indiqué que les états sont chargeables, lit la translation, la rotation et le temps d'animation absolus de chaque outil, réinitialise les interpolateurs, les applique et déclenche onMovingToolChanged. |
| `Cylindered:onWriteStream(streamId: integer, connection: Connection)` | 989 | ✍ Côté serveur à la connexion : écrit un drapeau (allowLoadMovingToolStates) puis la translation, la rotation et le temps d'animation absolus de chaque outil synchronisé pour le client entrant. |
| `Cylindered:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1018 | ✍ Le serveur lit la valeur d'entrée sur 12 bits de chaque outil pilotable envoyée par un client. Le client lit les cibles compressées de rotation, translation et animation (et les limites de rotation synchronisées) et alimente les interpolateurs réseau. |
| `Cylindered:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1091 | ✍ Le client envoie ses valeurs d'entrée actuelles (12 bits, seulement si le drapeau dirty d'entrée est levé). Le serveur envoie l'état compressé de chaque outil actif dont le drapeau dirty est levé. |
| `Cylindered:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1149 | ✍ Mise à jour à chaque image. Serveur : transforme l'entrée (ou la cible de l'IA) en mouvement accéléré de rotation, translation et animation, pilote outils et limites dépendants, lève les drapeaux dirty et gère le délai de consommation de puissance. Client : interpole vers le dernier état réseau. Fait aussi avancer les nœuds retardés et le minuteur de puissance. |
| `Cylindered:setDelayedData(tool: any, immediate: any)` | 1375 | ✍ Stocke la rotation et la translation actuelles du nœud de l'outil comme entrée la plus récente de son historique d'images retardées (avec remplissage complet optionnel). |
| `Cylindered:updateDelayedTool(tool: any, forceLastPosition: any)` | 1391 | ✍ Décale l'historique retardé d'une image et applique la plus ancienne pose stockée au delayedNode de l'outil, en marquant dirty la moving part ou le tool correspondant. Peut d'abord forcer toutes les entrées à la dernière pose. |
| `Cylindered:loadEasyArmControlFromXML(xmlFile: any, key: any, easyArmControl: any)` | 1425 | ✍ Lit et valide le bloc de commande de bras : deux outils cibles, nœuds de translation Z optionnels et exactement deux nœuds de rotation X, avec contrôles de position. Calcule la portée maximale si elle n'est pas donnée. Renvoie faux avec un avertissement ou une erreur XML si la configuration est invalide. |
| `Cylindered:updateEasyControl(dt: any, updateDelayedNodes: any)` | 1570 | ✍ Quand la commande simplifiée est active et que le joueur déplace la cible Y ou Z, déplace un point de référence dans la portée et résout le bras à deux segments (intersection de cercles et loi des cosinus), en pilotant les outils de translation Z et de rotation X dans leurs limites. Mouvement côté serveur uniquement. |
| `Cylindered:setIsEasyControlActive(state: any)` | 1756 | ✍ Active ou désactive la commande de bras simplifiée. Sur le serveur, l'activation aligne d'abord les outils cibles Y et Z sur le nœud de référence et synchronise. Demande un rafraîchissement des événements d'action partout. |
| `Cylindered:setEasyControlForcedTransMove(value: any)` | 1802 | ✍ Définit un facteur de déplacement forcé ponctuel pour les nœuds de translation de la commande simplifiée, consommé à la prochaine mise à jour ; ignoré sans commande de bras. |
| `Cylindered:updateExtraDependentParts(part: any, dt: any)` | 1812 | ✍ Point d'extension vide appelé après la mise à jour d'un outil ou d'une pièce, que d'autres spécialisations peuvent surcharger pour mettre à jour du contenu dépendant supplémentaire. |
| `Cylindered:updateDependentAnimations(part: any, dt: any)` | 1817 | ✍ Convertit la translation ou la rotation actuelle de la pièce sur son axe en valeur normalisée 0..1 (inversion possible) et règle chaque animation dépendante sur ce temps. |
| `Cylindered:updateDependentToolLimits(tool: any, dependentTool: any)` | 1844 | ✍ Interpole les limites min/max de translation ou de rotation d'un outil dépendant selon l'état de l'outil pilote, puis rebride l'outil dépendant et le marque dirty s'il a bougé. |
| `Cylindered:onMovingPartSoundEvent(part: any, action: any, type: any)` | 1879 | ✍ Déclenche les sons d'action enregistrés pour une pièce et une action : types ponctuel, continu, de fin ou de début, avec horodatage pour filtrer les sons de fin et de début. Gestion sonore côté client. |
| `Cylindered:updateMovingToolSoundEvents(tool: any, direction: any, hitLimit: any, wasAtLimit: any)` | 1940 | ✍ Traduit un mouvement d'outil (sens, limite atteinte, limite quittée) en événements sonores d'action de début, de fin, positifs et négatifs pour l'outil. |
| `Cylindered:updateControlGroups()` | 1975 | ✍ Reconstruit les sous-sélections à partir des groupes de contrôle qui ont encore un outil pilotable actif, rafraîchit les objets sélectionnables du véhicule racine et resélectionne ce véhicule s'il l'était. |
| `Cylindered:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2009 | ✍ Côté client : active ou désactive l'action d'entrée de chaque outil selon son état, remet à zéro les entrées bloquées, rafraîchit les groupes de contrôle lors d'un changement d'état et gère l'expiration des sons d'action actifs, de fin et de début. |
| `Cylindered:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2086 | ✍ Force la mise à jour de toutes les moving parts en dirty permanent, quelle que soit la distance de la caméra, juste avant la mise en veille du véhicule, puis traite les pièces dirty. |
| `Cylindered:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2099 | ✍ Marque dirty les moving parts à dirty permanent lorsque le véhicule est dans leur distance de mise à jour maximale, puis met à jour les pièces dirty et le son hydraulique. |
| `Cylindered:onPostUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2112 | ✍ Met à jour les pièces marquées dirty pendant le tick de mise à jour, sans l'étape sonore, pour qu'elles n'aient pas une image de retard. |
| `Cylindered:updateDirtyMovingParts(dt: any, updateSound: any)` | 2119 | ✍ Traite les outils dirty (roues, joints de composants côté serveur, dépendants supplémentaires et d'animation) et les moving parts dirty, puis démarre ou arrête le son hydraulique sur les clients si updateSound est vrai. |
| `Cylindered:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2182 | ✍ Quand le véhicule a plusieurs groupes de contrôle et est actif pour les entrées, ajoute un texte HUD supplémentaire avec le nom et le numéro du groupe de contrôle courant. |
| `Cylindered:loadMovingPartsFromXML(xmlFile: any, key: any)` | 2195 | ✍ Charge toutes les moving parts trouvées sous la clé avec leurs pièces dépendantes, joints, pièces à copie de direction, extras et animations, et les enregistre par nœud. Les nœuds en double sont ignorés avec un avertissement. |
| `Cylindered:loadMovingPartFromXML(xmlFile: any, key: any, entry: any)` | 2230 | ✍ Lit une moving part (repère et points de référence, modes d'alignement, distances, seuils, lissage, distance de mise à jour) dans entry. Renvoie faux si le nœud ou le repère manque ou si des modes d'alignement incompatibles sont combinés. |
| `Cylindered:loadMovingToolsFromXML(xmlFile: any, key: any)` | 2425 | ✍ Charge tous les moving tools trouvés sous la clé avec leurs outils et pièces dépendants, joints, extras et animations, et les enregistre par nœud. Les nœuds en double sont ignorés avec un avertissement. |
| `Cylindered:loadMovingToolFromXML(xmlFile: any, key: any, entry: any)` | 2457 | ✍ Lit un moving tool dans entry : vitesses (converties de par seconde en par ms), limites, précision réseau en bits, animation, commandes, verrous de dételage, configurations requises, nœud retardé et interpolateurs. Renvoie faux si une limite min n'est pas inférieure à sa max. |
| `Cylindered:loadDependentMovingTools(xmlFile: XMLFile, baseName: string, entry: table)` | 2703 | ✍ Lit les entrées dependentMovingTool d'un outil ou d'une pièce : facteur de vitesse, requiresMovement, courbe de limites selon la rotation et paires de limites min/max. Seules les entrées avec un nœud et au moins une règle sont conservées. |
| `Cylindered:loadDependentParts(xmlFile: XMLFile, baseName: string, entry: table)` | 2768 | ✍ Lit les nœuds dependentPart (et leur distance de mise à jour maximale, illimitée par défaut) d'une entrée ; ils sont résolus plus tard en vraies pièces par resolveDependentPartData. |
| `Cylindered:resolveDependentPartData(dependentPartData: table, referenceNodes: table)` | 2795 | ✍ Relie chaque nœud dépendant aux moving parts ou tools enregistrés pour lui (en ajoutant des entrées si plusieurs partagent un nœud), les marque comme dépendants et supprime les entrées non résolues. |
| `Cylindered:loadDependentComponentJoints(xmlFile: XMLFile, baseName: string, entry: table)` | 2831 | ✍ Serveur uniquement : lit les joints de composants à mettre à jour avec un outil ou une pièce et stocke le décalage et l'orientation du second composant par rapport au nœud du joint. Un index invalide provoque un avertissement sauf si ignoreWarning est défini. |
| `Cylindered:loadDependentAttacherJoints(xmlFile: XMLFile, baseName: string, entry: table)` | 2882 | ✍ Résout les index d'attaches de ce véhicule en entrées de joint et lit si l'attache d'entrée doit aussi être mise à jour. Les index absents donnent un avertissement sauf s'ils sont ignorés. |
| `Cylindered:loadDependentWheels(xmlFile: XMLFile, baseName: string, entry: table)` | 2916 | ✍ Si le véhicule a la spécialisation Wheels, résout les roues listées par index ou par nom de nœud pour que leurs formes suivent la pièce. Une roue inconnue donne un avertissement. |
| `Cylindered:loadDependentTranslatingParts(xmlFile: XMLFile, baseName: string, entry: table)` | 2952 | ✍ Lit les entrées translatingPart d'une moving part avec points de référence : position de départ, distance de référence, limites Z et partage ou non de la distance entre pièces (diviseur compté). |
| `Cylindered:loadExtraDependentParts(xmlFile: any, baseName: any, entry: any)` | 3011 | ✍ Point d'extension vide appelé pendant le chargement d'un outil ou d'une pièce ; renvoie vrai. Prévu pour être surchargé par d'autres spécialisations. |
| `Cylindered:loadDependentAnimations(xmlFile: any, baseName: any, entry: any)` | 3017 | ✍ Lit les entrées dependentAnimation (nom, axe de translation ou de rotation, pièce coulissante optionnelle, plage de valeurs convertie en radians pour la rotation, drapeau d'inversion) d'une entrée. |
| `Cylindered:loadCopyLocalDirectionParts(xmlFile: XMLFile, baseName: string, entry: table)` | 3065 | ✍ Lit les entrées copyLocalDirectionPart dont l'orientation copie la direction et le vecteur haut de la pièce avec une échelle par axe. Les entrées sans dirScale ou upScale sont ignorées avec un avertissement. |
| `Cylindered:loadRotationBasedLimits(xmlFile: any, key: any, tool: any)` | 3097 | ✍ Construit un point clé (rotation, rotation et translation min/max, normalisé sur la plage de l'outil s'il en a une) pour une courbe de limites selon la rotation. Renvoie nil si la rotation ou toutes les limites manquent. |
| `Cylindered:loadActionSoundsFromXML(xmlFile: any, key: any)` | 3119 | ✍ Charge les sons actionSound et associe chaque nœud et chaque nom SOUND_ACTION_* à la liste de sons, en la rattachant à la moving part, la pièce coulissante ou le tool correspondant. Les actions ou nœuds inconnus donnent un avertissement. |
| `Cylindered:checkMovingPartDirtyUpdateNode(node: any, movingPart: any)` | 3189 | ✍ Point d'extension vide utilisé dans les versions de développement pour vérifier les nœuds sous des moving parts à distance limitée ; le corps est vide dans ce dump. |
| `Cylindered:setMovingToolDirty(node: integer, forceUpdate: boolean, dt: number)` | 3197 | ✍ À appeler quand un changement extérieur (animation par exemple) a déplacé le nœud d'un outil : rafraîchit la position en cache, joue les sons, marque l'outil dirty, synchronise les interpolateurs client et met à jour les pièces immédiatement si demandé. |
| `Cylindered:setMovingPartReferenceNode(movingPartNode: integer, referenceNode: integer, isActiveDirty: any)` | 3242 | ✍ Remplace le point de référence d'une moving part (nil rétablit celui du XML) et change éventuellement son état dirty permanent, en gérant les transitions de direction lissées. Met la pièce à jour immédiatement et propage aux dépendants qui partagent la référence d'origine. |
| `Cylindered:updateMovingPartByNode(movingPartNode: any, dt: any)` | 3303 | ✍ Recalcule immédiatement la moving part enregistrée pour le nœud, avec ses pièces dépendantes, extras et animations ; sans effet si le nœud est inconnu. |
| `Cylindered:updateCylinderedInitial(placeComponents: boolean, keepDirty: any)` | 3316 | ✍ Passe initiale complète sur les outils et les pièces (roues, joints de composants côté serveur, extras, animations), en plaçant les composants sauf indication contraire. keepDirty laisse les drapeaux dirty levés. |
| `Cylindered:allowLoadMovingToolStates(superFunc: any) → boolean` | 3362 | ✍ Renvoie toujours vrai ici ; interrupteur surchargeable qui autorise le chargement des états sauvegardés des moving tools et leur envoi aux clients entrants. |
| `Cylindered:getMovingToolByNode(node: any)` | 3368 | ✍ Renvoie le moving tool enregistré pour le nœud, ou nil. |
| `Cylindered:getMovingPartByNode(node: any)` | 3374 | ✍ Renvoie la moving part enregistrée pour le nœud, ou nil. |
| `Cylindered:getTranslatingPartByNode(node: any)` | 3380 | ✍ Parcourt toutes les moving parts à la recherche d'une pièce coulissante utilisant ce nœud et la renvoie, ou nil. |
| `Cylindered:getIsMovingToolActive(movingTool: any)` | 3398 | ✍ Renvoie vrai si l'outil est activé et si sa configuration requise est installée. |
| `Cylindered:getIsMovingPartActive(movingPart: any)` | 3404 | ✍ Renvoie le drapeau actif de la pièce (modifié par les object changes). |
| `Cylindered:getMovingToolMoveValue(movingTool: any)` | 3410 | ✍ Renvoie l'entrée totale de l'outil : entrée du joueur plus déplacement externe (par exemple d'un outil pilote). |
| `Cylindered:isDetachAllowed(superFunc: function) → boolean, string?` | 3419 | ✍ Surcharge : renvoie faux si un outil avec limites de dételage est hors de sa plage de rotation ou de translation autorisée ; sinon délègue à l'implémentation parente. |
| `Cylindered:loadObjectChangeValuesFromXML(superFunc: XMLFile, xmlFile: XMLFile, key: string, node: integer, object: table)` | 3452 | ✍ Surcharge : après le parent, lit les limites et valeurs de départ d'un moving tool par état pour le nœud, ainsi qu'un interrupteur movingPartUpdate qui règle le drapeau actif de la moving part. |
| `Cylindered:setObjectChangeValues(superFunc: table, object: table, isActive: boolean)` | 3491 | ✍ Surcharge : après le parent, applique les limites et valeurs de départ de rotation et translation (état actif ou inactif) au tool du nœud d'object change. |
| `Cylindered:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 3520 | ✍ Surcharge : si le parent réussit, lit un bloc optionnel movingToolActivation (nœud, inversion, facteur et décalage d'ouverture) sur le nœud de vidange. |
| `Cylindered:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 3541 | ✍ Surcharge : module la vitesse de vidange selon l'ouverture du moving tool lié (état, inversion, décalage et facteur d'ouverture) ; sans données d'activation, la valeur parente est utilisée. |
| `Cylindered:loadShovelNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 3565 | ✍ Surcharge : si le parent réussit, lit un bloc optionnel movingToolActivation (nœud, inversion, facteur d'ouverture) pour le nœud de pelle. |
| `Cylindered:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 3585 | ✍ Surcharge : un nœud de pelle n'est actif que si le parent le dit et si l'état du moving tool lié dépasse le facteur d'ouverture (après inversion éventuelle). |
| `Cylindered:loadDynamicMountGrabFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 3605 | ✍ Surcharge : si le parent réussit, lit un bloc optionnel movingToolActivation pour une pince de montage dynamique. |
| `Cylindered:getIsDynamicMountGrabOpened(superFunc: any, grab: any)` | 3625 | ✍ Surcharge : la pince n'est ouverte que si le parent le dit et si l'état du moving tool lié dépasse le facteur d'ouverture (après inversion éventuelle). |
| `Cylindered:setComponentJointFrame(superFunc: any, jointDesc: any, anchorActor: any)` | 3645 | ✍ Surcharge : après le parent, recalcule les décalages de composants stockés pour les joints de chaque outil. À noter : elle lit la liste componentJoints des outils, créée seulement sur le serveur ; usage serveur présumé (NON VÉRIFIÉ). |
| `Cylindered:getAdditionalSchemaText(superFunc: any)` | 3669 | ✍ Surcharge : côté client, lorsque le véhicule est actif pour les entrées et que plusieurs groupes de contrôle existent, renvoie le numéro du groupe courant comme texte de schéma. |
| `Cylindered:getWearMultiplier(superFunc: any) → number` | 3686 | ✍ Surcharge : ajoute le multiplicateur d'usure de travail tant que le son hydraulique joue, si bien que bouger les bras use le véhicule. |
| `Cylindered:getDoConsumePtoPower(superFunc: any) → boolean` | 3700 | ✍ Surcharge : renvoie aussi vrai tant que le minuteur de consommation de puissance des moving tools est en cours. |
| `Cylindered:getConsumingLoad(superFunc: any)` | 3706 | ✍ Surcharge : ajoute un consommateur à la somme de charge, pondéré par le minuteur de consommation restant par rapport à son délai. |
| `Cylindered:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 3716 | ✍ Côté client : enregistre une action d'axe pour chaque outil pilotable du groupe de contrôle sélectionné, avec ou sans exigence de puissance, selon la commande de bras et selon que l'outil est une cible de cette commande. |
| `Cylindered:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 3749 | ✍ Après l'attelage du véhicule, borne la translation et la rotation de chaque outil à ses limites d'attelage si elles sont définies, et marque dirty les outils modifiés. |
| `Cylindered:onSelect(subSelectionIndex: any)` | 3796 | ✍ Définit le groupe de contrôle courant à partir de l'index de sous-sélection choisi (0 s'il n'a pas de groupe associé). |
| `Cylindered:onUnselect()` | 3808 | ✍ Remet le groupe de contrôle courant à 0. |
| `Cylindered:onDeactivate()` | 3815 | ✍ Sur les clients, arrête le son hydraulique et remet à zéro l'entrée et le déplacement externe de chaque outil. |
| `Cylindered:onAnimationPartChanged(node: any)` | 3831 | ✍ Réagit à une animation qui modifie un nœud en appelant setMovingToolDirty pour celui-ci. |
| `Cylindered:onAIImplementStart()` | 3837 | ✍ Au démarrage du travail de l'IA, fait aller chaque outil ayant une aiActivePosition vers cette position (cible et direction). |
| `Cylindered:onVehicleSettingChanged(gameSettingId: any, state: any)` | 3849 | ✍ Réagit au réglage EASY_ARM_CONTROL en appelant setIsEasyControlActive avec le nouvel état. |
| `Cylindered:onRegisterAnimationValueTypes()` | 3857 | ✍ Enregistre le type de valeur d'animation "movingPartReferencePoint", qui fait glisser le point de référence d'une moving part entre un nœud de début et de fin pendant l'animation, via un groupe de transformation auxiliaire. |
| `Cylindered.setToolTranslation(self: table, tool: table, transSpeed: number, dt: number, delta: any) → boolean` | 3919 | ✍ Déplace l'outil le long de son axe de translation selon vitesse fois dt ou un delta, borné par ses limites. Met à jour les sons, déclenche onMovingToolChanged et renvoie vrai si le déplacement dépasse 0,0001. Appelée avec un point, véhicule en premier argument. |
| `Cylindered.setAbsoluteToolTranslation(self: table, tool: table, translation: number)` | 3960 | ✍ Place l'outil à une translation absolue ; en cas de changement, le marque dirty et lève les drapeaux dirty réseau. |
| `Cylindered.setToolRotation(self: table, tool: table, rotSpeed: number, dt: number, delta: number) → boolean` | 3978 | ✍ Fait tourner l'outil sur son axe de rotation selon vitesse fois dt ou un delta, borné par ses limites (ramené à 0..2 pi si illimité). Met à jour les sons, déclenche onMovingToolChanged et renvoie vrai si le changement dépasse 0,0001. |
| `Cylindered.setAbsoluteToolRotation(self: table, tool: table, rotation: number, updateDelayedNodes: boolean)` | 4032 | ✍ Fait tourner l'outil à un angle absolu ; en cas de changement, le marque dirty, met à jour le nœud retardé si demandé et lève les drapeaux dirty réseau. |
| `Cylindered.setToolAnimation(self: table, tool: table, animSpeed: number, dt: number) → boolean` | 4053 | ✍ Fait avancer le temps d'animation de l'outil selon vitesse fois dt dans ses bornes min/max, en détectant les changements externes pour la réinitialisation réseau. Met à jour les sons, déclenche onMovingToolChanged et renvoie vrai en cas de changement. |
| `Cylindered.getMovingToolState(self: table, tool: table) → number` | 4091 | ✍ Renvoie la position de l'outil en fraction 0..1 de sa plage de rotation ou de translation, la valeur brute si illimité, ou le temps d'animation pour les outils d'animation. |
| `Cylindered.setDirty(self: table, part: table)` | 4111 | ✍ Marque une pièce ou un outil dirty (une seule fois, ou toujours pendant le chargement), propage aux pièces dépendantes dans leur distance de mise à jour, met à jour attaches et roues pour les outils et applique les données retardées. |
| `Cylindered.updateWheels(self: table, part: table)` | 4138 | ✍ Rafraîchit la position de la forme physique des roues liées à une pièce, ainsi que leurs cales. |
| `Cylindered.updateMovingPart(self: table, part: table, placeComponents: boolean?, updateDependentParts: boolean?, isActive: boolean?, updateSounds: any)` | 4156 | ✍ Cœur du calcul d'une moving part : détermine la direction (point de référence, intersections de cercles, alignements sur ligne, axe Y monde, copie de rotation), l'applique avec seuils et lissage, déplace les pièces coulissantes, copie les directions, met à jour joints et roues côté serveur et descend dans les dépendants. |
| `Cylindered.updateComponentJoints(self: table, entry: table, placeComponents: boolean)` | 4675 | ✍ Serveur uniquement : pour chaque joint de l'entrée, replace éventuellement le second composant par rapport au nœud du joint, puis rafraîchit le repère du joint via setComponentJointFrame. |
| `Cylindered.updateAttacherJoints(self: table, entry: table)` | 4704 | ✍ Serveur uniquement : réapplique les repères des attaches listées et, si demandé, recalcule le repère de l'attache d'entrée du véhicule attelé à un parent, en tenant compte des décalages du joint. |
| `Cylindered.limitInterpolator(first: any, second: any, alpha: any)` | 4758 | ✍ Fonction d'interpolation des courbes de limites selon la rotation, qui mélange rotMin, rotMax, transMin et transMax de deux points clés. À noter : la branche transMin lit first.minTrans, champ jamais défini (les points clés utilisent transMin), ce qui provoquerait une erreur arithmétique sur nil si elle était atteinte. |
| `Cylindered.updateRotationBasedLimits(self: any, tool: any, dependentTool: any)` | 4784 | ✍ Évalue la courbe de limites selon la rotation à partir de l'état de l'outil pilote ou de la rotation du nœud et applique les min/max à l'outil dépendant. Le serveur borne et synchronise ; le client met seulement à jour les limites de l'interpolateur. |
| `Cylindered.actionEventInput(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 4836 | ✍ Callback d'entrée pour l'axe d'un outil : applique l'inversion, le réglage de sensibilité des bras et la mise à l'échelle de la souris, arbitre entre axes de souris simultanés (y compris les outils attelés) et règle tool.move ; lève le drapeau dirty d'entrée pour envoyer la valeur au serveur. |
| `Cylindered.getMovingToolDashboardState(self: any, dashboard: any)` | 4915 | ✍ Callback de valeur de tableau de bord : trouve le véhicule (lui-même ou l'outil sur les attaches configurées) et renvoie l'entrée lissée du moving tool correspondant à l'axe du tableau de bord, ramenée à 0..1 ; 0,5 au repos ou sans correspondance. |
| `Cylindered.movingToolDashboardAttributes(self: any, xmlFile: any, key: any, dashboard: any, components: any, i3dMappings: any)` | 4971 | ✍ Lit les attributs XML de tableau de bord axis (obligatoire), attacherJointIndex, attacherJointNode et attacherJointNodes. Renvoie faux avec un avertissement si l'axe manque. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onMovingToolChanged` | 392 |
| registerFunction | `loadMovingPartsFromXML` | 398 |
| registerFunction | `loadMovingPartFromXML` | 399 |
| registerFunction | `loadMovingToolsFromXML` | 400 |
| registerFunction | `loadMovingToolFromXML` | 401 |
| registerFunction | `loadDependentMovingTools` | 402 |
| registerFunction | `loadEasyArmControlFromXML` | 403 |
| registerFunction | `loadDependentParts` | 404 |
| registerFunction | `resolveDependentPartData` | 405 |
| registerFunction | `loadDependentComponentJoints` | 406 |
| registerFunction | `loadDependentAttacherJoints` | 407 |
| registerFunction | `loadDependentWheels` | 408 |
| registerFunction | `loadDependentTranslatingParts` | 409 |
| registerFunction | `loadExtraDependentParts` | 410 |
| registerFunction | `loadDependentAnimations` | 411 |
| registerFunction | `loadCopyLocalDirectionParts` | 412 |
| registerFunction | `loadRotationBasedLimits` | 413 |
| registerFunction | `loadActionSoundsFromXML` | 414 |
| registerFunction | `checkMovingPartDirtyUpdateNode` | 415 |
| registerFunction | `updateDirtyMovingParts` | 416 |
| registerFunction | `setMovingToolDirty` | 417 |
| registerFunction | `setMovingPartReferenceNode` | 418 |
| registerFunction | `updateMovingPartByNode` | 419 |
| registerFunction | `updateCylinderedInitial` | 420 |
| registerFunction | `allowLoadMovingToolStates` | 421 |
| registerFunction | `getMovingToolByNode` | 422 |
| registerFunction | `getMovingPartByNode` | 423 |
| registerFunction | `getTranslatingPartByNode` | 424 |
| registerFunction | `getIsMovingToolActive` | 425 |
| registerFunction | `getIsMovingPartActive` | 426 |
| registerFunction | `getMovingToolMoveValue` | 427 |
| registerFunction | `setDelayedData` | 428 |
| registerFunction | `updateDelayedTool` | 429 |
| registerFunction | `updateEasyControl` | 430 |
| registerFunction | `setIsEasyControlActive` | 431 |
| registerFunction | `setEasyControlForcedTransMove` | 432 |
| registerFunction | `updateExtraDependentParts` | 433 |
| registerFunction | `updateDependentAnimations` | 434 |
| registerFunction | `updateDependentToolLimits` | 435 |
| registerFunction | `onMovingPartSoundEvent` | 436 |
| registerFunction | `updateMovingToolSoundEvents` | 437 |
| registerFunction | `updateControlGroups` | 438 |
| registerOverwrittenFunction | `isDetachAllowed` | 444 |
| registerOverwrittenFunction | `loadObjectChangeValuesFromXML` | 445 |
| registerOverwrittenFunction | `setObjectChangeValues` | 446 |
| registerOverwrittenFunction | `loadDischargeNode` | 447 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 448 |
| registerOverwrittenFunction | `loadShovelNode` | 449 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 450 |
| registerOverwrittenFunction | `loadDynamicMountGrabFromXML` | 451 |
| registerOverwrittenFunction | `getIsDynamicMountGrabOpened` | 452 |
| registerOverwrittenFunction | `setComponentJointFrame` | 453 |
| registerOverwrittenFunction | `getAdditionalSchemaText` | 454 |
| registerOverwrittenFunction | `getWearMultiplier` | 455 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 456 |
| registerOverwrittenFunction | `getConsumingLoad` | 457 |
| registerEventListener | `onLoad` | 463 |
| registerEventListener | `onPostLoad` | 464 |
| registerEventListener | `onLoadFinished` | 465 |
| registerEventListener | `onRegisterDashboardValueTypes` | 466 |
| registerEventListener | `onDelete` | 467 |
| registerEventListener | `onReadStream` | 468 |
| registerEventListener | `onWriteStream` | 469 |
| registerEventListener | `onReadUpdateStream` | 470 |
| registerEventListener | `onWriteUpdateStream` | 471 |
| registerEventListener | `onUpdate` | 472 |
| registerEventListener | `onUpdateTick` | 473 |
| registerEventListener | `onUpdateEnd` | 474 |
| registerEventListener | `onPostUpdate` | 475 |
| registerEventListener | `onPostUpdateTick` | 476 |
| registerEventListener | `onDraw` | 477 |
| registerEventListener | `onRegisterActionEvents` | 478 |
| registerEventListener | `onPostAttach` | 479 |
| registerEventListener | `onSelect` | 480 |
| registerEventListener | `onUnselect` | 481 |
| registerEventListener | `onDeactivate` | 482 |
| registerEventListener | `onAnimationPartChanged` | 483 |
| registerEventListener | `onAIImplementStart` | 484 |
| registerEventListener | `onVehicleSettingChanged` | 485 |
| registerEventListener | `onRegisterAnimationValueTypes` | 486 |
