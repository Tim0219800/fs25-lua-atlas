# vehicles/specializations/events/PlowRotationEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PlowRotationEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowRotationEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PlowRotationEvent` (hérite de `Event`) qui réplique le côté cible de la rotation de la charrue. Elle transporte le véhicule et un booléen rotationMax. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PlowRotationEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowRotationEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `PlowRotationEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PlowRotationEvent.new(object: table, rotationMax: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen rotationMax. |
| `PlowRotationEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen rotationMax), puis appelle `run`. |
| `PlowRotationEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen rotationMax). |
| `PlowRotationEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setRotationMax(rotationMax, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PlowRotationEvent.sendEvent(object: table, rotationMax: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
