# vehicles/specializations/Attachable.lua

*[English version](../../../../scripts/vehicles/specializations/Attachable.md)*

Source: `dataS/scripts/vehicles/specializations/Attachable.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour tout outil ou remorque pouvant être attelé à un autre véhicule. Elle charge depuis le XML du véhicule les attaches d'entrée (côté outil de l'attelage), les béquilles, le comportement de l'essieu directeur, les caméras d'outil, les freins et l'animation de descente, puis garde le lien avec le véhicule porteur une fois attelé. Elle déclenche des événements comme onPreAttach, onPostAttach, onPreDetach, onPostDetach et onSetLowered, et surcharge de nombreuses fonctions de base de Vehicle pour qu'un outil attelé hérite de l'état de son tracteur (actif, alimenté, ferme, véhicule racine). Elle travaille avec la spécialisation AttacherJoints côté tracteur et enregistre les attaches auprès du système de véhicules. À noter : setIsDetachingBlocked et getCanImplementBeUsedForAI sont enregistrées ici mais aucun corps de fonction de ce nom n'existe dans ce dump, et les constantes comme les clés XML ne sont pas visibles (NON VÉRIFIÉ).

- **Attachable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Attachable.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Vérification des prérequis de la spécialisation. Retourne toujours true : Attachable peut être ajoutée à n'importe quel type de véhicule sans autre spécialisation requise. |
| `Attachable.registerEvents(vehicleType: any)` | 32 | ✍ Déclare les événements que cette spécialisation peut émettre : onPreAttach, onPostAttach, onPreDetach, onPostDetach, onSetLowered, onSetLoweredAll et onLeaveRootVehicle. |
| `Attachable.registerFunctions(vehicleType: any)` | 44 | ✍ Enregistre les nouvelles fonctions de véhicule ajoutées par cette spécialisation (accès aux attaches, processus de dételage, descente, essieu directeur, caméras d'outil, etc.). Elle cite aussi setIsDetachingBlocked, sans définition dans ce dump. |
| `Attachable.registerOverwrittenFunctions(vehicleType: any)` | 96 | ✍ Enregistre les fonctions de base de Vehicle que cette spécialisation enveloppe via superFunc, comme findRootVehicle, getIsActive, getBrakeForce, getIsLowered, addToPhysics et removeFromPhysics. L'entrée getCanImplementBeUsedForAI pointe vers une fonction absente de ce dump. |
| `Attachable.registerEventListeners(vehicleType: any)` | 130 | ✍ Abonne la spécialisation aux événements de cycle de vie et d'état du véhicule : chargement, suppression, flux réseau, mises à jour, sélection, changement d'état, changement de véhicule racine, état de pliage et enregistrement des types de valeurs d'animation. |
| `Attachable.initSpecialization()` | 153 | ✍ Enregistre le type de configuration inputAttacherJoint et déclare les chemins du schéma XML sous vehicle.attachable (attaches, force de freinage, air, essieu directeur, béquilles, animation de descente, caméras, sons) ainsi que deux attributs de sauvegarde (lowerAnimTime, isDetachingBlocked). |
| `Attachable.registerInputAttacherJointXMLPaths(schema: any, baseName: any)` | 258 | ✍ Déclare chaque attribut et élément XML d'une attache d'entrée sous la clé de base donnée : nœud, type d'attache, distances au sol, bras inférieurs, échelles de limites, ressorts, options de descente, attelage supplémentaire, etc. |
| `Attachable.registerSupportXMLPaths(schema: any, key: any)` | 350 | ✍ Déclare les attributs XML d'une animation de béquille : nom de l'animation, chargement différé, attelage différé, dételage après l'animation et instant de l'animation où le dételage a lieu. |
| `Attachable:onLoad(savegame: table)` | 363 | ✍ Lit le XML vehicle.attachable : animations de béquille, attaches d'entrée (y compris la configuration choisie), force de freinage, air, règles de pliage, besoin de puissance, essieu directeur et nœuds d'angle, animation de descente, caméras d'outil, sons côté client et textes. Signale aussi les clés XML obsolètes. |
| `Attachable:onPostLoad(savegame: table)` | 511 | ✍ Joue jusqu'à leur état final les animations de béquille non différées, applique la force de freinage si le véhicule a un frein, décide si l'essieu directeur doit être mis à jour, et retire les écouteurs de mise à jour quand le véhicule n'a aucune attache d'entrée. |
| `Attachable:onLoadFinished(savegame: table)` | 541 | ✍ Enregistre chaque attache d'entrée auprès du système de véhicules de la mission et conserve sur l'attache les informations retournées. |
| `Attachable:onPreInitComponentPlacement(savegame: table)` | 551 | ✍ Joue les animations de béquille différées, initialise les nœuds de référence du timon, et restaure depuis la sauvegarde le temps de l'animation de descente et l'état de dételage bloqué (ou applique l'état abaissé par défaut sans sauvegarde). |
| `Attachable:onPreDelete()` | 599 | ✍ Avant la suppression, dételle cet outil de son véhicule porteur s'il est attelé et désenregistre ses attaches d'entrée du système de véhicules. |
| `Attachable:onDelete()` | 619 | ✍ Libère les ressources : supprime les caméras d'outil, libère le fichier i3d partagé des rotules de bras inférieurs et supprime les échantillons sonores actifs. |
| `Attachable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 644 | ✍ Écrit dans le XML de sauvegarde le temps de l'animation de descente (si elle existe) et l'indicateur de dételage bloqué. |
| `Attachable:onReadStream(streamId: integer, connection: Connection)` | 658 | ✍ Côté client lors de la connexion : si le serveur indique que l'outil est attelé, lit le véhicule porteur, les indices d'attaches et l'état abaissé, puis rattache l'outil localement et applique l'état de descente de l'attache. |
| `Attachable:onWriteStream(streamId: integer, connection: Connection)` | 676 | ✍ Côté serveur lors de la connexion : écrit si l'outil est attelé et, le cas échéant, le véhicule porteur, les indices des attaches, l'état de descente et l'indice de l'outil. Miroir de onReadStream. |
| `Attachable:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 701 | ✍ Tant que l'outil est attelé, dans la distance de mise à jour du véhicule porteur et dans la même boucle de mise à jour, rafraîchit à chaque image les graphismes d'attache des deux véhicules. |
| `Attachable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 721 | ✍ Mise à jour à chaque image. Calcule l'angle de l'essieu directeur d'après le lacet par rapport au véhicule de base (dépendant de la vitesse, délai de distance optionnel), tourne le nœud cible, met à jour les nœuds d'angle de direction et termine un dételage en attente quand les animations de béquille sont finies. |
| `Attachable:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 829 | ✍ Met à jour dans le système de véhicules les informations de chaque attache d'entrée et, côté client, démarre ou arrête le son actif en boucle selon que la dernière vitesse du véhicule dépasse un petit seuil. |
| `Attachable:loadInputAttacherJoint(xmlFile: table, key: any, inputAttacherJoint: any, index: any)` | 856 | ✍ Charge une attache d'entrée depuis le XML dans la table fournie et retourne true si un nœud a été trouvé. Gère le type d'attache (avec valeurs de repli), les distances au sol, les rotules de bras inférieurs, les échelles de limites, les ressorts, les valeurs par défaut de descente, les attaches dépendantes, les changements d'objets et l'attelage supplémentaire. Émet des avertissements XML pour les valeurs invalides. |
| `Attachable:loadAttacherJointHeightNode(xmlFile: table, key: string, heightNode: table, attacherJointNode: any)` | 1173 | ✍ Charge depuis le XML un nœud de hauteur d'une attache d'entrée (nœud et nœud d'attache propriétaire). Retourne toujours true. |
| `Attachable:getIsAttacherJointHeightNodeActive(heightNode: table) → boolean` | 1184 | ✍ Indique si un nœud de hauteur donné est actif. Toujours true ici ; d'autres spécialisations peuvent le surcharger. |
| `Attachable:getInputAttacherJointByJointDescIndex(index: any)` | 1190 | ✍ Retourne la table de l'attache d'entrée à l'indice donné (base 1), ou nil si elle n'existe pas. |
| `Attachable:getInputAttacherJointIndexByNode(node: any)` | 1196 | ✍ Retourne l'indice de l'attache d'entrée dont le nœud correspond au nœud donné, ou nil si aucune ne correspond. |
| `Attachable:getAttacherVehicle()` | 1211 | ✍ Retourne le véhicule auquel cet outil est actuellement attelé, ou nil s'il n'est pas attelé. |
| `Attachable:getShowAttachableMapHotspot()` | 1216 | ✍ Retourne true quand l'outil n'est attelé à rien, ce qui signifie que son point d'intérêt sur la carte peut être affiché. |
| `Attachable:getInputAttacherJoints()` | 1222 | ✍ Retourne la liste des attaches d'entrée chargées pour ce véhicule. |
| `Attachable:getIsAttachedTo(vehicle: any)` | 1228 | ✍ Retourne true si le véhicule donné est ce véhicule lui-même ou un véhicule plus haut dans la chaîne d'attelage. |
| `Attachable:getActiveInputAttacherJointDescIndex()` | 1247 | ✍ Retourne l'indice de l'attache d'entrée actuellement utilisée pour l'attelage, ou nil si l'outil est dételé. |
| `Attachable:getActiveInputAttacherJoint()` | 1253 | ✍ Retourne la table de l'attache d'entrée actuellement utilisée, ou nil si l'outil n'est pas attelé. |
| `Attachable:getAllowsLowering() → boolean, string` | 1261 | ✍ Retourne true si l'outil peut être abaissé : false pour un attelage supplémentaire sans besoin d'abaissement, ou si l'attache active ne l'autorise pas. La seconde valeur retournée est toujours nil. |
| `Attachable:loadSupportAnimationFromXML(supportAnimation: table, xmlFile: XMLFile, key: string)` | 1284 | ✍ Remplit une entrée d'animation de béquille depuis le XML (nom, chargement différé, attelage différé, dételage après animation, instant de dételage). Retourne true seulement si un nom d'animation est présent. |
| `Attachable:getIsSupportAnimationAllowed(supportAnimation: any)` | 1296 | ✍ Retourne true quand le véhicule dispose d'un système d'animation (playAnimation existe), donc que les animations de béquille peuvent être jouées. |
| `Attachable:getIsReadyToFinishDetachProcess()` | 1302 | ✍ Retourne true quand chaque animation de béquille marquée dételage après animation est terminée ou a atteint son instant de dételage, ce qui permet le dételage final. |
| `Attachable:startDetachProcess(noEventSend: any)` | 1325 | ✍ Lance le dételage : envoie AttachableStartDetachEvent, joue les animations de béquille et, côté serveur, dételle immédiatement si possible ou marque le dételage comme en cours. Retourne si le dételage a pu être terminé maintenant. |
| `Attachable:getIsImplementChainLowered(defaultIsLowered: boolean) → boolean` | 1361 | ✍ Retourne true si cet outil et chaque véhicule porteur au-dessus de lui qui gère l'abaissement sont abaissés. Le paramètre est la valeur de repli quand l'abaissement n'est pas autorisé. |
| `Attachable:getIsInWorkPosition() → boolean` | 1383 | ✍ Indique si l'outil est en position de travail. Toujours true ici ; d'autres spécialisations sont censées le surcharger. |
| `Attachable:getAttachbleAirConsumerUsage() → number` | 1390 | ✍ Retourne la consommation d'air lue dans le XML (usage en freinage complet). Le nom de la fonction conserve la faute d'origine Attachble. |
| `Attachable:isDetachAllowed() → boolean, string` | 1398 | ✍ Indique si l'outil peut être dételé, avec un texte d'avertissement optionnel. Refuse si le dételage est bloqué, si l'attache l'interdit, si le parent est relevé et doit d'abord être abaissé, si c'est un attelage supplémentaire ou si l'attelage est encore en cours. |
| `Attachable:isAttachAllowed(farmId: integer, attacherVehicle: table) → boolean, string` | 1442 | ✍ Indique si l'attelage est autorisé : la ferme doit avoir accès au véhicule et aucun dételage ne doit être en cours. La seconde valeur retournée est toujours nil. |
| `Attachable:getIsInputAttacherActive(inputAttacherJoint: table) → boolean` | 1458 | ✍ Indique si une attache d'entrée donnée peut servir à l'attelage. Toujours true ici ; point d'accroche pour des surcharges. |
| `Attachable:getSteeringAxleBaseVehicle()` | 1464 | ✍ Retourne le véhicule servant de référence de direction : le porteur du porteur si l'option super attachable est active, sinon le véhicule porteur s'il est forcé ou s'il peut diriger cet outil. Peut retourner nil. |
| `Attachable:loadSteeringAxleFromXML(spec: any, xmlFile: any, key: any)` | 1486 | ✍ Lit les réglages de l'essieu directeur depuis le XML dans la table donnée : plage de vitesse, limites de rotation, nœud cible, direction, usage forcé, délai de distance et composant de référence optionnel. La vitesse de rotation est convertie de degrés par seconde en par milliseconde. |
| `Attachable:getIsSteeringAxleAllowed()` | 1512 | ✍ Indique si l'ajustement de l'essieu directeur est autorisé. Toujours true ici ; point d'accroche pour des surcharges. |
| `Attachable:loadSteeringAngleNodeFromXML(entry: any, xmlFile: any, key: any)` | 1518 | ✍ Remplit une entrée de nœud d'angle de direction depuis le XML (nœud, vitesse par milliseconde, échelle, décalage, vitesse minimale) et remet son angle courant à zéro. Retourne toujours true. |
| `Attachable:updateSteeringAngleNode(steeringAngleNode: any, angle: any, dt: any)` | 1532 | ✍ Déplace un nœud d'angle de direction vers l'angle cible à sa vitesse configurée quand le véhicule dépasse la vitesse minimale du nœud, applique la rotation en Y et marque l'outil mobile comme modifié. |
| `Attachable:attachableAddToolCameras()` | 1551 | ✍ Ajoute les caméras d'outil de cet outil au véhicule racine (s'il gère addToolCameras). Sans effet si aucune caméra d'outil n'existe. |
| `Attachable:attachableRemoveToolCameras()` | 1566 | ✍ Retire les caméras d'outil de cet outil du véhicule racine (s'il gère removeToolCameras). Sans effet si aucune caméra d'outil n'existe. |
| `Attachable:preAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: boolean, loadFromSavegame: boolean)` | 1584 | ✍ Appelée avant la fin de l'attelage. Mémorise le véhicule porteur et l'attache active, choisit les distances au sol selon le fichier du porteur, active les objets additionnels et les rotules de bras inférieurs, joue les animations de béquille non différées et émet onPreAttach. |
| `Attachable:postAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: boolean)` | 1646 | ✍ Appelée après l'attelage. Active l'outil si le véhicule racine est contrôlé, copie l'état des feux du porteur, joue les animations de béquille différées, ajoute les caméras d'outil, applique les changements d'objets et références de pièces mobiles, enregistre l'action contrôlée d'abaissement et émet onPostAttach. |
| `Attachable:preDetach(attacherVehicle: any, implement: any)` | 1736 | ✍ Appelée avant le dételage. Retire l'action contrôlée d'abaissement du contrôleur d'actions et émet onPreDetach. |
| `Attachable:postDetach(implementIndex: any)` | 1748 | ✍ Appelée après le dételage. Désactive le véhicule, annule les changements d'objets et références de pièces mobiles, joue les animations de béquille et de descente en sens inverse, retire les caméras d'outil, masque les objets additionnels, efface les références du porteur et émet onPostDetach. |
| `Attachable:setLowered(lowered: boolean)` | 1806 | ✍ Définit l'état abaissé : joue l'animation de descente en avant ou en arrière, propage l'état aux attaches dépendantes (avec avertissements si elles manquent) et émet onSetLowered. |
| `Attachable:setLoweredAll(doLowering: boolean, jointDescIndex: any)` | 1840 | ✍ Demande au véhicule porteur d'abaisser ou de relever tout l'outil à l'indice d'attache donné, puis émet onSetLoweredAll. Suppose que l'outil est attelé. |
| `Attachable:setToolBottomArmWidthByIndex(inputAttacherJointIndex: integer, widthIndex: integer)` | 1850 | ✍ Déplace les nœuds de rotules gauche et droite des bras inférieurs d'une attache d'entrée selon la largeur choisie par indice (0,5 si l'indice est inconnu). Le calcul de taille de rotule n'est pas appliqué au maillage. |
| `Attachable:updateInputAttacherJointGraphics(implement: any, dt: any)` | 1867 | ✍ Tant que l'attelage n'est pas en cours, met à jour les pièces mobiles des nœuds de barre de direction et du timon de l'attache d'entrée active. |
| `Attachable:setIsAdditionalAttachment(needsLowering: any, vehicleLoaded: any)` | 1887 | ✍ Marque le véhicule comme attelage supplémentaire (ne peut être ni dételé ni abaissé seul) et mémorise s'il nécessite un abaissement. Si déjà chargé, rafraîchit les événements d'action et retire l'action d'abaissement quand elle est inutile. |
| `Attachable:getIsAdditionalAttachment()` | 1905 | ✍ Retourne true si le véhicule a été marqué comme attelage supplémentaire. |
| `Attachable:setIsSupportVehicle(state: any)` | 1911 | ✍ Marque le véhicule comme véhicule de support ; l'état vaut true par défaut si nil est passé. Les véhicules de support sont exclus de la réinitialisation et des points d'intérêt de la carte. |
| `Attachable:getIsSupportVehicle()` | 1922 | ✍ Retourne l'indicateur de véhicule de support (nil s'il n'a jamais été défini). |
| `Attachable:registerLoweringActionEvent(actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 1928 | ✍ Enregistre un événement d'action d'entrée pour l'abaissement en transmettant tous les paramètres à addPoweredActionEvent (l'événement dépend de l'alimentation du véhicule). Retourne ce que cette fonction retourne. |
| `Attachable:getLoweringActionEventState()` | 1935 | ✍ Retourne si l'action abaisser/relever doit être affichée (les attaches du porteur et de l'outil autorisent l'abaissement) et le texte correspondant avec le type de véhicule, selon l'état abaissé actuel. |
| `Attachable:getAllowMultipleAttachments()` | 1958 | ✍ Retourne false ici : la boîte de dialogue d'attelage n'est pas proposée pour un outil déjà attelé. Surchargeable. |
| `Attachable:resolveMultipleAttachments()` | 1964 | ✍ Point d'accroche vide appelé avant un attelage à un second véhicule ; sans effet dans cette spécialisation. |
| `Attachable:getBlockFoliageDestruction()` | 1969 | ✍ Retourne l'indicateur XML blockFoliageDestruction : à true, l'outil bloque la destruction du feuillage pour toute sa chaîne de véhicules. |
| `Attachable:onDeactivate()` | 1980 | ✍ À la désactivation, réapplique la force de freinage si le véhicule a un frein et, côté client, arrête le son actif s'il joue. |
| `Attachable:onSelect(subSelectionIndex: any)` | 1999 | ✍ Quand l'outil est sélectionné, demande au véhicule porteur de le marquer comme outil sélectionné. |
| `Attachable:onUnselect()` | 2008 | ✍ Quand l'outil est désélectionné, demande au véhicule porteur d'effacer son outil sélectionné (passe nil). |
| `Attachable:findRootVehicle(superFunc: any)` | 2017 | ✍ Surcharge : retourne le véhicule racine du véhicule porteur quand l'outil est attelé, sinon délègue à l'implémentation de base. |
| `Attachable:getIsActive(superFunc: any)` | 2028 | ✍ Surcharge : actif si la base le dit ou si le véhicule porteur est actif. |
| `Attachable:getIsOperating(superFunc: any) → boolean` | 2042 | ✍ Surcharge : en fonctionnement si la base le dit ou si le véhicule porteur est en fonctionnement. |
| `Attachable:getBrakeForce(superFunc: any)` | 2056 | ✍ Surcharge : retourne la plus grande valeur entre la force de freinage de base et celle propre à l'outil. La force peut être interpolée selon la masse entre valeurs par défaut et maximale, et une force distincte s'applique quand l'outil est abaissé. |
| `Attachable:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 2078 | ✍ Surcharge : refuse le pliage (avec un texte d'avertissement) quand l'outil est attelé et que le pliage attelé est désactivé, quand il est abaissé et que le pliage abaissé est désactivé, ou quand l'attache active l'interdit. Sinon délègue à la base. |
| `Attachable:getCanToggleTurnedOn(superFunc: any)` | 2102 | ✍ Surcharge : retourne false si l'attache du tracteur ou l'attache d'entrée active interdit la mise en marche de l'outil ; sinon délègue à la base. |
| `Attachable:getDeactivateOnLeave(superFunc: any)` | 2138 | ✍ Surcharge : retourne false si le véhicule porteur ne se désactive pas à la sortie ; sinon délègue à la base. |
| `Attachable:getCanAIImplementContinueWork(superFunc: any, isTurning: any) → boolean` | 2152 | ✍ Surcharge : après la vérification de base, exige que l'animation de descente soit à une extrémité (ou en remontée) et, si l'IA a besoin d'abaissement, que l'attache ait fini de bouger. Retourne les valeurs d'arrêt de la base si celle-ci refuse. |
| `Attachable:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 2183 | ✍ Surcharge : retourne false tant qu'une animation de béquille est en cours ; sinon délègue à la base. |
| `Attachable:getActiveFarm(superFunc: any)` | 2196 | ✍ Surcharge : pour un outil attelé retourne la ferme du véhicule porteur, sauf si le véhicule est lui-même occupé par un conducteur (enterable avec une ferme de contrôle), auquel cas la valeur de base est utilisée. |
| `Attachable:getCanBeSelected(superFunc: any)` | 2213 | ✍ Surcharge : les véhicules attelables peuvent toujours être sélectionnés ; retourne true. |
| `Attachable:getIsLowered(superFunc: any, defaultIsLowered: any)` | 2219 | ✍ Surcharge : quand l'outil est attelé, retourne l'état de descente de l'attache si l'abaissement est autorisé ou par défaut, sinon la valeur par défaut fournie ; dételé, délègue à la base. |
| `Attachable:mountDynamic(superFunc: any, object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 2237 | ✍ Surcharge : refuse le montage dynamique d'objets (retourne false) tant que ce véhicule est attelé ; sinon délègue à la base. |
| `Attachable:getOwnerConnection(superFunc: any)` | 2249 | ✍ Surcharge : quand l'outil est attelé, retourne la connexion propriétaire du véhicule porteur (multijoueur) ; sinon délègue à la base. |
| `Attachable:getIsInUse(superFunc: any, connection: any)` | 2261 | ✍ Surcharge : quand l'outil est attelé, l'état d'utilisation pour une connexion vient du véhicule porteur ; sinon de la base. |
| `Attachable:getUpdatePriority(superFunc: any, skipCount: any, x: any, y: any, z: any, coeff: any, connection: any, isGuiVisible: any)` | 2272 | ✍ Surcharge : quand l'outil est attelé, la priorité de mise à jour réseau vient du véhicule porteur ; sinon la valeur de base est utilisée (l'appel de base omet l'argument de visibilité GUI). |
| `Attachable:getCanBeReset(superFunc: any)` | 2283 | ✍ Surcharge : retourne false pour les attelages supplémentaires et les véhicules de support ; sinon délègue à la base. |
| `Attachable:loadAdditionalLightAttributesFromXML(superFunc: any, xmlFile: any, key: any, light: any)` | 2297 | ✍ Surcharge : après le chargement d'un feu par la base, lit aussi l'attribut optionnel inputAttacherJointIndex qui limite le feu à une attache d'entrée. Retourne false si la base échoue. |
| `Attachable:getIsLightActive(superFunc: any, light: any)` | 2309 | ✍ Surcharge : un feu lié à un indice d'attache d'entrée est inactif sauf si cette attache est l'attache active ; sinon délègue à la base. |
| `Attachable:getIsPowered(superFunc: any)` | 2321 | ✍ Surcharge : attelé, l'état alimenté vient du véhicule porteur (son avertissement est transmis). Dételé, le véhicule n'est pas alimenté, avec un avertissement, s'il exige une puissance externe et n'a pas la spécialisation Motorized. |
| `Attachable:getConnectionHoseConfigIndex(superFunc: any)` | 2342 | ✍ Surcharge : retourne l'indice de configuration des flexibles de connexion lu dans le XML, la valeur de la configuration d'attache d'entrée étant prioritaire, avec repli sur la valeur de base. |
| `Attachable:getIsMapHotspotVisible(superFunc: any)` | 2356 | ✍ Surcharge : le point d'intérêt de la carte est visible seulement si la base l'autorise, si le véhicule n'est ni un attelage supplémentaire ni un véhicule de support, et s'il n'est pas attelé. |
| `Attachable:getPowerTakeOffConfigIndex(superFunc: any)` | 2374 | ✍ Surcharge : retourne l'indice de configuration de la prise de force lu dans le XML, la valeur de la configuration d'attache d'entrée étant prioritaire, avec repli sur la valeur de base. |
| `Attachable:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 2388 | ✍ Surcharge : après le chargement d'un groupe de tableau de bord par la base, lit aussi la condition optionnelle isAttached. Retourne false si la base échoue. |
| `Attachable:getIsDashboardGroupActive(superFunc: any, group: any)` | 2400 | ✍ Surcharge : un groupe de tableau de bord ayant une condition isAttached est inactif quand elle ne correspond pas à l'état d'attelage actuel ; sinon délègue à la base. |
| `Attachable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 2421 | ✍ Surcharge : sur un client, ignore les positions reçues du réseau tant que l'outil est attelé en dur (sa position suit le véhicule porteur) ; sur le serveur et sinon délègue à la base. |
| `Attachable:addToPhysics(superFunc: any) → boolean` | 2438 | ✍ Surcharge : après l'ajout du véhicule à la physique par la base, crée le joint d'attelage si le véhicule porteur est dans la physique (sauf attelage en dur). Si un parent attelé en dur n'y est pas encore, réinitialise l'indicateur pour permettre un nouvel appel. |
| `Attachable:removeFromPhysics(superFunc: any) → boolean` | 2472 | ✍ Surcharge : avant le retrait du véhicule de la physique par la base, remet à zéro l'indice de joint d'attelage mémorisé (sauf attelage en dur) quand le véhicule porteur est dans la physique. |
| `Attachable:actionControllerLowerImplementEvent(direction: any)` | 2493 | ✍ Rappel de l'action contrôlée d'abaissement : si l'abaissement est autorisé, définit l'état de descente de l'attache d'après le signe de la direction (négatif = relever) quand il diffère. Retourne true si traité. |
| `Attachable:onStateChange(state: any, data: any)` | 2515 | ✍ Lors des changements d'état IA début et fin de ligne, abaisse ou relève l'outil via l'action contrôlée quand il est configuré pour s'abaisser si un outil l'est. |
| `Attachable:onRootVehicleChanged(rootVehicle: table)` | 2530 | ✍ Quand le véhicule racine change, rattache l'action contrôlée d'abaissement au contrôleur d'actions de la nouvelle racine si les deux existent. |
| `Attachable:onFoldStateChanged(direction: any, moveToMiddle: any)` | 2542 | ✍ Pendant un changement de pliage, émet onSetLowered avec true ou false selon la direction de pliage par rapport à la direction de mise en marche, seulement si un temps de pliage intermédiaire existe. À noter : lit spec_foldable sans vérifier que la spécialisation Foldable est présente. |
| `Attachable:onRegisterAnimationValueTypes()` | 2555 | ✍ Enregistre des types de valeurs d'animation permettant aux pièces d'AnimatedVehicle de piloter les réglages d'une attache d'entrée : échelles de limites de rotation et de translation, décalages de rotation et distances au sol (basses/hautes). Côté serveur, chaque changement met à jour les réglages d'attache du véhicule porteur. |
| `Attachable:onBottomArmBallsI3DLoaded(i3dNode: integer, failedReason: table, inputAttacherJoint: any)` | 2778 | ✍ Rappel du chargement de l'i3d des rotules de bras inférieurs : s'il contient exactement trois nœuds de rotule, les lie à l'attache d'entrée, règle la plus grande largeur et la visibilité, et lie la rotule du haut au nœud de référence supérieur. Sinon émet un avertissement. Supprime le nœud chargé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onPreAttach` | 33 |
| registerEvent | `onPostAttach` | 34 |
| registerEvent | `onPreDetach` | 35 |
| registerEvent | `onPostDetach` | 36 |
| registerEvent | `onSetLowered` | 37 |
| registerEvent | `onSetLoweredAll` | 38 |
| registerEvent | `onLeaveRootVehicle` | 39 |
| registerFunction | `loadInputAttacherJoint` | 45 |
| registerFunction | `loadAttacherJointHeightNode` | 46 |
| registerFunction | `getIsAttacherJointHeightNodeActive` | 47 |
| registerFunction | `getInputAttacherJointByJointDescIndex` | 48 |
| registerFunction | `getInputAttacherJointIndexByNode` | 49 |
| registerFunction | `getAttacherVehicle` | 50 |
| registerFunction | `getShowAttachableMapHotspot` | 51 |
| registerFunction | `getInputAttacherJoints` | 52 |
| registerFunction | `getIsAttachedTo` | 53 |
| registerFunction | `getActiveInputAttacherJointDescIndex` | 54 |
| registerFunction | `getActiveInputAttacherJoint` | 55 |
| registerFunction | `getAllowsLowering` | 56 |
| registerFunction | `loadSupportAnimationFromXML` | 57 |
| registerFunction | `getIsSupportAnimationAllowed` | 58 |
| registerFunction | `getIsReadyToFinishDetachProcess` | 59 |
| registerFunction | `startDetachProcess` | 60 |
| registerFunction | `getIsImplementChainLowered` | 61 |
| registerFunction | `getIsInWorkPosition` | 62 |
| registerFunction | `getAttachbleAirConsumerUsage` | 63 |
| registerFunction | `isDetachAllowed` | 64 |
| registerFunction | `isAttachAllowed` | 65 |
| registerFunction | `getIsInputAttacherActive` | 66 |
| registerFunction | `getSteeringAxleBaseVehicle` | 67 |
| registerFunction | `loadSteeringAxleFromXML` | 68 |
| registerFunction | `getIsSteeringAxleAllowed` | 69 |
| registerFunction | `loadSteeringAngleNodeFromXML` | 70 |
| registerFunction | `updateSteeringAngleNode` | 71 |
| registerFunction | `attachableAddToolCameras` | 72 |
| registerFunction | `attachableRemoveToolCameras` | 73 |
| registerFunction | `preAttach` | 74 |
| registerFunction | `postAttach` | 75 |
| registerFunction | `preDetach` | 76 |
| registerFunction | `postDetach` | 77 |
| registerFunction | `setLowered` | 78 |
| registerFunction | `setLoweredAll` | 79 |
| registerFunction | `setToolBottomArmWidthByIndex` | 80 |
| registerFunction | `updateInputAttacherJointGraphics` | 81 |
| registerFunction | `setIsAdditionalAttachment` | 82 |
| registerFunction | `getIsAdditionalAttachment` | 83 |
| registerFunction | `setIsSupportVehicle` | 84 |
| registerFunction | `getIsSupportVehicle` | 85 |
| registerFunction | `registerLoweringActionEvent` | 86 |
| registerFunction | `getLoweringActionEventState` | 87 |
| registerFunction | `getAllowMultipleAttachments` | 88 |
| registerFunction | `resolveMultipleAttachments` | 89 |
| registerFunction | `getBlockFoliageDestruction` | 90 |
| registerFunction | `setIsDetachingBlocked` | 91 |
| registerOverwrittenFunction | `findRootVehicle` | 97 |
| registerOverwrittenFunction | `getIsActive` | 98 |
| registerOverwrittenFunction | `getIsOperating` | 99 |
| registerOverwrittenFunction | `getBrakeForce` | 100 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 101 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 102 |
| registerOverwrittenFunction | `getCanImplementBeUsedForAI` | 103 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 104 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 105 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 106 |
| registerOverwrittenFunction | `getActiveFarm` | 107 |
| registerOverwrittenFunction | `getCanBeSelected` | 108 |
| registerOverwrittenFunction | `getIsLowered` | 109 |
| registerOverwrittenFunction | `mountDynamic` | 110 |
| registerOverwrittenFunction | `getOwnerConnection` | 111 |
| registerOverwrittenFunction | `getIsInUse` | 112 |
| registerOverwrittenFunction | `getUpdatePriority` | 113 |
| registerOverwrittenFunction | `getCanBeReset` | 114 |
| registerOverwrittenFunction | `loadAdditionalLightAttributesFromXML` | 115 |
| registerOverwrittenFunction | `getIsLightActive` | 116 |
| registerOverwrittenFunction | `getIsPowered` | 117 |
| registerOverwrittenFunction | `getConnectionHoseConfigIndex` | 118 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 119 |
| registerOverwrittenFunction | `getPowerTakeOffConfigIndex` | 120 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 121 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 122 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 123 |
| registerOverwrittenFunction | `addToPhysics` | 124 |
| registerOverwrittenFunction | `removeFromPhysics` | 125 |
| registerEventListener | `onLoad` | 131 |
| registerEventListener | `onPostLoad` | 132 |
| registerEventListener | `onLoadFinished` | 133 |
| registerEventListener | `onPreInitComponentPlacement` | 134 |
| registerEventListener | `onPreDelete` | 135 |
| registerEventListener | `onDelete` | 136 |
| registerEventListener | `onReadStream` | 137 |
| registerEventListener | `onWriteStream` | 138 |
| registerEventListener | `onUpdateInterpolation` | 139 |
| registerEventListener | `onUpdate` | 140 |
| registerEventListener | `onUpdateTick` | 141 |
| registerEventListener | `onDeactivate` | 142 |
| registerEventListener | `onSelect` | 143 |
| registerEventListener | `onUnselect` | 144 |
| registerEventListener | `onStateChange` | 145 |
| registerEventListener | `onRootVehicleChanged` | 146 |
| registerEventListener | `onFoldStateChanged` | 147 |
| registerEventListener | `onRegisterAnimationValueTypes` | 148 |
