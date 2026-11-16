# player/stateMachine/PlayerStateFall.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateFall.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateFall.lua` — FS25 1.25.1.0

✍ État à pied du joueur lorsqu'il est en l'air assez longtemps pour être considéré comme en chute, et non immergé. Les constantes (seuils, vitesses) sont définies hors du dump (valeurs NON VÉRIFIÉES).

- **PlayerStateFall** hérite de `BaseStateMachineState` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateFall.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 31 | ✍ Crée l'état de chute pour le joueur et la machine à états donnés. |
| `PlayerStateFall:calculateIfFalling() → boolean` | 48 | ✍ Vrai si le joueur n'est pas immergé et que le temps de chute courant du mover a atteint le seuil de chute. |
| `PlayerStateFall:calculateIfLanding() → boolean` | 56 | ✍ Vrai si la distance au sol est inférieure ou égale à la distance d'atterrissage. |
| `PlayerStateFall:updateAsCurrent(dt: number)` | 63 | ✍ À chaque frame, demande à la machine à états de déterminer un nouvel état sauf si cet état est forcé par calculateIfShouldBeForced (défini dans la classe de base, absent du dump). |
| `PlayerStateFall:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 79 | ✍ Retourne la vélocité de contrôle en l'air : direction d'entrée multipliée par la vitesse maximale de chute, mise à l'échelle par le facteur de super vitesse si la commande est active. |
