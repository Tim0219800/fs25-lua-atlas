# vehicles/specializations/YarderTower.lua

*[English version](../../../../scripts/vehicles/specializations/YarderTower.md)*

Source: `dataS/scripts/vehicles/specializations/YarderTower.lua` — FS25 1.25.1.0

✍ Spécialisation pour la tour d'un téléphérique forestier (yarder). Le joueur entre en mode installation, vise un arbre et, si le placement est valide (angle, longueur, diamètre de l'arbre, trajet dégagé, règle de la montée), la corde principale est ancrée. Le serveur crée alors un véhicule chariot séparé (voir YarderCarriage) qui se déplace sur la corde, tandis que des cordes de soutien se fixent à des arbres proches ou au sol et que la tour devient cinématique. Elle n'a aucun prérequis, utilise YarderTowerSetupActivatable, YarderTowerControlActivatable et une extension HUD, déclare des specs de boutique (longueur et masse maximales) et sauvegarde l'état des cordes, la position du chariot et les arbres attachés. La synchronisation passe par YarderTowerSetTargetEvent et YarderTowerFollowModeEvent, plus un flux d'entrées du client vers le serveur.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTower.prerequisitesPresent(specializations: table) → boolean` | 49 | ✍ Retourne toujours true : aucune spécialisation prérequise. |
| `YarderTower.initSpecialization()` | 55 | ✍ Enregistre les types de spec de boutique `yarderMaxLength` et `yarderMaxMass`, tout le schéma XML `vehicle.yarderTower` (déclencheur de contrôle, placement, chariot, crochets, cordes d'installation/principale/traction/poussée/soutien, sons, effets moteur) et les attributs de sauvegarde pour l'état des cordes, la position du chariot, la cible et les arbres attachés. |
| `YarderTower.registerRopeXMLPaths(schema: any, baseKey: any)` | 148 | ✍ Déclare les clés XML communes à tous les types de corde : affaissement, fichier i3d et chemin de noeud de la corde, diamètre, noeud de rotation, noeuds pilotés par la longueur de corde (rotation, translation, échelle, paramètre de shader) et object changes. À noter : onLoad utilise un affaissement par défaut de 0.4 alors que le schéma indique 0.1. |
| `YarderTower.registerEvents(vehicleType: any)` | 176 | ✍ Enregistre l'événement véhicule `onYarderCarriageTreeAttached`, déclenché par le chariot quand un arbre est attaché. |
| `YarderTower.registerFunctions(vehicleType: any)` | 182 | ✍ Ajoute l'API du yarder au type de véhicule : mode installation, activation de la cible, suivi/déplacement/levage du chariot, installation des cordes de soutien, mise à jour des cordes, validation du placement, requêtes de portée, infos d'état et callbacks de raycast/overlap/trigger. |
| `YarderTower.registerOverwrittenFunctions(vehicleType: any)` | 218 | ✍ Surcharge le détachement, le pliage, l'abaissement, la puissance PTO, la charge consommée, l'activité PTO, la salissure, l'usure, l'usage causant des dégâts et l'ajout/retrait de la physique. |
| `YarderTower.registerEventListeners(vehicleType: any)` | 234 | ✍ S'abonne aux événements de chargement, fin de chargement, pré-suppression, suppression, flux réseau, mise à jour, événement d'arbre attaché du chariot et post-attach. |
| `YarderTower:onLoad(savegame: any)` | 250 | ✍ Lit tous les réglages du yarder depuis le XML, valide les éléments obligatoires (déclencheur de contrôle avec le flag de collision PLAYER, objet de boutique du chariot, crochets, noeuds des cordes d'installation et principale), charge les i3d de cordes, sons, effets moteur et textes. En cas d'invalidité elle journalise une erreur et retire les écouteurs d'exécution ; sinon elle crée les activables d'installation et de contrôle et l'extension HUD. Les défauts utilisés ici (maxAngle des cordes de soutien 22.5) diffèrent du schéma (15). |
| `YarderTower:onLoadEnd(savegame: table)` | 560 | ✍ Depuis la sauvegarde, restaure l'état actif, la position du chariot, la cible de la corde principale et les données d'arbres attachés, et réactive la cible sans envoyer d'événement. |
| `YarderTower:onPreDelete()` | 582 | ✍ Désactive la cible du yarder avant la suppression si la corde principale est active, afin de nettoyer chariot et enregistrements. |
| `YarderTower:onDelete()` | 591 | ✍ Retire l'extension HUD, le déclencheur de contrôle, les requêtes i3d partagées, crochets, sons, effets moteur et les deux activables. |
| `YarderTower:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 644 | ✍ Sauvegarde l'état actif de la corde principale, la position du chariot et les coordonnées de la cible, et demande au véhicule chariot de sauvegarder ses arbres attachés. |
| `YarderTower:onReadStream(streamId: integer, connection: Connection)` | 663 | ✍ Client à la connexion : lit l'état du mode de suivi et, si la corde est active, la position de la cible, puis active la cible localement. |
| `YarderTower:onWriteStream(streamId: integer, connection: Connection)` | 681 | ✍ Serveur à la connexion : écrit l'état du mode de suivi, l'indicateur de corde active et, si active, la position de la cible. |
| `YarderTower:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 693 | ✍ Côté serveur : lit les directions d'entrée de déplacement et de levage du chariot envoyées par un client (stockées en signe + 1). |
| `YarderTower:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 704 | ✍ Côté client : si le dirty flag est actif, écrit le signe de la dernière entrée de déplacement et de levage pour le serveur. |
| `YarderTower:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 717 | ✍ Grosse mise à jour par frame. En mode installation : raycast vers un arbre, validation du placement de la corde principale, sons et couleur de la corde. Quand la corde principale est active : le serveur déplace le chariot le long de la corde avec accélération et modes de suivi, peut démarrer le moteur du véhicule porteur et alimenter la charge PTO, place le véhicule chariot ; tous les côtés mettent à jour cordes, sons du chariot, HUD et son/effets du moteur. La condition sur `updateRopesDirtyTime` est toujours vraie à cause d'un `or true`. |
| `YarderTower:onYarderCarriageTreeAttached(treeId: any)` | 1099 | ✍ Gestionnaire d'événement : mémorise la position actuelle du chariot comme position de prise pour le mode de suivi et rafraîchit les textes d'actions de contrôle. |
| `YarderTower:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 1107 | ✍ Après l'attelage de la tour à un véhicule, enregistre sur le véhicule racine une fonction qui interdit la conduite tant que le yarder est installé. |
| `YarderTower:onHookI3DLoaded(i3dNode: any, failedReason: any, hookData: any)` | 1116 | ✍ Callback du chargement i3d partagé d'un crochet : lie le premier enfant au noeud racine, le masque et le stocke dans les données du crochet, puis supprime l'i3d chargé. |
| `YarderTower:onRopeI3DLoaded(i3dNode: any, failedReason: any, ropeData: any)` | 1131 | ✍ Callback du chargement d'un i3d de corde : lie la shape de corde trouvée via le chemin configuré au noeud de la corde (ou à la racine du véhicule), la masque et la stocke, puis supprime l'i3d chargé. |
| `YarderTower:getIsSetupModeChangeAllowed()` | 1147 | ✍ Retourne true si le mode installation peut être activé ou quitté ; à l'entrée il exige l'outil abaissé et déplié dans les limites si configuré. Sinon retourne false et un texte d'avertissement. |
| `YarderTower:setYarderSetupModeState(state: any, canceled: any)` | 1171 | ✍ Active, désactive ou inverse le mode installation : joue les sons de début/annulation, désactive la cible existante et affiche ou masque la corde d'installation ; retire l'activable d'installation à la sortie si le joueur est hors du déclencheur. |
| `YarderTower:setYarderTargetActive(state: any, noEventSend: any)` | 1199 | ✍ Active ou retire l'ancrage de la corde principale. L'activation monte les crochets sur l'arbre cible, s'enregistre auprès de g_splitShapeManager, installe les cordes de soutien, rend les composants de la tour cinématiques et (serveur) charge le véhicule chariot ; la désactivation inverse tout et supprime le chariot. Envoie YarderTowerSetTargetEvent sauf si `noEventSend`. |
| `YarderTower:setYarderCarriageFollowMode(state: any, connection: any, noEventSend: any)` | 1333 | ✍ Définit le mode de suivi du chariot (aucun, suivre le joueur, position de prise ou retour ; constantes définies ailleurs, NON VÉRIFIÉ ici). Sur le serveur il mémorise le joueur demandeur et écoute sa suppression ; envoie YarderTowerFollowModeEvent sauf si `noEventSend`. |
| `YarderTower:setYarderCarriageMoveInput(direction: any)` | 1375 | ✍ Mémorise une direction de déplacement avec son horodatage (annule tout mode de suivi) et lève le dirty flag pour que l'entrée parvienne au serveur. |
| `YarderTower:setYarderCarriageLiftInput(direction: any)` | 1392 | ✍ Mémorise une direction de levage avec son horodatage et lève le dirty flag pour que l'entrée parvienne au serveur. |
| `YarderTower:onYarderCarriageAttach()` | 1405 | ✍ Transmet l'action d'attache d'arbre au véhicule chariot. Provoque une erreur s'il n'y a pas de chariot. |
| `YarderTower:onYarderCarriageDetach()` | 1411 | ✍ Transmet l'action de détache d'arbre au véhicule chariot. Provoque une erreur s'il n'y a pas de chariot. |
| `YarderTower:setupSupportRopes()` | 1417 | ✍ Trouve les arbres autour du noeud central par un overlap sphérique, attribue à chaque corde de soutien le meilleur arbre selon le plus petit angle (en résolvant les conflits) et, pour les cordes sans arbre, lance un raycast asynchrone pour ancrer un crochet au sol. |
| `YarderTower:onCreateCarriageFinished(vehicles: any, vehicleLoadState: any, arguments: any)` | 1546 | ✍ Callback après le chargement du véhicule chariot : en cas de succès le mémorise, le lie à la tour, écoute sa suppression et le retire de la physique jusqu'à son placement ; sinon journalise une erreur. |
| `YarderTower:onCarriageVehicleDeleted(rope: any, state: any)` | 1563 | ✍ Écouteur de suppression : efface la référence au véhicule chariot et l'indicateur de présence à portée. |
| `YarderTower:setYarderRopeState(rope: any, state: any)` | 1571 | ✍ Affiche ou masque une corde : définit son indicateur actif, la visibilité de son noeud et ses object changes ; en masquant, réinitialise son noeud de rotation, supprime son crochet et remet à zéro les noeuds pilotés par la longueur. |
| `YarderTower:updateYarderRope(rope: any, tx: any, ty: any, tz: any, dt: any, isSupportRope: any, emissiveColor: any)` | 1600 | ✍ Oriente une corde de son noeud de départ vers un point cible, met à jour ses paramètres de shader de longueur/courbure, sa sphère englobante et ses noeuds pilotés par la longueur, seulement si la longueur a changé. Retourne l'affaissement utilisé. |
| `YarderTower:updateYarderRopeLengthNodes(rope: any, length: any)` | 1643 | ✍ Interpole rotation, translation, échelle et paramètre de shader des noeuds pilotés par la longueur de la corde entre leurs réglages min et max selon la longueur de la corde. |
| `YarderTower:getTreeAtPosition(x: any, y: any, z: any, maxRadius: any)` | 1676 | ✍ Cherche une split shape (arbre) près d'une position monde avec `findSplitShape` du moteur et retourne son id (nil ou 0 si aucune). |
| `YarderTower:getIsPlayerInYarderRange()` | 1686 | ✍ Retourne true si la ferme du joueur local possède la tour et si le joueur est dans le déclencheur de contrôle ou en mode installation. |
| `YarderTower:getIsPlayerInYarderControlRange(x: any, y: any, z: any)` | 1698 | ✍ Retourne si une position (par défaut le joueur local) se trouve à moins de la distance maximale de contrôle de la ligne de la corde principale, ainsi que la distance. Retourne false si le joueur est dans le déclencheur d'installation ou pour une autre ferme. |
| `YarderTower:getYarderIsSetUp()` | 1728 | ✍ Retourne true quand le véhicule chariot existe, c'est-à-dire quand le yarder est installé. |
| `YarderTower:getYarderStatusInfo()` | 1734 | ✍ Retourne l'état pour le HUD : joueur disponible, chariot chargé d'arbres, position du joueur le long de la corde, position du chariot, mode de suivi, si le joueur local est suivi et position cible (le cas échéant). |
| `YarderTower:getYarderMainRopeLength()` | 1762 | ✍ Retourne la distance entre le départ de la corde principale et sa cible, ou 0 s'il n'y a pas de cible valide. |
| `YarderTower:getYarderCarriageLastSpeed()` | 1776 | ✍ Retourne la dernière vitesse mesurée du chariot sous forme de fraction de 0 à 1 de la vitesse maximale. |
| `YarderTower:getIsTreeShapeUsedForYarderSetup(shape: any)` | 1783 | ✍ Retourne true si la shape d'arbre donnée porte la corde principale ou l'une des cordes de soutien. |
| `YarderTower:onYarderControlTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 1806 | ✍ Callback de déclencheur : quand le joueur local entre ou sort du déclencheur de contrôle, met à jour l'indicateur de portée et ajoute ou retire l'activable d'installation. |
| `YarderTower:onYarderTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1825 | ✍ Callback du raycast d'installation : conserve le premier arbre non fendu touché et sa hauteur comme arbre visé, sinon l'efface. |
| `YarderTower:doRopePlacementValidation(ropeNode: any, treeId: any, ex: any, ey: any, ez: any, maxAngle: any, maxLength: any, clearance: any, minTreeDiameter: any, callbackData: any)` | 1845 | ✍ Valide une cible de corde principale : règle de hauteur (montée), angle, diamètre de l'arbre et limites de longueur, puis lance un raycast asynchrone pour vérifier que le trajet est dégagé. Le résultat est transmis à la fonction des données de callback avec une raison d'échec. |
| `YarderTower.onYarderMainTreeRaycastCallback(callbackData: any, hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1884 | ✍ Callback du raycast de vérification du trajet : toute collision signifie que le chemin est bloqué ; atteindre le dernier résultat sans collision indique un succès. |
| `YarderTower:onMainRopePlacementValidated(isValid: any, x: any, y: any, z: any, reason: any)` | 1898 | ✍ Reçoit le résultat de validation : pendant l'installation il mémorise validité et cible, et affiche un avertissement clignotant pour trop long, mauvais angle, arbre trop petit, chemin bloqué ou placement non montant. |
| `YarderTower.onYarderSupportTerrainRaycastCallback(supportRope: any, hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1928 | ✍ Callback de raycast des cordes de soutien : sur un impact avec le terrain il crée un crochet au sol à ce point, joue le son de fixation au sol et active la corde ; sans impact au dernier résultat il désactive la corde. |
| `YarderTower:onSupportRopeTreeOverlapCallback(objectId: any, ...: any)` | 1957 | ✍ Callback d'overlap : collecte les arbres trouvés pour les cordes de soutien, en excluant l'arbre utilisé par la corde principale. |
| `YarderTower:onYarderTowerPlayerDeleted()` | 1966 | ✍ Écouteur de suppression du joueur suivi : remet le mode de suivi du chariot à aucun. |
| `YarderTower:isDetachAllowed(superFunc: any) → boolean` | 1974 | ✍ Interdit de détacher la tour de son porteur tant que la corde principale est active si la tour exige un véhicule porteur (retourne false et un avertissement) ; sinon délègue au parent. |
| `YarderTower:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1990 | ✍ Retourne false tant que la corde principale est active ; sinon délègue au parent. |
| `YarderTower:getAllowsLowering(superFunc: any)` | 2001 | ✍ Retourne false tant que la corde principale est active ; sinon délègue au parent. |
| `YarderTower:getDoConsumePtoPower(superFunc: any) → boolean` | 2013 | ✍ Retourne true tant que la corde principale est active, sinon la valeur parente. |
| `YarderTower:getConsumingLoad(superFunc: any)` | 2024 | ✍ Ajoute une entrée de charge au résultat parent quand actif : 5 % de base plus jusqu'à 95 % selon la dernière vitesse du chariot. |
| `YarderTower:getIsPowerTakeOffActive(superFunc: any)` | 2038 | ✍ Retourne true quand la corde principale est active et que le moteur du véhicule porteur tourne ; sinon la valeur parente. |
| `YarderTower:getDirtMultiplier(superFunc: any) → number` | 2056 | ✍ Ajoute une contribution de salissure de travail proportionnelle à la vitesse du chariot tant que la corde principale est active. |
| `YarderTower:getWearMultiplier(superFunc: any) → number` | 2070 | ✍ Ajoute une contribution d'usure de travail proportionnelle à la vitesse du chariot tant que la corde principale est active. |
| `YarderTower:getUsageCausesDamage(superFunc: any)` | 2083 | ✍ Quand actif, retourne true seulement si le chariot a bougé récemment et que le véhicule n'est pas un véhicule de mission ; sinon délègue au parent. |
| `YarderTower:addToPhysics(superFunc: any)` | 2094 | ✍ Appelle le parent et, si la corde principale est active, passe chaque composant en corps rigide cinématique. |
| `YarderTower:removeFromPhysics(superFunc: any)` | 2114 | ✍ Si la corde principale est active, rétablit des corps rigides dynamiques sur tous les composants, puis appelle le parent. |
| `YarderTower.getIsVehicleControlAllowed(self: any)` | 2135 | ✍ Fonction enregistrée sur le véhicule racine : retourne false avec un texte d'avertissement tant que la corde du yarder est active, empêchant de conduire le porteur. |
| `YarderTower.loadSpecValueMaxLength(xmlFile: any, customEnvironment: any, baseDir: any)` | 2146 | ✍ Chargeur de spec de boutique : lit le `maxLength` de la corde principale dans le XML du véhicule. |
| `YarderTower.getSpecValueMaxLength(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2152 | ✍ Formateur de spec de boutique : retourne la longueur maximale de corde en mètres sous forme de texte, ou la valeur brute (et la plage) selon les indicateurs ; rien si la valeur est 0. |
| `YarderTower.loadSpecValueMaxMass(xmlFile: any, customEnvironment: any, baseDir: any)` | 2168 | ✍ Chargeur de spec de boutique : lit le `maxTreeMass` du chariot dans le XML du véhicule. |
| `YarderTower.getSpecValueMaxMass(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2174 | ✍ Formateur de spec de boutique : retourne la masse maximale d'arbre en tonnes avec une décimale sous forme de texte, ou la valeur brute (et la plage) selon les indicateurs ; rien si la valeur est 0. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onYarderCarriageTreeAttached` | 177 |
| registerFunction | `onHookI3DLoaded` | 183 |
| registerFunction | `onRopeI3DLoaded` | 184 |
| registerFunction | `getIsSetupModeChangeAllowed` | 185 |
| registerFunction | `setYarderSetupModeState` | 186 |
| registerFunction | `setYarderTargetActive` | 187 |
| registerFunction | `setYarderCarriageFollowMode` | 188 |
| registerFunction | `setYarderCarriageMoveInput` | 189 |
| registerFunction | `setYarderCarriageLiftInput` | 190 |
| registerFunction | `onYarderCarriageAttach` | 191 |
| registerFunction | `onYarderCarriageDetach` | 192 |
| registerFunction | `setupSupportRopes` | 193 |
| registerFunction | `onCreateCarriageFinished` | 194 |
| registerFunction | `onCarriageVehicleDeleted` | 195 |
| registerFunction | `setYarderRopeState` | 196 |
| registerFunction | `updateYarderRope` | 197 |
| registerFunction | `updateYarderRopeLengthNodes` | 198 |
| registerFunction | `getTreeAtPosition` | 199 |
| registerFunction | `getIsPlayerInYarderRange` | 200 |
| registerFunction | `getIsPlayerInYarderControlRange` | 201 |
| registerFunction | `getYarderIsSetUp` | 202 |
| registerFunction | `getYarderStatusInfo` | 203 |
| registerFunction | `getYarderMainRopeLength` | 204 |
| registerFunction | `getYarderCarriageLastSpeed` | 205 |
| registerFunction | `getIsTreeShapeUsedForYarderSetup` | 206 |
| registerFunction | `onYarderControlTriggerCallback` | 207 |
| registerFunction | `onYarderTreeRaycastCallback` | 208 |
| registerFunction | `doRopePlacementValidation` | 209 |
| registerFunction | `onMainRopePlacementValidated` | 210 |
| registerFunction | `onYarderSupportTerrainRaycastCallback` | 211 |
| registerFunction | `onSupportRopeTreeOverlapCallback` | 212 |
| registerFunction | `onYarderTowerPlayerDeleted` | 213 |
| registerOverwrittenFunction | `isDetachAllowed` | 219 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 220 |
| registerOverwrittenFunction | `getAllowsLowering` | 221 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 222 |
| registerOverwrittenFunction | `getConsumingLoad` | 223 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 224 |
| registerOverwrittenFunction | `getDirtMultiplier` | 225 |
| registerOverwrittenFunction | `getWearMultiplier` | 226 |
| registerOverwrittenFunction | `getUsageCausesDamage` | 227 |
| registerOverwrittenFunction | `addToPhysics` | 228 |
| registerOverwrittenFunction | `removeFromPhysics` | 229 |
| registerEventListener | `onLoad` | 235 |
| registerEventListener | `onLoadEnd` | 236 |
| registerEventListener | `onPreDelete` | 237 |
| registerEventListener | `onDelete` | 238 |
| registerEventListener | `onReadStream` | 239 |
| registerEventListener | `onWriteStream` | 240 |
| registerEventListener | `onReadUpdateStream` | 241 |
| registerEventListener | `onWriteUpdateStream` | 242 |
| registerEventListener | `onUpdate` | 243 |
| registerEventListener | `onYarderCarriageTreeAttached` | 244 |
| registerEventListener | `onPostAttach` | 245 |
