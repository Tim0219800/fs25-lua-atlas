# vehicles/specializations/InlineWrapper.lua

*[English version](../../../../scripts/vehicles/specializations/InlineWrapper.md)*

Source: `dataS/scripts/vehicles/specializations/InlineWrapper.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les enrubanneuses en ligne, qui enrubannent une ligne continue de balles (requiert Foldable et Consumable pour les rouleaux de film). Un trigger de balles collecte les balles à pousser dans la ligne, un trigger d'enrubannage suit les balles en cours d'enrubannage, et le serveur construit des objets InlineBale à partir d'elles (les classes InlineBale, InlineBaleSingle et Bale ne sont pas dans ce fichier). Elle gère les animations de poussoir, d'enrubannage et d'éjection, des nœuds d'enrubannage qui suivent la surface de la balle, des rails réglables et des nœuds de direction, relâche le frein pendant la poussée, consomme du film par minute et synchronise les listes de balles vers les clients. Le joueur peut éjecter la ligne via une entrée ou un activable. Elle enregistre aussi deux valeurs de spécification de boutique pour les tailles de balles (rondes et carrées) et contient la classe auxiliaire InlineWrapperActivatable.

- **InlineWrapper** (l.11)
- **InlineWrapperActivatable** (l.1347)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InlineWrapper.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Renvoie true seulement si le type de véhicule possède Foldable et Consumable. |
| `InlineWrapper.initSpecialization()` | 28 | ✍ Enregistre les deux types de spécification boutique pour les tailles de balles rondes et carrées, et le schéma XML sous vehicle.inlineWrapper : triggers, types de balles (nœud de départ, usage de film, rail, fichier de balle en ligne, taille), rails, nœuds d'enrubannage et de direction, animations, réglages du frein en poussée, seuil de déplacement, numObjectBits et sons. |
| `InlineWrapper.registerFunctions(vehicleType: any)` | 84 | ✍ Enregistre les fonctions de véhicule de la spécialisation : lecture et écriture des balles dans le flux, callbacks de triggers, mises à jour des nœuds d'enrubannage, recherche du type de balle, rails, direction, éjection et accesseurs de la balle en ligne courante. |
| `InlineWrapper.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Surcharge getIsFoldAllowed, getIsActive, getBrakeForce et getShowConsumableEmptyWarning. |
| `InlineWrapper.registerEventListeners(vehicleType: any)` | 115 | ✍ Abonne aux événements de chargement, suppression, lecture et écriture de flux, mise à jour, dessin, événements d'action, entrée et sortie de véhicule et variation de consommable. |
| `InlineWrapper:onLoad(savegame: table)` | 135 | ✍ Charge les triggers, les types de balles (validés : nœud de départ et fichier de balle en ligne requis, la taille détermine rond ou carré), les rails, les nœuds d'enrubannage et de direction, les noms d'animations, les réglages de poussée et de frein et les drapeaux dirty. Crée l'activable et, côté client, les sons de wrap, démarrage et arrêt. |
| `InlineWrapper:onPostLoad(savegame: table)` | 257 | ✍ Place l'animation des rails à sa fin pour que les rails démarrent entièrement ouverts. |
| `InlineWrapper:onDelete()` | 266 | ✍ Retire les deux triggers, supprime les sons et l'activable, et libère la balle en ligne courante (la réveille, réinitialise l'état d'enrubannage et le lien avec l'enrubanneuse). |
| `InlineWrapper:onReadStream(streamId: any, connection: any)` | 290 | ✍ Synchronisation initiale côté client : lit les trois listes de balles, la balle en ligne courante et l'indicateur d'avertissement de balle incompatible, puis enregistre l'activable. |
| `InlineWrapper:onWriteStream(streamId: any, connection: any)` | 310 | ✍ Synchronisation initiale côté serveur : écrit les trois listes de balles, la balle en ligne courante (le cas échéant) et l'indicateur d'avertissement. |
| `InlineWrapper:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 325 | ✍ Côté client : quand le drapeau dirty est présent dans le flux, lit les listes de balles et la balle en ligne courante et enregistre l'activable. Lit toujours l'indicateur d'avertissement de balle incompatible. |
| `InlineWrapper:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 350 | ✍ Côté serveur : quand le drapeau dirty des balles est levé, écrit les listes de balles et la balle en ligne courante. Écrit toujours l'indicateur d'avertissement. |
| `InlineWrapper:readInlineBales(name: any, streamId: any, connection: any)` | 371 | ✍ Lit dans le flux une liste nommée d'identifiants d'objets balle (nombre codé sur numObjectBits bits) et remplace la liste dans la spécialisation. |
| `InlineWrapper:writeInlineBales(name: any, streamId: any, connection: any)` | 384 | ✍ Écrit une liste nommée d'identifiants de balles avec son nombre sur numObjectBits bits, avec avertissement si la liste dépasse ce que les bits permettent (augmenter numObjectBits). |
| `InlineWrapper:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 405 | ✍ Pendant la lecture de l'animation d'enrubannage, met à jour les nœuds d'enrubannage à chaque frame. |
| `InlineWrapper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 417 | ✍ Logique principale. Serveur : transforme les balles en attente en balles en ligne (compte les balles enrubannées pour les statistiques et le succès), gère l'animation du poussoir, le relâchement du frein et l'indicateur de balle incompatible. Tous côtés : suit la direction de la ligne, démarre ou arrête l'animation et les sons d'enrubannage quand une balle a bougé récemment, consomme le film côté serveur, déplace les rails, remet le bras d'éjection et active la touche d'éjection. |
| `InlineWrapper:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 693 | ✍ Client uniquement : affiche des avertissements clignotants quand des balles attendent alors que la machine n'est pas dépliée dans la plage autorisée, et quand une balle incompatible est présente. |
| `InlineWrapper:updateWrappingNodes()` | 711 | ✍ Pour chaque nœud d'enrubannage, trouve la balle en cours d'enrubannage la plus proche (en ignorant celle en attente) et déplace la cible du nœud vers le point de la surface de cette balle calculé par l'aide ronde ou carrée, ou la remet à sa translation de départ. Réinitialise les nœuds quand il ne reste plus de balle en ligne. |
| `InlineWrapper:updateRoundBaleWrappingNode(bale: any, wrappingNode: any, x: any, y: any, z: any)` | 785 | ✍ Calcule, pour une balle ronde, la position monde sur sa section circulaire (32 échantillons, légèrement à l'intérieur du rayon) que le nœud d'enrubannage doit viser. Renvoie des valeurs nil si aucune ne convient. |
| `InlineWrapper:updateSquareBaleWrappingNode(bale: any, wrappingNode: any, x: any, y: any, z: any)` | 824 | ✍ Calcule, pour une balle carrée, l'angle de sa section (mis en cache dans wrappingEdges) que le nœud d'enrubannage doit viser, en choisissant le plus petit angle parmi les coins non masqués par la balle. Renvoie des valeurs nil si aucun ne convient. |
| `InlineWrapper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 876 | ✍ Client uniquement : quand actif pour les entrées, lie ACTIVATE_OBJECT au gestionnaire d'éjection avec le texte de déchargement, activé selon getCanPushOff. |
| `InlineWrapper:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 893 | ✍ Refuse le repli tant que des balles sont dans le trigger de balles en ligne, sinon s'en remet au parent. |
| `InlineWrapper:getIsActive(superFunc: any)` | 904 | ✍ Renvoie true pendant que le frein est relâché (ou que son état appliqué est périmé) pour que le véhicule continue de se mettre à jour, sinon la valeur du parent. |
| `InlineWrapper:getBrakeForce(superFunc: any)` | 915 | ✍ Renvoie 0 et mémorise l'état tant que la poussée exige le relâchement du frein, sinon la force de freinage du parent. |
| `InlineWrapper:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 927 | ✍ Pour le consommable de film, n'affiche l'avertissement de vide que si des balles sont en attente et que le test de repli passe. À noter : le test utilise `or` entre les comparaisons min et max, il est donc toujours vrai. |
| `InlineWrapper:getIsInlineBalingAllowed()` | 947 | ✍ Renvoie true quand la machine est dépliée dans la plage autorisée, que les animations de poussoir et d'éjection sont au repos au départ et que du film consommable est disponible. |
| `InlineWrapper:inlineBaleTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 968 | ✍ Callback de trigger côté serveur uniquement pour le trigger de ramassage. Suit les balles entrantes comme en attente (type supporté), incompatibles ou déjà en ligne ; à la sortie, les retire et détache la balle en ligne de l'enrubanneuse quand plus aucune de ses balles ne reste. Lève le drapeau dirty des balles. |
| `InlineWrapper:inlineWrapTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1027 | ✍ Callback de trigger côté serveur uniquement pour le trigger d'enrubannage : ajoute ou retire des balles de la liste des balles à enrubanner, garde le véhicule actif et lève le drapeau dirty des balles. |
| `InlineWrapper:getWrapperBaleType(bale: any)` | 1047 | ✍ Renvoie le type de balle configuré correspondant à une balle (supporte l'enrubannage, mêmes diamètre et largeur pour une ronde, mêmes largeur, hauteur et longueur pour une carrée), ou nil si aucun ne correspond. |
| `InlineWrapper:getAllowBalePushing(bale: any)` | 1076 | ✍ Renvoie false si la balle est retenue par un joint de montage dynamique, true sinon. |
| `InlineWrapper:updateWrapperRailings(targetPosition: any, dt: any)` | 1086 | ✍ Déplace la largeur courante des rails vers la cible à une vitesse fixe par milliseconde et règle en conséquence le temps de l'animation des rails. |
| `InlineWrapper:updateInlineSteeringWheels(dirX: any, dirZ: any)` | 1104 | ✍ Aligne chaque nœud de direction vers la direction monde donnée (x, z), ou restaure sa rotation de départ si aucune direction n'est fournie. Marque les outils mobiles comme modifiés si disponible. |
| `InlineWrapper:onLeaveVehicle()` | 1127 | ✍ Remet le braquage (rotatedTime) à 0 quand le joueur quitte le véhicule. |
| `InlineWrapper:onEnterVehicle()` | 1133 | ✍ Restaure la rotation de départ de tous les nœuds de direction quand le joueur entre dans le véhicule. |
| `InlineWrapper:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 1146 | ✍ Quand la variation de film sélectionnée porte une couleur, la mémorise comme couleur de film utilisée pour les nouvelles balles. |
| `InlineWrapper:getCanInteract()` | 1157 | ✍ Renvoie true si le joueur local est à pied, a accès au véhicule et se tient dans le rayon d'interaction de son premier composant. La constante du rayon est définie hors de ce fichier (NON VÉRIFIÉ). |
| `InlineWrapper:getCanPushOff()` | 1178 | ✍ Renvoie true quand une balle en ligne existe sans balle en attente et que ni l'animation du poussoir ni celle d'éjection ne joue. |
| `InlineWrapper:setCurrentInlineBale(inlineBale: any, isClient: any)` | 1203 | ✍ Mémorise la balle en ligne courante : côté serveur sous forme d'identifiant réseau (en levant le drapeau dirty si elle change), côté client sous forme d'objet quand isClient vaut true. |
| `InlineWrapper:getCurrentInlineBale()` | 1220 | ✍ Renvoie l'objet de la balle en ligne courante résolu depuis l'identifiant réseau mémorisé, ou nil. |
| `InlineWrapper.pushOffInlineBaleEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1226 | ✍ Callback d'entrée : à l'appui, le serveur éjecte directement la ligne de balles, un client envoie un InlineWrapperPushOffEvent au serveur. |
| `InlineWrapper:pushOffInlineBale()` | 1238 | ✍ Démarre l'animation d'éjection en avant si elle ne joue pas déjà et marque l'éjection comme lancée pour que le bras soit remis ensuite. |
| `InlineWrapper.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleWrapper: any)` | 1248 | ✍ Lit dans un XML de véhicule le diamètre (enrubanneuses rondes) ou la longueur (carrées) min et max sur toutes les entrées baleType. Renvoie une table de ces valeurs, ou nil s'il n'y en a pas. |
| `InlineWrapper.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleWrapper: any)` | 1277 | ✍ Aide d'affichage boutique : renvoie la taille de balle en texte en cm (une plage si min diffère de max), ou en nombres avec unité si returnValues est vrai, ou des valeurs vides en l'absence de données. |
| `InlineWrapper.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 1313 | ✍ Chargeur de spécification boutique pour les tailles de balles rondes : appelle loadSpecValueBaleSize avec l'indicateur rond. |
| `InlineWrapper.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 1319 | ✍ Chargeur de spécification boutique pour les tailles de balles carrées : appelle loadSpecValueBaleSize sans l'indicateur rond. |
| `InlineWrapper.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1325 | ✍ Accesseur de spécification boutique pour les tailles de balles rondes ; renvoie nil si l'article n'a pas cette spécification, sinon le résultat du formatage partagé. |
| `InlineWrapper.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1335 | ✍ Accesseur de spécification boutique pour les tailles de balles carrées ; renvoie nil si l'article n'a pas cette spécification, sinon le résultat du formatage partagé. |
| `InlineWrapperActivatable.new(inlineWrapper: any)` | 1351 | ✍ Crée l'objet activable lié à une enrubanneuse en ligne, avec le texte de déchargement pour l'invite d'activation. |
| `InlineWrapperActivatable:getIsActivatable()` | 1362 | ✍ Renvoie true quand le joueur peut interagir avec l'enrubanneuse et que la ligne de balles peut être éjectée. |
| `InlineWrapperActivatable:run()` | 1374 | ✍ Exécute l'activation : le serveur éjecte la ligne de balles, un client envoie un InlineWrapperPushOffEvent au serveur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `readInlineBales` | 85 |
| registerFunction | `writeInlineBales` | 86 |
| registerFunction | `getIsInlineBalingAllowed` | 87 |
| registerFunction | `inlineBaleTriggerCallback` | 88 |
| registerFunction | `inlineWrapTriggerCallback` | 89 |
| registerFunction | `updateWrappingNodes` | 90 |
| registerFunction | `updateRoundBaleWrappingNode` | 91 |
| registerFunction | `updateSquareBaleWrappingNode` | 92 |
| registerFunction | `getWrapperBaleType` | 93 |
| registerFunction | `getAllowBalePushing` | 94 |
| registerFunction | `updateWrapperRailings` | 95 |
| registerFunction | `updateInlineSteeringWheels` | 96 |
| registerFunction | `getCanInteract` | 97 |
| registerFunction | `getCanPushOff` | 98 |
| registerFunction | `setCurrentInlineBale` | 99 |
| registerFunction | `getCurrentInlineBale` | 100 |
| registerFunction | `pushOffInlineBale` | 101 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 107 |
| registerOverwrittenFunction | `getIsActive` | 108 |
| registerOverwrittenFunction | `getBrakeForce` | 109 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 110 |
| registerEventListener | `onLoad` | 116 |
| registerEventListener | `onPostLoad` | 117 |
| registerEventListener | `onDelete` | 118 |
| registerEventListener | `onReadStream` | 119 |
| registerEventListener | `onWriteStream` | 120 |
| registerEventListener | `onReadUpdateStream` | 121 |
| registerEventListener | `onWriteUpdateStream` | 122 |
| registerEventListener | `onUpdate` | 123 |
| registerEventListener | `onUpdateTick` | 124 |
| registerEventListener | `onDraw` | 125 |
| registerEventListener | `onRegisterActionEvents` | 126 |
| registerEventListener | `onLeaveVehicle` | 127 |
| registerEventListener | `onEnterVehicle` | 128 |
| registerEventListener | `onConsumableVariationChanged` | 129 |
