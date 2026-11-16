# objects/AnimatedMapObject.lua

*[English version](../../../scripts/objects/AnimatedMapObject.md)*

Source: `dataS/scripts/objects/AnimatedMapObject.lua` — FS25 1.25.1.0

✍ Sous-classe d'AnimatedObject pour les objets animés placés directement dans l'i3d d'une carte. Le nœud de carte porte des attributs utilisateur (xmlFilename et saveId) qui pointent vers un XML contenant la définition réelle de l'animation. Le point d'entrée onCreate le crée, le charge et l'enregistre auprès du système d'objets onCreate et du réseau.

- **AnimatedMapObject** hérite de `AnimatedObject` (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimatedMapObject:onCreate(id: integer)` | 25 | ✍ Rappel onCreate i3d : construit une instance avec les indicateurs serveur/client courants, la charge depuis le nœud, puis l'ajoute à g_currentMission.onCreateObjectSystem et l'enregistre sur le réseau. Si le chargement échoue, l'objet est supprimé. |
| `AnimatedMapObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 41 | ✍ Constructeur : délègue à AnimatedObject.new avec la métatable d'AnimatedMapObject sauf si une métatable personnalisée est fournie. |
| `AnimatedMapObject:load(nodeId: integer) → boolean` | 55 | ✍ Lit les attributs utilisateur xmlFilename (obligatoire) et saveId (l'ancien attribut "index" reste accepté), résout le fichier par rapport au répertoire de base de la carte ou de l'objet, trouve l'entrée animatedObjects.animatedObject de même saveId et appelle le load parent dessus. Retourne false avec un message d'erreur si un attribut, le fichier ou l'entrée manque. |
