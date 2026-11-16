# vehicles/specializations/events/BalerSetBaleTimeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BalerSetBaleTimeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerSetBaleTimeEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BalerSetBaleTimeEvent` (hérite de `Event`) qui synchronise la valeur de temps d'une balle contenue dans une presse. Elle transporte le véhicule, un index de balle (int32) et un temps (float32). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerSetBaleTimeEvent.emptyNew() → table` | 15 | ✍ Crée une instance vide de `BalerSetBaleTimeEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BalerSetBaleTimeEvent.new(object: table, bale: integer, baleTime: number)` | 25 | ✍ Crée l'événement avec ses données : le véhicule, un index de balle (int32) et un temps (float32). |
| `BalerSetBaleTimeEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un index de balle (int32) et un temps (float32)), puis appelle `run`. |
| `BalerSetBaleTimeEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un index de balle (int32) et un temps (float32)). |
| `BalerSetBaleTimeEvent:run(connection: Connection)` | 57 | ✍ Exécute l'événement côté réception : appelle `setBaleTime(bale, baleTime)` sur le véhicule (pas de retransmission dans `run`). |
