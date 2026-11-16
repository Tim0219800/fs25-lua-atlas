# vehicles/specializations/events/HonkEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/HonkEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/HonkEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `HonkEvent` (hérite de `Event`) qui réplique le déclenchement ou l'arrêt du klaxon. Elle transporte le véhicule et un booléen isPlaying. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **HonkEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HonkEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `HonkEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `HonkEvent.new(object: table, isPlaying: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen isPlaying. |
| `HonkEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen isPlaying), puis appelle `run`. |
| `HonkEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen isPlaying). |
| `HonkEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `playHonk(isPlaying, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `HonkEvent.sendEvent(vehicle: table, isPlaying: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
