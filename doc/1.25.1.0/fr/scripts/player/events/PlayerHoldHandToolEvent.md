# player/events/PlayerHoldHandToolEvent.lua

*[English version](../../../../scripts/player/events/PlayerHoldHandToolEvent.md)*

Source: `dataS/scripts/player/events/PlayerHoldHandToolEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'outil à main tenu par un joueur entre le serveur et les clients. Il passe par le canal principal ; un client l'envoie au serveur, qui le rediffuse aux autres clients.

- **PlayerHoldHandToolEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerHoldHandToolEvent.emptyNew() → table` | 18 | ✍ Crée un événement vide sur le canal réseau principal, utilisé lors de la lecture depuis un flux. |
| `PlayerHoldHandToolEvent.new(player: any, handToolId: any, isHolding: any)` | 25 | ✍ Construit l'événement pour un joueur et l'identifiant d'objet d'un outil à main. L'argument `isHolding` est accepté mais jamais stocké ni utilisé. Un `handToolId` nil signifie que l'outil est rangé. |
| `PlayerHoldHandToolEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit l'objet joueur, puis un identifiant d'outil à main optionnel (précédé d'un indicateur de présence), et exécute aussitôt l'événement. |
| `PlayerHoldHandToolEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit l'objet joueur et, s'il est défini, l'identifiant de l'outil à main, précédé d'un booléen de présence. |
| `PlayerHoldHandToolEvent:run(connection: Connection)` | 62 | ✍ Sur le serveur, rediffuse l'événement aux autres clients. Puis résout l'outil à main et appelle `setCurrentHandTool` sur le joueur, seulement si l'outil existe et est synchronisé, ou avec nil pour le vider. |
| `PlayerHoldHandToolEvent.sendEvent(player: table, handToolId: integer, noEventSend: boolean)` | 84 | ✍ Envoie l'événement sauf si `noEventSend` est vrai : le serveur le diffuse à tous les clients, un client l'envoie au serveur. |
