# objects/PhysicsObject.lua

*[English version](../../../scripts/objects/PhysicsObject.md)*

Source: `dataS/scripts/objects/PhysicsObject.lua` — FS25 1.25.1.0

✍ Classe de base (hérite de Object) pour les objets rigides en réseau comme les balles et les palettes. Elle possède un noeud de scène, l'ajoute à la physique, envoie depuis le serveur la position et la rotation compressées quand l'objet a bougé au-delà d'un petit seuil, et interpole côté client la pose reçue avec des corps cinématiques. Elle fournit aussi des tests de portée et de priorité basés sur la distance de clip, l'ajout/retrait fantôme et l'enregistrement noeud-objet auprès de la mission.

- **PhysicsObject** hérite de `Object` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PhysicsObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 16 | ✍ Crée l'objet sans noeud, avec un interpolateur de temps réseau (1,2), une distance de clip forcée de 60 et un dirty flag pour les mises à jour de pose. |
| `PhysicsObject:delete()` | 32 | ✍ Retire les enfants du noeud de la table noeud-objet de la mission, supprime le noeud de scène, marque l'objet comme supprimé puis appelle le delete parent. |
| `PhysicsObject:getAllowsAutoDelete() → boolean` | 48 | ✍ Retourne true : cet objet peut être supprimé automatiquement par le jeu. |
| `PhysicsObject:loadOnCreate(nodeId: integer)` | 55 | ✍ Utilise un noeud de l'i3D de la map : l'assigne via setNodeId et, sur un client, le met en état fantôme (masqué, hors physique). |
| `PhysicsObject:setNodeId(nodeId: integer)` | 65 | ✍ Mémorise le noeud, fixe son type de corps rigide (par défaut dynamique sur le serveur, cinématique sur le client), l'ajoute à la physique, retient la pose initiale, crée les interpolateurs sur les clients et enregistre l'arbre de noeuds. |
| `PhysicsObject:readStream(streamId: integer, connection: table, objectId: any)` | 88 | ✍ Connexion côté client : après le readStream parent, lit la position et la rotation monde compressées et les applique immédiatement, puis réinitialise l'interpolateur de temps réseau. Vérifie qu'un noeud existe. |
| `PhysicsObject:writeStream(streamId: integer, connection: table)` | 113 | ✍ Connexion côté serveur : après le writeStream parent, écrit la position et la rotation monde compressées du noeud. |
| `PhysicsObject:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 135 | ✍ Mise à jour côté client : si le booléen est vrai, lit une pose compressée et la fixe comme cible d'interpolation en démarrant une nouvelle phase réseau. |
| `PhysicsObject:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 160 | ✍ Mise à jour côté serveur : si le dirty flag de pose est présent dans le masque, écrit la dernière position et rotation envoyées (compressées). |
| `PhysicsObject:update(dt: number)` | 179 | ✍ Ne fait rien si l'objet est déjà supprimé. Client : fait avancer les interpolateurs et applique la pose interpolée, en restant actif pendant l'interpolation. Serveur : reste actif tant que le corps n'est pas endormi. |
| `PhysicsObject:updateMove() → boolean` | 207 | ✍ Compare la pose monde du noeud à la dernière envoyée (0,005 en position, 0,02 en rotation). S'il a bougé, lève le dirty flag de pose et mémorise la nouvelle pose. Retourne s'il a bougé. |
| `PhysicsObject:updateTick(dt: number)` | 225 | ✍ Uniquement sur le serveur, appelle updateMove pour détecter le mouvement à synchroniser. |
| `PhysicsObject:testScope(x: number, y: number, z: number, coeff: number) → boolean` | 238 | ✍ Retourne true si l'objet est plus proche de la position de l'observateur que la distance de clip du noeud multipliée par coeff, plafonnée par forcedClipDistance. Sert à décider quels clients reçoivent l'objet. |
| `PhysicsObject:getUpdatePriority(skipCount: number, x: number, y: number, z: number, coeff: number, connection: table, isGuiVisible: any) → number` | 258 | ✍ Calcule la priorité de mise à jour réseau : les objets proches obtiennent un score plus élevé (poids de 80 %), avec un bonus selon le nombre de mises à jour sautées (poids de 20 %). |
| `PhysicsObject:onGhostRemove()` | 267 | ✍ Masque le noeud et le retire de la physique (état fantôme). |
| `PhysicsObject:onGhostAdd()` | 274 | ✍ Affiche le noeud et le remet dans la physique. |
| `PhysicsObject:wakeUp()` | 281 | ✍ Réveille le corps physique du noeud via I3DUtil.wakeUpObject. |
| `PhysicsObject:setWorldPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 302 | ✍ Fixe la position monde et le quaternion du noeud. Si changeInterp est vrai, un client réinitialise ses interpolateurs sur cette pose, et le serveur lève le dirty flag et la mémorise comme dernière pose envoyée. |
| `PhysicsObject:setLocalPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 327 | ✍ Équivalent de la version monde mais avec translation et quaternion locaux ; avec changeInterp, les interpolateurs ou la pose envoyée utilisent la pose monde résultante. |
| `PhysicsObject:getDefaultRigidBodyType() → string` | 347 | ✍ Retourne DYNAMIC sur le serveur et KINEMATIC sur les clients, car le serveur pilote la physique. |
| `PhysicsObject:addChildenToNodeObject(nodeId: integer)` | 373 | ✍ Parcourt récursivement l'arbre de noeuds ; chaque noeud ayant un corps rigide est associé à cet objet dans la mission et, sur le serveur, reçoit un rapport de réveil appelant onPhysicObjectWakeUpCallback. Le nom garde l'orthographe d'origine 'Childen'. |
