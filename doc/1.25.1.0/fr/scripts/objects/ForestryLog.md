# objects/ForestryLog.lua

*[English version](../../../scripts/objects/ForestryLog.md)*

Source: `dataS/scripts/objects/ForestryLog.lua` — FS25 1.25.1.0

✍ Un tronc d'arbre abattu sous forme d'objet manipulable. Il étend MountableObject, charge de façon asynchrone un enfant aléatoire d'un fichier i3d (variante de tronc), s'enregistre dans le système d'objets et comme obstacle IA tant qu'il est libre, et se sauvegarde dans le XML de la partie (uniqueId, filename, position, rotation, farmId). Quand il est monté, il sort du système d'objets et des obstacles IA.

- **ForestryLog** hérite de `MountableObject` (l.5)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ForestryLog.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 31 | ✍ Constructeur. Appelle celui de MountableObject, enregistre le nom de classe ForestryLog et met uniqueId à nil. Retourne l'instance. |
| `ForestryLog:delete()` | 43 | ✍ Libère la requête i3d partagée, retire l'obstacle IA, désenregistre le nom de classe, retire le tronc du système d'objets et appelle le delete du parent. |
| `ForestryLog:readStream(streamId: integer, connection: table)` | 60 | ✍ À la connexion, lit le nom du fichier i3d et charge le tronc s'il n'a pas encore de nœud. La connexion n'est pas vérifiée et le readStream du parent n'est pas appelé. |
| `ForestryLog:writeStream(streamId: integer, connection: table)` | 71 | ✍ Écrit le nom du fichier i3d au format réseau. Le writeStream du parent n'est pas appelé. |
| `ForestryLog:loadFromFilename(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number, asyncCallback: any, asyncTarget: any, asyncArguments: any)` | 84 | ✍ Lance le chargement asynchrone du fichier i3d (après avoir vérifié qu'il existe) et conserve position, rotation et un callback optionnel pour onForestryLogLoaded. Retourne false si le nom est nil ou le fichier absent, true une fois le chargement lancé. |
| `ForestryLog:onForestryLogLoaded(nodeId: any, failedReason: any, asyncCallbackArguments: any)` | 110 | ✍ Callback du chargement asynchrone. En cas de succès, clone un enfant aléatoire du fichier chargé, le rattache à la racine, applique la pose donnée si elle est complète, le définit comme nœud, enregistre l'objet et l'obstacle IA et supprime la racine chargée. Appelle ensuite le callback optionnel avec un indicateur de succès. |
| `ForestryLog:loadAsyncFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean, asyncCallback: any, asyncTarget: any, asyncArguments: any) → boolean` | 150 | ✍ Lit position, rotation, uniqueId et filename dans le XML de la partie et lance le chargement asynchrone. Appelle le callback avec false si la pose manque ou si le chargement ne peut pas démarrer. |
| `ForestryLog:saveToXMLFile(xmlFile: any, key: any)` | 169 | ✍ Écrit dans le XML de la partie, sous la clé donnée, uniqueId, nom de fichier réseau encodé en HTML, position, rotation et farmId propriétaire du tronc. |
| `ForestryLog:mount(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 190 | ✍ Appelle le mount du parent, puis retire le tronc du système d'objets et désactive son obstacle IA. |
| `ForestryLog:unmount()` | 198 | ✍ Appelle l'unmount du parent. En cas de succès, remet le tronc dans le système d'objets et réactive l'obstacle IA. Retourne true en cas de succès, sinon false. |
| `ForestryLog:mountKinematic(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 217 | ✍ Appelle le mountKinematic du parent, puis retire le tronc du système d'objets et désactive l'obstacle IA. |
| `ForestryLog:unmountKinematic()` | 225 | ✍ Appelle l'unmountKinematic du parent. En cas de succès, restaure l'entrée dans le système d'objets et l'obstacle IA et retourne true, sinon false. |
| `ForestryLog:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 236 | ✍ Appelle le mountDynamic du parent et désactive l'obstacle IA. Contrairement aux autres variantes de montage, il ne touche pas au système d'objets. |
| `ForestryLog:unmountDynamic(isDelete: any)` | 243 | ✍ Appelle l'unmountDynamic du parent, puis réactive l'obstacle IA. |
| `ForestryLog:setForestryLogAIObstacle(isActive: any)` | 250 | ✍ Ajoute le nœud du tronc comme obstacle à aiSystem à l'activation (s'il n'y en a pas) ou le retire à la désactivation. Garde le nœud d'obstacle dans obstacleNodeId. |
| `ForestryLog:getMeshNodes()` | 262 | ✍ Retourne la table tensionBeltMeshes, initialisée vide au chargement. |
| `ForestryLog:getSupportsTensionBelts()` | 268 | ✍ Retourne true : les troncs peuvent être sanglés avec des sangles de tension. |
| `ForestryLog:getAllowPickup()` | 274 | ✍ Retourne false : les troncs ne peuvent pas être ramassés à la main. |
| `ForestryLog:getDefaultRigidBodyType() → string` | 281 | ✍ Retourne RigidBodyType.KINEMATIC comme type de corps rigide par défaut d'un tronc libre. |
