# player/PlayerTargeter.lua

*[English version](../../../scripts/player/PlayerTargeter.md)*

Source: `dataS/scripts/player/PlayerTargeter.lua` — FS25 1.25.1.0

✍ Outil côté client appartenant au joueur local qui lance un rayon dans la direction du regard du joueur et enregistre l'impact le plus proche pour chaque type de cible enregistré (une clé, un masque de collision et une plage de distance, avec des fonctions de filtre optionnelles). Les autres parties du code joueur lui demandent quel noeud est ciblé pour une clé donnée. Les tables de cibles sont recyclées via un `ObjectPool`.

- **PlayerTargeter** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerTargeter.new(player: Player) → PlayerTargeter` | 19 | ✍ Crée un targeter pour le joueur donné, avec des tables de cibles vides, un pool de cibles et aucun rayon enregistré. |
| `PlayerTargeter:getLastLookRay() → number, number, number, number, number, number` | 62 | ✍ Renvoie l'origine (x, y, z) et la direction (x, y, z) du dernier rayon lancé ; les valeurs sont nil avant le premier rayon valide. |
| `PlayerTargeter:getHasTargetedKey(targetKey: CollisionFlag) → boolean` | 70 | ✍ Renvoie true si un type de cible est enregistré sous cette clé. |
| `PlayerTargeter:addTargetType(targetKey: any, targetMask: CollisionFlag, minDistance: number?, maxDistance: number)` | 80 | ✍ Enregistre un type de cible avec une clé, un masque de collision et une plage de distance. Ignoré si la clé existe déjà ; allonge le rayon à la plus grande distance maximale et reconstruit le masque combiné. |
| `PlayerTargeter:addFilterToTargetType(targetKey: any, filterFunction: function)` | 104 | ✍ Ajoute à un type de cible une fonction de filtre appelée `filter(hitNode, x, y, z)` ; tous les filtres doivent renvoyer true pour qu'un impact soit retenu. La clé doit déjà exister. |
| `PlayerTargeter:removeTargetType(targetKey: any)` | 117 | ✍ Supprime un type de cible, puis reconstruit le masque combiné et recalcule la plus grande distance maximale parmi les types restants. |
| `PlayerTargeter:recalculateCombinedTargetMask()` | 132 | ✍ Reconstruit le masque de collision combiné en appliquant un OU binaire aux masques de tous les types de cible. |
| `PlayerTargeter:getClosestTargetedNodeFromType(targetKey: any) → integer?` | 143 | ✍ Renvoie le noeud de l'impact le plus proche trouvé pour cette clé, ou nil s'il n'y en a aucun. Comment et quand cette table est remplie depuis les résultats du raycast n'est pas visible dans ce fichier (NON VÉRIFIÉ). |
| `PlayerTargeter:update(dt: number)` | 151 | ✍ Lit le rayon de regard du joueur (ne fait rien s'il est invalide), vide l'état via `resetState` (absent de ce fichier, NON VÉRIFIÉ) et lance un raycast asynchrone avec le masque combiné. Les impacts reviennent dans une méthode `raycastCallback` absente de ce fichier. |
| `PlayerTargeter:tryAddTargetWithMask(hitNode: integer, x: number, y: number, z: number, targetedMask: table, distance: number)` | 195 | ✍ Retient un impact comme cible courante d'un masque s'il est dans la plage de distance, possède le groupe de collision du masque, est plus proche que l'existant et passe tous les filtres. Les données de l'impact sont stockées dans une table du pool. |
| `PlayerTargeter:debugDraw(x: number, y: number, textSize: number) → number` | 229 | ✍ Affiche le texte de debug du targeter : nom du masque combiné et, pour chaque masque enregistré, le nom de son noeud cible courant. Renvoie la position y suivante. |
