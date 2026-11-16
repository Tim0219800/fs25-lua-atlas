# vehicles/specializations/events/FellerBuncherReleaseEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/FellerBuncherReleaseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FellerBuncherReleaseEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `FellerBuncherReleaseEvent` (hérite de `Event`) qui réplique le relâchement des arbres tenus par une abatteuse-empileuse. Elle transporte uniquement le véhicule. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **FellerBuncherReleaseEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FellerBuncherReleaseEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `FellerBuncherReleaseEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `FellerBuncherReleaseEvent.new(object: table) → table` | 29 | ✍ Crée l'événement avec ses données : uniquement le véhicule. |
| `FellerBuncherReleaseEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit les données de l'événement depuis le flux réseau (uniquement le véhicule), puis appelle `run`. |
| `FellerBuncherReleaseEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (uniquement le véhicule). |
| `FellerBuncherReleaseEvent:run(connection: Connection)` | 57 | ✍ Exécute l'événement côté réception : appelle `releaseMountedTrees(true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `FellerBuncherReleaseEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 72 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
