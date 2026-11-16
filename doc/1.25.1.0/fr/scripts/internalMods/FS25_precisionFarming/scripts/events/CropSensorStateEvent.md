# internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui synchronise l'état actif ou non d'un capteur de culture sur un véhicule entre clients et serveur. Un client l'envoie au serveur, qui le rediffuse.

- **CropSensorStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CropSensorStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de CropSensorStateEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `CropSensorStateEvent.new(object: table, state: boolean)` | 23 | ✍ Crée l'événement pour un objet véhicule et un état booléen du capteur. |
| `CropSensorStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit la référence de l'objet réseau et l'état booléen, puis appelle run. |
| `CropSensorStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit la référence de l'objet réseau et l'état booléen. |
| `CropSensorStateEvent:run(connection: Connection)` | 52 | ✍ Côté réception. Sur le serveur, il rediffuse d'abord l'événement aux autres clients (pas à l'expéditeur) ; puis, si l'objet cible existe et est synchronisé, il applique le changement localement sans renvoyer d'événement. Le changement est appliqué via object:setCropSensorActive(state, true). |
| `CropSensorStateEvent.sendEvent(object: table, state: boolean, noEventSend: boolean)` | 67 | ✍ Point d'entrée pour synchroniser l'état du capteur de culture. Serveur : diffuse un nouvel CropSensorStateEvent aux clients (lié à l'objet) ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |
