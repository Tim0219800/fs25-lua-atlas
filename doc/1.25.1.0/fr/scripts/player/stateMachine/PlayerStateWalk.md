# player/stateMachine/PlayerStateWalk.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateWalk.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateWalk.lua` — FS25 1.25.1.0

✍ État à pied du joueur pour se déplacer au sol, en marchant ou en courant selon l'entrée de course. Il peut passer à idle, jumping ou crouching. La vitesse (calculateDesiredSpeed) et calculateIfMoving sont définies hors de ce fichier.

- **PlayerStateWalk** hérite de `BaseStateMachineState` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateWalk.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 24 | ✍ Crée l'état de marche avec les axes de marche et de course à zéro. |
| `PlayerStateWalk:createTransitions()` | 39 | ✍ Ajoute les transitions de walking vers idle, jumping et crouching. |
| `PlayerStateWalk:calculateIfValidEntryState() → boolean` | 49 | ✍ Vrai si le joueur se déplace, est au sol et n'est pas immergé ; sert à revenir à pied après un état forcé. |
| `PlayerStateWalk:calculateIfWalking() → boolean` | 64 | ✍ Vrai si le joueur se déplace et si l'axe de course est nul. Ne teste pas lui-même l'entrée d'accroupissement. |
| `PlayerStateWalk:calculateIfRunning() → boolean` | 71 | ✍ Vrai si le joueur se déplace, si l'axe de course est positif et si le multiplicateur de course du joueur est supérieur à zéro. |
| `PlayerStateWalk:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 135 | ✍ Retourne la direction d'entrée multipliée par la vitesse issue de calculateDesiredSpeed (hors du dump), en m/s. |
