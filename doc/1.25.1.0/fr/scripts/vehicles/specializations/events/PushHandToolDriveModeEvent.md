# vehicles/specializations/events/PushHandToolDriveModeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PushHandToolDriveModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PushHandToolDriveModeEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PushHandToolDriveModeEvent` (hérite de `Event`) qui réplique le mode de conduite d'un outil poussé à la main. Elle transporte le véhicule et un booléen de mode de conduite. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PushHandToolDriveModeEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PushHandToolDriveModeEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `PushHandToolDriveModeEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PushHandToolDriveModeEvent.new(object: table, driveModeState: integer) → PushHandToolDriveModeEvent` | 29 | ✍ Crée l'événement avec ses données : le véhicule et un booléen de mode de conduite. |
| `PushHandToolDriveModeEvent:readStream(streamId: integer, connection: Connection)` | 41 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen de mode de conduite), puis appelle `run`. |
| `PushHandToolDriveModeEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen de mode de conduite). |
| `PushHandToolDriveModeEvent:run(connection: Connection)` | 60 | ✍ Exécute l'événement côté réception : appelle `setPushHandToolDriveMode(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PushHandToolDriveModeEvent.sendEvent(vehicle: table, driveModeState: integer, noEventSend: boolean)` | 75 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |
