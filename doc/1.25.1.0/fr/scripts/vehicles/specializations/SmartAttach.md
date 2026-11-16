# vehicles/specializations/SmartAttach.lua

*[English version](../../../../scripts/vehicles/specializations/SmartAttach.md)*

Source: `dataS/scripts/vehicles/specializations/SmartAttach.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet d'atteler un véhicule à un véhicule cible proche d'une simple pression de touche, sans choisir manuellement l'attache. Un nœud trigger détecte les véhicules ayant une attache libre du type configuré ; un activatable (`SmartAttachActivatable`) apparaît alors quand les deux attaches sont proches et alignées. Le fichier définit aussi `SmartAttachActivatable` et `SmartAttachEvent`, qui envoie la demande au serveur et la rediffuse. Elle lit `vehicle.smartAttach#jointType` et `#trigger`.

- **SmartAttachActivatable** (l.225)
- **SmartAttachEvent** hérite de `Event` (l.257)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SmartAttach.prerequisitesPresent(specializations: any)` | 17 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `SmartAttach.initSpecialization()` | 23 | ✍ Déclare les entrées de schéma XML `vehicle.smartAttach#jointType` (nom du type d'attache) et `#trigger` (nœud trigger). |
| `SmartAttach.registerFunctions(vehicleType: any)` | 35 | ✍ Enregistre `smartAttachCallback`, `getCanBeSmartAttached` et `doSmartAttach` sur le type de véhicule. |
| `SmartAttach.registerEventListeners(vehicleType: any)` | 43 | ✍ S'abonne à onLoad, onDelete et onPreAttach. |
| `SmartAttach:onLoad(savegame: any)` | 51 | ✍ Cherche l'input attacher joint correspondant au type d'attache configuré (avertit s'il est invalide ou absent), enregistre le nœud trigger avec `smartAttachCallback`, réinitialise l'état de la cible et crée l'activatable. |
| `SmartAttach:onDelete()` | 89 | ✍ Retire l'activatable du système d'objets activables et supprime le trigger. |
| `SmartAttach:doSmartAttach(targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any, noEventSend: any)` | 105 | ✍ Envoie un SmartAttachEvent puis, côté serveur, détache ce véhicule de son porteur actuel (s'il y en a un) et l'attache au véhicule cible avec les index d'attaches donnés. |
| `SmartAttach:getCanBeSmartAttached()` | 120 | ✍ Retourne true si un véhicule cible est connu, que l'un des deux véhicules est actif pour l'entrée, et que la distance horizontale entre les deux attaches est sous SmartAttach.DISTANCE_THRESHOLD avec une différence de rotation en Y sous SmartAttach.ABS_ANGLE_THRESHOLD (constantes définies hors de l'extrait du dump, valeurs NON VÉRIFIÉES). |
| `SmartAttach:onPreAttach()` | 146 | ✍ Efface le véhicule cible mémorisé et son compteur avant un attelage. |
| `SmartAttach:smartAttachCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 161 | ✍ Callback de trigger : à l'entrée, choisit comme cible le premier véhicule ayant une attache libre du bon type, construit le texte d'action (attelage au sol ou transfert) et ajoute l'activatable ; compte les formes de la cible dans le trigger. À la sortie, décrémente le compteur et efface cible et activatable à zéro. |
| `SmartAttachActivatable.new(smartAttachVehicle: table) → table` | 231 | ✍ Crée l'objet activatable d'un véhicule smart-attach, avec un texte d'activation vide. |
| `SmartAttachActivatable:getIsActivatable() → boolean` | 243 | ✍ Retourne si le véhicule peut actuellement être attelé en smart attach (délègue à `getCanBeSmartAttached`). |
| `SmartAttachActivatable:run()` | 249 | ✍ Appelée quand le joueur l'active : exécute `doSmartAttach` avec le véhicule cible et les index d'attaches mémorisés. |
| `SmartAttachEvent.emptyNew()` | 263 | ✍ Crée un SmartAttachEvent vide, utilisé lors de la lecture depuis le réseau. |
| `SmartAttachEvent.new(vehicle: any, targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 270 | ✍ Crée un SmartAttachEvent contenant le véhicule, le véhicule cible et les deux index d'attaches. |
| `SmartAttachEvent:readStream(streamId: any, connection: any)` | 281 | ✍ Lit dans le flux les deux objets véhicule et les deux index d'attaches sur 7 bits, puis exécute l'événement. |
| `SmartAttachEvent:writeStream(streamId: any, connection: any)` | 291 | ✍ Écrit dans le flux les deux objets véhicule et les deux index d'attaches sur 7 bits. |
| `SmartAttachEvent:run(connection: any)` | 300 | ✍ Appelle `doSmartAttach` sans renvoyer l'événement ; reçu par le serveur, il le rediffuse aux autres clients. |
| `SmartAttachEvent.sendEvent(vehicle: any, targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any, noEventSend: any)` | 310 | ✍ Envoie l'événement sauf si `noEventSend` est vrai : le serveur le diffuse, un client l'envoie à la connexion serveur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `smartAttachCallback` | 36 |
| registerFunction | `getCanBeSmartAttached` | 37 |
| registerFunction | `doSmartAttach` | 38 |
| registerEventListener | `onLoad` | 44 |
| registerEventListener | `onDelete` | 45 |
| registerEventListener | `onPreAttach` | 46 |
