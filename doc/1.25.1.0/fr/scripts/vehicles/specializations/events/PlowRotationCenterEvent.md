# vehicles/specializations/events/PlowRotationCenterEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PlowRotationCenterEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowRotationCenterEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PlowRotationCenterEvent` (hérite de `Event`) qui réplique le passage de la rotation de la charrue en position centrale. Elle transporte uniquement le véhicule. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PlowRotationCenterEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowRotationCenterEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `PlowRotationCenterEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PlowRotationCenterEvent.new(object: table)` | 23 | ✍ Crée l'événement avec ses données : uniquement le véhicule. |
| `PlowRotationCenterEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit les données de l'événement depuis le flux réseau (uniquement le véhicule), puis appelle `run`. |
| `PlowRotationCenterEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Écrit les données de l'événement dans le flux réseau (uniquement le véhicule). |
| `PlowRotationCenterEvent:run(connection: Connection)` | 49 | ✍ Exécute l'événement côté réception : appelle `setRotationCenter(true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PlowRotationCenterEvent.sendEvent(object: table, noEventSend: boolean)` | 63 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
