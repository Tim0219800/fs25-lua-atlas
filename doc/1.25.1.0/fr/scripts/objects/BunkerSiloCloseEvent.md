# objects/BunkerSiloCloseEvent.lua

*[English version](../../../scripts/objects/BunkerSiloCloseEvent.md)*

Source: `dataS/scripts/objects/BunkerSiloCloseEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant la fermeture d'un silo-couloir. Il ne transporte que l'objet silo. L'exécution met le silo à l'état fermé.

- **BunkerSiloCloseEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSiloCloseEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide, utilisée par la couche réseau avant la lecture d'un flux. |
| `BunkerSiloCloseEvent.new(bunkerSilo: table) → table` | 22 | ✍ Crée un événement pour le silo-couloir donné. |
| `BunkerSiloCloseEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit l'objet nœud du silo dans le flux quand la connexion n'est pas vers un serveur, puis exécute l'événement. À noter : run est appelé quel que soit le type de connexion. |
| `BunkerSiloCloseEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit l'objet nœud du silo dans le flux, uniquement quand la connexion est vers un serveur (sens client vers serveur). |
| `BunkerSiloCloseEvent:run(connection: Connection)` | 52 | ✍ Quand la connexion n'est pas vers un serveur, met le silo à l'état BunkerSilo.STATE_CLOSED. |
