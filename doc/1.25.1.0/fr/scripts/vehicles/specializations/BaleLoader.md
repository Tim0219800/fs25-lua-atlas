# vehicles/specializations/BaleLoader.lua

*[English version](../../../../scripts/vehicles/specializations/BaleLoader.md)*

Source: `dataS/scripts/vehicles/specializations/BaleLoader.lua` — FS25 1.25.1.0

✍ Spécialisation des ramasseuses-chargeuses de balles automatiques (remorques qui saisissent les balles avec un grappin, les empilent sur une plateforme rotative et les déposent en rangées). Elle exige `FillUnit` : chaque balle chargée ajoute une unité au niveau de remplissage. Le fonctionnement est une machine à états pilotée par le serveur, qui diffuse des `BaleLoaderStateEvent` avec des identifiants CHANGE_* que chaque machine rejoue via `doStateChange`, essentiellement en lançant des animations d'`AnimatedVehicle`. Les balles sont attachées de façon cinématique, rigide ou par joints dynamiques (`dynamicMount`), peuvent être liées entre elles au déchargement, et sont sauvegardées avec le véhicule. Lit de nombreuses clés XML `vehicle.baleLoader` (types de balles avec plages de tailles, emplacements, animations, sons, effets). Le ramassage utilise un trigger et dépend de la propriété de la ferme et du type de balle.

