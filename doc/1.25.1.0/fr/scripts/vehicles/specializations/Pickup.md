# vehicles/specializations/Pickup.lua

*[English version](../../../../scripts/vehicles/specializations/Pickup.md)*

Source: `dataS/scripts/vehicles/specializations/Pickup.lua` — FS25 1.25.1.0

✍ Spécialisation des outils dont le pick-up peut être abaissé indépendamment (autochargeuse, presse et similaires). Elle exige AnimatedVehicle. Elle mémorise l'état abaissé, joue une animation de levage ou d'abaissement configurable, synchronise l'état via PickupSetStateEvent, ajoute une action LOWER_IMPLEMENT, enregistre une action contrôlée auprès du contrôleur d'actions du véhicule racine, et augmente salissure et usure quand le pick-up est abaissé et travaille.

- **Pickup** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Pickup.prerequisitesPresent(specializations: any)` | 19 | ✍ Retourne true seulement si le type de véhicule possède la spécialisation AnimatedVehicle. |
| `Pickup.initSpecialization()` | 25 | ✍ Enregistre les chemins XML de l'animation du pick-up (name, lowerSpeed, liftSpeed, isDefaultLowered) sous la clé contenue dans Pickup.PICKUP_XML_KEY, définie hors des lignes visibles de ce dump (valeur NON VÉRIFIÉE). |
| `Pickup.registerFunctions(vehicleType: any)` | 39 | ✍ Enregistre allowPickingUp, setPickupState, loadPickupFromXML et getCanChangePickupState sur le type de véhicule. |
| `Pickup.registerOverwrittenFunctions(vehicleType: any)` | 48 | ✍ Surcharge getIsLowered, les multiplicateurs de salissure et d'usure, les deux enregistrements d'actions d'abaissement et les contrôles de décharge au sol et vers un objet. |
| `Pickup.registerEventListeners(vehicleType: any)` | 60 | ✍ S'abonne aux événements de chargement, post-chargement, lecture/écriture de flux, abaissement général, changement de véhicule racine et changement de temps de pliage. |
| `Pickup:onLoad(savegame: any)` | 72 | ✍ Charge les réglages du pick-up depuis la clé XML vehicle.pickup dans la spec via loadPickupFromXML. |
| `Pickup:onPostLoad(savegame: any)` | 78 | ✍ Si une animation existe, la place immédiatement à sa position finale : abaissée si isDefaultLowered est défini (et marque l'état abaissé), relevée sinon. |
| `Pickup:onReadStream(streamId: any, connection: any)` | 94 | ✍ Client à la connexion : lit l'indicateur d'abaissement et l'applique avec setPickupState sans envoyer d'événement. |
| `Pickup:onWriteStream(streamId: any, connection: any)` | 101 | ✍ Serveur à la connexion : écrit l'indicateur d'abaissement courant. |
| `Pickup:onSetLoweredAll(doLowering: any, jointDescIndex: any)` | 108 | ✍ Suit la commande d'abaissement général de la chaîne de véhicules en fixant l'état du pick-up à la valeur demandée. |
| `Pickup:onRootVehicleChanged(rootVehicle: table)` | 115 | ✍ Enregistre (ou rattache de nouveau) une action contrôlée lowerPickup sur le contrôleur d'actions du nouveau véhicule racine, sauvegardée, avec des écouteurs IA de début et fin de ligne si l'IA doit abaisser ; la retire si aucun contrôleur ne s'applique. Ignoré s'il n'y a pas d'animation. |
| `Pickup:onFoldTimeChanged(foldAnimTime: number)` | 145 | ✍ Rafraîchit le texte et la disponibilité de l'action d'abaissement quand le temps de pliage change. |
| `Pickup:actionControllerLowerPickupEvent(direction: any)` | 151 | ✍ Callback du contrôleur d'actions : abaisse le pick-up si la direction est positive, le relève sinon, et retourne true. |
| `Pickup:setPickupState(isPickupLowered: any, noEventSend: any)` | 158 | ✍ Change l'état abaissé s'il diffère, envoie PickupSetStateEvent sauf si noEventSend, joue l'animation d'abaissement ou de levage depuis le temps courant et rafraîchit l'événement d'action. |
| `Pickup:allowPickingUp()` | 184 | ✍ Retourne true tant que le pick-up est abaissé, c'est-à-dire que la récolte peut être ramassée. |
| `Pickup:getIsLowered(superFunc: any, default: any)` | 191 | ✍ Retourne l'état abaissé propre du pick-up, en ignorant l'argument par défaut et le parent. |
| `Pickup:loadPickupFromXML(xmlFile: any, key: any, spec: any)` | 198 | ✍ Lit le nom et les vitesses de l'animation depuis une clé donnée dans la table de spec fournie. Si l'animation n'existe pas, le nom est vidé et l'état est abaissé. La vitesse de levage vaut par défaut l'opposé de celle d'abaissement. Retourne toujours true. |
| `Pickup:getCanChangePickupState(spec: any, newState: any)` | 217 | ✍ Point d'extension qui retourne toujours true ; il reçoit la table de spec et le nouvel état et peut être surchargé par d'autres codes pour restreindre la bascule. |
| `Pickup:getDirtMultiplier(superFunc: any)` | 223 | ✍ Tant que le pick-up est abaissé et que le véhicule est en marche (ou ne peut pas être allumé), ajoute au résultat du parent le multiplicateur de salissure de travail pondéré par la vitesse rapportée à la limite. |
| `Pickup:getWearMultiplier(superFunc: any)` | 235 | ✍ Tant que le pick-up est abaissé et que le véhicule est en marche (ou ne peut pas être allumé), ajoute au résultat du parent le multiplicateur d'usure de travail pondéré par la vitesse rapportée à la limite. |
| `Pickup:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 247 | ✍ Si une animation existe, enregistre une action motorisée LOWER_IMPLEMENT pour basculer le pick-up et saute l'enregistrement du parent si c'est l'entrée demandée ; sinon appelle le parent. |
| `Pickup:registerSelfLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 265 | ✍ Délègue à la même logique que registerLoweringActionEvent. |
| `Pickup:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 271 | ✍ Retourne false tant que le pick-up est abaissé, sauf si spec_pickup.allowWhileTipping est défini (nulle part dans ce fichier) ; sinon délègue au parent. |
| `Pickup:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 283 | ✍ Retourne false tant que le pick-up est abaissé, sauf si spec_pickup.allowWhileTipping est défini (nulle part dans ce fichier) ; sinon délègue au parent. |
| `Pickup.updateActionEvents(self: any)` | 295 | ✍ Fonction statique : fixe le texte de levage ou d'abaissement de l'action LOWER_IMPLEMENT et l'active selon getCanChangePickupState ; seulement si une animation existe. |
| `Pickup.actionEventTogglePickup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 314 | ✍ Callback d'entrée : bascule l'état du pick-up si getCanChangePickupState l'autorise. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `allowPickingUp` | 40 |
| registerFunction | `setPickupState` | 41 |
| registerFunction | `loadPickupFromXML` | 42 |
| registerFunction | `getCanChangePickupState` | 43 |
| registerOverwrittenFunction | `getIsLowered` | 49 |
| registerOverwrittenFunction | `getDirtMultiplier` | 50 |
| registerOverwrittenFunction | `getWearMultiplier` | 51 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 52 |
| registerOverwrittenFunction | `registerSelfLoweringActionEvent` | 53 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 54 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 55 |
| registerEventListener | `onLoad` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onWriteStream` | 64 |
| registerEventListener | `onSetLoweredAll` | 65 |
| registerEventListener | `onRootVehicleChanged` | 66 |
| registerEventListener | `onFoldTimeChanged` | 67 |
