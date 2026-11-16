# vehicles/specializations/TensionBelts.lua

*[English version](../../../../scripts/vehicles/specializations/TensionBelts.md)*

Source: `dataS/scripts/vehicles/specializations/TensionBelts.lua` — FS25 1.25.1.0

✍ Spécialisation (sans prérequis) des véhicules qui arriment des charges (balles, palettes, véhicules, troncs) avec des sangles de tension. Les sangles sont décrites par configuration sous vehicle.tensionBelts et construites en géométrie avec TensionBeltGeometryConstructor, à partir des données de g_tensionBeltManager. Le serveur monte les objets trouvés avec des joints physiques (ou des liens cinématiques pour les arbres sur train) et synchronise l'état via TensionBeltsEvent et un booléen de flux par sangle. Un TensionBeltsActivatable propose l'interaction par sangle ; le fichier contient aussi l'action de bascule et une commande console de debug.

- **TensionBelts** (l.14)
- **TensionBeltsActivatable** (l.1585)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TensionBelts.prerequisitesPresent(specializations: any)` | 21 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `TensionBelts.initSpecialization()` | 27 | ✍ Enregistre le type de configuration « tensionBelts » et le schéma XML (rayons d'interaction, trigger, type de sangle, largeur, crochets, décalages, nodes par sangle, changements d'objets, sons, indicateur d'outil mobile) ainsi que la clé de sauvegarde de l'état actif des sangles. |
| `TensionBelts.registerFunctions(vehicleType: any)` | 85 | ✍ Enregistre les fonctions de sangles : création/suppression, activation, requêtes de montage/démontage, rafraîchissement, libération/verrouillage d'objet, portée du joueur, test de montage dynamique, callback de trigger et gestion de coupe d'arbre. |
| `TensionBelts.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Surcharge l'aptitude au trajet automatisé de train, la sélection, l'autorisation de pliage, le chargement et l'activité des outils mobiles, les contrôles de déchargement, l'info de remplissage, le test d'objet monté et la masse de composant additionnelle. |
| `TensionBelts.registerEventListeners(vehicleType: any)` | 121 | ✍ S'abonne à onLoad, onPostLoad, onDelete, onPreDelete, onReadStream, onWriteStream, onUpdate, onUpdateTick, onDraw et onRegisterActionEvents. |
| `TensionBelts:onLoad(savegame: table)` | 137 | ✍ Lit la configuration de sangles choisie : rayons, trigger joueur optionnel (vérifie les filtres de collision), données du type de sangle, nodes et chaque entrée tensionBelt (x/y du node de fin = 0). Calcule le centre d'interaction, s'abonne aux messages de coupe d'arbre et retire les écouteurs sans sangles. Met le chargement en erreur si linkNode manque. |
| `TensionBelts:onPostLoad(savegame: table)` | 363 | ✍ Au chargement d'une sauvegarde, collecte les indices des sangles enregistrées comme actives pour que onUpdate les rattache une par frame. |
| `TensionBelts:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 384 | ✍ Écrit dans la sauvegarde l'indicateur isActive de chaque sangle (true si la sangle a un mesh). |
| `TensionBelts:onPreDelete()` | 397 | ✍ Avant la suppression, réveille la physique de chaque objet situé dans la zone de montage d'une sangle pour qu'il ne reste pas endormi. |
| `TensionBelts:onDelete()` | 410 | ✍ Retire l'activable, détache silencieusement toutes les sangles, retire le trigger d'activation et supprime les sons. |
| `TensionBelts:onReadStream(streamId: integer, connection: Connection)` | 429 | ✍ Connexion d'un client : lit un booléen par sangle et met en file les sangles actives pour les rattacher. |
| `TensionBelts:onWriteStream(streamId: integer, connection: Connection)` | 447 | ✍ Synchronisation à la connexion côté serveur : écrit un booléen par sangle indiquant si elle a un mesh. |
| `TensionBelts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 462 | ✍ Rattache les sangles en file ; sur le serveur, met à jour les repères de joints dynamiques si le link node a bougé ; sur les clients, déroule la séquence serrer/desserrer tout ; gère l'aperçu (sangle fantôme) de la sangle la plus proche et l'activable quand le joueur local est à portée ; dessine le debug si activé. |
| `TensionBelts:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 602 | ✍ Serveur uniquement, toutes les 500 ms : vérifie si un objet physique monté n'existe plus et, le cas échéant, l'oublie et rafraîchit les sangles. |
| `TensionBelts:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 634 | ✍ Pour le véhicule sélectionné et actif en entrée, règle le texte de l'action de bascule sur serrer ou desserrer selon que toutes les sangles sont serrées. |
| `TensionBelts:refreshTensionBelts()` | 657 | ✍ Le serveur diffuse TensionBeltsRefreshEvent, puis reconstruit la géométrie de chaque sangle serrée autour des objets actuellement à portée. |
| `TensionBelts:freeTensionBeltObject(objectId: any, objectsToJointTable: any, isDynamic: any, object: any)` | 674 | ✍ Libère un objet de son montage : le serveur retire le joint, restaure masse, inertie et indicateurs (vendable, type de montage) ou relie/démonte les objets cinématiques ; efface l'attribut d'arbre monté et oublie l'objet. |
| `TensionBelts:lockTensionBeltObject(objectId: any, objectsToJointTable: any, isDynamic: any, jointNode: any, object: any)` | 746 | ✍ Monte un objet : le serveur crée un joint à son centre de masse (limites à ressort, masse réduite, type de montage défini) ou lie cinématiquement les arbres sur des nodes non dynamiques. Les clients se contentent de l'enregistrer. Publie TREE_SHAPE_MOUNTED pour les arbres. À noter : la branche de montage cinématique n'est jamais choisie dans ce code. |
| `TensionBelts:setTensionBeltsActive(isActive: boolean, beltId: integer, noEventSend: boolean, playSound: boolean)` | 850 | ✍ Serre ou desserre une sangle (par id) ou toutes si l'id est nil : construit ou supprime les meshes, monte ou libère les objets à portée, applique les changements d'objets, envoie TensionBeltsEvent sauf si noEventSend, et met à jour l'état « tout serré ». |
| `TensionBelts:setAllTensionBeltsActive(isActive: any, noEventSend: any)` | 911 | ✍ Met toutes les sangles dans l'état donné, ou bascule selon que toutes sont déjà serrées quand isActive est nil. |
| `TensionBelts:updateFastenState()` | 924 | ✍ Recalcule areAllBeltsFastened : true seulement si aucune sangle n'est sans mesh. |
| `TensionBelts:createTensionBelt(belt: table, isDummy: boolean, objects: table, playSound: boolean)` | 944 | ✍ Construit la géométrie de la sangle entre ses nodes de début et de fin autour des meshes des objets donnés (matériau, largeur, crochets, cliquet, points d'intersection) et renvoie la shape, ou nil. Les sangles fantômes sont des aperçus ; les vraies sont stockées, cliquet et crochets sont clonés et le son d'ajout est joué. |
| `TensionBelts:removeTensionBelt(belt: table, playSound: boolean)` | 1074 | ✍ Supprime le mesh d'une sangle et efface sa référence ; joue le son de retrait sur les clients sauf s'il est désactivé ou si la sangle n'était qu'un aperçu. |
| `TensionBelts:getObjectToMount(belt: table) → table, integer` | 1099 | ✍ Lance un recouvrement par boîte synchrone sur la zone de la sangle (côtés, hauteur, décalage des voisines ou valeurs par défaut) contre objets dynamiques, véhicules et arbres, et renvoie la table des objets trouvés et leur nombre. La table renvoyée est réutilisée entre les appels. |
| `TensionBelts:getObjectsToUnmount(belt: table) → table, integer` | 1200 | ✍ Renvoie les objets montés qui seraient libérés si la sangle donnée est retirée, hors ceux encore retenus par une autre sangle serrée, et leur nombre. |
| `TensionBelts:objectOverlapCallback(transformId: integer)` | 1231 | ✍ Callback de recouvrement : enregistre les objets de jeu montables (via getTensionBeltNodeId/getMeshNodes) ou les split shapes d'arbres dynamiques/cinématiques trouvés dans la zone. Renvoie toujours true pour continuer. |
| `TensionBelts:getTensionBeltObjectCanBeMounted(object: any)` | 1262 | ✍ Renvoie si un objet peut être sanglé : ni ce véhicule ni sa hiérarchie, prise en charge des sangles avec mesh nodes, pas déjà monté dynamiquement ailleurs, et pas de montage circulaire avec ce véhicule. |
| `TensionBelts:getIsPlayerInTensionBeltsRange() → boolean, table` | 1315 | ✍ Renvoie true et la sangle la plus proche quand le joueur local peut accéder au véhicule et se trouve dans le rayon d'interaction d'une extrémité de sangle ; sinon false, nil. |
| `TensionBelts:getIsDynamicallyMountedNode(node: any)` | 1358 | ✍ Renvoie true si le node donné est actuellement monté par l'une des sangles de ce véhicule. |
| `TensionBelts:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 1374 | ✍ Surcharge : renvoie false tant que des objets sont à portée des sangles (pas encore sanglés) ; sinon délègue au parent. |
| `TensionBelts:getCanBeSelected(superFunc: any)` | 1385 | ✍ Surcharge qui renvoie toujours true. |
| `TensionBelts:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1391 | ✍ Surcharge : interdit le pliage avec un texte d'avertissement tant que toutes les sangles sont serrées si allowFoldingWhileFasten vaut false (sauf dans le sens du dépliage). |
| `TensionBelts:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1404 | ✍ Surcharge : après le chargement d'un outil mobile par le parent, lit son indicateur tensionBelts#allowedMounted (true par défaut). |
| `TensionBelts:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1416 | ✍ Surcharge : désactive un outil mobile qui n'autorise pas le mouvement en charge lorsque toutes les sangles sont serrées. |
| `TensionBelts:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 1429 | ✍ Surcharge : renvoie false tant que toutes les sangles sont serrées si allowDischargeWhileFasten vaut false. |
| `TensionBelts:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 1442 | ✍ Surcharge : renvoie false tant que toutes les sangles sont serrées si allowDischargeWhileFasten vaut false. |
| `TensionBelts:getFillLevelInformation(superFunc: any, display: any)` | 1455 | ✍ Surcharge qui ajoute aussi à l'affichage les niveaux de remplissage des objets sanglés, via leur propre getFillLevelInformation ou leur type, niveau et capacité. |
| `TensionBelts:getHasObjectMounted(superFunc: table, object: table) → boolean` | 1486 | ✍ Surcharge : true si le parent le dit, ou si l'objet est sanglé ici ou monté sur un objet sanglé (récursif). |
| `TensionBelts:getAdditionalComponentMass(superFunc: any, component: any)` | 1513 | ✍ Surcharge ajoutant au composant du joint la masse par défaut des objets sanglés dont la masse peut être réduite, ainsi que la masse d'origine mémorisée des split shapes sanglés. |
| `TensionBelts:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1540 | ✍ Client uniquement : enregistre l'événement d'action TOGGLE_TENSION_BELTS pour le véhicule quand l'entrée est active. |
| `TensionBelts:tensionBeltActivationTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1555 | ✍ Callback de trigger côté client : positionne isPlayerInTrigger quand le joueur local entre ou sort du trigger d'activation et garde le véhicule actif à l'entrée. |
| `TensionBelts:onTensionBeltTreeShapeCut(oldShape: any, shape: any)` | 1573 | ✍ Gestionnaire serveur des messages de coupe d'arbre : si la forme coupée était sanglée, desserre toutes les sangles. |
| `TensionBeltsActivatable.new(object: any)` | 1589 | ✍ Crée l'activable d'un véhicule, en conservant sa spec et le texte par défaut « serrer la sangle ». |
| `TensionBeltsActivatable:getIsActivatable()` | 1602 | ✍ Renvoie true tant que le joueur local est à portée des sangles. |
| `TensionBeltsActivatable:getDistance(posX: any, posY: any, posZ: any)` | 1608 | ✍ Renvoie 0 (priorité maximale) quand une sangle courante est sélectionnée, sinon math.huge. |
| `TensionBeltsActivatable:run()` | 1619 | ✍ Bascule la sangle courante : la desserre si elle a un mesh, sinon la serre, puis rafraîchit le texte. |
| `TensionBeltsActivatable:updateActivateText()` | 1633 | ✍ Règle le texte d'invite sur « desserrer » ou « serrer » selon que la sangle courante est serrée. |
| `TensionBelts.actionEventToggleTensionBelts(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1643 | ✍ Callback d'entrée : démarre la séquence serrer tout ou desserrer tout (inverse de l'état courant), réalisée une sangle par mise à jour. |
| `TensionBelts.consoleCommandToggleTensionBeltDebugRendering(unusedSelf: any)` | 1652 | ✍ Commande console qui bascule TensionBelts.debugRendering et renvoie une chaîne d'état. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `createTensionBelt` | 86 |
| registerFunction | `removeTensionBelt` | 87 |
| registerFunction | `setTensionBeltsActive` | 88 |
| registerFunction | `setAllTensionBeltsActive` | 89 |
| registerFunction | `objectOverlapCallback` | 90 |
| registerFunction | `getTensionBeltObjectCanBeMounted` | 91 |
| registerFunction | `getObjectToMount` | 92 |
| registerFunction | `getObjectsToUnmount` | 93 |
| registerFunction | `updateFastenState` | 94 |
| registerFunction | `refreshTensionBelts` | 95 |
| registerFunction | `freeTensionBeltObject` | 96 |
| registerFunction | `lockTensionBeltObject` | 97 |
| registerFunction | `getIsPlayerInTensionBeltsRange` | 98 |
| registerFunction | `getIsDynamicallyMountedNode` | 99 |
| registerFunction | `tensionBeltActivationTriggerCallback` | 100 |
| registerFunction | `onTensionBeltTreeShapeCut` | 101 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 107 |
| registerOverwrittenFunction | `getCanBeSelected` | 108 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 109 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 110 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 111 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 112 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 113 |
| registerOverwrittenFunction | `getFillLevelInformation` | 114 |
| registerOverwrittenFunction | `getHasObjectMounted` | 115 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 116 |
| registerEventListener | `onLoad` | 122 |
| registerEventListener | `onPostLoad` | 123 |
| registerEventListener | `onDelete` | 124 |
| registerEventListener | `onPreDelete` | 125 |
| registerEventListener | `onReadStream` | 126 |
| registerEventListener | `onWriteStream` | 127 |
| registerEventListener | `onUpdate` | 128 |
| registerEventListener | `onUpdateTick` | 129 |
| registerEventListener | `onDraw` | 130 |
| registerEventListener | `onRegisterActionEvents` | 131 |

## Messages

- s'abonne à `MessageType.TREE_SHAPE_CUT` (l.356)
- publie `MessageType.TREE_SHAPE_MOUNTED` (l.840)
