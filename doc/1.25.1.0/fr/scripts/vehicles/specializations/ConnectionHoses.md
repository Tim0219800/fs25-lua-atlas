# vehicles/specializations/ConnectionHoses.lua

*[English version](../../../../scripts/vehicles/specializations/ConnectionHoses.md)*

Source: `dataS/scripts/vehicles/specializations/ConnectionHoses.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule (sans prérequis) qui dessine des flexibles de raccordement souples entre un tracteur et un outil attelé, via une spline pilotée par shader sur un maillage fourni par `g_connectionHoseManager`. Elle gère les nœuds de flexible et de cible, les nœuds de saut qui font passer un flexible à travers un outil intermédiaire, les flexibles de liaison outil-outil à montage différé, et les flexibles personnalisés qui déplacent simplement un nœud sur une cible. Les flexibles se connectent à l'attelage et se déconnectent au dételage, ne sont mis à jour que dans `maxUpdateDistance`, et jouent des sons de connexion et de déconnexion. Purement visuel et local : aucun flux réseau ici. Certains éléments référencés (`ConnectionHoses.DEFAULT_MAX_UPDATE_DISTANCE`, `registerAdditionalToolConnectionHoses`, la classe du gestionnaire) sont absents du dump et NON VÉRIFIÉS.

- **ConnectionHoses** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConnectionHoses.prerequisitesPresent(specializations: any)` | 19 | ✍ Renvoie toujours vrai : la spécialisation n'a aucun prérequis. |
| `ConnectionHoses.initSpecialization()` | 25 | ✍ Enregistre le schéma XML : `vehicle.connectionHoses#maxUpdateDistance`, les chemins de flexibles (aussi par configuration), les sons de connexion et déconnexion, et les attributs supplémentaires d'outils et de pièces mobiles indiquant les flexibles à mettre à jour. |
| `ConnectionHoses.registerConnectionHoseXMLPaths(schema: any, basePath: any)` | 57 | ✍ Enregistre tous les chemins XML liés aux flexibles sous un chemin de base : nœuds de saut, cibles, flexibles de liaison d'outils, flexibles, flexibles locaux, flexibles et cibles personnalisés. |
| `ConnectionHoses.registerHoseTargetNodesXMLPaths(schema: XMLSchema, basePath: string)` | 90 | ✍ Enregistre les attributs XML d'un nœud cible de flexible : nœud, indices ou nœuds d'attelage, type, redressement, prise et type d'adaptateur, ainsi que les changements d'objets. |
| `ConnectionHoses.registerHoseNodesXMLPaths(schema: any, basePath: any)` | 111 | ✍ Enregistre les attributs XML d'un flexible : attelages d'entrée, type, longueur, diamètre, amortissement, affaissement et limites du point central, matériaux, adaptateurs et prise, ainsi que les changements d'objets. |
| `ConnectionHoses.registerCustomHoseNodesXMLPaths(schema: any, basePath: any)` | 149 | ✍ Enregistre les attributs XML d'un flexible personnalisé : nœud, type libre, indices ou nœuds d'attelage d'entrée et de sortie, indicateur de mise à jour permanente et changements d'objets. |
| `ConnectionHoses.registerCustomHoseTargetNodesXMLPaths(schema: any, basePath: any)` | 163 | ✍ Enregistre les attributs XML d'une cible de flexible personnalisé : nœud, type, indices ou nœuds d'attelage d'entrée et de sortie, ainsi que les changements d'objets. |
| `ConnectionHoses.registerFunctions(vehicleType: any)` | 176 | ✍ Enregistre une trentaine de fonctions de véhicule couvrant le chargement, la recherche de cibles, la connexion et la déconnexion, les liaisons d'outils, les nœuds de saut, les flexibles personnalisés et `setConnectionHosesActive`. |
| `ConnectionHoses.registerOverwrittenFunctions(vehicleType: any)` | 212 | ✍ Surcharge `loadExtraDependentParts` et `updateExtraDependentParts` pour que les pièces mobiles puissent rafraîchir flexibles et cibles personnalisés ainsi que flexibles locaux. |
| `ConnectionHoses.registerEventListeners(vehicleType: any)` | 219 | ✍ S'abonne à onPreLoad, onPostLoad, onLoadFinished, onDelete, onUpdateInterpolation, onUpdateEnd, onPostAttach et onPreDetach. |
| `ConnectionHoses:onPreLoad(savegame: any)` | 232 | ✍ Initialise les tables de la spécialisation (flexibles, cibles, nœuds de saut, flexibles personnalisés, liaisons d'outils), lit l'index de configuration et `maxUpdateDistance`. |
| `ConnectionHoses:onPostLoad(savegame: any)` | 272 | ✍ Charge les flexibles depuis la clé de base et la configuration choisie, puis appelle `registerAdditionalToolConnectionHoses` (NON VÉRIFIÉ, absent du dump). Charge les sons de connexion et déconnexion côté client et retire l'écouteur d'interpolation s'il n'y a rien à mettre à jour. |
| `ConnectionHoses:onLoadFinished(savegame: any)` | 341 | ✍ Connecte chaque flexible local (flexible et cible sur le même véhicule) sans vérification de liaison d'outil. |
| `ConnectionHoses:onDelete()` | 352 | ✍ Libère les fichiers i3d partagés supplémentaires, supprime les montures de flexibles de liaison d'outils et supprime les échantillons sonores de connexion et déconnexion. |
| `ConnectionHoses:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 380 | ✍ Dans `maxUpdateDistance`, met à jour les flexibles actifs et les flexibles personnalisés à mise à jour permanente dont le partenaire est dans la même boucle de mise à jour, puis demande aux outils attelés de mettre à jour leurs flexibles vers ce véhicule. |
| `ConnectionHoses:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 412 | ✍ Exécute une dernière mise à jour des flexibles via `onUpdateInterpolation` avant la mise en veille de la physique, lorsque la distance de mise à jour vaut 0. |
| `ConnectionHoses:getConnectionHoseConfigIndex()` | 419 | ✍ Renvoie l'index de configuration des flexibles ; la valeur par défaut ici est 1. Prévu pour être surchargé par d'autres spécialisations. |
| `ConnectionHoses:updateAttachedConnectionHoses(attacherVehicle: any)` | 425 | ✍ Appelée par le véhicule porteur. Met à jour les flexibles de ce véhicule et les flexibles personnalisés permanents connectés à ce véhicule porteur. |
| `ConnectionHoses:updateConnectionHose(hose: any, index: any)` | 449 | ✍ Calcule les points de contrôle de la spline d'un flexible (affaissement selon le mou, limites d'angle, bornes de décalage, amortissement lissé par la vitesse) et les écrit dans les paramètres de shader cv2, cv3 et cv4. Dessine aussi des lignes de débogage en mode débogage des attelages. |
| `ConnectionHoses:getCenterPointAngle(node: any, cX: any, cY: any, cZ: any, eX: any, eY: any, eZ: any, useWorldSpace: any)` | 635 | ✍ Renvoie les deux angles, en radians, au point central du flexible entre la verticale et chaque moitié du flexible. Leur somme est comparée à l'angle minimal. |
| `ConnectionHoses:getCenterPointAngleRegulation(node: any, cX: any, cY: any, cZ: any, eX: any, eY: any, eZ: any, angle1: any, angle2: any, targetAngle: any, useWorldSpace: any)` | 658 | ✍ Renvoie un point central corrigé (en coordonnées locales du nœud), abaissé pour que le flexible atteigne l'angle central minimal, en répartissant l'angle proportionnellement aux deux angles mesurés. |
| `ConnectionHoses:loadConnectionHosesFromXML(xmlFile: any, key: any)` | 688 | ✍ Charge nœuds de saut, cibles, flexibles de liaison d'outils, flexibles, flexibles locaux, flexibles et cibles personnalisés depuis une clé et les range dans les tables de la spécialisation, indexés par type et attelage d'entrée. |
| `ConnectionHoses:loadHoseSkipNode(xmlFile: any, targetKey: any, entry: any)` | 750 | ✍ Charge un nœud de saut dans `entry` (nœud, indices d'attelage, type, longueur, changements d'objets). Renvoie faux avec un avertissement si le nœud ou le type manque. |
| `ConnectionHoses:loadToolConnectorHoseNode(xmlFile: any, targetKey: any, entry: any)` | 784 | ✍ Charge un flexible de liaison d'outils avec ses cibles de départ et d'arrivée, réoriente éventuellement les deux nœuds l'un vers l'autre, masque le nœud de montage et compte les liaisons par type. Renvoie faux si une cible manque. |
| `ConnectionHoses:addHoseTargetNodes(xmlFile: any, key: any)` | 853 | ✍ Charge toutes les cibles sous une clé dans la spécialisation et les indexe par type. Renvoie l'index de la dernière cible ajoutée, ou nil si aucune. |
| `ConnectionHoses:loadCustomHosesFromXML(isHose: any, targetTable: any, attacherJointMapping: any, inputAttacherJointMapping: any, xmlFile: any, key: any)` | 882 | ✍ Charge des flexibles ou cibles personnalisés, résout les indices d'attelage à partir des indices et des nœuds, et les enregistre par attelage et attelage d'entrée. Les entrées sans nœud, type ou attelage sont rejetées avec un avertissement. |
| `ConnectionHoses:loadHoseTargetNode(xmlFile: any, targetKey: any, entry: any)` | 983 | ✍ Charge une cible de flexible dans `entry` (nœud, attelages, type, redressement, prise optionnelle, nom d'adaptateur, changements d'objets). Renvoie faux si le nœud ou le type manque. |
| `ConnectionHoses:loadHoseNode(xmlFile: any, hoseKey: any, entry: any, isBaseHose: any)` | 1047 | ✍ Charge un flexible dans `entry` : attelages, type, géométrie, amortissement et limites, matériaux et adaptateurs. Clone le maillage depuis le gestionnaire et le masque. Renvoie faux si le type, le nœud ou le maillage est introuvable. |
| `ConnectionHoses:getClonedSkipHoseNode(sourceHose: any, skipNode: any)` | 1221 | ✍ Construit une copie d'un flexible source placée sur un nœud de saut, avec la longueur du nœud de saut si elle est définie. Renvoie la table du nouveau flexible, ou faux (avec avertissement) si aucun maillage ne correspond. |
| `ConnectionHoses:getConnectionTarget(attacherJointIndex: any, type: any, specType: any, excludeToolConnections: any)` | 1275 | ✍ Trouve la première cible libre pour un attelage, un type et un sous-type, puis se rabat sur un nœud de saut disponible. Renvoie le nœud et un booléen indiquant s'il s'agit d'un nœud de saut, ou nil. |
| `ConnectionHoses:iterateConnectionTargets(func: any, attacherJointIndex: any, type: any, specType: any, excludeToolConnections: any)` | 1317 | ✍ Même recherche que `getConnectionTarget`, mais appelle un rappel pour chaque cible libre et nœud de saut jusqu'à ce que le rappel renvoie faux. À noter : elle sort prématurément avec nil si une cible de liaison d'outil est exclue. |
| `ConnectionHoses:getIsConnectionTargetUsed(desc: any)` | 1363 | ✍ Renvoie vrai si la cible a déjà un objet connecté. |
| `ConnectionHoses:getIsConnectionHoseUsed(desc: any)` | 1369 | ✍ Renvoie vrai si le flexible a déjà un objet connecté. |
| `ConnectionHoses:getIsSkipNodeAvailable(skipNode: any)` | 1375 | ✍ Renvoie vrai si le véhicule est attelé sur l'attelage d'entrée du nœud de saut, que le véhicule porteur a une cible libre correspondante et que le nœud de saut n'a pas encore de flexible parent. |
| `ConnectionHoses:getConnectionHosesByInputAttacherJoint(inputJointDescIndex: any)` | 1395 | ✍ Renvoie la liste des flexibles liés à un indice d'attelage d'entrée, ou une table vide. |
| `ConnectionHoses:connectHose(sourceHose: any, targetObject: any, targetHose: any, updateToolConnections: any)` | 1407 | ✍ Connecte un flexible source à un flexible ou nœud cible : établit les liens, clone l'adaptateur, affiche le flexible, applique redressement et changements d'objets, ouvre les prises, met à jour la spline et joue le son de connexion. Les liaisons d'outils peuvent différer le montage. Renvoie vrai si connecté. |
| `ConnectionHoses:disconnectHose(hose: any)` | 1498 | ✍ Déconnecte un flexible, de façon récursive à travers les chaînes de nœuds de saut, retire son adaptateur, le masque, annule les changements d'objets, ferme les prises, le retire de la liste de mise à jour et joue le son de déconnexion. |
| `ConnectionHoses:updateToolConnectionHose(sourceObject: any, sourceHose: any, targetObject: any, targetHose: any, visibility: any)` | 1558 | ✍ Gère le flexible entre deux cibles d'outils. Avec visibilité vraie et un montage différé en attente, construit les maillages de liaison, affiche le nœud de montage et connecte le flexible différé. Avec faux, les démonte. Renvoie vrai si une connexion a été faite ou s'il n'existe pas de liaison d'outil. |
| `ConnectionHoses:addHoseToDelayedMountings(sourceObject: any, sourceHose: any, targetObject: any, targetHose: any)` | 1752 | ✍ Mémorise un flexible comme montage différé d'une liaison d'outil, à connecter quand l'autre extrémité sera attelée. S'il s'agit du premier, demande au véhicule racine de retenter les connexions par nœuds de saut. |
| `ConnectionHoses:connectHoseToSkipNode(sourceHose: any, targetObject: any, skipNode: any, childHose: any, childVehicle: any)` | 1768 | ✍ Connecte un flexible à un nœud de saut et, si le porteur est lui-même attelé plus haut, crée le flexible de saut cloné vers le véhicule suivant (liens parent et enfant, nœuds lavables). Ajoute le flexible à la liste de mise à jour et renvoie vrai. |
| `ConnectionHoses:connectHosesToAttacherVehicle(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any, updateToolConnections: any, excludeVehicle: any)` | 1843 | ✍ Pour chaque flexible de l'attelage d'entrée, trouve une cible libre ou un nœud de saut correspondant sur le véhicule porteur et le connecte, puis retente les connexions des autres outils attelés. |
| `ConnectionHoses:retryHoseSkipNodeConnections(updateToolConnections: any, excludeVehicle: any)` | 1874 | ✍ Demande à tous les outils attelés (sauf un véhicule exclu) de retenter la connexion de leurs flexibles, car un nouveau nœud de saut peut désormais la rendre possible. |
| `ConnectionHoses:connectCustomHosesToAttacherVehicle(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 1890 | ✍ Apparie les flexibles personnalisés inactifs avec les cibles personnalisées inactives du véhicule porteur (dans les deux sens) lorsque type et sous-type correspondent, et connecte chaque paire. |
| `ConnectionHoses:connectCustomHoseNode(customHose: any, customTarget: any, targetObject: any)` | 1941 | ✍ Déplace le nœud du flexible personnalisé sur sa cible, marque les deux comme actifs et liés, applique les changements d'objets et signale l'outil mobile comme modifié. |
| `ConnectionHoses:updateCustomHoseNode(customHose: any, customTarget: any)` | 1962 | ✍ Copie la position et la rotation du nœud cible, exprimées dans l'espace du parent du nœud de flexible, sur le nœud de flexible personnalisé et signale l'outil mobile comme modifié. |
| `ConnectionHoses:disconnectCustomHoseNode(customHose: any, customTarget: any)` | 1973 | ✍ Restaure la translation et la rotation initiales du nœud de flexible personnalisé, efface les liens des deux côtés et annule les changements d'objets. |
| `ConnectionHoses:setConnectionHosesActive(connectionHosesActive: any)` | 1995 | ✍ Active ou désactive les flexibles. Quand l'indicateur change sur un outil attelé, il connecte les flexibles (normaux et personnalisés) ou exécute la logique de dételage pour les déconnecter. |
| `ConnectionHoses:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 2018 | ✍ Surcharge. Après le succès du parent, lit les listes optionnelles d'indices de flexibles personnalisés, de cibles personnalisées et de flexibles locaux qu'une pièce mobile doit mettre à jour. |
| `ConnectionHoses:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 2043 | ✍ Surcharge. Après le parent, rafraîchit les flexibles personnalisés actifs, cibles personnalisées et flexibles locaux listés pour la pièce mobile. |
| `ConnectionHoses:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 2082 | ✍ Après l'attelage, connecte les flexibles et flexibles personnalisés au véhicule porteur si les flexibles sont actifs. |
| `ConnectionHoses:onPreDetach(attacherVehicle: any, implement: any)` | 2091 | ✍ Avant le dételage, déconnecte tous les flexibles de l'attelage d'entrée actif et du véhicule porteur, efface les montages différés en attente sur ses liaisons d'outils et déconnecte les flexibles et cibles personnalisés. |
| `ConnectionHoses.consoleCommandTestSockets(vehicle: any, attacherJointIndex: any)` | 2279 | ✍ Aide de débogage pour la console. Affiche prises, adaptateurs, lignes colorées et étiquettes pour chaque cible de l'attelage donné et applique ses changements d'objets, après avoir effacé les éléments de débogage précédents. |
| `ConnectionHoses.consoleCommandTestToolConnection(vehicle: any, toolConnectionIndex: any)` | 2369 | ✍ Aide de débogage pour la console. Efface les éléments de débogage précédents, puis pour le flexible de liaison d'outil choisi affiche lignes colorées et étiquettes des cibles de départ et d'arrivée, rend visible le nœud de montage et applique ses changements d'objets. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getConnectionHoseConfigIndex` | 177 |
| registerFunction | `updateAttachedConnectionHoses` | 178 |
| registerFunction | `updateConnectionHose` | 179 |
| registerFunction | `getCenterPointAngle` | 180 |
| registerFunction | `getCenterPointAngleRegulation` | 181 |
| registerFunction | `loadConnectionHosesFromXML` | 182 |
| registerFunction | `loadHoseSkipNode` | 183 |
| registerFunction | `loadToolConnectorHoseNode` | 184 |
| registerFunction | `addHoseTargetNodes` | 185 |
| registerFunction | `loadCustomHosesFromXML` | 186 |
| registerFunction | `loadHoseTargetNode` | 187 |
| registerFunction | `loadHoseNode` | 188 |
| registerFunction | `getClonedSkipHoseNode` | 189 |
| registerFunction | `getConnectionTarget` | 190 |
| registerFunction | `iterateConnectionTargets` | 191 |
| registerFunction | `getIsConnectionTargetUsed` | 192 |
| registerFunction | `getIsConnectionHoseUsed` | 193 |
| registerFunction | `getIsSkipNodeAvailable` | 194 |
| registerFunction | `getConnectionHosesByInputAttacherJoint` | 195 |
| registerFunction | `connectHose` | 196 |
| registerFunction | `disconnectHose` | 197 |
| registerFunction | `updateToolConnectionHose` | 198 |
| registerFunction | `addHoseToDelayedMountings` | 199 |
| registerFunction | `connectHoseToSkipNode` | 200 |
| registerFunction | `connectHosesToAttacherVehicle` | 201 |
| registerFunction | `retryHoseSkipNodeConnections` | 202 |
| registerFunction | `connectCustomHosesToAttacherVehicle` | 203 |
| registerFunction | `connectCustomHoseNode` | 204 |
| registerFunction | `updateCustomHoseNode` | 205 |
| registerFunction | `disconnectCustomHoseNode` | 206 |
| registerFunction | `setConnectionHosesActive` | 207 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 213 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 214 |
| registerEventListener | `onPreLoad` | 220 |
| registerEventListener | `onPostLoad` | 221 |
| registerEventListener | `onLoadFinished` | 222 |
| registerEventListener | `onDelete` | 223 |
| registerEventListener | `onUpdateInterpolation` | 224 |
| registerEventListener | `onUpdateEnd` | 225 |
| registerEventListener | `onPostAttach` | 226 |
| registerEventListener | `onPreDetach` | 227 |
