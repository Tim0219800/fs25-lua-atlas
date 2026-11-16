# vehicles/specializations/events/FellerBuncherCutEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/FellerBuncherCutEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FellerBuncherCutEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `FellerBuncherCutEvent` (hérite de `Event`) qui réplique la coupe d'un arbre par une abatteuse-empileuse. Elle transporte uniquement le véhicule. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **FellerBuncherCutEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FellerBuncherCutEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `FellerBuncherCutEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `FellerBuncherCutEvent.new(object: table) → table` | 29 | ✍ Crée l'événement avec ses données : uniquement le véhicule. |
| `FellerBuncherCutEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit les données de l'événement depuis le flux réseau (uniquement le véhicule), puis appelle `run`. |
| `FellerBuncherCutEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (uniquement le véhicule). |
| `FellerBuncherCutEvent:run(connection: Connection)` | 57 | ✍ Exécute l'événement côté réception : appelle `cutTree(true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `FellerBuncherCutEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 72 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
