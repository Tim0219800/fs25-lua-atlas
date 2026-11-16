# player/networking/PlayerPositionalInterpolator.lua

*[English version](../../../../scripts/player/networking/PlayerPositionalInterpolator.md)*

Source: `dataS/scripts/player/networking/PlayerPositionalInterpolator.lua` — FS25 1.25.1.0

✍ Lisse la position, le lacet, la vitesse et la vélocité du joueur entre les mises à jour réseau ou physiques à l'aide d'interpolateurs de temps, de position, d'angle et de valeur. Il peut piloter le noeud racine du joueur (mover) ou seulement un noeud graphique dont la position interpolée est lue par d'autres. Certaines méthodes utilisées ici (par ex. startNetworkNewPhase et setTargetPhysicsIndex) sont absentes du dump.

- **PlayerPositionalInterpolator** (l.22)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerPositionalInterpolator.new(player: Player, targetNodeType: integer) → PlayerPositionalInterpolator` | 38 | ✍ Crée l'interpolateur pour un joueur et un type de noeud cible (racine ou graphique), initialisé sur la position, le lacet, la vitesse et la vélocité verticale actuels. Enregistre un écouteur sur l'événement de téléportation du mover. |
| `PlayerPositionalInterpolator:update(dt: number)` | 85 | ✍ Étape par frame : fait avancer l'interpolateur de temps avec le delta physique non borné, calcule position, lacet, vitesse (sortie x1000) et vélocité interpolés. En mode noeud racine, les pousse aussi dans le mover du joueur. |
| `PlayerPositionalInterpolator:updateTick(dt: number)` | 131 | ✍ Étape par tick, mode noeud graphique uniquement : prend la position du mover comme nouvelle cible (s'alignant sur l'ancienne cible à moins de 0,001), démarre une phase de 75 ms et met à jour le lacet cible. Pour les non-propriétaires, attend que l'index physique soit simulé. |
| `PlayerPositionalInterpolator:setTargetPosition(targetPositionX: number, targetPositionY: number, targetPositionZ: number)` | 183 | ✍ Définit la position vers laquelle l'interpolateur se déplace. |
| `PlayerPositionalInterpolator:getInterpolatedPosition() → number, number, number` | 210 | ✍ Retourne la dernière position x, y, z interpolée calculée. |
| `PlayerPositionalInterpolator:setTargetYaw(targetYaw: number)` | 217 | ✍ Définit le lacet cible, d'abord ramené à une plage d'angle valide via MathUtil.getValidLimit. |
