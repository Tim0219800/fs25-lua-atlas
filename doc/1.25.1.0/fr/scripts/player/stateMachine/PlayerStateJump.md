# player/stateMachine/PlayerStateJump.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateJump.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateJump.lua` — FS25 1.25.1.0

✍ État à pied du joueur lorsqu'il est en l'air après un saut, avant d'être considéré comme en chute. Il suit le temps de saut et le temps de descente et passe la main à l'état de chute. Les constantes (seuils, vitesses) sont définies hors du dump (valeurs NON VÉRIFIÉES).

- **PlayerStateJump** hérite de `BaseStateMachineState` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateJump.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 37 | ✍ Crée l'état avec les chronos de saut et de descente à zéro. |
| `PlayerStateJump:createTransitions()` | 55 | ✍ Ajoute la transition de jumping vers falling. |
| `PlayerStateJump:calculateIfFalling() → boolean` | 63 | ✍ Vrai une fois que le temps de descente a atteint le seuil de chute propre à cet état, de sorte que la montée d'un saut ne compte jamais comme une chute. |
| `PlayerStateJump:calculateIfJumping() → boolean` | 70 | ✍ Propriétaire : vrai si l'entrée de saut multipliée par le multiplicateur de saut est positive et si le joueur est au sol depuis assez longtemps. Autres : vrai si la vitesse verticale est ascendante, avec la même condition de temps au sol. |
| `PlayerStateJump:calculateIfTakingOff() → boolean` | 81 | ✍ Vrai tant que le temps de saut est dans le seuil de décollage et que la vitesse verticale est encore ascendante. |
| `PlayerStateJump:calculateIfLanding() → boolean` | 88 | ✍ Vrai quand la distance au sol est dans la distance d'atterrissage et que le joueur ne décolle plus. |
| `PlayerStateJump:onStateEntered(previousState: PlayerStateBase)` | 95 | ✍ Fixe la vitesse verticale du mover à la force de saut multipliée par le multiplicateur de saut du joueur et réinitialise les chronos. |
| `PlayerStateJump:onStateExited(previousState: BaseStateMachineState)` | 107 | ✍ Remet à zéro la force ascendante courante du mover et réinitialise les chronos. |
| `PlayerStateJump:resetTimers()` | 118 | ✍ Remet à zéro les chronos de descente et de saut. |
| `PlayerStateJump:updateAsCurrent(dt: number)` | 128 | ✍ Cumule le temps de saut et, en descente, le temps de descente (en secondes). Redétermine l'état dès que le joueur est au sol et a fini de décoller ; sinon essaie les transitions valides. |
| `PlayerStateJump:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 154 | ✍ Retourne la vélocité horizontale en m/s : direction d'entrée multipliée par une vitesse lissée jusqu'au maximum de saut, mise à l'échelle par le facteur de super vitesse si cette commande est active. |
