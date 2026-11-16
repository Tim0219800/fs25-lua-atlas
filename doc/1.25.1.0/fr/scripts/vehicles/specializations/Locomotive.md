# vehicles/specializations/Locomotive.lua

*[English version](../../../../scripts/vehicles/specializations/Locomotive.md)*

Source: `dataS/scripts/vehicles/specializations/Locomotive.lua` — FS25 1.25.1.0

✍ Spécialisation pour les locomotives circulant sur une spline. Requiert SplineVehicle et Drivable. Elle contient une machine à états (déplacement automatique, manuel actif/inactif, position demandée, freinage vers une position), remplace la physique du véhicule par un modèle de vitesse 1D simple (effort de traction, freinage, force de pente), simule le régime moteur pour le HUD et peut déplacer un bras de prise de courant vers une spline électrique. Le serveur exécute la physique ; l'état est diffusé via `LocomotiveStateEvent`. Les constantes `Locomotive.STATE_*` sont définies hors de ce fichier (NON VÉRIFIÉ où).

- **Locomotive** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Locomotive.prerequisitesPresent(specializations: table) → boolean` | 30 | ✍ Renvoie vrai seulement si les spécialisations SplineVehicle et Drivable sont présentes. |
| `Locomotive.initSpecialization()` | 36 | ✍ Enregistre le chemin XML `vehicle.locomotive.powerArm#node`. |
| `Locomotive.registerEvents(vehicleType: any)` | 47 | ✍ Enregistre l'événement de spécialisation `onAutomatedTrainTravelActive`, levé à chaque mise à jour pendant le déplacement automatique côté serveur. |
| `Locomotive.registerFunctions(vehicleType: any)` | 53 | ✍ Enregistre sur le type de véhicule les fonctions de force de pente, vitesse, position demandée, état et déplacement automatique. |
| `Locomotive.registerOverwrittenFunctions(vehicleType: any)` | 65 | ✍ Surcharge les fonctions d'état moteur, de physique, de système de train, de nom, de sons, de statistiques, d'accès, de hotspot de carte, de réinitialisation, d'arrêt à la sortie et de régime réel. |
| `Locomotive.registerEventListeners(vehicleType: any)` | 84 | ✍ S'abonne aux événements onLoad, onDelete, onReadStream, onWriteStream, onUpdate, onLeaveVehicle et onEnterVehicle. |
| `Locomotive:onLoad(savegame: table)` | 98 | ✍ Charge le nœud du bras de prise de courant, fixe `serverMass` à 1 pour éviter les divisions par zéro, initialise vitesse et régime, passe à l'état inactif et s'abonne aux messages de changement de ferme et de création du joueur. |
| `Locomotive:onDelete()` | 127 | ✍ Se désabonne de tous les messages du message center. |
| `Locomotive:onReadStream(streamId: integer, connection: Connection)` | 135 | ✍ Connexion client : lit directement l'état de la locomotive depuis le flux. |
| `Locomotive:onWriteStream(streamId: integer, connection: Connection)` | 143 | ✍ Connexion côté serveur : écrit l'état de la locomotive dans le flux. |
| `Locomotive:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 149 | ✍ Dès qu'un système de train existe, lance le déplacement automatique ou l'état manuel (si loué). Côté serveur, pilote la physique à chaque frame pour le déplacement automatique, la position demandée (avec calcul du point de freinage), le freinage et l'état manuel inactif ; les clients maintiennent seulement le véhicule actif. |
| `Locomotive:setTrainSystem(superFunc: any, trainSystem: any)` | 232 | ✍ Surcharge : après le parent, prépare les données de la spline électrique (écart de longueur et temps de recherche) utilisées pour positionner le bras, si bras et spline existent. |
| `Locomotive:getFullName(superFunc: any)` | 250 | ✍ Surcharge : renvoie le nom de l'article de boutique correspondant au fichier de configuration du véhicule (appel sans contrôle de nil). |
| `Locomotive:getAreSurfaceSoundsActive(superFunc: any)` | 257 | ✍ Surcharge : les sons de surface sont actifs quand la dernière vitesse dépasse 0,1. |
| `Locomotive:getTraveledDistanceStatsActive(superFunc: any)` | 263 | ✍ Surcharge : les statistiques de distance ne comptent que dans l'état de déplacement manuel actif. |
| `Locomotive:getIsEnterable(superFunc: any)` | 270 | ✍ Surcharge : accessible seulement si le parent l'autorise, si le train est à portée de conduite et si l'état est manuel (actif ou inactif). |
| `Locomotive:getIsMapHotspotVisible(superFunc: any)` | 285 | ✍ Surcharge : le hotspot n'est visible que si le parent l'autorise, si le train est à portée de conduite et si sa position est dans les limites du terrain. |
| `Locomotive:getMapHotspotPosition(superFunc: any)` | 304 | ✍ Surcharge : renvoie la position du train donnée par le système de train, ou 0, 0, 0 sans système. |
| `Locomotive:getMotorRpmReal(superFunc: any)` | 314 | ✍ Surcharge : renvoie le régime simulé (virtuel) au lieu d'une valeur moteur réelle. |
| `Locomotive:setRequestedSplinePosition(splinePosition: any, noEventSend: any)` | 320 | ✍ Définit une position cible sur la spline (0 à 1, ramenée au tour le plus proche), passe à l'état de position demandée et démarre le moteur côté serveur. `noEventSend` est accepté mais inutilisé. |
| `Locomotive:getDistanceToRequestedPosition()` | 340 | ✍ Renvoie la distance restante jusqu'à la position demandée, en unités de longueur de spline, pendant le déplacement ou le freinage ; 0 sinon ou si la position est dépassée. |
| `Locomotive:setLocomotiveState(state: any, noEventSend: any)` | 360 | ✍ Définit l'état ; le déplacement automatique choisit un personnage de véhicule aléatoire et le manuel actif le restaure. Côté serveur, diffuse `LocomotiveStateEvent` sauf si `noEventSend` est vrai. |
| `Locomotive:startAutomatedTrainTravel()` | 381 | ✍ Passe en déplacement automatique et démarre le moteur. |
| `Locomotive:notifyPlayerFarmChanged()` | 388 | ✍ Callback de message : rend la locomotive sélectionnable par Tab seulement si le train est loué par la ferme du joueur local. |
| `Locomotive:onLeaveVehicle()` | 396 | ✍ Sauf en déplacement automatique, planifie l'heure de départ automatique si prêt, passe à l'état manuel inactif et efface la position demandée. |
| `Locomotive:onEnterVehicle()` | 412 | ✍ Efface la position demandée et le départ planifié, redémarre le moteur si le démarrage automatique est désactivé et que le train roulait seul, puis passe à l'état manuel actif. |
| `Locomotive:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 428 | ✍ Surcharge : pas prête tant qu'un joueur contrôle la locomotive ; sinon s'en remet au parent. |
| `Locomotive:getIsMotorStarted(superFunc: any)` | 438 | ✍ Surcharge : le moteur est aussi considéré comme démarré dans les états de déplacement automatique, de position demandée et de freinage vers position. |
| `Locomotive:getDownhillForce()` | 448 | ✍ Renvoie la force de gravité le long de la voie (masse serveur fois 9,81 fois le sinus de l'angle de pente, positive en descente). |
| `Locomotive:getLocomotiveSpeed()` | 457 | ✍ Renvoie la vitesse simulée de la locomotive (m/s, le signe donne le sens). |
| `Locomotive.getBrakeAcceleration(self: any)` | 463 | ✍ Fonction utilitaire (appelée avec le véhicule) : renvoie la décélération due au freinage (18 pour cent du poids, bien plus faible en conduite à vitesse) et à la pente. Utilise 95 pour cent de la force de pente si la somme est proche de zéro. |
| `Locomotive:updateVehiclePhysics(superFunc: any, axisForward: any, axisSide: any, doHandbrake: any, dt: any)` | 494 | ✍ Surcharge : appelle le parent, puis met à jour la vitesse simulée selon l'effort de traction (plafonné à 300000 et à la force de freinage), le freinage, la pente et le régulateur, la borne aux limites du moteur et met à jour un régime fictif transmis au moteur. |
| `Locomotive:alignToSplineTime(superFunc: any, spline: any, yOffset: any, tFront: any)` | 609 | ✍ Surcharge : après le parent, quand le bras est à moins de 50 m de la caméra active, cale sa hauteur sur le point le plus proche de la spline électrique. Les clients rafraîchissent aussi le hotspot de carte. |
| `Locomotive:getCanBeReset(superFunc: any)` | 646 | ✍ Surcharge : toujours faux, les locomotives ne peuvent pas être réinitialisées. |
| `Locomotive:getStopMotorOnLeave(superFunc: any)` | 652 | ✍ Surcharge : le moteur ne s'arrête à la sortie que dans les états manuels. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAutomatedTrainTravelActive` | 48 |
| registerFunction | `getDownhillForce` | 54 |
| registerFunction | `getLocomotiveSpeed` | 55 |
| registerFunction | `setRequestedSplinePosition` | 56 |
| registerFunction | `getDistanceToRequestedPosition` | 57 |
| registerFunction | `setLocomotiveState` | 58 |
| registerFunction | `startAutomatedTrainTravel` | 59 |
| registerFunction | `notifyPlayerFarmChanged` | 60 |
| registerOverwrittenFunction | `getIsMotorStarted` | 66 |
| registerOverwrittenFunction | `updateVehiclePhysics` | 67 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 68 |
| registerOverwrittenFunction | `alignToSplineTime` | 69 |
| registerOverwrittenFunction | `setTrainSystem` | 70 |
| registerOverwrittenFunction | `getFullName` | 71 |
| registerOverwrittenFunction | `getAreSurfaceSoundsActive` | 72 |
| registerOverwrittenFunction | `getTraveledDistanceStatsActive` | 73 |
| registerOverwrittenFunction | `getIsEnterable` | 74 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 75 |
| registerOverwrittenFunction | `getCanBeReset` | 76 |
| registerOverwrittenFunction | `getStopMotorOnLeave` | 77 |
| registerOverwrittenFunction | `getMapHotspotPosition` | 78 |
| registerOverwrittenFunction | `getMotorRpmReal` | 79 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onDelete` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onUpdate` | 89 |
| registerEventListener | `onLeaveVehicle` | 90 |
| registerEventListener | `onEnterVehicle` | 91 |

## Messages

- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.121)
- s'abonne à `MessageType.PLAYER_CREATED` (l.122)
