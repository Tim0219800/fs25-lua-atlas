# vehicles/VehicleActionControllerAction.lua

*[English version](../../../scripts/vehicles/VehicleActionControllerAction.md)*

Source: `dataS/scripts/vehicles/VehicleActionControllerAction.lua` — FS25 1.25.1.0

✍ Une action contrôlée appartenant à un `VehicleActionController` : elle encapsule un rappel d'entrée (appelé avec une direction +1/-1), une fonction optionnelle de contrôle de fin, des fonctions optionnelles de disponibilité, d'accessibilité et de désactivation automatique, des icônes, une liste d'écouteurs d'événements IA et un indicateur de persistance en sauvegarde. Elle suit `lastDirection` et `lastValidDirection`.

- **VehicleActionControllerAction** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleActionControllerAction.new(parent: any, name: any, inputAction: any, priority: any, customMt: any)` | 12 | ✍ Crée une action pour un contrôleur parent avec nom, action d'entrée et priorité. Valeurs par défaut : direction -1, sauvegarde = faux, réinitialisation à la désactivation = vrai, identifiant vide. |
| `VehicleActionControllerAction:remove()` | 32 | ✍ Retire cette action de son contrôleur parent. |
| `VehicleActionControllerAction:updateParent(parent: any)` | 38 | ✍ Déplace l'action vers un autre contrôleur (retrait de l'ancien, ajout au nouveau) s'il diffère du parent actuel. |
| `VehicleActionControllerAction:setCallback(callbackTarget: any, inputCallback: any, inputCallbackRev: any)` | 49 | ✍ Définit la cible et les rappels d'entrée avant et arrière, et prend le `configFileName` de la cible comme identifiant de l'action (chaîne vide s'il manque). Seul `inputCallback` est appelé par `doAction`. |
| `VehicleActionControllerAction:setFinishedFunctions(finishedFunctionTarget: any, finishedFunc: any, finishedResult: any, finishedResultRev: any, finishedFuncRev: any)` | 59 | ✍ Définit la fonction servant à savoir si l'action est terminée, et les valeurs qu'elle doit renvoyer pour la direction positive et la direction inverse (`finishedResult`, `finishedResultRev`). |
| `VehicleActionControllerAction:setDeactivateFunction(deactivateFunctionTarget: any, deactivateFunc: any, inverseDeactivateFunc: any)` | 69 | ✍ Définit une fonction qui, tant que l'action est active et renvoie vrai (ou faux si inversée), fait lancer une nouvelle séquence au parent dans `update`. |
| `VehicleActionControllerAction:setIsAvailableFunction(availableFunc: any)` | 77 | ✍ Définit la fonction indiquant si l'action est actuellement disponible. |
| `VehicleActionControllerAction:setIsAccessibleFunction(accessibleFunc: any)` | 83 | ✍ Enregistre la fonction d'accessibilité. À noter : aucune méthode de ce dump ne la lit, alors que le contrôleur appelle `isAccessible()` sur les actions (NON VÉRIFIÉ : définition ailleurs). |
| `VehicleActionControllerAction:setActionIcons(iconPos: any, iconNeg: any, changeColor: any)` | 89 | ✍ Définit les icônes positive et négative et si la couleur change. |
| `VehicleActionControllerAction:setResetOnDeactivation(resetOnDeactivation: any)` | 97 | ✍ Définit si l'action est rebasculée lorsqu'elle est retirée du contrôleur. |
| `VehicleActionControllerAction:setIsSaved(isSaved: any)` | 103 | ✍ Définit si cette action est écrite dans la sauvegarde. |
| `VehicleActionControllerAction:getIsSaved()` | 109 | ✍ Renvoie si cette action est sauvegardée. |
| `VehicleActionControllerAction:isAvailable()` | 115 | ✍ Appelle la fonction de disponibilité si elle est définie, sinon renvoie vrai. |
| `VehicleActionControllerAction:getControlledActionIcons()` | 133 | ✍ Renvoie l'icône positive, l'icône négative et l'indicateur de changement de couleur. |
| `VehicleActionControllerAction:getLastDirection()` | 139 | ✍ Renvoie la dernière direction demandée (+1 ou -1). |
| `VehicleActionControllerAction:getDoResetOnDeactivation()` | 145 | ✍ Renvoie si l'action est rebasculée lors du retrait. |
| `VehicleActionControllerAction:addAIEventListener(sourceVehicle: any, eventName: any, direction: any, forceUntilFinished: any)` | 151 | ✍ Enregistre un nom d'événement IA auquel réagir, avec la direction à appliquer et un indicateur pour le forcer jusqu'à réussite ; mémorise aussi le véhicule source. |
| `VehicleActionControllerAction:registerActionEvents(target: any, vehicle: any, actionEvents: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 165 | ✍ Ne fait rien : le corps ne contient que du code commenté, aucun événement d'entrée par action n'est enregistré. |
| `VehicleActionControllerAction:actionEvent(actionName: any, inputValue: any, actionIndex: any, isAnalog: any)` | 172 | ✍ Rappel d'entrée qui exécute `doAction()` avec l'opposé de la dernière direction. |
| `VehicleActionControllerAction:doAction(direction: any, isAIEvent: any)` | 178 | ✍ Définit la direction (par défaut l'opposé de la dernière) et appelle le rappel d'entrée avec la cible, la direction et l'indicateur IA. Enregistre `lastValidDirection` en cas de succès et renvoie le résultat du rappel. |
| `VehicleActionControllerAction:getIsFinished(direction: any)` | 194 | ✍ Compare le résultat de la fonction de fin à la valeur attendue pour la direction ; vrai si aucune fonction de fin n'est définie. |
| `VehicleActionControllerAction:getSourceVehicle()` | 208 | ✍ Renvoie le véhicule défini par `addAIEventListener`, ou nil. |
| `VehicleActionControllerAction:onAIEvent(eventName: any)` | 214 | ✍ Pour chaque écouteur correspondant au nom d'événement, exécute l'action avec sa direction. En cas d'échec avec forçage demandé, mémorise la direction pour réessayer ; sinon efface une direction forcée contraire et arrête la séquence du parent. |
| `VehicleActionControllerAction:update(dt: any)` | 234 | ✍ Tant que l'action est active et que sa fonction de désactivation renvoie la valeur déclenchante, demande au parent de lancer une séquence, sauf si une séquence est en cours ou si une direction IA forcée est en attente. |
| `VehicleActionControllerAction:updateForAI(dt: any)` | 248 | ✍ Réessaie la direction IA forcée ; en cas de succès l'efface et arrête la séquence du parent. |
| `VehicleActionControllerAction:getDebugText()` | 259 | ✍ Construit une ligne de débogage avec priorité, nom du véhicule, nom de l'action et valeurs de fin courante/cible. Appelle la fonction de fin et `getName()` sur la cible du rappel. |
