# fence/Fence.lua

*[English version](../../../scripts/fence/Fence.md)*

Source: `dataS/scripts/fence/Fence.lua` — FS25 1.25.1.0

✍ Objet conteneur d'un placeable de clôture : il possède la liste des instances FenceSegment (et FenceGate) ainsi que les modèles de segments, et gère leur schéma XML, l'écriture dans la sauvegarde et la synchronisation réseau à la connexion. Dans ce dump, beaucoup de méthodes utilisées ailleurs (createNewSegment, getSegmentById, removeSegment, deleteSegmentPart...) sont absentes du fichier : leur comportement est NON VÉRIFIÉ.

- **Fence** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Fence.registerXMLPaths(schema: XMLSchema, basePath: string)` | 37 | ✍ Enregistre les chemins XML du placeable `fence.segment(?)#id` et `#class` (tous deux requis), puis délègue à FenceSegment et FenceGate l'enregistrement de leurs propres clés par segment. Utilise le type de spécialisation "Fence". |
| `Fence.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 54 | ✍ Enregistre les chemins XML de sauvegarde d'une clôture : `segment(?)#id` (l'identifiant issu du XML de configuration) plus les clés de sauvegarde de FenceSegment et FenceGate. |
| `Fence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 234 | ✍ Sauvegarde chaque segment sous `segment(i)`. Les segments dont `needsSaving` vaut false sont ignorés ; l'attribut `#id` et le compteur d'index n'avancent que si la sauvegarde du segment renvoie true. |
| `Fence:readStream(streamId: integer, connection: table)` | 251 | ✍ Connexion d'un client : lit un nombre de segments UInt16, puis pour chaque segment un index de modèle UInt8 et ses données (chaînées au segment précédent), met à jour les maillages (true, false) et le finalise avec true. |
| `Fence:writeStream(streamId: integer, connection: table)` | 269 | ✍ Connexion côté serveur : écrit le nombre de segments en UInt16, puis pour chaque segment son index de modèle UInt8 (retrouvé via son id) et ses données, en passant le segment précédent pour le chaînage. Miroir de readStream. |
