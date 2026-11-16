# player/stateMachine/PlayerStateMachine.lua

*[English version](../../../../scripts/player/stateMachine/PlayerStateMachine.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateMachine.lua` — FS25 1.25.1.0

✍ Machine à états de plus haut niveau d'un joueur. Elle contient la sous-machine à pied ainsi que les états conduite, passager et montagnes russes, démarre à pied et est passive : les changements d'état sont pilotés par des événements du joueur, pas par des transitions. Les classes de conduite, passager et montagnes russes ne sont pas dans ce fichier.

- **PlayerStateMachine** hérite de `StateMachine` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateMachine.new(player: Player) → PlayerStateMachine` | 18 | ✍ Crée la machine avec ses quatre états (onFoot, driving, passenger, rollercoaster), construit les transitions, définit onFoot comme état courant et par défaut, et marque la machine passive. |
| `PlayerStateMachine:updateWhilePaused(dt: number, isInGui: boolean, isFrozen: boolean)` | 54 | ✍ Transmet un appel updateWhilePaused à l'état courant, avec le delta de temps et l'indication que le joueur est dans une interface ou gelé. Ce que les états en font est NON VÉRIFIÉ. |
