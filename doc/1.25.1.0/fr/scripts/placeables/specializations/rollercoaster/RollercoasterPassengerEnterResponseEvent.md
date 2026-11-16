# placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua

*[English version](../../../../../scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.md)*

Source: `dataS/scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client indiquant quel utilisateur prend quel siège d'une montagne russe, pour que le joueur concerné entre dans le manège. C'est la réponse à RollercoasterPassengerEnterRequestEvent ; les index de siège sont envoyés sur `PlaceableRollercoaster.SEAT_INDEX_NUM_BITS` bits, base zéro sur le réseau et base un en Lua.

- **RollercoasterPassengerEnterResponseEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RollercoasterPassengerEnterResponseEvent.emptyNew() → table` | 19 | ✍ Crée un événement vide avec la métatable de la classe et le canal par défaut. |
| `RollercoasterPassengerEnterResponseEvent.new(rollercoaster: table, userId: integer, seatIndex: integer) → table` | 30 | ✍ Construit la réponse à partir de la montagne russe, d'un id d'utilisateur et de l'index de siège (base un) à occuper. |
| `RollercoasterPassengerEnterResponseEvent:readStream(streamId: integer, connection: Connection)` | 44 | ✍ Lit la montagne russe, l'id d'utilisateur et l'index de siège (en ajoutant 1 à la valeur transmise), puis exécute l'événement. |
| `RollercoasterPassengerEnterResponseEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Écrit la montagne russe, l'id d'utilisateur et l'index de siège moins 1. |
| `RollercoasterPassengerEnterResponseEvent:run(connection: Connection)` | 65 | ✍ Trouve parmi `playerSystem.players` le joueur dont l'id utilisateur unique correspond et appelle `onEnterRollercoaster` avec le siège. À noter : si aucun joueur ne correspond, `player` reste nil et l'appel provoque une erreur. |
