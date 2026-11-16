# placeables/specializations/PlaceableFence.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableFence.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFence.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les clôtures construites par le joueur, faites de segments (x, z de début et de fin) remplis de clones de poteaux et de panneaux qui suivent la hauteur du terrain, avec des portails optionnels pilotés par AnimatedObject. Elle gère les règles d'aimantation, un segment d'aperçu, la suppression panneau par panneau, une file de reconstruction asynchrone d'un segment par image, un verrou de construction, ainsi que la sauvegarde et la synchronisation réseau des segments. Plusieurs fonctions liées aux changements de terrain (registerTerrainHeightChangeCallbacks, onTerrainDeformationSyncerUpdate) n'ont pas de corps dans le dump du SDK : NON VÉRIFIÉ.

- **PlaceableFence** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFence.prerequisitesPresent(specializations: table) → boolean` | 24 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableFence.registerEvents(placeableType: any)` | 30 | ✍ Déclare l'événement onCreateSegmentPanel, levé chaque fois qu'un panneau est construit entre deux poteaux (aperçu ou définitif). |
| `PlaceableFence.registerFunctions(placeableType: any)` | 36 | ✍ Enregistre sur le type de placeable toutes les méthodes de clôture : segments, poteaux, panneaux, portails, aperçu, noeuds de sélection, aimantation, verrou de construction et callbacks de changement de terrain. detachSourceNodes, updatePanelVisuals, getSnapAngle, registerTerrainHeightChangeCallbacks et onTerrainDeformationSyncerUpdate n'ont pas de corps dans le dump du SDK (NON VÉRIFIÉ). |
| `PlaceableFence.registerOverwrittenFunctions(placeableType: any)` | 91 | ✍ Surcharge canBeSold, collectPickObjects, getDestructionMethod, performNodeDestruction, previewNodeDestructionNodes et setOwnerFarmId sur le type de placeable. |
| `PlaceableFence.registerEventListeners(placeableType: any)` | 102 | ✍ Abonne la spécialisation aux événements de chargement, suppression, lecture/écriture de flux et mise à jour. |
| `PlaceableFence.registerXMLPaths(schema: any, basePath: any)` | 112 | ✍ Déclare le XML de clôture : groupes de variantes de poteaux et de panneaux, longueur et indicateur de longueur fixe, limites d'angle vertical, largeur de contrôle, distance/angle/distance de contrôle d'aimantation, extension seule, angle de coin maximal, aimantation parallèle, poteaux invisibles, ainsi que les portails (noeud, longueur, déclencheur, textes, durée, portes) et les chemins d'objet animé. |
| `PlaceableFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 143 | ✍ Déclare les données de sauvegarde : pour chaque segment, positions de début et de fin, visibilité du premier et du dernier poteau, index de portail et état de l'objet animé. |
| `PlaceableFence:onLoad(savegame: table)` | 157 | ✍ Lit les réglages de clôture avec valeurs par défaut (angle vertical max 35 degrés, portail 5, largeur de contrôle 0,25), collecte les variantes de poteaux et panneaux parmi les enfants de leurs noeuds et charge les portails. Se termine par detachSourceNodes (sans corps dans le dump, NON VÉRIFIÉ). |
| `PlaceableFence:onDelete()` | 273 | ✍ Nettoie : supprime les minuteurs de mise à jour en attente, se désinscrit des cellules du synchroniseur de déformation du terrain, supprime les objets animés des portails et les noeuds source détachés s'ils existent encore. |
| `PlaceableFence:onReadStream(streamId: any, connection: any)` | 316 | ✍ Connexion client : lit chaque segment (coordonnées de début et de fin, index de portail, indicateurs de premier/dernier poteau), reconstruit ses poteaux de façon synchrone, lit l'objet animé de chaque portail et enregistre les callbacks de changement de hauteur du terrain. |
| `PlaceableFence:onWriteStream(streamId: any, connection: any)` | 360 | ✍ Pendant serveur : écrit le nombre de segments et les données de chaque segment, puis l'id et l'état de l'objet animé de chaque portail, enregistré dans le flux. |
| `PlaceableFence:onUpdate(dt: any)` | 393 | ✍ À chaque mise à jour, traite la file des formes de segments via updateSegmentUpdateQueue. |
| `PlaceableFence:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 399 | ✍ Appelle le parent, puis propage le nouvel identifiant de ferme propriétaire à chaque objet animé de portail. |
| `PlaceableFence:loadFromXMLFile(xmlFile: any, key: any)` | 413 | ✍ Reconstruit la clôture depuis la sauvegarde : lit chaque segment, ignore et logue une erreur pour les positions invalides, régénère ses poteaux de façon synchrone et restaure l'état des objets animés des portails. |
| `PlaceableFence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 457 | ✍ Écrit tous les segments (début, fin, index de portail et objet animé pour les portails). Les indicateurs premier/dernier poteau ne sont écrits que s'ils sont faux, vrai étant la valeur par défaut. |
| `PlaceableFence:getPoleNear(x: any, y: any, z: any, maxDistance: any) → x, z, distance` | 559 | ✍ Cherche un poteau de clôture à moins de maxDistance d'un point par un recouvrement sphérique sur les objets statiques. Renvoie x, y, z monde du poteau, son noeud et son segment, ou nil. Les portails sont ignorés. |
| `PlaceableFence:getPoleNearOverlapCallback(hitObjectId: any)` | 578 | ✍ Callback de recouvrement de getPoleNear : retient l'impact le plus proche dont le groupe appartient à un segment de cette clôture et qui a moins de trois enfants (pour exclure les portails). Renvoie true pour poursuivre la requête. |
| `PlaceableFence:getPolePosition(node: any, allowPanel: any)` | 606 | ✍ À partir d'un noeud de collision, indique s'il appartient à un poteau de cette clôture (ou à un de ses panneaux si allowPanel) et renvoie x, y, z monde du poteau et le segment, sinon nil. |
| `PlaceableFence:getPoleShapeForPreview()` | 640 | ✍ Renvoie un clone de la première variante de poteau pour l'aperçu de placement, ou nil si les poteaux sont invisibles, absents ou vides. L'appelant doit supprimer le clone renvoyé. |
| `PlaceableFence:getMaxVerticalAngleAndYForPreview()` | 664 | ✍ Applique getMaxVerticalAngleAndYForSegment au segment d'aperçu courant et renvoie l'angle maximal, la hauteur minimale et la hauteur maximale. |
| `PlaceableFence:getMaxVerticalAngleAndYForSegment(segment: table) → number, number, number` | 679 | ✍ Calcule, d'après la hauteur du terrain à des poteaux consécutifs, l'angle de pente maximal en radians ainsi que les hauteurs minimale et maximale. Nécessite les poteaux calculés mais pas les formes. Les bornes initiales sont 1000 et -1000. |
| `PlaceableFence:getSegmentLength(segment: any)` | 711 | ✍ Renvoie la distance horizontale entre le début et la fin d'un segment. |
| `PlaceableFence:getPanelLength()` | 717 | ✍ Renvoie la longueur de panneau configurée. |
| `PlaceableFence:getIsPanelLengthFixed()` | 723 | ✍ Indique si la longueur de panneau est fixée dans le XML. |
| `PlaceableFence:canBeSold(superFunc: function) → boolean, string?` | 733 | ✍ Refuse la vente avec le message d'objet utilisé tant qu'un verrou de construction est actif, sinon délègue à l'implémentation parente et renvoie son résultat. |
| `PlaceableFence:getIsBuildLocked() → boolean` | 746 | ✍ Renvoie true tant que le compteur de verrou de construction est supérieur à zéro. |
| `PlaceableFence:setBuildLocked(isLocked: boolean)` | 756 | ✍ Incrémente le compteur de verrou si true, le décrémente (jamais sous 0) si false, afin que des constructions simultanées ne se déverrouillent pas mutuellement. |
| `PlaceableFence:createSegment(x1: any, z1: any, x2: any, z2: any, renderFirst: any, gateIndex: any)` | 769 | ✍ Renvoie une nouvelle table de segment à partir des coordonnées de début et de fin, de l'indicateur de premier poteau et d'un index de portail optionnel. Le dernier poteau est toujours affiché ; rien n'est encore enregistré (voir addSegment). |
| `PlaceableFence:addSegment(segment: any, sync: any)` | 784 | ✍ Ajoute le segment à la clôture et génère ses poteaux ; l'argument sync choisit une construction immédiate ou différée des formes. |
| `PlaceableFence:deleteSegment(segment: any)` | 793 | ✍ Retire un segment : supprime son objet animé de portail, son groupe de noeuds et son minuteur en attente, retire ses écouteurs de changement de terrain, l'ôte de la liste et marque la zone couverte comme modifiée. |
| `PlaceableFence:updateDirtyAreas(x1: any, z1: any, x2: any, z2: any)` | 830 | ✍ Marque la boîte englobante de la ligne comme modifiée dans la carte de collision des hauteurs et dans le système de navigation IA. |
| `PlaceableFence:setPreviewSegment(segment: any)` | 842 | ✍ Remplace le segment d'aperçu : supprime le groupe de noeuds de l'ancien aperçu et génère les poteaux du nouveau, avec construction des formes différée. |
| `PlaceableFence:getPreviewSegment()` | 860 | ✍ Renvoie le segment d'aperçu courant, ou nil. |
| `PlaceableFence:getGate(index: any)` | 867 | ✍ Renvoie la définition de portail à l'index donné (base 1). |
| `PlaceableFence:getSegment(index: any)` | 874 | ✍ Renvoie le segment à l'index donné (base 1). |
| `PlaceableFence:getNumSequments()` | 881 | ✍ Renvoie le nombre de segments (le nom contient une faute de frappe pour « segments »). |
| `PlaceableFence:getMaxVerticalAngle()` | 888 | ✍ Renvoie l'angle de terrain maximal autorisé pour les segments normaux. |
| `PlaceableFence:getMaxVerticalGateAngle()` | 895 | ✍ Renvoie l'angle de terrain maximal autorisé pour les segments de portail. |
| `PlaceableFence:getBoundingCheckWidth()` | 902 | ✍ Renvoie la largeur de la boîte utilisée pour les contrôles de collision lors du placement. |
| `PlaceableFence:getSnapDistance()` | 908 | ✍ Renvoie la distance d'aimantation du XML, ou nil si non définie. |
| `PlaceableFence:getSnapCheckDistance()` | 918 | ✍ Renvoie la distance utilisée pour détecter les cibles d'aimantation (0,25 par défaut). |
| `PlaceableFence:getAllowExtendingOnly()` | 924 | ✍ Indique si les nouveaux segments peuvent seulement prolonger les existants au lieu de se fixer en milieu de segment. |
| `PlaceableFence:getMaxCornerAngle()` | 930 | ✍ Renvoie l'angle maximal autorisé entre deux segments connectés. |
| `PlaceableFence:getHasParallelSnapping()` | 936 | ✍ Renvoie toujours false dans cette spécialisation ; peut être surchargé ailleurs. |
| `PlaceableFence:getSupportsParallelSnapping()` | 942 | ✍ Renvoie l'indicateur XML précisant si l'aimantation parallèle est proposée. |
| `PlaceableFence:deletePanel(node: any)` | 948 | ✍ Supprime le panneau touché par un noeud. Sur le serveur, applique doDeletePanel et diffuse PlaceableFenceRemoveSegmentEvent ; sur un client, vide le masque de collision du noeud et envoie l'événement au serveur. Renvoie true si un panneau est trouvé. |
| `PlaceableFence:doDeletePanel(segment: any, segmentIndex: any, poleIndex: any)` | 984 | ✍ Applique la suppression d'un panneau sur le segment : le raccourcit, déplace son début, le supprime ou le scinde en deux. Réaffiche les poteaux utiles aux voisins, régénère les formes et marque l'ancienne zone comme modifiée. Appelé sur le serveur et par l'événement de suppression sur les clients. |
| `PlaceableFence:findRaycastInfo(node: any)` | 1103 | ✍ À partir d'un noeud de collision de raycast, remonte la hiérarchie pour trouver le panneau, son visuel, le segment, le poteau et l'index du poteau (2*enfant+1 dans la liste des poteaux). Gère les portails ; si le noeud est un simple poteau, le panneau est nil. Renvoie nil si aucun segment ne correspond. |
| `PlaceableFence:getNodesToDeleteForPanel(node: any)` | 1181 | ✍ Pour l'aperçu de destruction, renvoie les noeuds visuels que supprimerait le retrait du panneau : le panneau ou les portes du portail, plus un poteau d'extrémité qui resterait isolé. Renvoie nil si aucun panneau n'est trouvé. |
| `PlaceableFence:isPoleInAnySegment(x: any, z: any, ignoreSegment: any)` | 1228 | ✍ Cherche un autre segment dont le début ou la fin coïncide avec x, z (à PlaceableFence.EPSILON près). Renvoie le segment et deux indicateurs : correspond au début, correspond à la fin ; nil sinon. Le segment ignoré est écarté. |
| `PlaceableFence:fakeRandomValueForPosition(x: any, y: any, z: any, n: any)` | 1247 | ✍ Valeur pseudo-aléatoire déterministe calculée à partir de x et z seulement : une fraction dans [0,1) ou, avec n, un entier de 1 à n. Sert à garder les mêmes variantes de poteaux et de panneaux sur tous les clients. |
| `PlaceableFence:generateSegmentPoles(segment: any, sync: any)` | 1262 | ✍ Recalcule les poteaux du segment, puis reconstruit ses formes immédiatement (sync) ou les met en file, et met à jour les noeuds de sélection. Marque la zone comme modifiée sauf pour le segment d'aperçu. Sans effet si le segment est trop court. |
| `PlaceableFence:calculateSegmentPoles(segment: table) → boolean` | 1287 | ✍ Remplit la liste des coordonnées de poteaux du segment (paires x, z) sans toucher aux formes : d'abord des panneaux de longueur entière, puis un ou deux panneaux finaux de taille égale ; un portail n'a que deux poteaux. Renvoie false si le segment fait moins de 0,01. |
| `PlaceableFence:updateSegmentShapes(segment: any)` | 1335 | ✍ Reconstruit les noeuds de scène d'un segment : supprime l'ancien groupe, clone poteaux et panneaux à la hauteur du terrain, les oriente et les dimensionne, ajoute la physique sauf en aperçu, et lève onCreateSegmentPanel. Pour un portail, construit le portail et un AnimatedObject synchronisé (diffusé par le serveur). À noter : l'identifiant de sauvegarde de l'AnimatedObject utilise x2 deux fois, alors que le commentaire laisse penser que z2 était voulu. |
| `PlaceableFence:addSegmentShapesToUpdate(segment: any)` | 1557 | ✍ Met un segment en file pour la reconstruction de ses formes et réveille la boucle de mise à jour du placeable. |
| `PlaceableFence:updateSegmentUpdateQueue()` | 1566 | ✍ Prend le premier segment en file à chaque appel et reconstruit ses formes (noeuds de sélection retirés puis rajoutés), puis maintient la boucle active : un seul segment est reconstruit par image. |
| `PlaceableFence:addPickingNodesForSegment(segment: any)` | 1582 | ✍ Enregistre chaque noeud du groupe du segment qui possède un corps rigide dans la table des noeuds-objets de la mission pour qu'il soit sélectionnable, et réinitialise le cache des couleurs de surbrillance. Ignoré pour le segment d'aperçu. |
| `PlaceableFence:removePickingNodesForSegment(segment: any)` | 1602 | ✍ Inverse de addPickingNodesForSegment : retire les noeuds à corps rigide du segment de la table des noeuds-objets de la mission. Ignoré pour le segment d'aperçu. |
| `PlaceableFence:recursivelyAddPickingNodes(objects: any, node: any)` | 1619 | ✍ Ajoute récursivement à la liste donnée chaque noeud sous un noeud dont le type de corps rigide n'est pas NONE. |
| `PlaceableFence:getDestructionMethod(superFunc: any)` | 1632 | ✍ Renvoie Placeable.DESTRUCTION.PER_NODE : la clôture est détruite morceau par morceau. |
| `PlaceableFence:previewNodeDestructionNodes(superFunc: any, node: any)` | 1638 | ✍ Renvoie les noeuds à surligner pour l'aperçu de destruction, en déléguant à getNodesToDeleteForPanel. |
| `PlaceableFence:performNodeDestruction(superFunc: any, node: any)` | 1644 | ✍ Supprime le panneau d'un noeud via deletePanel et renvoie si quelque chose a été supprimé ainsi que si tout le placeable doit être détruit (plus aucun segment). |
| `PlaceableFence:collectPickObjects(superFunc: any, node: any)` | 1652 | ✍ Surcharge vide : la clôture n'ajoute pas d'objets de sélection par défaut au niveau du placeable, les noeuds des segments étant enregistrés à part. L'implémentation parente n'est pas appelée. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onCreateSegmentPanel` | 31 |
| registerFunction | `addSegment` | 37 |
| registerFunction | `addSegmentShapesToUpdate` | 38 |
| registerFunction | `calculateSegmentPoles` | 39 |
| registerFunction | `createSegment` | 40 |
| registerFunction | `deletePanel` | 41 |
| registerFunction | `deleteSegment` | 42 |
| registerFunction | `detachSourceNodes` | 43 |
| registerFunction | `doDeletePanel` | 44 |
| registerFunction | `fakeRandomValueForPosition` | 45 |
| registerFunction | `findRaycastInfo` | 46 |
| registerFunction | `generateSegmentPoles` | 47 |
| registerFunction | `getGate` | 48 |
| registerFunction | `getMaxVerticalAngle` | 49 |
| registerFunction | `getMaxVerticalAngleAndYForPreview` | 50 |
| registerFunction | `getMaxVerticalAngleAndYForSegment` | 51 |
| registerFunction | `getMaxVerticalGateAngle` | 52 |
| registerFunction | `getNodesToDeleteForPanel` | 53 |
| registerFunction | `getNumSequments` | 54 |
| registerFunction | `getPanelLength` | 55 |
| registerFunction | `getIsPanelLengthFixed` | 56 |
| registerFunction | `getIsBuildLocked` | 57 |
| registerFunction | `setBuildLocked` | 58 |
| registerFunction | `getPoleNear` | 59 |
| registerFunction | `getPoleNearOverlapCallback` | 60 |
| registerFunction | `getPolePosition` | 61 |
| registerFunction | `getPoleShapeForPreview` | 62 |
| registerFunction | `getPreviewSegment` | 63 |
| registerFunction | `getSegment` | 64 |
| registerFunction | `getSegmentLength` | 65 |
| registerFunction | `isPoleInAnySegment` | 66 |
| registerFunction | `recursivelyAddPickingNodes` | 67 |
| registerFunction | `addPickingNodesForSegment` | 68 |
| registerFunction | `removePickingNodesForSegment` | 69 |
| registerFunction | `setPreviewSegment` | 70 |
| registerFunction | `updatePanelVisuals` | 71 |
| registerFunction | `updateSegmentShapes` | 72 |
| registerFunction | `updateSegmentUpdateQueue` | 73 |
| registerFunction | `updateDirtyAreas` | 74 |
| registerFunction | `getSupportsParallelSnapping` | 75 |
| registerFunction | `getBoundingCheckWidth` | 77 |
| registerFunction | `getSnapDistance` | 78 |
| registerFunction | `getSnapAngle` | 79 |
| registerFunction | `getSnapCheckDistance` | 80 |
| registerFunction | `getAllowExtendingOnly` | 81 |
| registerFunction | `getMaxCornerAngle` | 82 |
| registerFunction | `getHasParallelSnapping` | 83 |
| registerFunction | `registerTerrainHeightChangeCallbacks` | 85 |
| registerFunction | `onTerrainDeformationSyncerUpdate` | 86 |
| registerOverwrittenFunction | `canBeSold` | 92 |
| registerOverwrittenFunction | `collectPickObjects` | 93 |
| registerOverwrittenFunction | `getDestructionMethod` | 94 |
| registerOverwrittenFunction | `performNodeDestruction` | 95 |
| registerOverwrittenFunction | `previewNodeDestructionNodes` | 96 |
| registerOverwrittenFunction | `setOwnerFarmId` | 97 |
| registerEventListener | `onLoad` | 103 |
| registerEventListener | `onDelete` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onUpdate` | 107 |
