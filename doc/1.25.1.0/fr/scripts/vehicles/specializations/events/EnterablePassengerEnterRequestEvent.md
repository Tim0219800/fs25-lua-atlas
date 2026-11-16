# vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/EnterablePassengerEnterRequestEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `EnterablePassengerEnterRequestEvent` (hérite de `Event`) qui est envoyé par un client pour demander au serveur une place passager dans un véhicule. Elle transporte l'id réseau du véhicule et un index de siège envoyé sous la forme `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **EnterablePassengerEnterRequestEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnterablePassengerEnterRequestEvent.emptyNew() → table` | 20 | ✍ Crée une instance vide de `EnterablePassengerEnterRequestEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `EnterablePassengerEnterRequestEvent.new(object: table, seatIndex: table) → table` | 30 | ✍ Crée l'événement avec ses données : l'id réseau du véhicule et un index de siège envoyé sous la forme `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits). |
| `EnterablePassengerEnterRequestEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Lit les données de l'événement depuis le flux réseau (l'id réseau du véhicule et un index de siège envoyé sous la forme `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits)), puis appelle `run`. |
| `EnterablePassengerEnterRequestEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Écrit les données de l'événement dans le flux réseau (l'id réseau du véhicule et un index de siège envoyé sous la forme `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits)). |
| `EnterablePassengerEnterRequestEvent:run(connection: Connection)` | 62 | ✍ Exécute l'événement côté réception : si `getIsPassengerSeatIndexAvailable` est vrai, retrouve l'id utilisateur et répond par un `EnterablePassengerEnterResponseEvent` (diffusé aux autres avec isOwner faux, envoyé au demandeur avec isOwner vrai). |
