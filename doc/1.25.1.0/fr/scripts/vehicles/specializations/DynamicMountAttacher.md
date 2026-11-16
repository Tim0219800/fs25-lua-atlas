# vehicles/specializations/DynamicMountAttacher.lua

*[English version](../../../../scripts/vehicles/specializations/DynamicMountAttacher.md)*

Source: `dataS/scripts/vehicles/specializations/DynamicMountAttacher.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule sans prérequis qui permet à un véhicule de saisir automatiquement des objets libres (balles, palettes, véhicules montables comme les remorques de coupe) via un trigger et un joint physique, sans point d'attelage classique. Les objets restent en attente jusqu'à ce qu'ils soient immobiles un certain temps, puis sont montés ; des positions de verrouillage optionnelles calent des véhicules connus à des emplacements fixes. Le serveur effectue le montage et envoie aux clients les listes d'objets montés et en attente via le flux de mise à jour ; configurée sous vehicle.dynamicMountAttacher dans le XML.

- **DynamicMountAttacher** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DynamicMountAttacher.prerequisitesPresent(specializations: any)` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `DynamicMountAttacher.initSpecialization()` | 23 | ✍ Enregistre dans le schéma XML les clés sous vehicle.dynamicMountAttacher (nœud, trigger, joint, types de montage, fourches, pince, positions de verrouillage, animation, repliage) ainsi que les entrées dynamicMountAttacher des outils et pièces mobiles de Cylindered. |
| `DynamicMountAttacher.registerFunctions(vehicleType: any)` | 81 | ✍ Enregistre les fonctions de niveau véhicule de cette spécialisation (chargement des positions de verrouillage, montage/démontage, lecture/écriture de flux, état de la pince, montage/démontage forcés, rappels de trigger et de chevauchement). |
| `DynamicMountAttacher.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Surcharge getFillLevelInformation, loadExtraDependentParts, updateExtraDependentParts, getIsAttachedTo, getAdditionalComponentMass, getIsFoldAllowed, loadMovingToolFromXML et getIsMovingToolActive. À noter : getHasObjectMounted est définie dans le fichier mais n'est pas enregistrée ici. |
| `DynamicMountAttacher.registerEventListeners(vehicleType: any)` | 119 | ✍ S'abonne à onLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdateTick et onPreAttachImplement. |
| `DynamicMountAttacher:onLoad(savegame: any)` | 130 | ✍ Lit les réglages XML ; sur le serveur, charge aussi les nœuds de fourche (en contrôlant leur groupe de collision), le trigger de montage avec ses contrôles de masque de collision, l'option de transfert de masse et les positions de verrouillage. Démarre l'animation optionnelle et crée le drapeau de modification pour les listes d'objets montés. |
| `DynamicMountAttacher:onDelete()` | 235 | ✍ Sur le serveur, démonte tous les objets montés ; puis retire le trigger de montage et son enregistrement nœud-vers-objet. |
| `DynamicMountAttacher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 252 | ✍ Côté client : quand le bit de modification est présent, lit les objets montés et en attente, et met à jour l'état d'animation de montage selon qu'un objet est monté ou non. |
| `DynamicMountAttacher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 267 | ✍ Côté serveur : quand le drapeau de modification des listes d'objets est actif, écrit les objets montés et les objets en attente dans le flux. |
| `DynamicMountAttacher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 280 | ✍ Serveur uniquement. Quand le montage est autorisé, monte les objets en attente une fois immobiles pendant le délai de montage (via mountDynamic et un nœud de joint), écarte ceux qui ne peuvent pas l'être, et démonte tous les objets si le montage devient interdit. Change aussi les limites du joint quand la pince s'ouvre ou se ferme. |
| `DynamicMountAttacher:lockDynamicMountedObject(object: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 406 | ✍ Démonte l'objet, le déplace à la position et à la rotation monde données (en le retirant puis le rajoutant à la physique) et le remonte sur le joint du trigger. Renvoie false et retire l'objet de la liste des montés si le montage échoue. |
| `DynamicMountAttacher:addDynamicMountedObject(object: any)` | 430 | ✍ Enregistre un objet comme monté : tente de le caler sur une position de verrouillage (celles de l'objet ou celles correspondantes de ce véhicule, avec un test de collision par boîte de chevauchement optionnel), applique le transfert de masse, désactive les collisions entre objets montés si configuré, lance l'animation et signale une mise à jour réseau. |
| `DynamicMountAttacher:removeDynamicMountedObject(object: any, isDeleting: any)` | 535 | ✍ Retire un objet de la liste des montés (et de celle des en attente s'il est supprimé), libère sa position de verrouillage et ses changements d'objets, rétablit les collisions entre paires, inverse l'animation et signale une mise à jour réseau. |
| `DynamicMountAttacher:onUnmountObject(object: any)` | 576 | ✍ Rappel utilisé quand un objet est démonté de l'extérieur : le retire de la liste des montés s'il y figurait. |
| `DynamicMountAttacher:setDynamicMountAnimationState(state: any)` | 585 | ✍ Joue l'animation configurée vers l'avant (true) ou l'arrière (false) depuis son temps courant. Le code ne protège pas ici contre un nom d'animation absent (tolérance de playAnimation envers nil NON VÉRIFIÉE). |
| `DynamicMountAttacher:loadDynamicLockPositionFromXML(xmlFile: any, key: any, lockPosition: any)` | 597 | ✍ Charge une position de verrouillage : xmlFilename (avec $data remplacé), nœud de joint, filtres de configuration optionnels, largeur/longueur/hauteur optionnelles pour les tests de collision et changements d'objets. Renvoie false avec un avertissement si le nom de fichier ou le nœud de joint manque. |
| `DynamicMountAttacher:getIsDynamicLockPositionActive(lockPosition: any)` | 635 | ✍ Renvoie true quand la position de verrouillage donnée est libre (elle ne tient aucun objet). |
| `DynamicMountAttacher:writeDynamicMountObjectsToStream(streamId: any, objects: any)` | 641 | ✍ Écrit le nombre d'objets (plafonné par le nombre de bits configuré) puis chaque objet par identifiant réseau de nœud. Journalise un avertissement s'il y en a trop ; il faut alors augmenter numObjectBits. |
| `DynamicMountAttacher:readDynamicMountObjectsFromStream(streamId: any, objects: any)` | 659 | ✍ Vide la table donnée, lit le nombre et les objets depuis le flux et remplit à nouveau la table. Renvoie le nombre lu. |
| `DynamicMountAttacher:getAllowDynamicMountObjects()` | 679 | ✍ Renvoie true par défaut ; d'autres spécialisations la surchargent pour interdire le montage dans certains états. |
| `DynamicMountAttacher:dynamicMountTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 685 | ✍ Rappel de trigger. Pour les corps rigides dynamiques il compte les chevauchements : à l'entrée, les objets montables (balles, véhicules à sangles) passent en attente, en ignorant le véhicule racine et le véhicule d'attelage ; à la sortie, l'objet quitte l'attente et est démonté quand son compteur atteint zéro. Avec limitToKnownObjects, seuls les véhicules correspondant à une position libre sont retenus. |
| `DynamicMountAttacher:getAllowDynamicMountFillLevelInfo()` | 774 | ✍ Renvoie true par défaut : les niveaux de remplissage des objets montés sont inclus dans les informations de remplissage de ce véhicule. |
| `DynamicMountAttacher:loadDynamicMountGrabFromXML(xmlFile: any, key: any, entry: any)` | 780 | ✍ Remplit une entrée de pince depuis le XML : types de montage ouvert et fermé (fourche et auto-attache XYZ par défaut, via DynamicMountUtil) et type courant, initialisé à ouvert. Renvoie toujours true. |
| `DynamicMountAttacher:getIsDynamicMountGrabOpened(grab: any)` | 794 | ✍ Renvoie true par défaut (pince ouverte) ; destinée à être surchargée par les spécialisations qui implémentent une vraie pince. |
| `DynamicMountAttacher:getDynamicMountTimeToMount()` | 800 | ✍ Renvoie le délai en millisecondes pendant lequel un objet doit rester immobile avant d'être monté (timeToMount, 1000 par défaut). |
| `DynamicMountAttacher:getHasDynamicMountedObjects()` | 806 | ✍ Renvoie true si au moins un objet est actuellement monté. |
| `DynamicMountAttacher:forceDynamicMountPendingObjects(onlyBales: any)` | 812 | ✍ Si le montage est autorisé, monte immédiatement les objets en attente sans attendre le délai ; avec onlyBales, seuls les objets Bale sont concernés. |
| `DynamicMountAttacher:forceUnmountDynamicMountedObjects()` | 831 | ✍ Démonte tous les objets montés et supprime leur nœud de joint additionnel. |
| `DynamicMountAttacher:getDynamicMountAttacherSettingsByNode(node: any)` | 846 | ✍ Renvoie le type de montage et l'échelle de limite de force de la fourche configurée pour un nœud, ou le type fourche et 1 si aucune ne correspond. Les données de fourche n'existent que sur le serveur. |
| `DynamicMountAttacher:dynamicMountLockPositionOverlapCallback(transformId: any)` | 859 | ✍ Rappel de la boîte de chevauchement : lève un indicateur de collision quand le nœud touché appartient à un objet ou joueur connu autre que ce véhicule et le véhicule en cours de montage. |
| `DynamicMountAttacher:getFillLevelInformation(superFunc: any, display: any)` | 870 | ✍ Surcharge : après le parent, ajoute à l'affichage les niveaux de remplissage des objets montés, via leur propre getFillLevelInformation ou sinon type, niveau et capacité. Ignorée si getAllowDynamicMountFillLevelInfo renvoie false. |
| `DynamicMountAttacher:getHasObjectMounted(superFunc: table, object: table) → boolean` | 898 | ✍ Surcharge prévue : true si le parent le dit ou si l'objet est monté ici, directement ou via un objet monté. À noter : elle n'est pas enregistrée dans registerOverwrittenFunctions, elle n'est donc probablement pas appelée par la chaîne de surcharge (NON VÉRIFIÉ). |
| `DynamicMountAttacher:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 921 | ✍ Surcharge : après le chargement du parent, lit l'indicateur dynamicMountAttacher#value d'une pièce dépendante, qui indique si elle doit mettre à jour les joints de montage. |
| `DynamicMountAttacher:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 933 | ✍ Surcharge, serveur uniquement : pour les pièces marquées, remet le repère du joint de chaque objet monté sur son nœud de joint de montage. |
| `DynamicMountAttacher:getIsAttachedTo(superFunc: any, vehicle: any)` | 948 | ✍ Surcharge : renvoie aussi true quand le véhicule donné est monté ou en attente sur ce véhicule. |
| `DynamicMountAttacher:getAdditionalComponentMass(superFunc: any, component: any)` | 972 | ✍ Surcharge : quand transferMass est actif, ajoute la masse par défaut (moins 0,1) des objets montés qui acceptent la réduction de masse au composant portant le trigger. |
| `DynamicMountAttacher:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 992 | ✍ Surcharge : refuse le repliage avec l'avertissement « outil plein » si allowFoldingWhileMounted vaut false et qu'un objet est monté ; sinon délègue au parent. |
| `DynamicMountAttacher:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1004 | ✍ Surcharge : après le parent, lit dynamicMountAttacher#allowedMounted (true par défaut) pour l'outil mobile. |
| `DynamicMountAttacher:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1016 | ✍ Surcharge : un outil mobile non autorisé pendant le montage est inactif dès qu'un objet est monté ; sinon délègue au parent. |
| `DynamicMountAttacher:onPreAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 1028 | ✍ Serveur uniquement : quand ce véhicule va être attelé à un autre doté de cette spécialisation, le retire de la liste d'attente de ce dernier et le démonte s'il y était monté dynamiquement. |
| `DynamicMountAttacher:updateDebugValues(values: any)` | 1046 | ✍ Aide au débogage : ajoute à la liste des valeurs de débogage le temps de montage restant, les objets en attente et montés (avec infos de joint et un point de debug sur le serveur), l'état d'autorisation de montage et l'état de la pince. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadDynamicLockPositionFromXML` | 82 |
| registerFunction | `getIsDynamicLockPositionActive` | 83 |
| registerFunction | `writeDynamicMountObjectsToStream` | 84 |
| registerFunction | `readDynamicMountObjectsFromStream` | 85 |
| registerFunction | `getAllowDynamicMountObjects` | 86 |
| registerFunction | `dynamicMountTriggerCallback` | 87 |
| registerFunction | `lockDynamicMountedObject` | 88 |
| registerFunction | `addDynamicMountedObject` | 89 |
| registerFunction | `removeDynamicMountedObject` | 90 |
| registerFunction | `onUnmountObject` | 91 |
| registerFunction | `setDynamicMountAnimationState` | 92 |
| registerFunction | `getAllowDynamicMountFillLevelInfo` | 93 |
| registerFunction | `loadDynamicMountGrabFromXML` | 94 |
| registerFunction | `getIsDynamicMountGrabOpened` | 95 |
| registerFunction | `getDynamicMountTimeToMount` | 96 |
| registerFunction | `getHasDynamicMountedObjects` | 97 |
| registerFunction | `forceDynamicMountPendingObjects` | 98 |
| registerFunction | `forceUnmountDynamicMountedObjects` | 99 |
| registerFunction | `getDynamicMountAttacherSettingsByNode` | 100 |
| registerFunction | `dynamicMountLockPositionOverlapCallback` | 101 |
| registerOverwrittenFunction | `getFillLevelInformation` | 107 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 108 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 109 |
| registerOverwrittenFunction | `getIsAttachedTo` | 110 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 111 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 112 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 113 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 114 |
| registerEventListener | `onLoad` | 120 |
| registerEventListener | `onDelete` | 121 |
| registerEventListener | `onReadUpdateStream` | 122 |
| registerEventListener | `onWriteUpdateStream` | 123 |
| registerEventListener | `onUpdateTick` | 124 |
| registerEventListener | `onPreAttachImplement` | 125 |
