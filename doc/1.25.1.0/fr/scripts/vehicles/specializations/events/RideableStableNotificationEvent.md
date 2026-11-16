# vehicles/specializations/events/RideableStableNotificationEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/RideableStableNotificationEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/RideableStableNotificationEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `RideableStableNotificationEvent` (hérite de `Event`) qui indique à un client si un cheval est dans son écurie. Elle transporte un booléen isInStable et le nom du cheval. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **RideableStableNotificationEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RideableStableNotificationEvent.emptyNew() → table` | 13 | ✍ Crée une instance vide de `RideableStableNotificationEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `RideableStableNotificationEvent.new(isInStable: table, name: integer)` | 22 | ✍ Crée l'événement avec ses données : un booléen isInStable et le nom du cheval. |
| `RideableStableNotificationEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit les données de l'événement depuis le flux réseau (un booléen isInStable et le nom du cheval), puis appelle `run`. |
| `RideableStableNotificationEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit les données de l'événement dans le flux réseau (un booléen isInStable et le nom du cheval). |
| `RideableStableNotificationEvent:run(connection: Connection)` | 51 | ✍ Exécute l'événement côté réception : affiche une notification en jeu (OK ou critique) formatée avec le nom du cheval. |
