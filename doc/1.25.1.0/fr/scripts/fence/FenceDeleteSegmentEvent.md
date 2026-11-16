# fence/FenceDeleteSegmentEvent.lua

*[English version](../../../scripts/fence/FenceDeleteSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceDeleteSegmentEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui demande à chaque pair de retirer un segment de clôture, identifié par son placeable et un identifiant de segment sur 16 bits. Il est diffusé par le serveur (voir FenceRequestDeleteSegmentEvent) et, à la réception, supprime le segment et publie un message. Sous-classe d'Event sur le canal principal.

- **FenceDeleteSegmentEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceDeleteSegmentEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide sur le canal réseau principal, utilisée à la réception depuis un flux. Il n'y a pas de constructeur `new` dans ce fichier : l'émetteur doit renseigner lui-même `fencePlaceable` et `segmentId`. |
| `FenceDeleteSegmentEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit le placeable de clôture (objet nœud) et l'identifiant de segment UInt16 depuis le flux, puis appelle aussitôt run. |
| `FenceDeleteSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit le placeable de clôture comme objet nœud puis l'identifiant de segment en UInt16. |
| `FenceDeleteSegmentEvent:run(connection: Connection)` | 51 | ✍ Si le placeable est synchronisé : le serveur rediffuse l'événement, puis le segment est retiré de la clôture, supprimé, et un message est publié avec le placeable et le segment. Sur le serveur, le placeable est lui-même supprimé quand il ne reste plus de segment. |
