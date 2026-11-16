# fence/FenceRequestDeleteSegmentPartEvent.lua

*[English version](../../../scripts/fence/FenceRequestDeleteSegmentPartEvent.md)*

Source: `dataS/scripts/fence/FenceRequestDeleteSegmentPartEvent.lua` — FS25 1.25.1.0

✍ Requête client vers serveur pour supprimer un seul panneau d'un segment de clôture, ou le segment entier, avec une réponse booléenne du serveur. Le serveur revérifie les permissions, reconstruit les sous-segments restants et diffuse FenceDeleteSegmentEvent puis FenceSegmentEvent aux clients. Sous-classe d'Event sur le canal principal.

- **FenceRequestDeleteSegmentPartEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceRequestDeleteSegmentPartEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide sur le canal réseau principal, pour la réception depuis un flux. |
| `FenceRequestDeleteSegmentPartEvent.newClientToServer(fencePlaceable: Placeable, segmentId: integer, childIndex: integer, hitX: number, hitY: number, hitZ: number, wholeSegment: boolean) → FenceRequestDeleteSegmentPartEvent` | 28 | ✍ Construit la requête : placeable, identifiant du segment, index enfant du nœud du panneau, sa position monde comme localisation de repli, et un indicateur choisissant la suppression du segment entier plutôt que d'un seul panneau. |
| `FenceRequestDeleteSegmentPartEvent.newServerToClient(success: boolean) → FenceRequestDeleteSegmentPartEvent` | 46 | ✍ Construit la réponse du serveur, qui ne contient que l'indicateur de succès. |
| `FenceRequestDeleteSegmentPartEvent:readStream(streamId: integer, connection: Connection)` | 58 | ✍ Côté serveur : lit le placeable, l'identifiant de segment et l'index enfant en UInt16, trois positions monde compressées (paramètres de compression de position des véhicules de la mission) et le booléen de segment entier. Côté client : lit le booléen de succès. Puis appelle run. |
| `FenceRequestDeleteSegmentPartEvent:writeStream(streamId: integer, connection: Connection)` | 83 | ✍ Miroir de readStream : vers le serveur, écrit le placeable, les identifiants, la position compressée et l'indicateur de segment entier ; vers un client, écrit seulement le booléen de succès. |
| `FenceRequestDeleteSegmentPartEvent:run(connection: Connection)` | 126 | ✍ Client : publie le résultat. Serveur : répond false sauf si le placeable est synchronisé, le segment existe, la suppression est autorisée et la ferme du joueur peut le modifier et le supprimer. Il résout ensuite le panneau par index enfant (repli : enfant le plus proche de la position via findNearestChild, non défini dans ce fichier, NON VÉRIFIÉ) et appelle deleteSegmentPart. Il supprime le placeable s'il ne reste aucun segment, sinon diffuse la suppression de l'ancien segment et les nouveaux segments, puis répond true. |
