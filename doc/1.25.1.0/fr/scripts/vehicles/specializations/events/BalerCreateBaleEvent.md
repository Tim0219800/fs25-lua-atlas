# vehicles/specializations/events/BalerCreateBaleEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BalerCreateBaleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerCreateBaleEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BalerCreateBaleEvent` (hérite de `Event`) qui indique aux clients qu'une presse a créé une balle. Elle transporte le véhicule, le temps de la balle (float32), le type de matière et, en option, l'id réseau de l'objet balle. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BalerCreateBaleEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerCreateBaleEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BalerCreateBaleEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BalerCreateBaleEvent.new(object: table, baleFillType: integer, baleTime: number, baleServerId: any)` | 24 | ✍ Crée l'événement avec ses données : le véhicule, le temps de la balle (float32), le type de matière et, en option, l'id réseau de l'objet balle. |
| `BalerCreateBaleEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, le temps de la balle (float32), le type de matière et, en option, l'id réseau de l'objet balle), puis appelle `run`. |
| `BalerCreateBaleEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, le temps de la balle (float32), le type de matière et, en option, l'id réseau de l'objet balle). |
| `BalerCreateBaleEvent:run(connection: Connection)` | 64 | ✍ Exécute l'événement côté réception : appelle `createBale(fillType, nil, baleServerId)`, puis règle le temps de la dernière entrée de `spec_baler.bales` (pas de retransmission dans `run`). |
