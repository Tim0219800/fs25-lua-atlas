# triggers/LadderTrigger.lua

*[English version](../../../scripts/triggers/LadderTrigger.md)*

Source: `dataS/scripts/triggers/LadderTrigger.lua` — FS25 1.25.1.0

✍ Trigger côté client qui indique au mover du joueur local qu'il est sur une échelle tant que le noeud racine du joueur est dans le volume du trigger. Il est créé depuis un noeud trigger de l'i3d au chargement de la carte et avertit si le masque de collision du noeud n'a pas le bit joueur.

- **LadderTrigger** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LadderTrigger:onCreate(id: integer)` | 16 | ✍ Point d'entrée au chargement de la carte pour un noeud d'échelle : construit un LadderTrigger et l'ajoute aux objets non mis à jour de la mission. |
| `LadderTrigger.new(node: integer) → table` | 24 | ✍ Crée l'instance. Uniquement sur un client, il vérifie que le masque de collision du noeud a le drapeau PLAYER (avertissement sinon) et enregistre le callback physique `triggerCallback` ; sur un serveur dédié rien n'est enregistré. |
| `LadderTrigger:delete()` | 42 | ✍ Retire le trigger physique s'il a été enregistré. |
| `LadderTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 55 | ✍ À l'entrée ou la sortie du noeud racine du joueur local, appelle setIsOnLadder(true) ou (false) sur le mover du joueur local. Les autres acteurs et les événements de présence sont ignorés. |
