# fence/FenceGate.lua

*[English version](../../../scripts/fence/FenceGate.md)*

Source: `dataS/scripts/fence/FenceGate.lua` — FS25 1.25.1.0

✍ Segment de clôture qui est un portail : sous-classe de FenceSegment qui clone un nœud de portail depuis l'i3d de la clôture, pilote un ou plusieurs AnimatedObject (battants) et peut enregistrer une zone de blocage IA pour que les agents GoTo attendent et l'ouvrent. Il lit les clés XML `fence.segment(?).gate` (node, alignY, poteaux, length, depth, depthOffset), sauvegarde l'indicateur inversé et l'état d'animation, et synchronise les battants pour les clients qui rejoignent. Le déclenchement est limité aux fermes ayant accès au propriétaire de la parcelle ou à sa mission active.

- **FenceGate** hérite de `FenceSegment` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceGate.registerXMLPaths(schema: XMLSchema, basePath: string)` | 22 | ✍ Enregistre les clés XML `.gate` (node, alignY, hasStartPole, hasEndPole, length, depth, depthOffset), les clés d'AnimatedObject, et par animation `useAIBlockingRegion` (false par défaut), `aiBlockingRegion#stopDistance` (2 par défaut) et `#openedStateAnimTime` (1 par défaut, normalisé 0..1). |
| `FenceGate.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 41 | ✍ Enregistre les clés de sauvegarde : celles de FenceSegment, `#reversed`, et `animatedObject(?)` avec son `#id` et les clés de sauvegarde d'AnimatedObject. |
| `FenceGate.new(id: integer, metadata: table, fence: Fence, customMt: table?) → FenceGate` | 55 | ✍ Crée un portail : recharge l'i3d de la clôture en privé, détache le nœud du portail comme racine cachée et construit un AnimatedObject par entrée `animatedObject`. Chacun n'est déclenchable que par les fermes autorisées à accéder au propriétaire de la parcelle ou à la ferme de la mission. Une zone de blocage IA n'est mémorisée que si le portail est plus large que FenceGate.MIN_WIDTH_AI_BLOCKING_REGION (défini hors de ce fichier, NON VÉRIFIÉ). |
| `FenceGate.loadMetadataFromXML(xmlFile: XMLFile, key: string, id: string, fence: Fence) → table` | 127 | ✍ Complète les métadonnées du segment avec la classe FenceGate et une table `gate` lue depuis `.gate` (length, depth, depthOffset, alignY, indicateurs de poteaux à true par défaut), et enregistre le nœud de portail partagé comme nœud source de la clôture pour le retirer de la scène et de la physique. |
| `FenceGate:delete()` | 161 | ✍ Retire chaque zone de blocage IA du système IA et supprime les objets animés, supprime le nœud racine caché, se désabonne de FARMLAND_OWNER_CHANGED, puis appelle le delete du parent. À noter : `blockingRegionId` est lu mais jamais assigné dans ce fichier (origine NON VÉRIFIÉE). |
| `FenceGate:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 189 | ✍ Charge l'indicateur inversé et les données du parent, puis remonte les Y de début et de fin à la hauteur du terrain (toujours pour une nouvelle sauvegarde, sinon seulement si sous le terrain) et reconstruit les maillages en cas de changement. Restaure ensuite l'état de chaque objet animé retrouvé par id sauvegardé. Renvoie false si le chargement du parent échoue. |
| `FenceGate:saveToXMLFile(xmlFile: XMLFile, key: string) → boolean` | 232 | ✍ Sauvegarde les données du parent, `#reversed` seulement s'il vaut true, et chaque objet animé sous `animatedObject(i)` avec son id de sauvegarde. Renvoie false si la sauvegarde du parent échoue. Un TODO de la source indique que les noms de mods ne sont pas gérés. |
| `FenceGate:readStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 259 | ✍ Lit les données du segment parent et le booléen inversé ; sur un client, lit aussi pour chaque objet animé son identifiant d'objet réseau et son état, et termine son enregistrement côté client. |
| `FenceGate:writeStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 280 | ✍ Écrit les données du segment parent et le booléen inversé ; pour une connexion vers un client, écrit l'identifiant réseau et l'état de chaque objet animé et enregistre l'objet dans le flux. |
