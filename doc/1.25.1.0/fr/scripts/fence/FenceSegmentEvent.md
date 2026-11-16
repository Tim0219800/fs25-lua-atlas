# fence/FenceSegmentEvent.lua

*[English version](../../../scripts/fence/FenceSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceSegmentEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par le serveur à tous les clients pour annoncer un segment de clôture nouvellement construit. Il transporte le placeable de clôture, l'index du modèle de segment et les données sérialisées du segment. Sous-classe d'Event sur le canal principal.

- **FenceSegmentEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceSegmentEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide sur le canal réseau principal, à utiliser lors de la lecture depuis un flux. |
| `FenceSegmentEvent.new(fencePlaceable: Placeable, segment: Segment) → FenceSegmentEvent` | 23 | ✍ Crée un événement contenant le placeable de clôture et le segment donnés, prêt à être diffusé. |
| `FenceSegmentEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit le placeable et un index de modèle UInt8, demande à la clôture de créer un segment pour ce modèle, laisse le segment lire ses données, puis appelle run. |
| `FenceSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Écrit le placeable, l'index de modèle UInt8 retrouvé à partir de l'identifiant du segment, puis les données propres du segment. |
| `FenceSegmentEvent:run(connection: Connection)` | 67 | ✍ Si le placeable est synchronisé, met à jour les maillages du segment (indicateurs true, false) et le finalise. Aucune validation ici : le serveur est supposé l'avoir déjà faite. |
