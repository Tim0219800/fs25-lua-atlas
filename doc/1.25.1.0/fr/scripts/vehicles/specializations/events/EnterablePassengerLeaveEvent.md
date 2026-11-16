# vehicles/specializations/events/EnterablePassengerLeaveEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/EnterablePassengerLeaveEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/EnterablePassengerLeaveEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `EnterablePassengerLeaveEvent` (hérite de `Event`) qui réplique le départ d'un utilisateur d'une place passager. Elle transporte le véhicule et l'id utilisateur. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **EnterablePassengerLeaveEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnterablePassengerLeaveEvent.emptyNew() → table` | 20 | ✍ Crée une instance vide de `EnterablePassengerLeaveEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `EnterablePassengerLeaveEvent.new(vehicle: table, userId: any) → table` | 29 | ✍ Crée l'événement avec ses données : le véhicule et l'id utilisateur. |
| `EnterablePassengerLeaveEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et l'id utilisateur), puis appelle `run`. |
| `EnterablePassengerLeaveEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et l'id utilisateur). |
| `EnterablePassengerLeaveEvent:run(connection: Connection)` | 58 | ✍ Exécute l'événement côté réception : si le véhicule est synchronisé, retrouve le joueur par id utilisateur et appelle `player:leaveVehicle(vehicle, true)`, sinon journalise un message dev. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `EnterablePassengerLeaveEvent.sendEvent(vehicle: any, userId: any, noEventSend: any)` | 77 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
