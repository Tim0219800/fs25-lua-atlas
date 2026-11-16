# vehicles/specializations/PushHandTool.lua

*[English version](../../../../scripts/vehicles/specializations/PushHandTool.md)*

Source: `dataS/scripts/vehicles/specializations/PushHandTool.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils motorisés à conducteur à pied (type tondeuse à pousser) : le personnage marche derrière la machine, placé par deux raycasts au sol et la position des roues, avec un nœud de poignée, une flexion de colonne, des chaînes IK personnalisées et des animations conditionnelles. Elle propose aussi un mode de conduite optionnel (animation, vitesse et rapport limités, personnage propre), des effets de coupe pilotés par l'état de la tondeuse et la synchronisation réseau du mode et des effets. Exige Enterable ; le code utilise aussi les specs Motorized, Drivable et Foldable (NON VÉRIFIÉ : comment le type les garantit). La table de classe elle-même est déclarée hors des lignes visibles du dump.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PushHandTool.initSpecialization()` | 19 | ✍ Enregistre le schéma XML sous vehicle.pushHandTool (nœuds de raycast et lissage, roues, limites de poignée, colonne, chaînes IK, effets, mode de conduite, limites de chaînes personnalisées, animation conditionnelle) et la clé de sauvegarde driveModeIsActive. |
| `PushHandTool.prerequisitesPresent(specializations: table) → boolean` | 82 | ✍ Retourne true seulement si la spécialisation Enterable est présente. |
| `PushHandTool.registerFunctions(vehicleType: any)` | 88 | ✍ Enregistre getRaycastPosition, playerRaycastCallback, postAnimationUpdate, customVehicleCharacterLoaded et setPushHandToolDriveMode sur le type de véhicule. |
| `PushHandTool.registerOverwrittenFunctions(vehicleType: any)` | 98 | ✍ Surcharge setVehicleCharacter, deleteVehicleCharacter, getAllowCharacterVisibilityUpdate, setActiveCameraIndex et getIsFoldAllowed. |
| `PushHandTool.registerEventListeners(vehicleType: any)` | 108 | ✍ S'abonne aux événements de chargement, post-chargement, suppression, lecture/écriture de flux, lecture/écriture de flux de mise à jour, update, actions, entrée dans le véhicule, changement de caméra et changement de personnage. |
| `PushHandTool:onLoad(savegame: any)` | 125 | ✍ Lit tous les réglages XML, construit les paramètres d'animation, le nœud cible du joueur, les listes de roues, la poignée, la colonne, les cibles IK, les effets de coupe (client), les limites de chaînes et le mode de conduite (mémorise vitesse et rapport de base du moteur). Définit une exigence de zone de test sur l'herbe et enregistre un callback post-animation. |
| `PushHandTool:onPostLoad(savegame: any)` | 256 | ✍ Si la sauvegarde indique que le mode de conduite était actif, le réactive sans événement et avance son animation d'un coup. |
| `PushHandTool:onDelete()` | 268 | ✍ Supprime les effets de coupe et retire le callback post-animation. |
| `PushHandTool:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 277 | ✍ Sauvegarde l'état du mode de conduite, seulement si un nom d'animation de mode de conduite est configuré. |
| `PushHandTool:onReadStream(streamId: integer, connection: Connection)` | 288 | ✍ Client à la connexion : lit le booléen du mode de conduite, l'applique sans événement et avance l'animation d'un coup. |
| `PushHandTool:onWriteStream(streamId: integer, connection: Connection)` | 298 | ✍ Serveur à la connexion : écrit l'état du mode de conduite. |
| `PushHandTool:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 309 | ✍ Client : lit si les effets de coupe tournent, avec type de culture et stade de croissance le cas échéant, et arrête les effets quand ils se terminent. |
| `PushHandTool:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 334 | ✍ Serveur : écrit l'indicateur d'effets actifs, avec stade de croissance (4 bits) et type de culture quand ils tournent. |
| `PushHandTool:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 349 | ✍ À chaque frame : pilote les effets de coupe (le serveur décide d'après la dernière coupe de la tondeuse, le client suit le flux), calcule la vitesse lissée des roues pour les paramètres d'animation conditionnelle et met à jour l'animation du personnage, ajuste la colonne selon la direction, et déplace le nœud joueur derrière l'outil avec les deux raycasts, la pente des roues et un lissage. Si les raycasts échouent en étant entré, masque le personnage et force une caméra extérieure. |
| `PushHandTool:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 603 | ✍ Côté client avec un personnage de mode de conduite, enregistre l'action IMPLEMENT_EXTRA4 (moteur requis) pour basculer le mode de conduite quand actif pour l'entrée. |
| `PushHandTool.actionEventToggleDriveMode(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 620 | ✍ Callback d'entrée qui bascule le mode de conduite en appelant setPushHandToolDriveMode sans argument. |
| `PushHandTool:setVehicleCharacter(superFunc: any, playerStyle: any)` | 626 | ✍ Surchargée : recharge le personnage normal avec customVehicleCharacterLoaded en callback, et charge le personnage du mode de conduite si un style de joueur est donné. À noter : la fonction parente n'est jamais appelée. |
| `PushHandTool:deleteVehicleCharacter(superFunc: any)` | 643 | ✍ Surchargée : appelle le parent, puis décharge aussi le personnage du mode de conduite. |
| `PushHandTool:customVehicleCharacterLoaded(loadingState: any, arguments: any)` | 654 | ✍ Callback de chargement du personnage. En cas de succès, déclenche onVehicleCharacterChanged, duplique les nœuds des chaînes IK dans des groupes de transformation auxiliaires, applique les limites d'articulation personnalisées, affecte cibles et solveurs IK (40 itérations), enregistre les paramètres d'animation conditionnelle et initialise l'animation depuis vehicle.pushHandTool.playerConditionalAnimation. |
| `PushHandTool.driveModeVehicleCharacterLoaded(self: any, loadingState: any, arguments: any)` | 749 | ✍ Callback du personnage du mode de conduite : en cas de succès, l'affiche sauf si la caméra est intérieure et met à jour ses chaînes IK. |
| `PushHandTool:setPushHandToolDriveMode(driveModeState: any, noEventSend: any)` | 765 | ✍ Active, désactive ou bascule (nil) le mode de conduite. En cas de changement : échange vitesse max avant et rapport mini du moteur, met à jour les limites du régulateur, joue l'animation, replie l'outil et masque le personnage normal. Envoie toujours PushHandToolDriveModeEvent sauf noEventSend, même sans changement. |
| `PushHandTool:getAllowCharacterVisibilityUpdate(superFunc: any)` | 798 | ✍ Surchargée : false si le parent refuse, si entré avec une caméra intérieure, si les raycasts sont invalides, ou pendant le mode de conduite (actif ou en animation) avec son propre personnage. Sinon true. |
| `PushHandTool:setActiveCameraIndex(superFunc: any, index: any)` | 830 | ✍ Surchargée : tant que les raycasts sont invalides, remplace un index de caméra intérieure par la première caméra extérieure avant d'appeler le parent. |
| `PushHandTool:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 854 | ✍ Surchargée : retourne false tant que le mode de conduite est actif, sinon le résultat du parent. |
| `PushHandTool:onEnterVehicle(isControlling: any)` | 865 | ✍ Masque le personnage quand on contrôle avec une caméra intérieure ou quand les raycasts sont invalides. |
| `PushHandTool:onCameraChanged(activeCamera: any, camIndex: any)` | 891 | ✍ Quand entré, masque le personnage normal pour une caméra intérieure et ne montre le personnage du mode de conduite que pour les caméras extérieures. |
| `PushHandTool:onVehicleCharacterChanged(character: any)` | 910 | ✍ Quand entré avec une caméra intérieure, masque le nouveau personnage. Quand le personnage est retiré, vide les copies de nœuds IK et le nœud de colonne. |
| `PushHandTool:postAnimationUpdate(dt: any)` | 930 | ✍ Callback exécuté après les animations pendant l'activité : incline la poignée selon la distance main-cible dans ses limites, applique la rotation de colonne répartie par ratio sur trois nœuds, puis (hors mode de conduite) met à jour les chaînes IK, recopie les transformations des nœuds IK dupliqués et applique les poses des chaînes. |
| `PushHandTool:getRaycastPosition(node: any)` | 1006 | ✍ Lance un rayon de 2 m vers le bas depuis le nœud (légèrement redressé selon l'axe Y monde) avec le masque de collision joueur. Retourne x, y, z et la distance du point touché, ou nil si rien de valide n'est touché (distance supérieure à 0,35 et impact à plus de 0,25 sous le nœud). |
| `PushHandTool:playerRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any)` | 1023 | ✍ Callback de raycast : ignore les impacts sur ce véhicule (retourne true pour continuer), sinon mémorise position et distance et arrête le rayon en retournant false. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getRaycastPosition` | 89 |
| registerFunction | `playerRaycastCallback` | 90 |
| registerFunction | `postAnimationUpdate` | 91 |
| registerFunction | `customVehicleCharacterLoaded` | 92 |
| registerFunction | `setPushHandToolDriveMode` | 93 |
| registerOverwrittenFunction | `setVehicleCharacter` | 99 |
| registerOverwrittenFunction | `deleteVehicleCharacter` | 100 |
| registerOverwrittenFunction | `getAllowCharacterVisibilityUpdate` | 101 |
| registerOverwrittenFunction | `setActiveCameraIndex` | 102 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 103 |
| registerEventListener | `onLoad` | 109 |
| registerEventListener | `onPostLoad` | 110 |
| registerEventListener | `onDelete` | 111 |
| registerEventListener | `onReadStream` | 112 |
| registerEventListener | `onWriteStream` | 113 |
| registerEventListener | `onReadUpdateStream` | 114 |
| registerEventListener | `onWriteUpdateStream` | 115 |
| registerEventListener | `onUpdate` | 116 |
| registerEventListener | `onRegisterActionEvents` | 117 |
| registerEventListener | `onEnterVehicle` | 118 |
| registerEventListener | `onCameraChanged` | 119 |
| registerEventListener | `onVehicleCharacterChanged` | 120 |
