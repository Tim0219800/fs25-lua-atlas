# player/events/PlayerTeleportEvent.lua

*[English version](../../../../scripts/player/events/PlayerTeleportEvent.md)*

Source: `dataS/scripts/player/events/PlayerTeleportEvent.lua` — FS25 1.25.1.0

✍ Événement client vers serveur ordonnant la téléportation d'un joueur, soit vers des coordonnées du monde, soit vers le point de sortie d'un véhicule. Il n'est traité que sur le serveur, qui retrouve le joueur de la connexion émettrice, et utilise le canal réseau principal.

- **PlayerTeleportEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerTeleportEvent.emptyNew() → table` | 11 | ✍ Crée un événement vide sur le canal réseau principal pour la lecture depuis un flux. |
| `PlayerTeleportEvent.new(x: number, y: number, z: number, isAbsolute: boolean, isRootNode: boolean) → table` | 24 | ✍ Construit un événement de téléportation par coordonnées avec x, y, z et deux indicateurs, `isAbsolute` et `isRootNode`, qui sont sérialisés. |
| `PlayerTeleportEvent.newExitVehicle(exitVehicle: table) → table` | 38 | ✍ Construit un événement de téléportation qui place le joueur au point de sortie du véhicule donné. |
| `PlayerTeleportEvent:readStream(streamId: integer, connection: table)` | 48 | ✍ Lit un booléen : si vrai, un objet véhicule ; sinon trois flottants et les deux indicateurs. Puis exécute l'événement. |
| `PlayerTeleportEvent:writeStream(streamId: integer, connection: table)` | 65 | ✍ Écrit un booléen indiquant si un véhicule de sortie est défini, puis soit l'objet véhicule, soit les flottants x, y, z et les deux indicateurs. |
| `PlayerTeleportEvent:run(connection: table)` | 80 | ✍ Ignoré côté client. Sur le serveur, retrouve le joueur de la connexion et appelle `teleportToExitPoint` pour un véhicule, ou `teleportTo(x, y, z, true, true)` pour des coordonnées ; `isAbsolute` et `isRootNode` stockés ne sont pas utilisés ici. |
