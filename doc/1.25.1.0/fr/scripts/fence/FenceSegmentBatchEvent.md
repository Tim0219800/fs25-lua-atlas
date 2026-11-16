# fence/FenceSegmentBatchEvent.lua

*[English version](../../../scripts/fence/FenceSegmentBatchEvent.md)*

Source: `dataS/scripts/fence/FenceSegmentBatchEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client avec deux formes dans une même classe : un lot de segments de clôture fraîchement construits (construction en masse), ou un rapport de progression (identifiant de requête, étapes faites, étapes totales) sans segments, envoyé au seul client demandeur. Le premier booléen du flux choisit la forme. Sous-classe d'Event sur le canal principal.

- **FenceSegmentBatchEvent** hérite de `Event` (l.28)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceSegmentBatchEvent.emptyNew() → FenceSegmentBatchEvent` | 39 | ✍ Crée un événement vide sur le canal réseau principal. |
| `FenceSegmentBatchEvent.newSegments(fencePlaceable: Placeable, segments: table) → FenceSegmentBatchEvent` | 50 | ✍ Crée la forme lot pour un placeable et un tableau de segments construits. La source mentionne un plafond MAX_SEGMENTS (non défini dans ce fichier, NON VÉRIFIÉ) ; le nombre est écrit en UInt8. |
| `FenceSegmentBatchEvent.newProgress(requestId: integer, doneSteps: integer, totalSteps: integer) → FenceSegmentBatchEvent` | 67 | ✍ Crée la forme progression à partir d'un identifiant de requête de construction, des étapes faites et des étapes totales. Destiné au seul client demandeur, car les identifiants de run sont propres à chaque client. |
| `FenceSegmentBatchEvent:readStream(streamId: integer, connection: Connection)` | 81 | ✍ Lit le booléen de forme. Forme progression : identifiant de requête UInt8 et deux compteurs UInt16, puis run. Forme lot : lit le placeable (journalise une erreur et abandonne s'il est inconnu, ce qui désaligne le flux), puis pour chaque segment un index de modèle UInt8 et les données du segment (sans segment précédent chaîné), puis run. |
| `FenceSegmentBatchEvent:writeStream(streamId: integer, connection: Connection)` | 123 | ✍ Écrit le booléen de forme (true si des segments sont définis), puis soit les compteurs de progression, soit le placeable, le nombre de segments et, pour chacun, son index de modèle et ses données. |
| `FenceSegmentBatchEvent:run(connection: Connection)` | 149 | ✍ Forme progression : publie l'identifiant de requête et les étapes faites/totales sur le message center. Forme lot : si le placeable n'est pas synchronisé, supprime les segments qui viennent d'être créés ; sinon met à jour les maillages (true, false) et finalise chacun. |
