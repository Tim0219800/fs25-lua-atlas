# placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua

*[English version](../../../../../scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.md)*

Source: `dataS/scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua` — FS25 1.25.1.0

✍ Événement client vers serveur demandant à monter dans une montagne russe, avec la montagne russe et le joueur demandeur. Le serveur le traite avec `tryEnterRide` ; la réponse est un RollercoasterPassengerEnterResponseEvent (envoyé par du code hors de ce fichier).

- **RollercoasterPassengerEnterRequestEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RollercoasterPassengerEnterRequestEvent.emptyNew() → table` | 19 | ✍ Crée un événement vide avec la métatable de la classe et le canal par défaut. |
| `RollercoasterPassengerEnterRequestEvent.new(rollercoaster: table, player: table) → table` | 29 | ✍ Construit la requête à partir de l'objet montagne russe et du joueur qui la fait. |
| `RollercoasterPassengerEnterRequestEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit la montagne russe et le joueur comme objets réseau, puis exécute l'événement. |
| `RollercoasterPassengerEnterRequestEvent:writeStream(streamId: integer, connection: Connection)` | 51 | ✍ Écrit la montagne russe et le joueur comme objets réseau. |
| `RollercoasterPassengerEnterRequestEvent:run(connection: Connection)` | 59 | ✍ Si la montagne russe est synchronisée, appelle `tryEnterRide` avec la connexion et le joueur. Le joueur n'est pas testé contre nil ici. |
