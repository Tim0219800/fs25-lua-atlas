# objects/BunkerSiloOpenEvent.lua

*[English version](../../../scripts/objects/BunkerSiloOpenEvent.md)*

Source: `dataS/scripts/objects/BunkerSiloOpenEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant l'ouverture d'un silo-couloir à une position monde donnée. Il transporte le silo et trois flottants. L'exécution appelle openSilo avec cette position.

- **BunkerSiloOpenEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSiloOpenEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide, utilisée par la couche réseau avant la lecture d'un flux. |
| `BunkerSiloOpenEvent.new(bunkerSilo: table, x: number, y: number, z: number) → table` | 25 | ✍ Crée un événement pour le silo-couloir donné et la position d'ouverture x, y, z. |
| `BunkerSiloOpenEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit l'objet nœud du silo et trois coordonnées float32 quand la connexion n'est pas vers un serveur, puis exécute l'événement. À noter : run est appelé quel que soit le type de connexion. |
| `BunkerSiloOpenEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit l'objet nœud du silo et les trois coordonnées float32, uniquement quand la connexion est vers un serveur (sens client vers serveur). |
| `BunkerSiloOpenEvent:run(connection: Connection)` | 64 | ✍ Quand la connexion n'est pas vers un serveur, appelle openSilo sur le silo avec les x, y, z mémorisés. |
