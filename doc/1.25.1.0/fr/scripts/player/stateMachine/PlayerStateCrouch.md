# player/stateMachine/PlayerStateCrouch.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateCrouch.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateCrouch.lua` — FS25 1.25.1.0

✍ État à pied du joueur actif tant que l'entrée d'accroupissement est maintenue. Il abaisse la capsule, applique un décalage caméra progressif et limite la vitesse de déplacement. Les constantes (seuils, vitesses) sont définies hors du dump (valeurs NON VÉRIFIÉES).

- **PlayerStateCrouch** hérite de `BaseStateMachineState` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateCrouch.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 31 | ✍ Crée l'état avec un décalage caméra, un chrono d'accroupissement et un chrono de transition à zéro. |
| `PlayerStateCrouch:createTransitions()` | 52 | ✍ Ajoute les transitions de l'accroupissement vers idle, walking et jumping, via les fonctions de test de ces états. |
| `PlayerStateCrouch:calculateIfValidEntryState() → Returns` | 62 | ✍ Vrai si le joueur est accroupi, au sol et pas assez immergé pour nager. Sert à choisir cet état après un état forcé ou un véhicule. |
| `PlayerStateCrouch:calculateIfCrouching() → Returns` | 69 | ✍ Pour le propriétaire : vrai si l'accroupissement est pressé, si l'outil à main tenu l'autorise et si l'immersion dans l'eau est inférieure à 1. Pour les non-propriétaires, retourne toujours false (l'accroupissement en réseau est marqué TODO dans le code). |
| `PlayerStateCrouch:onStateEntered(previousState: PlayerStateBase)` | 83 | ✍ Met le mover en position accroupie et réinitialise les chronos. |
| `PlayerStateCrouch:onStateExited(nextState: BaseStateMachineState)` | 93 | ✍ Retire l'indicateur d'accroupissement du mover et réinitialise les chronos. |
| `PlayerStateCrouch:resetTimers()` | 102 | ✍ Remet à zéro le chrono d'accroupissement, le chrono de transition et le décalage vertical de la caméra. |
| `PlayerStateCrouch:updateAsCurrent(dt: number)` | 115 | ✍ Règle la hauteur de la capsule (accroupie ou debout) selon l'entrée, fait avancer ou reculer le chrono de lissage et en déduit le décalage caméra. Ne permet de quitter l'état qu'une fois le joueur de nouveau debout et le chrono de transition à zéro. |
| `PlayerStateCrouch:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 161 | ✍ Retourne la vélocité x et z désirée en m/s : la direction d'entrée multipliée par une vitesse lissée plafonnée à la vitesse maximale accroupie. |
