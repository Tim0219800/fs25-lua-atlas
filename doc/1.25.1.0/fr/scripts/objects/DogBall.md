# objects/DogBall.lua

*[English version](../../../scripts/objects/DogBall.md)*

Source: `dataS/scripts/objects/DogBall.lua` — FS25 1.25.1.0

✍ Objet physique de la balle que le chien peut rapporter. Il étend PhysicsObject, charge son modèle depuis un fichier i3d via le gestionnaire i3d partagé et mémorise sur le serveur la position d'apparition, de lancer et la rotation initiale pour pouvoir se réinitialiser. La niche (Doghouse) utilise le drapeau isDeleted pour le suivre (code absent de ce fichier).

- **DogBall** hérite de `PhysicsObject` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DogBall.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 24 | ✍ Constructeur. Appelle celui de PhysicsObject, fixe une distance de clipping forcée de 150 et enregistre le nom de classe DogBall. Retourne l'instance. |
| `DogBall:delete()` | 36 | ✍ Met isDeleted à true, libère la requête i3d partagée, désenregistre le nom de classe et appelle le delete du parent. À noter : sharedLoadRequestId n'est pas remis à nil ensuite. |
| `DogBall:readStream(streamId: integer, connection: table)` | 50 | ✍ Sur une connexion vers un serveur, lit le nom du fichier i3d et, si la balle n'en a pas encore, la charge à l'origine (PhysicsObject fixe la vraie pose). Appelle toujours ensuite le readStream du parent. |
| `DogBall:writeStream(streamId: integer, connection: table)` | 68 | ✍ Quand la connexion n'est pas vers un serveur, écrit le nom du fichier i3d au format réseau. Appelle toujours ensuite le writeStream du parent. |
| `DogBall:createNode(i3dFilename: string)` | 79 | ✍ Mémorise le nom du fichier et l'environnement du mod, charge l'i3d via le gestionnaire partagé, rattache son premier enfant au nœud racine, supprime la racine chargée et définit l'enfant comme nœud. |
| `DogBall:load(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 177 | ✍ Crée le nœud, applique la position et la rotation monde données et, sur le serveur, mémorise spawnPos, throwPos et startRot. Retourne toujours true. |
| `DogBall:reset()` | 192 | ✍ Serveur uniquement : retire le nœud de la physique, le replace à spawnPos et startRot, puis le réintègre à la physique. |
