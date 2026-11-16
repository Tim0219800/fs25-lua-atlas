# player/stateMachine/PlayerStateIdle.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateIdle.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateIdle.lua` — FS25 1.25.1.0

✍ État à pied du joueur utilisé lorsqu'il est immobile sans entrée de déplacement. Il peut passer à walking, jumping ou crouching.

- **PlayerStateIdle** hérite de `BaseStateMachineState` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateIdle.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 19 | ✍ Crée l'état idle pour le joueur et la machine à états donnés. |
| `PlayerStateIdle:createTransitions()` | 29 | ✍ Ajoute les transitions de idle vers walking, jumping et crouching. |
| `PlayerStateIdle:calculateIfValidEntryState() → boolean` | 39 | ✍ Vrai si le joueur est inactif et au sol ; sert à revenir à pied après un état forcé. |
| `PlayerStateIdle:calculateIfIdle() → boolean` | 46 | ✍ Vrai si la vitesse est inférieure ou égale à 0,01 et si le joueur n'est pas accroupi ; pour le propriétaire, exige aussi l'absence d'entrées de déplacement. |
