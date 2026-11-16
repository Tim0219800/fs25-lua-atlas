# vehicles/specializations/events/BalerDropFromPlatformEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BalerDropFromPlatformEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerDropFromPlatformEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BalerDropFromPlatformEvent` (hérite de `Event`) qui réplique la dépose d'une balle depuis la plateforme de la presse. Elle transporte le véhicule et un booléen d'attente de la balle suivante. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BalerDropFromPlatformEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerDropFromPlatformEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BalerDropFromPlatformEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BalerDropFromPlatformEvent.new(object: table, waitForNextBale: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen d'attente de la balle suivante. |
| `BalerDropFromPlatformEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen d'attente de la balle suivante), puis appelle `run`. |
| `BalerDropFromPlatformEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen d'attente de la balle suivante). |
| `BalerDropFromPlatformEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `dropBaleFromPlatform(waitForNextBale, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `BalerDropFromPlatformEvent.sendEvent(object: table, waitForNextBale: boolean, noEventSend: boolean)` | 66 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
