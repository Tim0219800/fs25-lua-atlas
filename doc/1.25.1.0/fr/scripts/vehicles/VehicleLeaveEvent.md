# vehicles/VehicleLeaveEvent.lua

*[English version](../../../scripts/vehicles/VehicleLeaveEvent.md)*

Source: `dataS/scripts/vehicles/VehicleLeaveEvent.lua` — FS25 1.25.1.0

✍ Événement réseau signalant qu'un utilisateur a quitté un véhicule. Les clients l'envoient au serveur, qui efface la connexion propriétaire et la ferme contrôleuse puis le rediffuse ; chaque machine appelle ensuite `leaveVehicle` sur le joueur concerné. `sendEvent` est le point d'entrée utilisé par le code du jeu. Canal principal.

- **VehicleLeaveEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleLeaveEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide sur le canal réseau principal. |
| `VehicleLeaveEvent.new(vehicle: table, userId: any) → table` | 23 | ✍ Construit l'événement à partir du véhicule et de l'identifiant de l'utilisateur qui le quitte. |
| `VehicleLeaveEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit l'objet véhicule et l'identifiant d'utilisateur depuis le flux, puis appelle `run`. |
| `VehicleLeaveEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit dans le flux l'objet véhicule et l'identifiant d'utilisateur. |
| `VehicleLeaveEvent:run(connection: Connection)` | 52 | ✍ Ignoré si le véhicule manque ou n'est pas synchronisé. Sur le serveur, réinitialise la connexion propriétaire et `controllerFarmId` puis rediffuse aux autres clients. Partout, appelle `leaveVehicle(vehicle, true)` sur le joueur retrouvé par utilisateur. |
| `VehicleLeaveEvent.sendEvent(vehicle: any, userId: any, noEventSend: any)` | 81 | ✍ Aide statique : sauf si `noEventSend` est vrai, le serveur diffuse l'événement aux clients et un client l'envoie à la connexion serveur. |
