# vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/EnterablePassengerEnterResponseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `EnterablePassengerEnterResponseEvent` (hérite de `Event`) qui est la réponse du serveur indiquant aux clients qu'un utilisateur a pris une place passager. Elle transporte l'id réseau du véhicule, un indicateur isOwner, l'index de siège (envoyé moins un) et l'id utilisateur. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **EnterablePassengerEnterResponseEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnterablePassengerEnterResponseEvent.emptyNew() → table` | 20 | ✍ Crée une instance vide de `EnterablePassengerEnterResponseEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `EnterablePassengerEnterResponseEvent.new(id: table, isOwner: boolean, seatIndex: table, userId: any) → table` | 31 | ✍ Crée l'événement avec ses données : l'id réseau du véhicule, un indicateur isOwner, l'index de siège (envoyé moins un) et l'id utilisateur. |
| `EnterablePassengerEnterResponseEvent:readStream(streamId: integer, connection: Connection)` | 46 | ✍ Lit les données de l'événement depuis le flux réseau (l'id réseau du véhicule, un indicateur isOwner, l'index de siège (envoyé moins un) et l'id utilisateur), puis appelle `run`. |
| `EnterablePassengerEnterResponseEvent:writeStream(streamId: integer, connection: Connection)` | 59 | ✍ Écrit les données de l'événement dans le flux réseau (l'id réseau du véhicule, un indicateur isOwner, l'index de siège (envoyé moins un) et l'id utilisateur). |
| `EnterablePassengerEnterResponseEvent:run(connection: Connection)` | 70 | ✍ Exécute l'événement côté réception : retrouve le joueur dont l'`uniqueUserId` correspond à l'utilisateur et appelle `player:onEnterVehicleAsPassenger(vehicle, seatIndex)` (pas de retransmission ; pas de test nil sur le joueur). |
