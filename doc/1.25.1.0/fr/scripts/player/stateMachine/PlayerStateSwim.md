# player/stateMachine/PlayerStateSwim.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateSwim.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateSwim.lua` — FS25 1.25.1.0

✍ État à pied du joueur utilisé lorsqu'il est assez profond dans l'eau. Il quitte l'état en redéterminant le meilleur sous-état dès qu'il n'est plus forcé. Le calcul de vitesse (calculateDesiredSpeed) et le test d'immersion se trouvent hors de ce fichier.

- **PlayerStateSwim** hérite de `BaseStateMachineState` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateSwim.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 34 | ✍ Crée l'état de nage pour le joueur et la machine à états donnés. |
| `PlayerStateSwim:updateAsCurrent(dt: number)` | 83 | ✍ À chaque frame, demande à la machine à états de déterminer un nouvel état sauf si cet état est encore forcé (calculateIfShouldBeForced, défini hors du dump). |
| `PlayerStateSwim:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 117 | ✍ Retourne la direction d'entrée multipliée par la vitesse issue de calculateDesiredSpeed (défini hors du dump), en m/s. |
