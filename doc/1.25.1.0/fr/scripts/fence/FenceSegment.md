# fence/FenceSegment.lua

*[English version](../../../scripts/fence/FenceSegment.md)*

Source: `dataS/scripts/fence/FenceSegment.lua` — FS25 1.25.1.0

✍ Un tronçon rectiligne de clôture : positions monde de début et de fin, poteaux de début/fin optionnels et une chaîne de panneaux construits à partir des métadonnées du modèle de segment. Ce dump ne conserve que le schéma XML, la sauvegarde des positions, la synchronisation réseau et les accesseurs de position ; les méthodes de construction des maillages, de finalisation, de suppression et de validation appelées par les autres fichiers (updateMeshes, finalize, getPrice, getCanBeBuilt...) sont absentes, leur comportement est donc NON VÉRIFIÉ. FenceGate étend cette classe.

- **FenceSegment** (l.33)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceSegment.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Enregistre les clés XML par segment : limites d'angle vertical et de pente, distances d'accrochage, réglages d'accrochage parallèle et de prolongement, `#price`, `poles.pole(?)` (variation, node, radius, height) et `panels` (maxScale, useRandomization, `panel(?)` avec node, collisionNode, length, width, height, alignY, scaleZ). |
| `FenceSegment:saveToXMLFile(xmlFile: any, key: any)` | 370 | ✍ Écrit les positions de début et de fin comme translations sous `#start` et `#end`. Renvoie false (avec un log de développement) si l'une des positions n'est pas définie, ce qui fait ignorer le segment par l'appelant. |
| `FenceSegment:readStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 387 | ✍ Lit le segment depuis un flux : l'identifiant UInt16 (seulement si l'émetteur est le serveur), une position de début ou, si le booléen est false, la fin du segment précédent, puis la position de fin compressée, les indicateurs de poteaux si le modèle en a, et l'indicateur de reconstruction après coupe. Enregistre les callbacks de hauteur du terrain. |
| `FenceSegment:writeStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 426 | ✍ Miroir de readStream : écrit l'identifiant (à l'envoi vers un client), omet la position de début si elle égale la fin du segment précédent, puis la position de fin compressée, les indicateurs de poteaux et l'indicateur de reconstruction après coupe. |
| `FenceSegment:getStartPos() → number, number, number` | 563 | ✍ Renvoie la position de début en trois nombres (x, y, z). |
| `FenceSegment:getStartPosVector() → vector?` | 570 | ✍ Renvoie la position de début sous forme de vecteur, ou nil si elle n'est pas encore définie. |
| `FenceSegment:getEndPos() → number, number, number` | 622 | ✍ Renvoie la position de fin en trois nombres (x, y, z). |
| `FenceSegment:getSegmentPartStartEnd(node: integer) → number?, number?, number?, number?, number?, number?, boolean?, boolean?` | 1193 | ✍ Résout un nœud en partie de segment (via getSegmentPartFromNode, absente de ce fichier, NON VÉRIFIÉ) et renvoie ses positions monde de début et de fin, ainsi que si c'est la première ou la dernière partie du segment (tolérance de 0,01). Renvoie nil si aucune partie n'est trouvée. |
