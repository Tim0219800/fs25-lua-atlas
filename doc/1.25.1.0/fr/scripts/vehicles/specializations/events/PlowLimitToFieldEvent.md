# vehicles/specializations/events/PlowLimitToFieldEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PlowLimitToFieldEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowLimitToFieldEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PlowLimitToFieldEvent` (hérite de `Event`) qui réplique l'option de limitation du labour au champ d'une charrue. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PlowLimitToFieldEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowLimitToFieldEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `PlowLimitToFieldEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PlowLimitToFieldEvent.new(object: table, plowLimitToField: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `PlowLimitToFieldEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `PlowLimitToFieldEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `PlowLimitToFieldEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setPlowLimitToField(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
