# objects/Basketball.lua

*[English version](../../../scripts/objects/Basketball.md)*

Source: `dataS/scripts/objects/Basketball.lua` — FS25 1.25.1.0

✍ Objet physique représentant un ballon de basket posé sur une carte. Il étend PhysicsObject, se crée soit depuis un nœud i3d de la carte (onCreate, attribut utilisateur filename), soit par code, et charge son modèle via le gestionnaire i3d partagé. Le serveur l'enregistre et les fonctions de flux envoient le nom du fichier i3d aux clients qui rejoignent.

- **Basketball** hérite de `PhysicsObject` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Basketball:onCreate(id: integer)` | 14 | ✍ Callback de carte pour un nœud i3d : lit la transformation du nœud et l'attribut utilisateur filename optionnel (i3d de ballon par défaut), crée un ballon, le charge, l'ajoute à onCreateObjectSystem et l'enregistre, sinon le supprime si le chargement échoue. |
| `Basketball.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 | ✍ Constructeur. Appelle celui de PhysicsObject, fixe une distance de clipping forcée de 150 et enregistre l'objet sous le nom de classe Basketball. Retourne la nouvelle instance. |
| `Basketball:delete()` | 47 | ✍ Libère la requête de chargement i3d partagée si elle existe, désenregistre le nom de classe puis appelle le delete du parent. |
| `Basketball:readStream(streamId: integer, connection: table)` | 60 | ✍ Côté client à la connexion : lit le nom du fichier i3d envoyé par le serveur, crée le nœud s'il n'existe pas encore, puis laisse le parent lire ses données. Sans effet si la connexion n'est pas vers un serveur. |
| `Basketball:writeStream(streamId: integer, connection: table)` | 74 | ✍ Côté serveur quand un client rejoint : écrit le nom du fichier i3d au format réseau, puis les données du parent. Sans effet sur une connexion vers un serveur. |
| `Basketball:createNode(i3dFilename: string)` | 84 | ✍ Mémorise le nom du fichier i3d et l'environnement du mod, charge le fichier via le gestionnaire i3d partagé, prend son premier enfant, le rattache au nœud racine, supprime la racine chargée et le définit comme nœud de l'objet. |
| `Basketball:load(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 106 | ✍ Crée le nœud depuis le fichier i3d, puis le place à la position et à la rotation monde données. Retourne toujours true. |
