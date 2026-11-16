# vehicles/specializations/activatables/WinchControlRopeActivatable.lua

*[English version](../../../../../scripts/vehicles/specializations/activatables/WinchControlRopeActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/WinchControlRopeActivatable.lua` — FS25 1.25.1.0

✍ Activatable pour commander un câble de treuil tendu dont un arbre est déjà attaché : enrouler/dérouler, détacher l'arbre ou en attacher un autre. Une instance par câble, sélectionnée quand le joueur local se tient près de la ligne du câble. Le travail est délégué aux méthodes de treuil du véhicule (NON VÉRIFIÉ : définies dans Winch.lua, hors de ce fichier).

- **WinchControlRopeActivatable** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WinchControlRopeActivatable.new(vehicle: table, rope: any) → table` | 22 | ✍ Crée l'activatable pour un câble de treuil ; met en cache les textes et la liste des câbles de `spec_winch`. |
| `WinchControlRopeActivatable:registerCustomInput(inputContext: any)` | 37 | ✍ Enregistre trois événements d'action à priorité très haute : commande du treuil (`WINCH_CONTROL`, analogique possible), détachement d'arbre (`WINCH_DETACH`) et mode d'attache d'un autre arbre (`WINCH_ATTACH_MODE`), chacun avec son texte. |
| `WinchControlRopeActivatable:removeCustomInput(inputContext: any)` | 54 | ✍ Retire tous les événements d'action d'entrée enregistrés par cet objet (tous ceux dont il est la cible). |
| `WinchControlRopeActivatable:onControlWinch(actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 60 | ✍ Callback d'entrée : transmet la valeur d'entrée au véhicule avec `setWinchControlInput` pour l'index de ce câble (enroule ou déroule le câble). |
| `WinchControlRopeActivatable:onDetachTree(actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 66 | ✍ Callback d'entrée : appelle `detachTreeFromWinch` sur le véhicule pour l'index de ce câble. |
| `WinchControlRopeActivatable:onAttachMode(actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 72 | ✍ Callback d'entrée : active le mode d'attache de ce câble s'il peut encore recevoir des arbres ; sinon affiche un avertissement clignotant pendant 2500 ms. |
| `WinchControlRopeActivatable:update(dt: any)` | 82 | ✍ Active l'action d'attache d'un autre arbre seulement si le joueur local est à moins de `maxSubLength` du câble plus `SUB_ATTACH_ADDITIONAL_RANGE` du crochet du premier arbre (distance horizontale). À noter : indexe `attachedTrees[1]` sans test de nil. |
| `WinchControlRopeActivatable:getIsActivatable()` | 94 | ✍ True si le véhicule appartient à la ferme locale, qu'aucun autre câble n'a de joueur à portée ni de mode d'attache actif, et que le joueur local (contrôlé, sans outil à main) est plus proche que `Winch.CONTROL_RANGE`. |
| `WinchControlRopeActivatable:activate()` | 124 | ✍ Fonction vide ; rien ne se passe quand l'activatable devient celui sélectionné. |
| `WinchControlRopeActivatable:deactivate()` | 129 | ✍ Fonction vide ; rien ne se passe quand l'activatable n'est plus celui sélectionné. |
| `WinchControlRopeActivatable:getDistance(x: any, y: any, z: any)` | 134 | ✍ Renvoie la distance horizontale entre le point et le segment de câble entre le nœud du câble et le crochet du premier arbre ; `math.huge` si un autre câble est actif, si aucun arbre n'est attaché ou si le nœud du crochet n'existe plus. |
| `WinchControlRopeActivatable:draw()` | 163 | ✍ Fonction vide ; cet activatable n'affiche rien à l'écran. |
