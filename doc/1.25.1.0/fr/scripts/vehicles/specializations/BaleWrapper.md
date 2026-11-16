# vehicles/specializations/BaleWrapper.lua

*[English version](../../../../scripts/vehicles/specializations/BaleWrapper.md)*

Source: `dataS/scripts/vehicles/specializations/BaleWrapper.lua` — FS25 1.25.1.0

✍ Spécialisation des enrubanneuses (balles rondes et carrées, y compris presses-enrubanneuses). Une machine à états pilotée par le serveur saisit une balle dans un déclencheur, l'amène à l'enrubanneuse, l'enrubanne avec des animations, des courbes de rotation et des clips de film, en consommant du film (Consumable), puis la dépose. Nécessite AnimatedVehicle et Consumable. Les changements d'état sont diffusés via BaleWrapperStateEvent et les joueurs qui rejoignent sont synchronisés par onReadStream/onWriteStream. Configurée sous vehicle.baleWrapper (roundBaleWrapper, squareBaleWrapper, grabber, automaticDrop, configurations d'animation et de couleur de film).

- **BaleWrapper** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleWrapper.prerequisitesPresent(specializations: table) → boolean` | 50 | ✍ Renvoie true uniquement si le type de véhicule possède à la fois AnimatedVehicle et Consumable. |
| `BaleWrapper.initSpecialization()` | 56 | ✍ Enregistre les types de configuration wrappingColor et wrappingAnimation, les deux entrées de spécifications de boutique pour la taille des balles rondes et carrées, et tout le schéma XML vehicle.baleWrapper, dont les configurations d'animation d'enrubannage. |
| `BaleWrapper.registerWrapperXMLPaths(schema: any, basePath: any)` | 97 | ✍ Enregistre les clés XML d'un bloc d'enrubanneuse (rond ou carré) sous le chemin donné : nœuds, types de balles, animations, courbes, nœuds d'enrubannage, zones de dépose et de blocage, animation du film et sons. |
| `BaleWrapper.registerWrapperAnimationXMLPaths(schema: any, basePath: any, name: any)` | 193 | ✍ Enregistre les attributs animName, animSpeed, reverseAfterMove et resetOnStart d'une animation d'enrubanneuse nommée sous le chemin donné. |
| `BaleWrapper.registerWrapperFoilAnimationXMLPaths(schema: any, basePath: any)` | 202 | ✍ Enregistre les clés XML wrappingFoilAnimation (nœud et axe de référence, rotation min/max, nœud et nom du clip). |
| `BaleWrapper.registerFunctions(vehicleType: any)` | 213 | ✍ Enregistre sur le type de véhicule les fonctions de chargement, le rappel du déclencheur de saisie, les vérifications d'enrubannage et de dépose, la gestion des changements d'état, le choix du type de balle et les réglages de dépose automatique et d'animation de dépose. |
| `BaleWrapper.registerOverwrittenFunctions(vehicleType: any)` | 243 | ✍ Remplace getIsFoldAllowed, getCanBeSelected, getShowConsumableEmptyWarning, getRequiresPower, getStandaloneMotorTargetRpm, getStandaloneMotorLoad, addToPhysics et removeFromPhysics. |
| `BaleWrapper.registerEventListeners(vehicleType: any)` | 256 | ✍ Enregistre les écouteurs de chargement, post-chargement, flux réseau, mise à jour, affichage, événements d'action, désactivation, état de pliage et variation de consommable. |
| `BaleWrapper:onLoad(savegame: table)` | 276 | ✍ Charge les définitions d'enrubanneuse ronde et carrée, choisit le type initial, crée le déclencheur de saisie (un triggerNode manquant ne produit qu'un avertissement XML alors qu'il est obligatoire) et initialise l'état, la dépose automatique et les textes d'avertissement. |
| `BaleWrapper:onPostLoad(savegame: any)` | 352 | ✍ Si la sauvegarde contient une balle en cours d'enrubannage, lit son fichier, son temps d'enrubannage et ses attributs dans une entrée baleToLoad restaurée plus tard dans onLoadFinished. |
| `BaleWrapper:loadWrapperFromXML(wrapper: any, xmlFile: any, baseKey: any, wrapperName: any)` | 373 | ✍ Charge un bloc d'enrubanneuse : animations, nœuds de balle et d'enrubanneuse, durée d'enrubannage, types de balles acceptés (taille, textures, animations de dépose, consommation de film), courbes, nœuds d'enrubannage, zones de dépose et de blocage, texte de déchargement et, côté client, sons d'enrubannage, de démarrage et d'arrêt. Beaucoup d'attributs obsolètes FS19/FS22 ne produisent que des avertissements. |
| `BaleWrapper:loadWrapperAnimationsFromXML(target: any, xmlFile: any, baseKey: any, configKey: any, animationsKey: any, parentAnimations: any)` | 511 | ✍ Charge les animations nommées (nom, vitesse, reverseAfterMove, resetOnStart) dans target.animations, avec repli sur une table d'animations parente via une métatable. Une clé de configuration prime sur la clé de base si elle existe. |
| `BaleWrapper:loadWrapperAnimCurveFromXML(target: any, xmlFile: any, baseKey: any)` | 544 | ✍ Construit la courbe d'animation de keyframes donnant la rotation de la balle et de l'enrubanneuse au fil du temps d'enrubannage, en s'arrêtant à la première clé sans baleRot. |
| `BaleWrapper:loadWrapperAnimNodesFromXML(target: any, xmlFile: any, baseKey: any)` | 562 | ✍ Charge les wrapAnimNodes : courbes par nœud de translation, rotation et échelle pilotées soit par la rotation de l'enrubanneuse soit par le temps d'enrubannage, avec répétition et normalisation de rotation à la dépose en option. |
| `BaleWrapper:loadWrapperWrapNodesFromXML(target: any, xmlFile: any, baseKey: any)` | 608 | ✍ Charge les wrapNodes : nœuds dont la visibilité dépend de l'état d'enrubannage ou de vide, avec une rotation maximale facultative de l'enrubanneuse. |
| `BaleWrapper:loadWrapperStateCurveFromXML(target: any, xmlFile: any, baseKey: any)` | 626 | ✍ Construit une courbe facultative reliant la progression à l'état d'enrubannage appliqué à la balle. La met à nil si aucune clé n'est définie. |
| `BaleWrapper:loadWrapperAnimationNodesFromXML(target: any, xmlFile: any, baseKey: any, animTime: any)` | 642 | ✍ Charge les wrappingAnimationNodes : clés temporelles qui déplacent ou re-lient des nœuds (comme des morceaux de film) pendant la rotation d'un nœud de référence, et place ceux au temps 0 à leur position de départ. |
| `BaleWrapper:loadWrapperFoilAnimationFromXML(target: any, xmlFile: any, baseKey: any, isDefault: any)` | 704 | ✍ Charge l'animation du film : nœud de référence et plage de rotation ainsi qu'un clip sur un nœud de clip. Avertit si le nœud, le nom ou le clip est introuvable. Pour l'animation par défaut, remet la piste du clip au temps 0. |
| `BaleWrapper:onLoadFinished(savegame: table)` | 753 | ✍ Restaure une balle sauvegardée : la crée et l'enregistre, rejoue les changements d'état de saisie, dépose sur la plateforme et début d'enrubannage, puis reprend l'animation au temps sauvegardé, ou termine l'enrubannage s'il est complet. |
| `BaleWrapper:onDelete()` | 798 | ✍ Détache la balle en cours de traitement (conservée et de nouveau vendable, ou supprimée si le véhicule est reconfiguré sur le serveur), retire le déclencheur de saisie et supprime les échantillons sonores. |
| `BaleWrapper:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 848 | ✍ Sauvegarde le temps d'enrubannage courant et, si une balle est tenue par la pince ou l'enrubanneuse, cette balle sous la clé .bale de l'entrée du véhicule. |
| `BaleWrapper:onReadStream(streamId: integer, connection: Connection)` | 870 | ✍ Synchronisation initiale côté client : lit le type d'enrubanneuse, le type de balle et l'état, puis rejoue les changements d'état et animations nécessaires. À noter : la branche MOVING_GRABBER_TO_WORK écrit self.baleGrabber.currentBale au lieu de spec.baleGrabber.currentBale, probablement un bug. |
| `BaleWrapper:onWriteStream(streamId: integer, connection: Connection)` | 949 | ✍ Pendant côté serveur : écrit le type d'enrubanneuse, l'indice du type de balle, l'état, l'identifiant de la balle si utile et le temps d'enrubannage écoulé pendant l'enrubannage. |
| `BaleWrapper:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 977 | ✍ Monte une balle en attente dès qu'elle existe. Pendant l'enrubannage, consomme du film, fait avancer le temps avec dt, appelle updateWrappingState, garde le véhicule actif et gère les sons d'enrubannage et d'arrêt côté client. |
| `BaleWrapper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1041 | ✍ Cherche une balle à saisir (le serveur la prend, le client peut afficher un avertissement de balle non supportée). Sur le serveur, fait avancer la machine à états à la fin de chaque animation en diffusant BaleWrapperStateEvent. Gère la dépose automatique et rafraîchit les événements d'action. |
| `BaleWrapper:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1121 | ✍ Client uniquement : affiche un avertissement clignotant pour une balle non supportée ou une zone de dépose bloquée. |
| `BaleWrapper:baleGrabberTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 1140 | ✍ Rappel du déclencheur qui compte les objets Bale entrant et sortant du déclencheur de saisie, en ne réagissant qu'aux corps rigides dynamiques. |
| `BaleWrapper:allowsGrabbingBale() → boolean` | 1164 | ✍ Renvoie true quand la machine est au repos, qu'aucune balle sauvegardée n'est en attente et que le temps d'animation de pliage est dans les limites autorisées. |
| `BaleWrapper:updateWrapNodes(isWrapping: boolean, isEmpty: boolean, t: number, wrapperRot: number)` | 1186 | ✍ Affiche ou masque les nœuds d'enrubannage selon l'état d'enrubannage et de vide, et met à jour les transformations des wrapAnimNodes d'après le temps ou la rotation de l'enrubanneuse. Hors enrubannage et non vide, normalise leur rotation si configuré. |
| `BaleWrapper:updateWrappingState(wrappingTime: number, noEventSend: boolean)` | 1244 | ✍ Applique la progression de l'enrubannage : pilote le clip du film, re-lie les nœuds animés temporels, fait tourner les nœuds de balle et d'enrubanneuse selon la courbe, fixe l'état et la couleur d'enrubannage de la balle, met à jour les nœuds et, sur le serveur, termine l'enrubannage. À noter : la ligne qui lit wrapperRot utilise une variable v non définie, ce qui ressemble à un bug. |
| `BaleWrapper:playMoveToWrapper(bale: table)` | 1364 | ✍ Sélectionne l'enrubanneuse et le type de balle correspondant à la balle saisie, puis joue l'animation moveToWrapper si elle est définie. |
| `BaleWrapper:setBaleWrapperType(isRoundBaleWrapper: boolean, baleTypeIndex: integer)` | 1379 | ✍ Bascule entre enrubanneuse ronde et carrée et choisit un type de balle : applique ses animations, son animation de film et ses changements d'objets, réinitialise le clip du film et demande la mise à jour des événements d'action. |
| `BaleWrapper:getMatchingBaleTypeIndex(baleTypes: table, bale: table)` | 1409 | ✍ Renvoie l'indice du premier type de balle dont la taille correspond à la balle, ou 1 si aucun ne correspond. |
| `BaleWrapper:doStateChange(id: integer, nearestBaleServerId: integer)` | 1423 | ✍ Applique une transition de la machine à états sur toutes les machines (saisie, dépose sur la plateforme, début d'enrubannage, fin d'enrubannage, début de dépose, balle déposée, réinitialisation de la plateforme, bouton de vidage). Gère montage, animations, sons, statistiques de ferme et succès WrappedBales. Saute l'enrubannage si la balle ne peut ou n'a pas besoin d'être enrubannée. |
| `BaleWrapper:getIsBaleWrappable(bale: table) → table` | 1625 | ✍ Compare la balle aux types de balles acceptés. Renvoie enrubannable, taille correspondante et indice du type ; enrubannable seulement si la balle gère l'enrubannage, n'est pas déjà complète et que le type n'est pas skipWrapping. |
| `BaleWrapper:getIsBaleDropAllowed() → boolean, string` | 1650 | ✍ Teste la boîte de la zone de dépose à la recherche d'objets qui la chevauchent. Renvoie true, ou false avec le texte d'avertissement de zone bloquée si autre chose que la balle portée gêne. |
| `BaleWrapper:onBaleWrapperDropOverlapCallback(nodeId: any)` | 1671 | ✍ Rappel de chevauchement de la zone de dépose : signale un objet bloquant et mémorise l'heure, en ignorant le véhicule et la balle portée. |
| `BaleWrapper:getIsBaleWrappingAllowed() → boolean` | 1690 | ✍ Renvoie true si la zone de blocage est libre d'autres objets et que du film est disponible dans le consommable. |
| `BaleWrapper:onBaleWrapperBlockOverlapCallback(nodeId: any)` | 1711 | ✍ Rappel de chevauchement de la zone de blocage : signale tout objet autre que le véhicule et la balle portée. |
| `BaleWrapper:pickupWrapperBale(bale: table, baleTypeIndex: integer)` | 1730 | ✍ Côté serveur. Applique les textures d'enrubannage du type de balle si elle sera enrubannée, la retire de la liste du déclencheur et diffuse le changement d'état de saisie. |
| `BaleWrapper.getBaleInRange(self: integer, refNode: integer, distance: number) → table, integer` | 1758 | ✍ Fonction statique parcourant les balles du déclencheur de saisie et renvoyant la balle enrubannable, la balle la plus proche et son indice de type. À noter : nearestDistance est remis à la distance de départ à chaque itération, le résultat n'est donc pas strictement la plus proche. |
| `BaleWrapper:setBaleWrapperAutomaticDrop(state: any, noEventSend: any)` | 1786 | ✍ Active, désactive ou inverse (si state est nil) la dépose automatique, rafraîchit les événements d'action et envoie BaleWrapperAutomaticDropEvent sauf si noEventSend est vrai. |
| `BaleWrapper:setBaleWrapperDropAnimation(dropAnimationIndex: any)` | 1802 | ✍ Mémorise l'indice de l'animation de dépose utilisée pour la prochaine dépose. |
| `BaleWrapper:getIsFoldAllowed(superFunc: boolean, direction: any, onAiTurnOn: boolean) → boolean` | 1811 | ✍ Refuse le pliage avec un texte d'avertissement tant que l'enrubanneuse n'est pas au repos, sinon s'en remet au parent. |
| `BaleWrapper:getCanBeSelected(superFunc: any)` | 1822 | ✍ Renvoie toujours true : le véhicule peut être sélectionné même comme outil passif. |
| `BaleWrapper:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 1828 | ✍ Pour le consommable de film, n'affiche l'avertissement de vide que si la machine est occupée et que le parent est d'accord ; les autres types utilisent le parent. |
| `BaleWrapper:getRequiresPower(superFunc: any)` | 1838 | ✍ Renvoie true dès que l'enrubanneuse n'est pas au repos, sinon le résultat du parent. |
| `BaleWrapper:getStandaloneMotorTargetRpm(superFunc: any)` | 1849 | ✍ Renvoie le plus grand de la valeur parente et d'un facteur : 1 pendant l'enrubannage, 0,5 dans les autres états actifs, 0 au repos ou terminé. |
| `BaleWrapper:getStandaloneMotorLoad(superFunc: any)` | 1865 | ✍ Ajoute une entrée de charge aux valeurs parentes : 1 pendant l'enrubannage, 0,5 dans les autres états actifs, 0 sinon. Renvoie la somme et le nombre de charges. |
| `BaleWrapper:addToPhysics(superFunc: any) → boolean` | 1887 | ✍ Appelle le parent puis réintroduit dans la physique et remonte la balle tenue par la pince et par l'enrubanneuse. Renvoie false si le parent échoue. |
| `BaleWrapper:removeFromPhysics(superFunc: any) → boolean` | 1914 | ✍ Appelle le parent puis démonte et retire de la physique la balle présente sur l'enrubanneuse. Renvoie false si le parent échoue. |
| `BaleWrapper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1934 | ✍ Client uniquement : enregistre l'action de déchargement (IMPLEMENT_EXTRA3), les actions optionnelles par animation de dépose et la bascule de dépose automatique (IMPLEMENT_EXTRA4) quand le véhicule est actif pour la saisie. |
| `BaleWrapper:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1969 | ✍ Enregistre les événements d'action externes baleWrapperDrop, baleWrapperAutomaticDrop (seulement si activable) et baleWrapperWarnings pour des déclencheurs extérieurs au véhicule. |
| `BaleWrapper:onDeactivate()` | 1984 | ✍ Efface l'avertissement de balle invalide et arrête les sons d'enrubannage, de démarrage et d'arrêt côté client. |
| `BaleWrapper:onFoldStateChanged(direction: any, moveToMiddle: any)` | 1996 | ✍ Quand la direction de pliage change et qu'un type de balle est marqué forceWhileFolding, revient à cette enrubanneuse et à ce type de balle. |
| `BaleWrapper:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 2007 | ✍ Mémorise la couleur du film issue des métadonnées de la variation de consommable, s'il y en a une, pour teinter les balles. |
| `BaleWrapper.actionEventEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2018 | ✍ Rappel d'entrée de l'action de déchargement : si l'enrubannage est terminé et la dépose autorisée, envoie BaleWrapperStateEvent (CHANGE_BUTTON_EMPTY) au serveur, sinon affiche l'avertissement de blocage. |
| `BaleWrapper.actionEventToggleAutomaticDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2032 | ✍ Rappel d'entrée qui bascule la dépose automatique. |
| `BaleWrapper.actionEventDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2038 | ✍ Rappel d'entrée d'une action d'animation de dépose : quand l'enrubannage est terminé, envoie BaleWrapperDropEvent au serveur avec l'état de rappel. |
| `BaleWrapper.updateActionEvents(self: any)` | 2047 | ✍ Active les actions de déchargement et d'animation de dépose seulement à l'état terminé, et rafraîchit les textes de déchargement et de dépose automatique. |
| `BaleWrapper.externalActionEventUnloadRegister(data: any, vehicle: any)` | 2076 | ✍ Enregistre l'entrée de déchargement pour un déclencheur externe ; elle n'exécute le rappel que si la dépose automatique est désactivée. |
| `BaleWrapper.externalActionEventUnloadUpdate(data: any, vehicle: any)` | 2093 | ✍ Active l'action de déchargement externe uniquement à l'état terminé. |
| `BaleWrapper.externalActionEventAutomaticUnloadRegister(data: any, vehicle: any)` | 2100 | ✍ Enregistre l'entrée externe qui bascule la dépose automatique. |
| `BaleWrapper.externalActionEventAutomaticUnloadUpdate(data: any, vehicle: any)` | 2112 | ✍ Met à jour le texte de la bascule externe selon l'état de la dépose automatique. |
| `BaleWrapper.externalActionEventWarningsRegister(data: any, vehicle: any)` | 2119 | ✍ Rappel d'enregistrement vide pour l'entrée d'avertissements externes. |
| `BaleWrapper.externalActionEventWarningsUpdate(data: any, vehicle: any)` | 2124 | ✍ Affiche l'avertissement de dépose bloquée (dépose automatique, dans les 500 ms du dernier chevauchement) ou celui de balle non supportée pour les déclencheurs externes. |
| `BaleWrapper.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleWrapper: any)` | 2137 | ✍ Chargeur de spécification de boutique : lit les diamètres et longueurs min et max des types de balles non ignorés d'un type d'enrubanneuse. Renvoie une table, ou nil s'il n'y en a pas. |
| `BaleWrapper.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleWrapper: any)` | 2166 | ✍ Accesseur de spécification de boutique : renvoie la taille de balle en cm sous forme de texte (valeur ou plage), ou en nombres et unité si returnValues est vrai. Diamètre pour les rondes, longueur pour les carrées. Valeurs vides si aucune. |
| `BaleWrapper.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 2202 | ✍ Chargeur de spécification de boutique de la taille des balles rondes, appelle loadSpecValueBaleSize avec l'indicateur rond. |
| `BaleWrapper.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 2208 | ✍ Chargeur de spécification de boutique de la taille des balles carrées, appelle loadSpecValueBaleSize avec l'indicateur carré. |
| `BaleWrapper.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2214 | ✍ Accesseur de boutique de la taille des balles rondes, nil si l'article n'a pas cette spécification. |
| `BaleWrapper.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2224 | ✍ Accesseur de boutique de la taille des balles carrées, nil si l'article n'a pas cette spécification. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadWrapperFromXML` | 214 |
| registerFunction | `loadWrapperAnimationsFromXML` | 215 |
| registerFunction | `loadWrapperAnimCurveFromXML` | 216 |
| registerFunction | `loadWrapperAnimNodesFromXML` | 217 |
| registerFunction | `loadWrapperWrapNodesFromXML` | 218 |
| registerFunction | `loadWrapperStateCurveFromXML` | 219 |
| registerFunction | `loadWrapperAnimationNodesFromXML` | 220 |
| registerFunction | `loadWrapperFoilAnimationFromXML` | 221 |
| registerFunction | `baleGrabberTriggerCallback` | 223 |
| registerFunction | `allowsGrabbingBale` | 224 |
| registerFunction | `pickupWrapperBale` | 225 |
| registerFunction | `getIsBaleWrappable` | 226 |
| registerFunction | `getIsBaleDropAllowed` | 227 |
| registerFunction | `onBaleWrapperDropOverlapCallback` | 228 |
| registerFunction | `getIsBaleWrappingAllowed` | 229 |
| registerFunction | `onBaleWrapperBlockOverlapCallback` | 230 |
| registerFunction | `updateWrappingState` | 231 |
| registerFunction | `doStateChange` | 232 |
| registerFunction | `updateWrapNodes` | 233 |
| registerFunction | `playMoveToWrapper` | 234 |
| registerFunction | `setBaleWrapperType` | 235 |
| registerFunction | `getMatchingBaleTypeIndex` | 236 |
| registerFunction | `setBaleWrapperAutomaticDrop` | 237 |
| registerFunction | `setBaleWrapperDropAnimation` | 238 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 244 |
| registerOverwrittenFunction | `getCanBeSelected` | 245 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 246 |
| registerOverwrittenFunction | `getRequiresPower` | 247 |
| registerOverwrittenFunction | `getStandaloneMotorTargetRpm` | 248 |
| registerOverwrittenFunction | `getStandaloneMotorLoad` | 249 |
| registerOverwrittenFunction | `addToPhysics` | 250 |
| registerOverwrittenFunction | `removeFromPhysics` | 251 |
| registerEventListener | `onLoad` | 257 |
| registerEventListener | `onPostLoad` | 258 |
| registerEventListener | `onLoadFinished` | 259 |
| registerEventListener | `onDelete` | 260 |
| registerEventListener | `onReadStream` | 261 |
| registerEventListener | `onWriteStream` | 262 |
| registerEventListener | `onUpdate` | 263 |
| registerEventListener | `onUpdateTick` | 264 |
| registerEventListener | `onDraw` | 265 |
| registerEventListener | `onRegisterActionEvents` | 266 |
| registerEventListener | `onRegisterExternalActionEvents` | 267 |
| registerEventListener | `onDeactivate` | 268 |
| registerEventListener | `onFoldStateChanged` | 269 |
| registerEventListener | `onConsumableVariationChanged` | 270 |
