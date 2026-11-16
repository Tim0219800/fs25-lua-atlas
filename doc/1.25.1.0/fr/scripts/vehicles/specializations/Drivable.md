# vehicles/specializations/Drivable.lua

*[English version](../../../../scripts/vehicles/specializations/Drivable.md)*

Source: `dataS/scripts/vehicles/specializations/Drivable.lua` — FS25 1.25.1.0

✍ Spécialisation qui transforme les entrées du joueur en conduite du véhicule : pédales, direction, frein à main, régulateur de vitesse, rotation sur place, retour de force et compteur kilométrique. Elle exige Enterable et Motorized. Le client calcule les axes et les envoie via le flux de mise à jour ; le serveur les applique au moteur et à la physique des roues. Elle expose aussi des types de valeur de dashboard et déclenche onVehiclePhysicsUpdate et onCruiseControlSpeedChanged.

- **Drivable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Drivable.prerequisitesPresent(specializations: table) → boolean` | 28 | ✍ Renvoie true seulement si le type de véhicule possède Enterable et Motorized. |
| `Drivable.initSpecialization()` | 34 | ✍ Enregistre le schéma XML de vehicle.drivable (directions, speedRotScale, régulateur, volant, rotation sur place, dashboards, son waterSplash) et les attributs de sauvegarde cruiseControl, cruiseControlReverse et odometerMilage. |
| `Drivable.registerFunctions(vehicleType: any)` | 76 | ✍ Enregistre les fonctions du véhicule de la spécialisation : régulateur, axes, sens de l'inverseur et de la direction, setters d'entrée, contrôles d'autorisation du joueur et updateVehiclePhysics. |
| `Drivable.registerOverwrittenFunctions(vehicleType: any)` | 110 | ✍ Surcharge getIsManualDirectionChangeAllowed, getMapHotspotRotation et setTransmissionDirection d'autres spécialisations. |
| `Drivable.registerEvents(vehicleType: any)` | 118 | ✍ Déclare les événements onVehiclePhysicsUpdate et onCruiseControlSpeedChanged. |
| `Drivable.registerEventListeners(vehicleType: any)` | 125 | ✍ S'abonne aux événements de chargement, suppression, enregistrement des types de valeur de dashboard, lecture/écriture de flux, mise à jour, affichage, enregistrement des actions, sortie du véhicule et panne. |
| `Drivable:onLoad(savegame: table)` | 143 | ✍ Lit les réglages XML et initialise les entrées, le régulateur (vitesses max par défaut égales à celles du moteur en km/h), le volant, les roues de rotation sur place, le retour de force et l'échantillon waterSplash. Restaure vitesses du régulateur et compteur depuis la sauvegarde et crée l'extension HUD du régulateur. |
| `Drivable:onRegisterDashboardValueTypes()` | 278 | ✍ Enregistre les types de valeur de dashboard du groupe « drivable » : cruiseControl, cruiseControlReverse, cruiseControlActive, directionForward/Backward, movingDirection, axes d'accélération et de décélération, steeringAngle, pédales combinées et odometerMilage. |
| `Drivable:onDelete()` | 341 | ✍ Supprime les échantillons sonores et l'extension HUD du régulateur. |
| `Drivable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 352 | ✍ Sauvegarde la vitesse du régulateur, celle en marche arrière et le compteur kilométrique dans l'entrée de sauvegarde du véhicule. |
| `Drivable:onReadStream(streamId: integer, connection: Connection)` | 363 | ✍ Synchronisation à la connexion côté client : si le régulateur est activé, lit son état (2 bits), les vitesses avant et arrière (8 bits chacune) et le compteur (float32). |
| `Drivable:onWriteStream(streamId: integer, connection: Connection)` | 382 | ✍ Synchronisation à la connexion côté serveur : écrit les mêmes état, vitesses du régulateur et compteur que ceux lus par onReadStream, si le régulateur est activé. |
| `Drivable:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 399 | ✍ Lit les axes avant et latéral transmis par le réseau (10 bits chacun, remis à l'échelle -1..1, valeurs infimes mises à zéro), l'indicateur de frein à main et celui de rotation sur place. |
| `Drivable:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 423 | ✍ Si le drapeau sale de Drivable est levé, écrit les axes avant et latéral quantifiés, l'indicateur de frein à main et celui de rotation sur place. |
| `Drivable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 440 | ✍ Logique principale par image. Client : convertit entrées de pédales, direction et régulateur en axisForward/axisSide (vitesse cible, brakeToStop, rotation sur place, retour de force, direction gyroscopique) et lève le drapeau sale en cas de changement. Serveur : fixe la limite de vitesse du moteur (limite, régulateur, rotation sur place) puis appelle updateVehiclePhysics. Met aussi à jour le volant et le compteur. |
| `Drivable:setCruiseControlState(state: integer, noEventSend: boolean)` | 804 | ✍ Définit l'état du régulateur (arrêt, actif ou plein). Sauf si noEventSend est vrai, envoie SetCruiseControlStateEvent au serveur, ou à la connexion propriétaire si appelée sur le serveur. Met à jour le texte de l'action de bascule. |
| `Drivable:setCruiseControlMaxSpeed(speed: number, speedReverse: number)` | 835 | ✍ Borne et stocke la vitesse du régulateur et, en option, celle en marche arrière (km/h), repasse l'état PLEIN à ACTIF si la vitesse a changé, ajuste la limite de vitesse du moteur et déclenche onCruiseControlSpeedChanged. Ne fait rien si speed est nil. |
| `Drivable:updateSteeringWheel(steeringWheel: any, dt: any, direction: any)` | 874 | ✍ Fait pivoter le nœud du volant d'après rotatedTime, avec la plage intérieure si le joueur local est dans une caméra intérieure hors passager, sinon la plage extérieure. Marque le personnage du véhicule comme sale en cas de changement. Sans effet si le volant est nil. |
| `Drivable:getCruiseControlState()` | 907 | ✍ Renvoie la constante de l'état courant du régulateur. |
| `Drivable:getCruiseControlSpeed()` | 913 | ✍ Renvoie la vitesse du régulateur en km/h, ou la vitesse maximale si l'état est PLEIN. |
| `Drivable:getCruiseControlMaxSpeed()` | 924 | ✍ Renvoie la vitesse maximale sélectionnable du régulateur en marche avant. |
| `Drivable:getCruiseControlDisplayInfo() → number, boolean` | 932 | ✍ Renvoie la vitesse du régulateur à afficher sur le HUD du compteur (avant ou arrière selon le sens et l'inverseur, vitesse max en état PLEIN) et si le régulateur est actif. |
| `Drivable:getAxisForward()` | 962 | ✍ Renvoie la valeur courante de l'axe avant (-1 à 1). |
| `Drivable:getAccelerationAxis()` | 968 | ✍ Renvoie la position de la pédale d'accélérateur (0 à 1), en tenant compte du sens de déplacement et de l'inverseur. |
| `Drivable:getDecelerationAxis()` | 976 | ✍ Renvoie la position de la pédale de frein (0 à 1) affichée par les dashboards ; elle vaut zéro à l'arrêt quasi complet ou quand le véhicule roule à l'opposé de l'entrée sous un seuil de vitesse. |
| `Drivable:getCruiseControlAxis()` | 988 | ✍ Renvoie 1 si le régulateur n'est pas à l'arrêt, sinon 0. |
| `Drivable:getAcDecelerationAxis()` | 995 | ✍ Renvoie l'axe avant multiplié par le sens de l'inverseur, comme valeur de pédale signée. |
| `Drivable:getDashboardSteeringAxis()` | 1001 | ✍ Renvoie la position de direction normalisée par maxRotTime (et par le sens de l'inverseur), avec un traitement spécial pendant la rotation sur place. Utilisée pour le dashboard steeringAngle. |
| `Drivable:getDashboardCombinedPedalLeft()` | 1018 | ✍ Valeur de dashboard d'une pédale gauche combinée : axe de pédale moins la direction, bornée à -1..1, ou valeur signée pendant la rotation sur place. |
| `Drivable:getDashboardCombinedPedalRight()` | 1033 | ✍ Valeur de dashboard d'une pédale droite combinée : axe de pédale plus la direction, bornée à -1..1, ou valeur de signe opposé pendant la rotation sur place. |
| `Drivable:setReverserDirection(reverserDirection: any)` | 1048 | ✍ Enregistre le sens de l'inverseur (1 ou -1) sans événement réseau. |
| `Drivable:getReverserDirection()` | 1054 | ✍ Renvoie le sens de l'inverseur (1 avant, -1 inversé). |
| `Drivable:getSteeringDirection()` | 1060 | ✍ Renvoie le facteur de sens de direction (-1 inverse la direction). |
| `Drivable:getIsDrivingForward()` | 1066 | ✍ Renvoie true quand getDrivingDirection est nul ou positif (donc aussi à l'arrêt). |
| `Drivable:getIsDrivingBackward()` | 1072 | ✍ Renvoie true quand getDrivingDirection est négatif. |
| `Drivable:getDrivingDirection()` | 1078 | ✍ Renvoie 0 à l'arrêt quasi complet (ou à faible vitesse sans entrée), sinon movingDirection multiplié par le sens de l'inverseur (+1 avant, -1 arrière). |
| `Drivable:getIsVehicleControlledByPlayer()` | 1097 | ✍ Renvoie toujours true dans cette spécialisation ; d'autres spécialisations peuvent la surcharger. |
| `Drivable:getIsPlayerVehicleControlAllowed() → boolean, string` | 1105 | ✍ Exécute les fonctions de contrôle enregistrées des véhicules attachés (en retirant les obsolètes) et renvoie false avec un texte d'avertissement dès que l'une refuse, sinon true. |
| `Drivable:registerPlayerVehicleControlAllowedFunction(vehicle: table, func: function)` | 1129 | ✍ Enregistre une fonction de contrôle pour un véhicule donné, indexée par son identifiant d'objet réseau, consultée avant que le joueur puisse contrôler ce véhicule racine. |
| `Drivable:stopMotor(noEventSend: boolean)` | 1141 | ✍ Coupe le régulateur sans envoyer d'événement. Elle n'est pas enregistrée via registerFunctions dans ce fichier ; elle est donc probablement appelée comme point d'entrée d'arrêt moteur ailleurs : NON VÉRIFIÉ. |
| `Drivable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1147 | ✍ Client uniquement : enregistre les actions accélérer, freiner, diriger, bascule du régulateur et niveau du régulateur quand le véhicule est occupé et actif (les quatre premières ignorées pendant qu'une IA conduit). |
| `Drivable:onLeaveVehicle(wasEntered: any)` | 1188 | ✍ Coupe le régulateur, serre le frein si le véhicule en a un et libère le retour de force si le joueur y était entré. |
| `Drivable:onSetBroken()` | 1208 | ✍ Client uniquement : joue l'échantillon sonore waterSplash quand le véhicule tombe en panne. |
| `Drivable:updateVehiclePhysics(axisForward: number, axisSide: number, doHandbrake: boolean, dt: number)` | 1223 | ✍ Étape côté serveur : dérive l'accélération de l'axe avant (moteur allumé ou non, le régulateur force 1), arrête le moteur s'il ne peut pas tourner, fixe rotatedTime depuis l'axe latéral si occupé et appelle WheelsUtil.updateWheelsPhysics. Renvoie l'accélération. |
| `Drivable:setAccelerationPedalInput(inputValue: any)` | 1293 | ✍ Enregistre l'entrée d'accélérateur bornée à 0..1 et annule toute vitesse cible. |
| `Drivable:setBrakePedalInput(inputValue: any)` | 1305 | ✍ Enregistre l'entrée de frein bornée à 0..1 et annule toute vitesse cible. |
| `Drivable:setTargetSpeedAndDirection(speed: any, direction: any)` | 1317 | ✍ Définit une vitesse et un sens cibles ; la vitesse est une fraction de la vitesse max avant ou arrière du moteur, convertie en km/h. onUpdate règle ensuite l'axe avant vers cette cible. |
| `Drivable:setSteeringInput(inputValue: any, isAnalog: any, deviceCategory: any)` | 1331 | ✍ Enregistre l'entrée de direction de cette image ; l'indicateur analogique et la catégorie de périphérique ne sont conservés que si l'entrée est non nulle. |
| `Drivable:brakeToStop()` | 1342 | ✍ Demande un freinage automatique jusqu'à environ 1 km/h, géré par onUpdate. |
| `Drivable:updateSteeringAngle(wheel: any, dt: any, steeringAngle: any)` | 1349 | ✍ Renvoie l'angle de braquage d'une roue, remplacé par l'angle de rotation sur place configuré (plus pi si inversé) tant que celle-ci est active et que la roue correspond. |
| `Drivable:getIsManualDirectionChangeAllowed(superFunc: any)` | 1370 | ✍ Surcharge : renvoie false pendant la rotation sur place, sinon délègue à l'implémentation parente. |
| `Drivable:getMapHotspotRotation(superFunc: any, isPlayerHotspot: any)` | 1381 | ✍ Surcharge : ajoute 180 degrés (pi) à la rotation du point d'intérêt sur la carte quand l'inverseur est inversé. |
| `Drivable:setTransmissionDirection(superFunc: integer, direction: integer)` | 1392 | ✍ Surcharge : après l'appel parent, si le sens a changé, échange les vitesses max avant et arrière du régulateur et applique les vitesses échangées. |
| `Drivable.actionEventAccelerate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1407 | ✍ Rappel d'entrée pour l'axe d'accélération : avertit si non alimenté, vérifie que le contrôle est autorisé, puis appelle setAccelerationPedalInput. |
| `Drivable.actionEventBrake(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1427 | ✍ Rappel d'entrée pour l'axe de freinage : avertit si non alimenté, vérifie que le contrôle est autorisé, puis appelle setBrakePedalInput. |
| `Drivable.actionEventSteer(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any, deviceCategory: any, binding: any)` | 1447 | ✍ Rappel d'entrée pour l'axe de direction : détecte le retour de force sur l'assignation et suit le périphérique actif, puis transmet l'entrée non nulle à setSteeringInput si le contrôle est autorisé. |
| `Drivable.actionEventCruiseControlState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1483 | ✍ Rappel d'entrée pour la bascule du régulateur : si le contrôle est autorisé, signale la bascule à onUpdate, sinon affiche l'avertissement. |
| `Drivable.actionEventCruiseControlValue(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1495 | ✍ Rappel d'entrée pour l'axe de niveau du régulateur : stocke la valeur brute pour onUpdate. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateSteeringWheel` | 77 |
| registerFunction | `setCruiseControlState` | 78 |
| registerFunction | `setCruiseControlMaxSpeed` | 79 |
| registerFunction | `getCruiseControlState` | 80 |
| registerFunction | `getCruiseControlSpeed` | 81 |
| registerFunction | `getCruiseControlMaxSpeed` | 82 |
| registerFunction | `getCruiseControlDisplayInfo` | 83 |
| registerFunction | `getAxisForward` | 84 |
| registerFunction | `getAccelerationAxis` | 85 |
| registerFunction | `getDecelerationAxis` | 86 |
| registerFunction | `getCruiseControlAxis` | 87 |
| registerFunction | `getAcDecelerationAxis` | 88 |
| registerFunction | `getDashboardSteeringAxis` | 89 |
| registerFunction | `setReverserDirection` | 90 |
| registerFunction | `getReverserDirection` | 91 |
| registerFunction | `getSteeringDirection` | 92 |
| registerFunction | `getIsDrivingForward` | 93 |
| registerFunction | `getIsDrivingBackward` | 94 |
| registerFunction | `getDrivingDirection` | 95 |
| registerFunction | `getIsVehicleControlledByPlayer` | 96 |
| registerFunction | `getIsPlayerVehicleControlAllowed` | 97 |
| registerFunction | `registerPlayerVehicleControlAllowedFunction` | 98 |
| registerFunction | `updateVehiclePhysics` | 99 |
| registerFunction | `setAccelerationPedalInput` | 100 |
| registerFunction | `setBrakePedalInput` | 101 |
| registerFunction | `setTargetSpeedAndDirection` | 102 |
| registerFunction | `setSteeringInput` | 103 |
| registerFunction | `brakeToStop` | 104 |
| registerFunction | `updateSteeringAngle` | 105 |
| registerOverwrittenFunction | `getIsManualDirectionChangeAllowed` | 111 |
| registerOverwrittenFunction | `getMapHotspotRotation` | 112 |
| registerOverwrittenFunction | `setTransmissionDirection` | 113 |
| registerEvent | `onVehiclePhysicsUpdate` | 119 |
| registerEvent | `onCruiseControlSpeedChanged` | 120 |
| registerEventListener | `onLoad` | 126 |
| registerEventListener | `onRegisterDashboardValueTypes` | 127 |
| registerEventListener | `onDelete` | 128 |
| registerEventListener | `onReadStream` | 129 |
| registerEventListener | `onWriteStream` | 130 |
| registerEventListener | `onReadUpdateStream` | 131 |
| registerEventListener | `onWriteUpdateStream` | 132 |
| registerEventListener | `onUpdate` | 133 |
| registerEventListener | `onDraw` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onLeaveVehicle` | 136 |
| registerEventListener | `onSetBroken` | 137 |
