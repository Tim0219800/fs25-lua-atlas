# collections/StateMachine.lua

*[English version](../../../scripts/collections/StateMachine.md)*

Source: `dataS/scripts/collections/StateMachine.lua` — FS25 1.25.1.0

✍ Base abstraite d'une machine à états qui gère des objets BaseStateMachineState stockés dans une table `states`. Elle suit l'état courant et l'état par défaut, un drapeau passif qui bloque les transitions automatiques, et des mises à jour par image où un état peut imposer un changement. Une machine peut aussi servir d'état en copiant l'interface d'état. Les sous-classes doivent remplir states et defaultState ; certains assistants utilisés ici (initialiseStateNames, getHasMappings, createStateIndexNameMapping) ne sont pas définis dans ce fichier (NON VÉRIFIÉ).

- **StateMachine** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StateMachine.new(custom_mt: table) → StateMachine` | 22 | ✍ Crée une machine sans état courant ni par défaut, avec une table d'états vide et le mode passif à false. Destiné à être appelé par une classe dérivée. |
| `StateMachine:implementStateInterface()` | 73 | ✍ Appelé sur une table de classe pour copier tous les membres de BaseStateMachineState qu'elle ne définit pas encore, afin que la machine puisse servir d'état d'une autre machine. |
| `StateMachine:changeState(newState: BaseStateMachineState, ...: any)` | 87 | ✍ Définit le nouvel état courant, appelle onStateExited sur l'ancien et onStateEntered sur le nouveau avec les arguments supplémentaires. Provoque une erreur s'il n'y a pas encore d'état courant, l'ancien état étant appelé sans test de nil. |
| `StateMachine:initialiseStateTransitions(...: any)` | 110 | ✍ Appelle createTransitions sur chaque état en transmettant les arguments donnés. Non appelé automatiquement par la classe de base. |
| `StateMachine:determineState()` | 118 | ✍ Passe au premier état dont calculateIfValidEntryState retourne true (dans l'ordre non spécifié de `pairs`), sinon à l'état par défaut. |
| `StateMachine:resolveCurrentState() → BaseStateMachineState` | 135 | ✍ Retourne l'état courant, ou, quand cet état est lui-même une machine avec resolveCurrentState, l'état le plus profond résolu. |
| `StateMachine:getCurrentStateName() → string` | 144 | ✍ Retourne le nom de l'état courant via getNameOfState. |
| `StateMachine:getNameOfState(state: BaseStateMachineState) → string` | 152 | ✍ Retourne le nom de l'état, ou le texte "No state" pour nil. Si le nom est vide, appelle d'abord initialiseStateNames, non défini dans ce fichier (NON VÉRIFIÉ). |
| `StateMachine:getCurrentStateIndex() → number` | 170 | ✍ Retourne l'indice de l'état courant dans la liste d'états triée alphabétiquement, via getIndexOfState. |
| `StateMachine:getIndexOfState(state: BaseStateMachineState) → integer` | 178 | ✍ Retourne l'indice d'un état dans la liste triée des états, ou nil s'il est absent. Il construit d'abord les correspondances via createStateIndexNameMapping si besoin, définie hors de ce fichier (NON VÉRIFIÉ). |
| `StateMachine:getStateByIndex(index: integer) → BaseStateMachineState` | 200 | ✍ Retourne l'état à un indice donné de la liste triée, ou nil. Construit d'abord les correspondances d'indices si besoin (assistant défini ailleurs, NON VÉRIFIÉ). |
| `StateMachine:getIsPassive() → boolean` | 220 | ✍ Retourne si la machine est passive, c'est-à-dire qu'elle ne change pas d'état d'elle-même pendant les mises à jour. |
| `StateMachine:setIsPassive(isPassive: boolean)` | 227 | ✍ Définit le drapeau passif ; seule la valeur true l'active, toute autre valeur devient false. |
| `StateMachine:update(dt: number)` | 234 | ✍ Mise à jour par image (dt en ms). Hors mode passif, passe au premier autre état dont calculateIfShouldBeForced est true ; puis appelle updateAsCurrent sur l'état courant et updateAsInactive sur tous les autres. |
| `StateMachine:callStateFunction(functionName: string, ...: any)` | 269 | ✍ Appelle la méthode portant le nom donné sur chaque état qui la possède, en passant les arguments supplémentaires. Les valeurs de retour sont ignorées. |
