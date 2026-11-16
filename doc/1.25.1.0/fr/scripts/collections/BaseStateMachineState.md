# collections/BaseStateMachineState.lua

*[English version](../../../scripts/collections/BaseStateMachineState.md)*

Source: `dataS/scripts/collections/BaseStateMachineState.lua` — FS25 1.25.1.0

✍ Classe de base abstraite pour un état utilisé avec un StateMachine. Un état garde une table de transitions (fonction de condition et état cible), possède des crochets d'entrée/sortie vides et des crochets de mise à jour pour les cas actif et inactif, et peut se dessiner sous forme de rectangle coloré pour le débogage. Les états concrets sont censés en hériter et fournir leur propre métatable.

- **BaseStateMachineState** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaseStateMachineState.new(stateMachine: StateMachine, custom_mt: table) → BaseStateMachineState` | 27 | ✍ Crée un état lié à sa machine d'états propriétaire, avec une table de transitions vide et des bornes de débogage non définies. Destiné à être appelé depuis le constructeur d'une classe dérivée. |
| `BaseStateMachineState:trySwitchToValidTransition() → BaseStateMachineState?` | 58 | ✍ Évalue la condition de chaque transition (appelée avec son contexte) dans l'ordre non spécifié de `pairs`. Au premier résultat vrai, appelle stateMachine:changeState avec la cible et retourne cet état, sinon nil. |
| `BaseStateMachineState:createTransitions()` | 76 | ✍ Crochet vide permettant aux sous-classes de définir leurs transitions une fois tous les états créés. La version de base ne fait rien. |
| `BaseStateMachineState:addTransition(conditionFunction: function, targetState: BaseStateMachineState, contextObject: table)` | 85 | ✍ Enregistre une transition vers targetState protégée par conditionFunction ; le contexte passé à la condition est par défaut l'état cible. Une seule transition par cible : en ajouter une autre remplace la précédente. Retourne la table de transition. |
| `BaseStateMachineState:calculateIfShouldBeForced() → boolean` | 98 | ✍ Crochet indiquant si cet état doit être imposé comme état courant. La version de base retourne toujours false. |
| `BaseStateMachineState:calculateIfValidEntryState() → boolean` | 105 | ✍ Crochet indiquant si cet état est valide pour y revenir après un état imposé. La version de base retourne toujours false. |
| `BaseStateMachineState:onStateEntered(previousState: BaseStateMachineState)` | 112 | ✍ Crochet vide appelé quand la machine entre dans cet état ; reçoit l'état précédent. |
| `BaseStateMachineState:onStateExited(nextState: BaseStateMachineState)` | 119 | ✍ Crochet vide appelé quand la machine quitte cet état ; reçoit l'état suivant. |
| `BaseStateMachineState:updateAsCurrent(dt: number)` | 126 | ✍ Crochet de mise à jour tant que cet état est l'état courant (dt en ms). Sauf si la machine est passive, il vérifie les transitions et peut changer d'état. |
| `BaseStateMachineState:updateAsInactive(dt: number)` | 140 | ✍ Crochet de mise à jour vide pour les états qui ne sont pas l'état courant (dt en ms). |
| `BaseStateMachineState:caclulateDebugScreenBounds(x: number, y: number, width: number, height: number)` | 150 | ✍ Convertit la position et la taille relatives de débogage de cet état en valeurs écran mises à l'échelle de la zone donnée. Retourne quatre nil si une borne de débogage n'est pas définie. À noter : le nom est mal orthographié (caclulate) dans la source. |
| `BaseStateMachineState:debugDraw(x: number, y: number, width: number, height: number, textSize: number, color: any)` | 167 | ✍ Dessine le rectangle de débogage de l'état, vert pour l'état courant et gris sinon sauf si une couleur est passée, et retourne ses bornes. Retourne quatre nil si l'état n'a pas de bornes de débogage. |
