# vehicles/specializations/events/SetDischargeStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetDischargeStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetDischargeStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetDischargeStateEvent` (hérite de `Event`) qui réplique l'état de déchargement d'un véhicule. Elle transporte le véhicule et un état (2 bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetDischargeStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetDischargeStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetDischargeStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetDischargeStateEvent.new(vehicle: table, state: integer)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un état (2 bits). |
| `SetDischargeStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état (2 bits)), puis appelle `run`. |
| `SetDischargeStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état (2 bits)). |
| `SetDischargeStateEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setDischargeState(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `SetDischargeStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 69 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
