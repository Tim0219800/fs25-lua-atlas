# vehicles/VehicleLowerImplementEvent.lua

*[English version](../../../scripts/vehicles/VehicleLowerImplementEvent.md)*

Source: `dataS/scripts/vehicles/VehicleLowerImplementEvent.lua` — FS25 1.25.1.0

✍ Événement réseau synchronisant l'abaissement ou le relevage d'un outil sur une articulation d'attelage donnée. Il transporte le véhicule, un indice d'articulation signé sur 8 bits et l'indicateur de descente, et appelle `setJointMoveDown`. Le serveur rediffuse les événements reçus des clients.

- **VehicleLowerImplementEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleLowerImplementEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la désérialisation depuis un flux. |
| `VehicleLowerImplementEvent.new(vehicle: table, jointIndex: integer, moveDown: boolean) → table` | 25 | ✍ Construit l'événement à partir du véhicule, de l'indice d'articulation et de `moveDown` (vrai pour abaisser). |
| `VehicleLowerImplementEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Lit le véhicule, un indice d'articulation signé sur 8 bits et l'indicateur de descente, puis appelle `run`. |
| `VehicleLowerImplementEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Écrit l'objet véhicule, l'indice d'articulation signé sur 8 bits et l'indicateur de descente. |
| `VehicleLowerImplementEvent:run(connection: Connection)` | 57 | ✍ Si le véhicule est synchronisé, appelle `setJointMoveDown(jointIndex, moveDown, true)` (sans renvoi d'événement). Sur le serveur, rediffuse aussi aux autres clients. |
| `VehicleLowerImplementEvent.sendEvent(vehicle: table, jointIndex: integer, moveDown: boolean, noEventSend: boolean)` | 72 | ✍ Aide statique : sauf si `noEventSend` est vrai, le serveur diffuse l'événement et un client l'envoie au serveur. |
