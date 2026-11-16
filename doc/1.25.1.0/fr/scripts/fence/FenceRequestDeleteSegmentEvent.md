# fence/FenceRequestDeleteSegmentEvent.lua

*[English version](../../../scripts/fence/FenceRequestDeleteSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceRequestDeleteSegmentEvent.lua` — FS25 1.25.1.0

✍ Requête client vers serveur pour supprimer un segment de clôture, avec une réponse serveur vers client portant un indicateur de succès. Le serveur supprime le segment, répond, puis diffuse un FenceDeleteSegmentEvent aux autres clients. Sous-classe d'Event sur le canal principal.

- **FenceRequestDeleteSegmentEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceRequestDeleteSegmentEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide sur le canal réseau principal. Les constructeurs `new`/`newServerToClient` utilisés dans ce fichier n'y sont pas définis (provenance NON VÉRIFIÉE). |
| `FenceRequestDeleteSegmentEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Côté serveur, lit le placeable et l'identifiant de segment UInt16 ; côté client, lit l'indicateur de succès booléen. Puis appelle run. |
| `FenceRequestDeleteSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 55 | ✍ À l'envoi vers le serveur, écrit le placeable et l'identifiant du segment ; à l'envoi vers un client, écrit le booléen de succès. |
| `FenceRequestDeleteSegmentEvent:run(connection: Connection)` | 67 | ✍ Client : publie l'indicateur de succès sur le message center. Serveur : cherche le segment, répond false s'il n'existe pas, sinon le retire et le supprime, répond true et diffuse un FenceDeleteSegmentEvent à toutes les autres connexions. |
