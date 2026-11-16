# player/stateMachine/PlayerOnFootStateMachine.lua

*[English version](../../../../scripts/player/stateMachine/PlayerOnFootStateMachine.md)*

Source: `dataS/scripts/player/stateMachine/PlayerOnFootStateMachine.lua` — FS25 1.25.1.0

✍ Sous-machine à états de PlayerStateMachine utilisée quand le joueur se déplace à pied. Elle possède les états idle, walking, swimming, falling, jumping et crouching et, lorsqu'elle est active, exécute toute la frame à pied : entrées, targeter, caméra, contrôleur capsule, mover, interpolateur, graphismes et composant réseau.

- **PlayerOnFootStateMachine** hérite de `StateMachine` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerOnFootStateMachine.new(player: Player) → PlayerOnFootStateMachine` | 21 | ✍ Crée la machine avec ses six états, construit leurs transitions, démarre sur idle (aussi l'état par défaut) et autorise les outils à main. Enregistre son gestionnaire pour les événements de sortie de véhicule, de passager et de montagnes russes (le gestionnaire n'est pas dans le dump). |
| `PlayerOnFootStateMachine:onStateEntered(previousState: BaseStateMachineState)` | 67 | ✍ Appelé quand le joueur passe à pied (par ex. en quittant un véhicule) : réinitialise l'état réseau et graphique, annule la vitesse et, sur le serveur, affiche le joueur. Pour le propriétaire, restaure le contexte d'entrée du joueur, active les objets activables, informe le HUD et détermine le bon sous-état. |
| `PlayerOnFootStateMachine:onStateExited(nextState: BaseStateMachineState)` | 107 | ✍ Appelé en quittant l'état à pied : réinitialise l'état réseau et graphique et place le modèle à la position graphique. Pour le propriétaire, arrête aussi le mouvement, range l'outil à main et désactive les objets activables. |
| `PlayerOnFootStateMachine:updateAsCurrent(dt: number)` | 168 | ✍ Mise à jour par frame à pied, dans un ordre fixe : entrées, targeter, pré-mise à jour réseau, rotation caméra, contrôleur capsule, mise à jour du sous-état, mouvement horizontal de l'état courant, mover, décalage caméra, interpolateur, graphismes, position caméra, position des objets activables (propriétaire), réinitialisation des entrées, mise à jour réseau. |
