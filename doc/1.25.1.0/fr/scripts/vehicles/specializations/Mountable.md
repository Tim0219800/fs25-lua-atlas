# vehicles/specializations/Mountable.lua

*[English version](../../../../scripts/vehicles/specializations/Mountable.md)*

Source: `dataS/scripts/vehicles/specializations/Mountable.lua` — FS25 1.25.1.0

✍ Spécialisation des objets pouvant être montés sur un autre objet : de façon cinématique ou par défaut (liés dans le graphe de scène), ou dynamique via un joint physique (par exemple sur une fourche). Aucun prérequis. Elle garde le type de montage et l'objet porteur, déclenche onDynamicMountTypeChanged, synchronise le type via MountableSetMountTypeEvent et délègue le travail de joint à DynamicMountUtil (absent du dump, NON VÉRIFIÉ). L'essentiel de la logique tourne côté serveur.

- **Mountable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Mountable.prerequisitesPresent(specializations: any)` | 20 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `Mountable.initSpecialization()` | 26 | ✍ Enregistre les chemins XML sous vehicle.dynamicMount : échelle de limite de force, nœuds de trigger et de joint, accélération de force du trigger, axes libres, pliage, décalages de joint, distance de montage supplémentaire, réduction de masse et entrées lockPosition. |
| `Mountable.registerEvents(vehicleType: any)` | 56 | ✍ Déclare l'événement onDynamicMountTypeChanged pour le type de véhicule. |
| `Mountable.registerFunctions(vehicleType: any)` | 62 | ✍ Enregistre les fonctions de montage et démontage (défaut, cinématique, dynamique), les requêtes de type de montage, la gestion de masse, les écouteurs et les aides de raycast pour la limite de force. |
| `Mountable.registerOverwrittenFunctions(vehicleType: any)` | 90 | ✍ Surcharge getIsActive, getOwnerConnection, findRootVehicle, la visibilité du hotspot de carte, la masse supplémentaire du composant, setWorldPositionQuaternion, addToPhysics, removeFromPhysics et getIsFoldAllowed. À noter : Mountable.addToPhysics et Mountable.removeFromPhysics sont enregistrées ici mais non définies dans ce fichier. |
| `Mountable.registerEventListeners(vehicleType: any)` | 104 | ✍ S'abonne aux événements de chargement, suppression, lecture/écriture de flux, mise à jour et pré-attache. |
| `Mountable:onLoad(savegame: any)` | 115 | ✍ Lit le XML dynamicMount. Côté serveur, enregistre le trigger de montage et crée un nœud de joint dynamique sous le composant. Initialise aussi l'état de mise à jour de la limite de force, l'indicateur de réduction de masse, les positions de verrouillage et le type de montage NONE. |
| `Mountable:onDelete()` | 190 | ✍ Prévient l'objet porteur, supprime le joint dynamique et son rapport de rupture, retire cet objet de la liste dynamique du porteur et supprime le trigger. |
| `Mountable:onReadStream(streamId: any, connection: any)` | 212 | ✍ Client à la connexion : lit le type de montage dans le flux et l'applique sans envoyer d'événement. |
| `Mountable:onWriteStream(streamId: any, connection: any)` | 218 | ✍ Serveur à la connexion : écrit le type de montage. À noter : il lit spec_mountable.dynamicMountType alors que le type est stocké sur le véhicule (self.dynamicMountType), donc le champ de la spec semble jamais renseigné. |
| `Mountable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 224 | ✍ Serveur uniquement : démonte dynamiquement quand le trigger de montage n'a plus de chevauchement (en attendant que l'objet se soit dégagé de la référence du joint), et rafraîchit la limite de force du joint si autorisé. |
| `Mountable:getSupportsMountDynamic()` | 253 | ✍ Retourne true si une échelle de limite de force est définie, ce qui est le cas par défaut (valeur 1) sauf surcharge XML. |
| `Mountable:getSupportsMountKinematic()` | 260 | ✍ Retourne true uniquement pour les véhicules à un seul composant. |
| `Mountable:onDynamicMountJointBreak(jointIndex: any, breakingImpulse: any)` | 266 | ✍ Callback de rupture de joint : démonte dynamiquement si le joint cassé est le joint de montage et retourne false pour que le moteur ne supprime pas lui-même le joint. |
| `Mountable:mountableTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 278 | ✍ Callback de trigger serveur : quand un objet avec un attacheur de montage dynamique entre, monte dynamiquement en type fourche (ou remonte sur un nouvel acteur) et compte les formes en chevauchement ; à la sortie, décrémente et démonte à zéro s'il n'y a pas de nœud de joint. |
| `Mountable:mount(object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 318 | ✍ Montage par défaut : annule tout montage dynamique, retire le composant de la physique s'il était libre, le lie au nœud cible au décalage donné et fixe le type DEFAULT. |
| `Mountable:unmount(noEventSend: any)` | 339 | ✍ Annule un montage DEFAULT : prévient l'objet porteur, relie le composant à la racine en gardant la pose monde, réactive la physique et fixe le type NONE. Retourne true si le montage était DEFAULT, false sinon. |
| `Mountable:mountKinematic(object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 366 | ✍ Montage cinématique : lie le composant au nœud, rend le corps rigide cinématique côté serveur et désactive la collision avec le composant dynamique de l'objet porteur. Fixe le type KINEMATIC. |
| `Mountable:unmountKinematic()` | 403 | ✍ Annule un montage cinématique : rétablit la collision, prévient l'objet porteur, relie à la racine en gardant la pose monde et rend le corps de nouveau dynamique côté serveur. Retourne true s'il était monté en cinématique. |
| `Mountable:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 447 | ✍ Tente un montage par joint physique via DynamicMountUtil (détails NON VÉRIFIÉS). Refuse si déjà monté, si les deux partagent le même véhicule racine, ou si un joint latéral serait trop incliné. Retourne true et fixe le type DYNAMIC en cas de succès. |
| `Mountable:unmountDynamic(isDelete: any)` | 530 | ✍ Remet le type de montage à NONE, prévient l'objet porteur et demande à DynamicMountUtil de supprimer le joint ; le paramètre optionnel indique une suppression. |
| `Mountable:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 568 | ✍ Bloque le pliage avec un message d'avertissement tant que l'objet est monté, sauf si le XML l'autorise ; sinon délègue au parent. |
| `Mountable:getAdditionalMountingDistance()` | 578 | ✍ Retourne la distance de montage supplémentaire configurée (hauteur de l'objet, utilisée pour compter les objets empilés). |
| `Mountable:getAdditionalMountingMass()` | 584 | ✍ Retourne toujours 0 ; fonction conservée vide par compatibilité. |
| `Mountable:updateDynamicMountJointForceLimit(dt: any)` | 590 | ✍ Lance périodiquement un raycast asynchrone vers le haut sur les objets dynamiques pour trouver ceux empilés sur celui-ci ; le résultat ajuste la limite de force du joint via le callback. |
| `Mountable:additionalMountingMassRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 623 | ✍ Callback de raycast : ajoute la masse de chaque véhicule empilé trouvé à l'espacement attendu et, au dernier impact, fixe la limite de force de l'entraînement linéaire du joint selon la masse totale rapportée à la masse de base. Retourne true pour continuer. |
| `Mountable:getIsActive(superFunc: any)` | 658 | ✍ Retourne true si le véhicule est actif ou si l'objet sur lequel il est monté est actif. |
| `Mountable:getMountObject()` | 671 | ✍ Retourne l'objet porteur pour les montages non dynamiques (défaut ou cinématique) ; retourne nil pour un montage dynamique ou s'il n'est pas monté. |
| `Mountable:getDynamicMountObject()` | 681 | ✍ Résout l'identifiant réseau mémorisé en objet porteur, quel que soit le type de montage, ou nil. |
| `Mountable:setReducedComponentMass(state: any)` | 691 | ✍ Active ou désactive l'indicateur de masse réduite si la réduction est autorisée, et marque la masse comme modifiée en cas de changement. Retourne si la réduction est autorisée. |
| `Mountable:getAllowComponentMassReduction()` | 707 | ✍ Retourne si l'objet porteur peut réduire la masse de ce composant. |
| `Mountable:getDefaultAllowComponentMassReduction()` | 713 | ✍ Valeur par défaut de la réduction de masse quand le XML ne la définit pas : false. |
| `Mountable:getMountableLockPositions()` | 719 | ✍ Retourne la table des positions de verrouillage chargées depuis le XML (xmlFilename, nœud de joint, décalages). |
| `Mountable:setDynamicMountType(mountType: any, mountObject: any, noEventSend: any)` | 725 | ✍ Change le type de montage et l'identifiant de l'objet porteur ; en cas de changement, réinitialise la masse réduite pour NONE, appelle les écouteurs, déclenche onDynamicMountTypeChanged et envoie MountableSetMountTypeEvent sauf si supprimé. |
| `Mountable:addMountStateChangeListener(object: any, callbackFunc: any)` | 756 | ✍ Ajoute un écouteur d'état de montage (objet et nom de méthode ou fonction, nom par défaut onObjectMountStateChanged) ; les doublons sont ignorés. |
| `Mountable:removeMountStateChangeListener(object: any, callbackFunc: any)` | 773 | ✍ Retire un écouteur d'état de montage ajouté précédemment, identifié par l'objet et le callback. |
| `Mountable:getOwnerConnection(superFunc: any)` | 793 | ✍ Retourne la connexion propriétaire de l'objet porteur (non dynamique) s'il en a une, sinon le résultat du parent. |
| `Mountable:findRootVehicle(superFunc: any)` | 806 | ✍ Si le véhicule n'a pas de racine d'attache propre, suit l'objet porteur pour trouver son véhicule racine ; sinon retourne lui-même. |
| `Mountable:getIsMapHotspotVisible(superFunc: any)` | 824 | ✍ Masque le hotspot de carte tant que l'objet est monté sur un autre objet, sinon utilise la réponse du parent. |
| `Mountable:getAdditionalComponentMass(superFunc: any, component: any)` | 838 | ✍ Quand la masse réduite est active, retourne un ajustement qui ne laisse au composant qu'environ 0,1 de masse ; sinon la valeur du parent. |
| `Mountable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 860 | ✍ Sur les clients, ignore les positions monde reçues tant qu'un objet porteur non dynamique existe, car la pose suit le porteur ; sinon délègue au parent. |
| `Mountable:onPreAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 878 | ✍ Avant d'être attaché comme outil, abandonne tout montage dynamique. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onDynamicMountTypeChanged` | 57 |
| registerFunction | `getSupportsMountDynamic` | 63 |
| registerFunction | `getSupportsMountKinematic` | 64 |
| registerFunction | `onDynamicMountJointBreak` | 65 |
| registerFunction | `mountableTriggerCallback` | 66 |
| registerFunction | `mount` | 67 |
| registerFunction | `unmount` | 68 |
| registerFunction | `mountKinematic` | 69 |
| registerFunction | `unmountKinematic` | 70 |
| registerFunction | `mountDynamic` | 71 |
| registerFunction | `unmountDynamic` | 72 |
| registerFunction | `getAdditionalMountingDistance` | 73 |
| registerFunction | `getAdditionalMountingMass` | 74 |
| registerFunction | `updateDynamicMountJointForceLimit` | 75 |
| registerFunction | `additionalMountingMassRaycastCallback` | 76 |
| registerFunction | `getMountObject` | 77 |
| registerFunction | `getDynamicMountObject` | 78 |
| registerFunction | `setReducedComponentMass` | 79 |
| registerFunction | `getAllowComponentMassReduction` | 80 |
| registerFunction | `getDefaultAllowComponentMassReduction` | 81 |
| registerFunction | `getMountableLockPositions` | 82 |
| registerFunction | `setDynamicMountType` | 83 |
| registerFunction | `addMountStateChangeListener` | 84 |
| registerFunction | `removeMountStateChangeListener` | 85 |
| registerOverwrittenFunction | `getIsActive` | 91 |
| registerOverwrittenFunction | `getOwnerConnection` | 92 |
| registerOverwrittenFunction | `findRootVehicle` | 93 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 94 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 95 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 96 |
| registerOverwrittenFunction | `addToPhysics` | 97 |
| registerOverwrittenFunction | `removeFromPhysics` | 98 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 99 |
| registerEventListener | `onLoad` | 105 |
| registerEventListener | `onDelete` | 106 |
| registerEventListener | `onReadStream` | 107 |
| registerEventListener | `onWriteStream` | 108 |
| registerEventListener | `onUpdate` | 109 |
| registerEventListener | `onPreAttach` | 110 |
