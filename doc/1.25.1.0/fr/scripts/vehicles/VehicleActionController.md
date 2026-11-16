# vehicles/VehicleActionController.lua

*[English version](../../../scripts/vehicles/VehicleActionController.md)*

Source: `dataS/scripts/vehicles/VehicleActionController.lua` — FS25 1.25.1.0

✍ Contrôleur par véhicule des « actions contrôlées » : un ensemble d'actions priorisées (plier, abaisser, allumer...) que le joueur déclenche ensemble avec une seule touche (`InputAction.VEHICLE_ACTION_CONTROL`). Il tient la liste des objets `VehicleActionControllerAction`, les exécute en séquence ordonnée (inversée au retour), sauvegarde/restaure la dernière direction dans la sauvegarde et propose un affichage de débogage. Seul le véhicule racine d'une chaîne enregistre l'entrée.

- **VehicleActionController** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleActionController.new(vehicle: any, customMt: any)` | 14 | ✍ Crée le contrôleur d'un véhicule avec des listes d'actions vides, `lastDirection` = -1 et sans réactivation en attente. Accepte une métatable personnalisée optionnelle. |
| `VehicleActionController:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 35 | ✍ Écrit `#lastDirection`, `#numActions` puis, pour chaque action dont `getIsSaved()` est vrai, son nom, son identifiant et sa dernière direction sous `action(i)`. N'écrit rien s'il n'y a aucune action. |
| `VehicleActionController:load(savegame: any)` | 55 | ✍ Lit la direction et la liste d'actions sauvegardées dans le XML de sauvegarde (ignoré si `resetVehicles`) et mémorise l'heure de chargement. Si aucune action sauvegardée n'a une direction positive, la liste chargée est abandonnée. |
| `VehicleActionController:registerAction(name: any, inputAction: any, prio: any)` | 92 | ✍ Crée un `VehicleActionControllerAction` avec nom, action d'entrée et priorité, l'ajoute au contrôleur et le renvoie pour que l'appelant configure ses rappels. |
| `VehicleActionController:addAction(action: any)` | 101 | ✍ Ajoute une action, reconstruit les listes triées par priorité, marque les actions comme « sales » (alignées sur la direction du contrôleur dans `update`) et demande une mise à jour des événements d'action du véhicule. |
| `VehicleActionController:removeAction(action: any)` | 113 | ✍ Retire une action. Si le contrôle automatique des véhicules est activé sur la plateforme et que l'action était active, elle est d'abord rebasculée quand elle se réinitialise à la désactivation. Réinitialise la direction quand la dernière action disparaît. |
| `VehicleActionController:updateSortedActions()` | 139 | ✍ Regroupe les actions par priorité identique et construit deux copies triées : priorité la plus haute d'abord (`sortedActions`) et la plus basse d'abord (`sortedActionsRev`). |
| `VehicleActionController:activate()` | 165 | ✍ Appelé quand le véhicule devient actif. Pour le véhicule racine avec une réactivation en attente, inverse la direction et rejoue la séquence afin de restaurer les actions coupées par la désactivation (par exemple la mise en marche). |
| `VehicleActionController:deactivate()` | 182 | ✍ Appelé à la désactivation du véhicule. Pour le véhicule racine, si la dernière direction était positive, il note une réactivation en attente au lieu de défaire les actions, afin de conserver les états plié et abaissé. |
| `VehicleActionController:registerActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 192 | ✍ Pour le véhicule racine ayant des actions, vide et ré-enregistre les événements par action et enregistre l'événement d'entrée `VEHICLE_ACTION_CONTROL` avec `actionSequenceEvent`, en remplaçant le précédent. |
| `VehicleActionController:actionEvent(actionName: any, inputValue: any, actionIndex: any, isAnalog: any)` | 210 | ✍ Rappel d'entrée qui déclenche les actions d'indice `actionIndex` via `doAction`. Les autres paramètres sont inutilisés. |
| `VehicleActionController:doAction(actionIndex: any, customTable: any, direction: any)` | 216 | ✍ Exécute toutes les actions d'un groupe de priorité (de la table personnalisée optionnelle ou de celle par défaut) avec la direction donnée. Renvoie vrai si au moins une a réussi. |
| `VehicleActionController:actionSequenceEvent()` | 234 | ✍ Gestionnaire de la touche des actions contrôlées. Ne fait rien juste après le chargement, si les actions ne sont pas accessibles, disponibles ou autorisées (un avertissement clignotant peut s'afficher) ; sinon lance la séquence. |
| `VehicleActionController:startActionSequence(force: any)` | 265 | ✍ Lance une séquence dans la direction opposée à la dernière (de la priorité haute à basse si positive). Sans `force`, si toutes les actions sont déjà dans l'état cible, la direction est inversée. Un appel en cours de séquence inverse l'indice. S'arrête si rien n'a pu s'exécuter. |
| `VehicleActionController:continueActionSequence()` | 311 | ✍ Passe au groupe de priorité suivant et l'exécute ; termine la séquence après le dernier et se rappelle aussitôt si le groupe n'a rien exécuté. |
| `VehicleActionController:stopActionSequence()` | 326 | ✍ Efface l'état de la séquence en cours (liste d'actions, indice et indice maximal). |
| `VehicleActionController:getActionsByIndex(actionIndex: any, customTable: any)` | 334 | ✍ Renvoie le groupe d'actions à l'indice donné, dans la table personnalisée si fournie, sinon dans la liste par priorité du contrôleur. |
| `VehicleActionController:getAreControlledActionsAvailable()` | 344 | ✍ Vrai seulement s'il y a au moins une action et que chaque action renvoie `isAvailable()`. |
| `VehicleActionController:getAreControlledActionsAccessible()` | 356 | ✍ Vrai seulement s'il y a au moins une action et que chaque action renvoie `isAccessible()`. À noter : `VehicleActionControllerAction:isAccessible` n'est pas défini dans ce dump (seul le setter existe), NON VÉRIFIÉ ailleurs. |
| `VehicleActionController:getControlledActionIcons()` | 368 | ✍ Renvoie les icônes (positive, négative, indicateur de changement de couleur) de la première action qui en définit, ou nil. |
| `VehicleActionController:playControlledActions()` | 381 | ✍ Lance la séquence d'actions, sauf si les actions de la sauvegarde sont encore en cours de réapplication. |
| `VehicleActionController:resetCurrentState()` | 389 | ✍ Remet la direction mémorisée à -1 (état éteint) sans exécuter d'action. |
| `VehicleActionController:getActionControllerDirection()` | 395 | ✍ Renvoie la direction que prendrait la prochaine séquence, c'est-à-dire l'opposé de la dernière direction. |
| `VehicleActionController:update(dt: any)` | 401 | ✍ Mise à jour par image : fait avancer la séquence en cours quand le groupe courant est terminé, met à jour chaque action, réapplique l'état de la sauvegarde environ 500 ms après le chargement une fois le moteur démarré, et aligne les actions nouvellement ajoutées sur la direction du contrôleur. |
| `VehicleActionController:updateForAI(dt: any)` | 468 | ✍ Transmet la mise à jour IA à chaque action. |
| `VehicleActionController:onAIEvent(sourceVehicle: any, eventName: any)` | 476 | ✍ Transmet un nom d'événement IA aux actions dont le véhicule source correspond à `sourceVehicle`. |
| `VehicleActionController:drawDebugRendering()` | 486 | ✍ Dessine des listes de texte de débogage pour toutes les actions et pour la séquence en cours, avec l'étape active en évidence (vert terminé, orange courant). Utilise `renderText` directement. |
| `VehicleActionController.registerXMLPaths(schema: any, basePath: any)` | 542 | ✍ Enregistre les chemins XML de sauvegarde : `#lastDirection`, `#numActions` et `action(?)` avec `#name`, `#identifier`, `#lastDirection` sous le chemin de base donné. |
