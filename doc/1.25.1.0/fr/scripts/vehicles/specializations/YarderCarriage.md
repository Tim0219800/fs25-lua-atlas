# vehicles/specializations/YarderCarriage.lua

*[English version](../../../../scripts/vehicles/specializations/YarderCarriage.md)*

Source: `dataS/scripts/vehicles/specializations/YarderCarriage.lua` — FS25 1.25.1.0

✍ Spécialisation pour le chariot d'un téléphérique forestier (yarder) : un véhicule qui roule sur le câble, accroche un ou plusieurs arbres avec des cordes, les soulève et les transporte. Elle n'a aucun prérequis. Le serveur crée les joints physiques entre le chariot et chaque arbre, gère l'entrée de levage/descente et détache les arbres coupés, montés ailleurs, supprimés ou trop éloignés. Les clients voient cordes et crochets, jouent les sons et visent les arbres par un raycast asynchrone. Elle coopère avec YarderTower via `setYarderTowerVehicle` ; les attaches sont synchronisées par TreeAttachEvent/TreeDetachEvent et sauvegardées via les ids de split shape.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderCarriage.prerequisitesPresent(specializations: table) → boolean` | 28 | ✍ Retourne toujours true : cette spécialisation n'a aucun prérequis. |
| `YarderCarriage.initSpecialization()` | 34 | ✍ Enregistre le schéma XML `vehicle.yarderCarriage` : limites de nombre et de masse d'arbres, dimensions du chariot, vitesse et accélération de levage, noeuds cibles des cordes, joint d'attache, cordes principale et additionnelles, crochet d'arbre, object changes et sons. À noter : la valeur par défaut du schéma pour `joint#maxDistance` est 10 mais onLoad utilise réellement 20. |
| `YarderCarriage.registerFunctions(vehicleType: any)` | 100 | ✍ Ajoute l'API du chariot au type de véhicule : dimensions, noeuds cibles des cordes, attache/détache d'arbres, requêtes de masse et de nombre, entrée de levage, callback de raycast, aides de sauvegarde et gestionnaires de coupe/montage d'arbre. |
| `YarderCarriage.registerOverwrittenFunctions(vehicleType: any)` | 130 | ✍ Surcharge getDirtMultiplier et getWearMultiplier. |
| `YarderCarriage.registerEventListeners(vehicleType: any)` | 137 | ✍ S'abonne aux événements de chargement, fin de chargement, suppression, flux réseau (connexion et mise à jour) et post-update. |
| `YarderCarriage:onLoad(savegame: any)` | 150 | ✍ Charge tous les réglages du chariot depuis le XML, construit les objets corde, crochet et marqueur d'attache, crée les sons côté client, alloue le dirty flag et s'abonne aux messages TREE_SHAPE_CUT et TREE_SHAPE_MOUNTED. La vitesse de levage est convertie en mètres par milliseconde. Met aussi `isVehicleSaved` à false. |
| `YarderCarriage:onLoadFinished(savegame: any)` | 303 | ✍ Relie la corde principale à son noeud d'origine et la clone comme courte corde entre le crochet racine et l'arbre, avec la longueur configurée. |
| `YarderCarriage:onDelete()` | 312 | ✍ Efface la référence de la tour vers ce chariot, détache les arbres attachés, et supprime sons, crochet, marqueur et toutes les cordes. |
| `YarderCarriage:onReadStream(streamId: integer, connection: Connection)` | 366 | ✍ Client à la connexion : lit le véhicule tour associé et les arbres attachés (position du crochet et id de split shape). Les arbres dont la shape n'est pas encore résolue sont mis en file dans `splitShapesToAttach`. |
| `YarderCarriage:onWriteStream(streamId: integer, connection: Connection)` | 391 | ✍ Serveur à la connexion : écrit le véhicule tour associé, le nombre d'arbres attachés et, pour chacun, la position du crochet dans le repère de l'arbre et l'id de split shape. |
| `YarderCarriage:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 413 | ✍ Client uniquement : lit trois indicateurs envoyés par le serveur (levage, limite de levage atteinte, descente) et joue ou arrête les sons correspondants. |
| `YarderCarriage:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 442 | ✍ Serveur uniquement : si le dirty flag est actif, écrit les trois indicateurs sonores (levage, limite, descente) puis les remet à zéro. |
| `YarderCarriage:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 460 | ✍ Serveur : réduit les limites de translation du joint juste après l'attache, et détache les arbres si l'un a disparu ou si la corde est trop tendue. Client : résout les split shapes en attente. Les deux : met à jour cordes, marqueur de visée et visibilité, arrête les sons de levage après un court délai, et garde le véhicule actif tant que des arbres sont attachés ou visés. |
| `YarderCarriage:getCarriageDimensions()` | 541 | ✍ Retourne la longueur du chariot et l'espacement des galets. |
| `YarderCarriage:getCarriagePullRopeTargetNode()` | 548 | ✍ Retourne le noeud où se connecte la corde de traction. |
| `YarderCarriage:getCarriagePushRopeTargetNode()` | 554 | ✍ Retourne le noeud où se connecte la corde de poussée. |
| `YarderCarriage:setYarderTowerVehicle(vehicle: any)` | 560 | ✍ Mémorise le véhicule tour auquel ce chariot appartient. |
| `YarderCarriage:updateRopeAlignmentNodes(ropeNode: any, tx: any, ty: any, tz: any, maxOffset: any)` | 566 | ✍ Déplace chaque noeud d'alignement de corde latéralement et verticalement selon une courbe sinusoïdale pour suivre l'affaissement d'une corde entre un noeud de corde et un point cible ; `maxOffset` est l'amplitude de l'affaissement. |
| `YarderCarriage:updateCarriageInRange()` | 585 | ✍ Joueur local uniquement : si le joueur est à portée, sans outil à la main et qu'il reste des emplacements d'arbre, lance un raycast asynchrone depuis la caméra contre les arbres ; sinon efface l'arbre cible valide. |
| `YarderCarriage:onYarderCarriageUpdateEnd()` | 619 | ✍ Réinitialise l'état du raycast (arbre valide et indicateur de démarrage) et garde le véhicule actif ; appelée par la tour à la fin de la mise à jour de portée du joueur. |
| `YarderCarriage:updateTreeAttachRopes(dt: any)` | 628 | ✍ Oriente la corde principale de son origine vers le crochet du premier arbre, place le crochet racine et règle la longueur de la corde principale, puis aligne les noeuds de crochet et les cibles des cordes additionnelles vers les autres arbres attachés. |
| `YarderCarriage:onCarriageTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 681 | ✍ Callback de raycast : accepte un arbre fendu à portée (et à moins de 2 m du premier arbre accroché s'il y en a un), calcule la position du crochet et les données du marqueur, et le mémorise comme arbre cible valide. Réinitialise l'état si rien de valide n'est touché. |
| `YarderCarriage:onAttachTreeAction()` | 750 | ✍ Gestionnaire d'entrée pour attacher l'arbre visé. Le serveur vérifie l'autorisation et attache directement (avec un avertissement en cas d'échec) ; un client envoie TreeAttachRequestEvent. |
| `YarderCarriage:attachTreeToCarriage(splitShapeId: any, x: any, y: any, z: any, ropeIndex: any, noEventSend: any)` | 770 | ✍ Monte un crochet sur l'arbre à la position monde donnée et enregistre l'arbre. Le serveur crée le joint physique ; les deux côtés mettent à jour les cordes, jouent le son d'attache, appliquent les limites actives du joint de composant, notifient la tour (`onYarderCarriageTreeAttached`), publient TREE_SHAPE_MOUNTED et envoient TreeAttachEvent sauf si `noEventSend`. Retourne tôt si le crochet ne peut pas être monté. |
| `YarderCarriage:createJoint(shapeId: any, shapeJointId: any)` | 845 | ✍ Construit un joint physique à ressort entre le composant du chariot et la shape de l'arbre, à partir du noeud de joint du chariot et du crochet. Retourne l'indice du joint et la distance initiale utilisée comme limite de translation. |
| `YarderCarriage:onDetachTreeAction()` | 872 | ✍ Gestionnaire d'entrée qui détache tous les arbres du chariot. |
| `YarderCarriage:detachTreeFromCarriage(ropeIndex: any, noEventSend: any)` | 878 | ✍ Détache tous les arbres attachés (l'argument `ropeIndex` n'est pas utilisé) : joue le son de détache, supprime les joints côté serveur, supprime les crochets, masque les cordes additionnelles, restaure les limites inactives du joint de composant et envoie TreeDetachEvent sauf si `noEventSend`. |
| `YarderCarriage:getNumAttachedTrees()` | 924 | ✍ Retourne le nombre d'arbres actuellement attachés. |
| `YarderCarriage:getMaxNumAttachedTrees()` | 930 | ✍ Retourne le nombre maximal d'arbres autorisés (`maxNumTrees`). |
| `YarderCarriage:getAttachedTreeMass()` | 936 | ✍ Retourne la masse cumulée de tous les arbres attachés, via `getMass` du moteur (unité NON VÉRIFIÉE, probablement des tonnes). |
| `YarderCarriage:getIsCarriageTreeAttachAllowed(splitShapeId: any)` | 948 | ✍ Vérifie si un arbre peut être attaché : il doit exister, un emplacement doit être libre, la masse totale doit rester sous `maxTreeMass` et l'arbre ne doit pas être monté sur une sangle. Retourne un booléen et une raison d'échec (par défaut ou trop lourd). |
| `YarderCarriage:getIsTreeInMountRange()` | 971 | ✍ Retourne true s'il existe un arbre visé valide qui existe toujours dans le monde et si un emplacement d'arbre est libre. |
| `YarderCarriage:showCarriageTreeMountFailedWarning(ropeIndex: any, reason: any)` | 990 | ✍ Affiche un avertissement clignotant avec la limite de masse quand la raison est un arbre trop lourd ; les autres raisons n'affichent rien. `ropeIndex` n'est pas utilisé. |
| `YarderCarriage:setCarriageLiftInput(direction: any)` | 999 | ✍ Serveur uniquement : applique l'entrée de levage ou de descente dans une direction, avec accélération, en déplaçant la limite de translation verticale de chaque arbre entre des distances minimale et maximale. Déclenche les sons de levage/descente et lève le dirty flag pour que les clients les jouent. |
| `YarderCarriage.registerSavegameXMLPaths(schema: any, basePath: any)` | 1057 | ✍ Enregistre les attributs de sauvegarde de chaque arbre attaché : translation du crochet et trois parties d'id de split shape. À noter : l'attribut de translation reçoit une description sans rapport dans le schéma. |
| `YarderCarriage:saveAttachedTreesToXML(xmlFile: any, key: any, usedModNames: any)` | 1066 | ✍ Écrit pour chaque arbre attaché la position monde du crochet et les parties d'id de split shape sauvegardables sous la clé donnée. |
| `YarderCarriage.loadAttachedTreesFromXML(xmlFile: any, key: any)` | 1086 | ✍ Aide statique : lit les entrées d'arbres attachés sauvegardées (translation et parties de split shape) et les retourne sous forme de liste ; les entrées incomplètes sont ignorées. |
| `YarderCarriage:resolveLoadedAttachedTrees(data: any)` | 1105 | ✍ Résout les données chargées en shapes d'arbres réelles ; si toutes sont résolues, attache chacune sans envoyer d'événement et retourne true, sinon retourne false sans rien attacher. |
| `YarderCarriage:onYarderCarriageTreeShapeCut(oldShape: any, shape: any)` | 1125 | ✍ Gestionnaire de message (serveur uniquement) : si une shape d'arbre coupée était attachée, détache tous les arbres du chariot. |
| `YarderCarriage:onYarderCarriageTreeShapeMounted(shape: any, mountVehicle: any)` | 1139 | ✍ Gestionnaire de message (serveur uniquement) : si un arbre attaché est monté par un autre véhicule, détache tous les arbres de ce chariot. |
| `YarderCarriage:getDirtMultiplier(superFunc: any) → number` | 1154 | ✍ Retourne le multiplicateur de salissure du véhicule tour s'il est lié, sinon la valeur parente. |
| `YarderCarriage:getWearMultiplier(superFunc: any) → number` | 1168 | ✍ Retourne la valeur de la tour liée, sinon la valeur parente. À noter : elle appelle getDirtMultiplier de la tour et non getWearMultiplier, ce qui ressemble à une erreur de copier-coller. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getCarriageDimensions` | 101 |
| registerFunction | `getCarriagePullRopeTargetNode` | 102 |
| registerFunction | `getCarriagePushRopeTargetNode` | 103 |
| registerFunction | `setYarderTowerVehicle` | 104 |
| registerFunction | `updateRopeAlignmentNodes` | 105 |
| registerFunction | `updateCarriageInRange` | 106 |
| registerFunction | `onYarderCarriageUpdateEnd` | 107 |
| registerFunction | `updateTreeAttachRopes` | 108 |
| registerFunction | `onCarriageTreeRaycastCallback` | 109 |
| registerFunction | `onAttachTreeAction` | 110 |
| registerFunction | `attachTreeToCarriage` | 111 |
| registerFunction | `createJoint` | 112 |
| registerFunction | `onDetachTreeAction` | 113 |
| registerFunction | `detachTreeFromCarriage` | 114 |
| registerFunction | `getNumAttachedTrees` | 115 |
| registerFunction | `getMaxNumAttachedTrees` | 116 |
| registerFunction | `getAttachedTreeMass` | 117 |
| registerFunction | `getIsCarriageTreeAttachAllowed` | 118 |
| registerFunction | `getIsTreeInMountRange` | 119 |
| registerFunction | `showCarriageTreeMountFailedWarning` | 120 |
| registerFunction | `setCarriageLiftInput` | 121 |
| registerFunction | `saveAttachedTreesToXML` | 122 |
| registerFunction | `resolveLoadedAttachedTrees` | 123 |
| registerFunction | `onYarderCarriageTreeShapeCut` | 124 |
| registerFunction | `onYarderCarriageTreeShapeMounted` | 125 |
| registerOverwrittenFunction | `getDirtMultiplier` | 131 |
| registerOverwrittenFunction | `getWearMultiplier` | 132 |
| registerEventListener | `onLoad` | 138 |
| registerEventListener | `onLoadFinished` | 139 |
| registerEventListener | `onDelete` | 140 |
| registerEventListener | `onReadStream` | 141 |
| registerEventListener | `onWriteStream` | 142 |
| registerEventListener | `onReadUpdateStream` | 143 |
| registerEventListener | `onWriteUpdateStream` | 144 |
| registerEventListener | `onPostUpdate` | 145 |

## Messages

- s'abonne à `MessageType.TREE_SHAPE_CUT` (l.297)
- s'abonne à `MessageType.TREE_SHAPE_MOUNTED` (l.298)
- publie `MessageType.TREE_SHAPE_MOUNTED` (l.836)