- **BaleLoader** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleLoader.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie true uniquement si le type de véhicule possède la spécialisation `FillUnit`. |
| `BaleLoader.initSpecialization()` | 24 | ✍ Déclare deux types de spécifications de boutique (taille des balles rondes et carrées) et enregistre tout le schéma XML `vehicle.baleLoader` ainsi que le schéma de sauvegarde (état, type de balle, chaque balle chargée). |
| `BaleLoader.registerAnimationXMLPaths(schema: any, basePath: any)` | 164 | ✍ Enregistre les clés XML de noms d'animations (plateforme, grappin, pousseur, plateforme avant, emplacements de balles, rotation de vidage, pinces) sous un chemin de base. Réutilisé pour la config par défaut et pour chaque type de balle. |
| `BaleLoader.registerFunctions(vehicleType: any)` | 277 | ✍ Enregistre les fonctions du véhicule : chargement XML, joints entre balles, changements d'état, ramassage, montage/démontage, animations de pliage, déchargement automatique et triggers de déchargement. |
| `BaleLoader.registerOverwrittenFunctions(vehicleType: any)` | 312 | ✍ Surcharge la sélection, la disponibilité IA, l'autorisation de pliage, la puissance et la charge PTO, l'info de remplissage du montage dynamique et l'ajout/retrait de la physique pour que les balles suivent le véhicule. |
| `BaleLoader.registerEventListeners(vehicleType: any)` | 328 | ✍ S'abonne aux événements de chargement, de flux réseau, de mise à jour, d'affichage, d'entrées, d'activation, de changement de véhicule racine, de niveau de remplissage, de pliage, de déchargement de presse et de types de valeurs d'animation. |
| `BaleLoader:onLoad(savegame: table)` | 353 | ✍ Lit tous les réglages `vehicle.baleLoader` : textes, options de déchargement automatique et de montage dynamique, grappin et son trigger (erreur s'il manque), effets et sons (client), animations, emplacements, types de balles, animations de pliage, tapis de déchargement et emballeur. Journalise des erreurs XML si types ou emplacements manquent. |
| `BaleLoader:onPostLoad(savegame: table)` | 668 | ✍ Depuis la sauvegarde, restaure le type de balle, l'animation de pliage et la position travail/transport, puis met en file chaque balle sauvegardée (indice d'emplacement, position, attributs) pour création. Avertit si une entrée est corrompue. |
| `BaleLoader:onLoadFinished(savegame: table)` | 759 | ✍ Une fois le véhicule en physique, crée, enregistre et monte chaque balle en file sur son emplacement (dynamiquement ou par montage classique), la marque non vendable et enregistre son identifiant réseau dans l'emplacement. |
| `BaleLoader:onDelete()` | 787 | ✍ Démonte toutes les balles chargées et saisies (les rend à nouveau vendables, et les supprime si le véhicule est seulement reconfiguré), retire triggers et écouteurs de suppression, et libère animations, effets et sons. |
| `BaleLoader:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 890 | ✍ Sauvegarde la position de travail, le type de balle, l'animation de pliage et chaque balle avec son indice d'emplacement (indice d'aide pour la rangée de départ). Démonte la balle du grappin pour qu'elle soit sauvegardée comme balle normale et la signale pour remontage. |
| `BaleLoader:onReadStream(streamId: integer, connection: Connection)` | 955 | ✍ Connexion d'un client : lit l'état de position, les directions, le type de balle, l'état de vidage, la balle saisie et les identifiants de balles par emplacement (positions quantifiées hors montage dynamique), planifie leur montage, puis rejoue la séquence de déchargement jusqu'à l'état reçu. |
| `BaleLoader:onWriteStream(streamId: integer, connection: Connection)` | 1092 | ✍ Connexion côté serveur : écrit l'état lu par `onReadStream`. Les positions des balles sont quantifiées sur `numBitsPosition` bits et un avertissement est journalisé si l'une dépasse `maxPosition`. |
| `BaleLoader:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 1153 | ✍ Côté client : lit l'indicateur du tapis de déchargement et démarre ou arrête ses nœuds d'animation et son son quand il change. |
| `BaleLoader:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 1175 | ✍ Côté serveur : écrit l'indicateur d'activité du tapis de déchargement quand son drapeau dirty est levé. |
| `BaleLoader.updateBalePlacesAnimations(self: any)` | 1187 | ✍ Place instantanément les animations des emplacements et des rangées dans la position correspondant au chargement actuel. Déclenche la rotation de la plateforme si la rangée de départ est pleine. |
| `BaleLoader:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1223 | ✍ Monte les balles dont l'objet est enfin disponible, arrête les effets du grappin après leur délai, et sur toute machine cherche une balle à ramasser (le serveur appelle `pickupBale`, le client peut afficher un avertissement). Le serveur fait aussi avancer la machine à états en diffusant des événements quand les animations se terminent. |
| `BaleLoader:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1392 | ✍ Met à jour textes et visibilité des actions (client). Serveur : déchargement automatique, retrait des joints après déchargement, arrêt du tapis, interpolation des joints et gestion de la masse en montage dynamique, mouvement différé de la plateforme et décalage de poussée. À noter : le test `useUnloadingMoverTrigger == nil` ne peut jamais être vrai (valeur par défaut false), donc la libération par animation n'est évaluée que si cette option est vraie. |
| `BaleLoader:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1669 | ✍ Affiche un avertissement clignotant quand une balle à portée n'est pas prise en charge par la machine. |
| `BaleLoader.getBaleInRange(self: integer, refNode: integer, balesInTrigger: any) → table, integer` | 1681 | ✍ Renvoie la balle valide la plus proche dans le trigger et à portée de ramassage, son type de balle correspondant (nil si refusée) et un texte d'avertissement. Rejette les balles déjà chargées, montées ailleurs, d'un autre type ou type de remplissage, non prises en charge, ou d'une autre ferme (sauf combinaison avec une presse). |
| `BaleLoader:onActivate()` | 1778 | ✍ Démarre les nœuds d'animation et le son de travail si la machine est en position de travail et non bloquée. |
| `BaleLoader:onDeactivate()` | 1789 | ✍ Arrête les effets du grappin, les nœuds d'animation de travail et le son de travail. |
| `BaleLoader:onRootVehicleChanged(rootVehicle: table)` | 1799 | ✍ Enregistre (ou rattache à nouveau) l'action contrôlée `baleLoaderWorkstate` sur le contrôleur d'actions du véhicule racine, terminée en position de travail, avec un écouteur IA pour la préparation au transport. La retire s'il n'y a plus de contrôleur. |
| `BaleLoader.actionControllerEvent(self: any, direction: any)` | 1824 | ✍ Callback du contrôleur d'actions : bascule entre position de travail et de transport quand la direction demandée diffère de l'état actuel et que rien ne bouge. Renvoie true si la bascule a été demandée. |
| `BaleLoader:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1837 | ✍ Réactualise le choix de l'animation de pliage quand le niveau de remplissage de l'unité du chargeur change. |
| `BaleLoader:onFoldStateChanged(direction: any)` | 1846 | ✍ Quand `useFoldingState` est actif, le serveur diffuse un événement de passage en travail ou en transport selon la direction de pliage. |
| `BaleLoader:onBalerUnloadingStarted(balesToUnload: any)` | 1860 | ✍ Avec le déchargement entièrement automatique, retient le nombre de balles encore attendues d'une presse attelée pour que le déchargement les attende. |
| `BaleLoader:onRegisterAnimationValueTypes()` | 1869 | ✍ Enregistre le type de valeur d'animation `baleLoaderAnimationNodes`, qui bloque ou autorise les nœuds d'animation et le son de travail depuis une pièce animée. |
| `BaleLoader:loadBaleTypeFromXML(xmlFile: any, key: any, baleType: any)` | 1897 | ✍ Charge un type de balle : plages de tailles (ronde : largeur et diamètre ; carrée : largeur, hauteur, longueur, arrondies à 2 décimales), indicateur de mélange de types, unité de remplissage, changements d'objets, emplacements et animations. Renvoie false si les animations échouent. |
| `BaleLoader:loadBaleLoaderAnimationsFromXML(xmlFile: any, key: any, target: any, defaultTarget: any)` | 1947 | ✍ Lit tous les noms et vitesses d'animations dans `target.animations`, avec repli sur la cible par défaut puis sur des noms intégrés. Renvoie toujours true. |
| `BaleLoader:loadBalePlacesFromXML(xmlFile: any, key: any, target: any)` | 1999 | ✍ Lit l'emplacement de départ (compte ses nœuds enfants et mémorise leurs transformations d'origine) et la liste des nœuds d'emplacements. Renvoie true si les deux existent, c'est-à-dire que les emplacements sont partagés par tous les types de balles. |
| `BaleLoader:createBaleToBaleJoints(baleLines: any)` | 2050 | ✍ Crée des joints physiques entre les balles des rangées déposées (le long des rangées et entre rangées au début ou à la fin) selon `dynamicBaleUnloading`, pour que la pile reste groupée jusqu'à la libération. |
| `BaleLoader:createBaleToBaleJoint(bale1: any, bale2: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, balePlaceIndex: any)` | 2102 | ✍ Crée un joint entre deux balles avec les limites de translation et de rotation données, aligné sur la rotation de l'emplacement, et garde son indice dans la liste des joints. |
| `BaleLoader:doStateChange(id: integer, nearestBaleServerId: integer)` | 2138 | ✍ Machine à états centrale. Applique un identifiant CHANGE_* : saisie de balle, mouvement du grappin, dépôt sur la plateforme, rotation, passage travail ou transport, étapes de déchargement, dépôt des balles (éventuellement liées ou emballées) et demandes de boutons. Les cas de boutons ne s'exécutent que sur le serveur. |
| `BaleLoader.getAllowsStartUnloading(self: any) → boolean` | 2616 | ✍ Renvoie true quand la machine contient des balles et qu'aucun mouvement de plateforme, de pousseur, de grappin ou étape de déchargement n'est en cours. |
| `BaleLoader.rotatePlatform(self: any)` | 2644 | ✍ Lance l'animation de rotation de la plateforme et, si nécessaire, celle qui décale les emplacements de balles. |
| `BaleLoader.moveToWorkPosition(self: boolean, onLoad: boolean)` | 2661 | ✍ Joue l'animation de pliage vers le travail et ouvre les pinces. Au chargement, elle tourne à très grande vitesse pour atteindre directement la fin. |
| `BaleLoader.moveToTransportPosition(self: any)` | 2679 | ✍ Joue l'animation de pliage en sens inverse et ferme les pinces. |
| `BaleLoader:getBaleGrabberDropBaleAnimName() → string` | 2689 | ✍ Renvoie l'animation de dépôt propre au nombre actuel de balles sur la rangée de départ si elle existe, sinon l'animation de dépôt générique. |
| `BaleLoader:getIsBaleGrabbingAllowed() → string` | 2701 | ✍ Renvoie true seulement en position de travail, sans mouvement en cours, rangée de départ non pleine, capacité libre et aucun déchargement en cours. |
| `BaleLoader:pickupBale(nearestBale: table, nearestBaleType: table)` | 2743 | ✍ Serveur : enregistre l'heure du ramassage, sélectionne le type de balle et diffuse un événement d'état de saisie pour la balle donnée. |
| `BaleLoader:setBaleLoaderBaleType(baleTypeIndex: integer, forceUpdate: boolean)` | 2756 | ✍ Passe au type de balle à l'indice donné (ou au premier) : met à jour animations, emplacements, unité de remplissage, affichage HUD et changements d'objets. Sans effet si le type ne change pas. |
| `BaleLoader:getBaleTypeByBale(bale: any)` | 2801 | ✍ Renvoie le premier type de balle dont les plages de tailles contiennent les dimensions de la balle (diamètre et largeur pour une ronde, largeur, hauteur et longueur pour une carrée), ou nil. |
| `BaleLoader:baleGrabberTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 2841 | ✍ Callback du trigger du grappin : compte les formes de chaque `Bale` présente dans le trigger (corps dynamiques côté serveur, cinématiques côté client). |
| `BaleLoader:baleLoaderMoveTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 2874 | ✍ Callback du trigger du tapis de déchargement : suit les balles dynamiques qui s'y trouvent (avec écouteur de suppression) pour garder le tapis actif tant qu'elles y restent. |
| `BaleLoader:mountDynamicBale(bale: any, node: any)` | 2901 | ✍ Serveur uniquement : attache une balle par un joint physique à un nœud de joint sous le nœud donné, avec interpolation de position facultative, limites de translation et masse réduite. Réutilise le joint s'il existe. |
| `BaleLoader:unmountDynamicBale(bale: any)` | 2956 | ✍ Serveur uniquement : détache une balle montée dynamiquement, supprime son nœud de joint, vide les entrées d'interpolation, restaure sa masse et la rend à nouveau sauvegardable. |
| `BaleLoader:mountBale(bale: any, object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, noKinematicMounting: any)` | 2978 | ✍ Monte une balle sur un nœud avec un décalage, en cinématique (collisions avec le véhicule désactivées) ou par montage simple, et la marque non sauvegardable. La retire de la liste du trigger du tapis. |
| `BaleLoader:unmountBale(bale: any)` | 3003 | ✍ Démonte une balle selon son type de montage (simple ou cinématique), réactive les collisions dans le cas cinématique, et la rend sauvegardable. |
| `BaleLoader:setBalePairCollision(bale: any, state: any)` | 3019 | ✍ Active ou désactive la collision entre la balle et chaque composant du véhicule et chaque balle montée en cinématique. |
| `BaleLoader:getLoadedBales()` | 3033 | ✍ Renvoie une nouvelle table de tous les objets balle actuellement sur les emplacements ou sur la rangée de départ. |
| `BaleLoader:startAutomaticBaleUnloading()` | 3060 | ✍ Signale le déchargement automatique comme en cours et envoie l'événement du bouton de vidage au serveur par la connexion client. |
| `BaleLoader:getIsAutomaticBaleUnloadingInProgress()` | 3073 | ✍ Indique si un déchargement automatique est en cours. |
| `BaleLoader:getIsAutomaticBaleUnloadingAllowed()` | 3079 | ✍ Renvoie true si aucun déchargement automatique n'est en cours, si le dernier ramassage date de plus de 15 secondes et si le déchargement peut démarrer. |
| `BaleLoader:playBaleLoaderFoldingAnimation(speed: any)` | 3097 | ✍ Joue l'animation de pliage actuelle à la vitesse donnée depuis son temps courant (vitesse négative : repliage). |
| `BaleLoader:getIsBaleLoaderFoldingPlaying()` | 3104 | ✍ Indique si l'animation de pliage actuelle est en cours de lecture. |
| `BaleLoader:getCurrentFoldingAnimation()` | 3110 | ✍ Renvoie le nom de l'animation de pliage : celle par défaut, ou la dernière choisie si plusieurs animations conditionnelles sont définies. |
| `BaleLoader:updateFoldingAnimation()` | 3122 | ✍ Choisit l'animation de pliage correspondant au type de balle, au niveau de remplissage et au nombre de balles sur la rangée de départ, et recopie le temps d'animation courant vers la nouvelle quand elle change. |
| `BaleLoader:onBaleMoverBaleRemoved(bale: any)` | 3157 | ✍ Écouteur de suppression : retire une balle supprimée de la liste du trigger du tapis de déchargement. |
| `BaleLoader.onBaleUnloadTriggerDeleted(self: any, unloadTrigger: any)` | 3164 | ✍ Écouteur de suppression : oublie un trigger de déchargement qui a été supprimé. |
| `BaleLoader:addBaleUnloadTrigger(unloadTrigger: any)` | 3173 | ✍ Enregistre un trigger de déchargement (avec compteur de références) et un écouteur de suppression, et réveille le véhicule pour qu'il vérifie le déchargement automatique. |
| `BaleLoader:removeBaleUnloadTrigger(unloadTrigger: any)` | 3182 | ✍ Décrémente le compteur de références d'un trigger de déchargement et le supprime avec son écouteur à zéro. |
| `BaleLoader:getCanBeSelected(superFunc: any)` | 3194 | ✍ Surcharge : renvoie toujours true, la ramasseuse peut donc être sélectionnée. |
| `BaleLoader:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 3200 | ✍ Surcharge : renvoie false quand le montage dynamique est actif, sinon le résultat du parent. |
| `BaleLoader:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 3213 | ✍ Surcharge : renvoie false pendant un déchargement automatique, sinon le résultat du parent. |
| `BaleLoader:getIsAIReadyToDrive(superFunc: any)` | 3223 | ✍ Surcharge : pas prête pour la conduite IA tant qu'elle est en position de travail ou que le grappin bouge. |
| `BaleLoader:getIsAIPreparingToDrive(superFunc: any)` | 3234 | ✍ Surcharge : renvoie true pendant que le grappin bouge, sinon le résultat du parent. |
| `BaleLoader:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 3245 | ✍ Surcharge : le pliage est refusé tant que la machine contient des balles, sinon le parent décide. |
| `BaleLoader:getDoConsumePtoPower(superFunc: any) → boolean` | 3257 | ✍ Surcharge : vrai tant que `consumePtoPower` est actif et que la machine est en position de travail ou en mouvement ; sinon le résultat du parent. |
| `BaleLoader:getConsumingLoad(superFunc: any)` | 3268 | ✍ Surcharge : ajoute une charge complète (1) pour un consommateur de plus en position de travail ou en mouvement avec consommation PTO, en plus des valeurs du parent. |
| `BaleLoader:getIsPowerTakeOffActive(superFunc: any)` | 3282 | ✍ Surcharge : vrai tant que la consommation PTO est active et que la machine est en position de travail ou en mouvement ; sinon le résultat du parent. |
| `BaleLoader:addToPhysics(superFunc: any) → boolean` | 3294 | ✍ Surcharge : après l'ajout du véhicule par le parent, rajoute chaque balle chargée à la physique et la remonte sur son emplacement. Renvoie false si le parent échoue. |
| `BaleLoader:removeFromPhysics(superFunc: any) → boolean` | 3341 | ✍ Surcharge : après le retrait du véhicule par le parent, démonte chaque balle chargée et la retire de la physique. Renvoie false si le parent échoue. |
| `BaleLoader:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 3382 | ✍ Client : enregistre les entrées travail/transport, déchargement et annulation (la première seulement sans état de pliage, les autres sans déchargement entièrement automatique). |
| `BaleLoader.actionEventEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3408 | ✍ Callback d'entrée : envoie l'événement du bouton de vidage au serveur si le niveau minimal est atteint ou si le déchargement est en cours, sinon affiche un avertissement clignotant. |
| `BaleLoader.actionEventAbortEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3419 | ✍ Callback d'entrée : envoie l'événement d'annulation du déchargement au serveur. |
| `BaleLoader.actionEventWorkTransport(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3425 | ✍ Callback d'entrée : envoie l'événement de bascule travail/transport au serveur. |
| `BaleLoader.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleLoader: any)` | 3431 | ✍ Parcourt les entrées baleType de la racine XML et relève diamètre et longueur min et max pour les chargeurs ronds ou carrés. Renvoie la table, ou nil si rien ne correspond. |
| `BaleLoader.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleLoader: any)` | 3464 | ✍ Affichage boutique de la taille de balle prise en charge en cm (diamètre pour rondes, longueur pour carrées), sous forme de texte ou de nombres bruts avec unité. Renvoie des valeurs vides si la spec manque. |
| `BaleLoader.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 3500 | ✍ Chargeur de boutique pour les tailles de balles rondes ; délègue à `loadSpecValueBaleSize`. |
| `BaleLoader.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 3506 | ✍ Chargeur de boutique pour les tailles de balles carrées ; délègue à `loadSpecValueBaleSize`. |
| `BaleLoader.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3512 | ✍ Accesseur boutique pour la taille des balles rondes, nil si l'objet n'a pas cette spec. |
| `BaleLoader.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3522 | ✍ Accesseur boutique pour la taille des balles carrées, nil si l'objet n'a pas cette spec. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadBaleTypeFromXML` | 278 |
| registerFunction | `loadBalePlacesFromXML` | 279 |
| registerFunction | `loadBaleLoaderAnimationsFromXML` | 280 |
| registerFunction | `createBaleToBaleJoints` | 282 |
| registerFunction | `createBaleToBaleJoint` | 283 |
| registerFunction | `doStateChange` | 284 |
| registerFunction | `getBaleGrabberDropBaleAnimName` | 285 |
| registerFunction | `getIsBaleGrabbingAllowed` | 286 |
| registerFunction | `pickupBale` | 287 |
| registerFunction | `setBaleLoaderBaleType` | 288 |
| registerFunction | `getBaleTypeByBale` | 289 |
| registerFunction | `baleGrabberTriggerCallback` | 290 |
| registerFunction | `baleLoaderMoveTriggerCallback` | 291 |
| registerFunction | `mountDynamicBale` | 292 |
| registerFunction | `unmountDynamicBale` | 293 |
| registerFunction | `mountBale` | 294 |
| registerFunction | `unmountBale` | 295 |
| registerFunction | `setBalePairCollision` | 296 |
| registerFunction | `getLoadedBales` | 297 |
| registerFunction | `startAutomaticBaleUnloading` | 298 |
| registerFunction | `getIsAutomaticBaleUnloadingInProgress` | 299 |
| registerFunction | `getIsAutomaticBaleUnloadingAllowed` | 300 |
| registerFunction | `playBaleLoaderFoldingAnimation` | 301 |
| registerFunction | `getIsBaleLoaderFoldingPlaying` | 302 |
| registerFunction | `getCurrentFoldingAnimation` | 303 |
| registerFunction | `updateFoldingAnimation` | 304 |
| registerFunction | `onBaleMoverBaleRemoved` | 305 |
| registerFunction | `addBaleUnloadTrigger` | 306 |
| registerFunction | `removeBaleUnloadTrigger` | 307 |
| registerOverwrittenFunction | `getCanBeSelected` | 313 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 314 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 315 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 316 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 317 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 318 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 319 |
| registerOverwrittenFunction | `getConsumingLoad` | 320 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 321 |
| registerOverwrittenFunction | `addToPhysics` | 322 |
| registerOverwrittenFunction | `removeFromPhysics` | 323 |
| registerEventListener | `onLoad` | 329 |
| registerEventListener | `onPostLoad` | 330 |
| registerEventListener | `onLoadFinished` | 331 |
| registerEventListener | `onDelete` | 332 |
| registerEventListener | `onReadUpdateStream` | 333 |
| registerEventListener | `onWriteUpdateStream` | 334 |
| registerEventListener | `onReadStream` | 335 |
| registerEventListener | `onWriteStream` | 336 |
| registerEventListener | `onUpdate` | 337 |
| registerEventListener | `onUpdateTick` | 338 |
| registerEventListener | `onDraw` | 339 |
| registerEventListener | `onRegisterActionEvents` | 340 |
| registerEventListener | `onActivate` | 341 |
| registerEventListener | `onDeactivate` | 342 |
| registerEventListener | `onRootVehicleChanged` | 343 |
| registerEventListener | `onFillUnitFillLevelChanged` | 344 |
| registerEventListener | `onFoldStateChanged` | 345 |
| registerEventListener | `onBalerUnloadingStarted` | 346 |
| registerEventListener | `onRegisterAnimationValueTypes` | 347 |
