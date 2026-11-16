# vehicles/specializations/activatables/YarderTowerSetupActivatable.lua

*[English version](../../../../../scripts/vehicles/specializations/activatables/YarderTowerSetupActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/YarderTowerSetupActivatable.lua` — FS25 1.25.1.0

✍ Activatable servant à installer et retirer le câble principal d'une tour de débardage : démarrer ou annuler la mise en place et confirmer l'arbre cible. Sélectionné quand le joueur est à portée de la tour. L'état réel est tenu dans `spec_yarderTower` (défini ailleurs, NON VÉRIFIÉ).

- **YarderTowerSetupActivatable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTowerSetupActivatable.new(vehicle: table) → table` | 20 | ✍ Crée l'activatable de mise en place pour un véhicule de tour de débardage avec un texte d'invite vide. |
| `YarderTowerSetupActivatable:registerCustomInput(inputContext: any)` | 32 | ✍ Enregistre les événements d'action `ACTIVATE_OBJECT` (bascule) et `YARDER_SETUP_ROPE` (définir la cible) à priorité très haute, puis met à jour leurs textes. |
| `YarderTowerSetupActivatable:removeCustomInput(inputContext: any)` | 45 | ✍ Retire tous les événements d'action d'entrée enregistrés par cet objet (tous ceux dont il est la cible). |
| `YarderTowerSetupActivatable:onToggleSetupMode()` | 51 | ✍ Callback d'entrée : si le câble principal est actif, désactive la cible ; sinon, si c'est permis, entre en mode de mise en place, sinon affiche l'avertissement renvoyé pendant 2000 ms. |
| `YarderTowerSetupActivatable:onSetTarget()` | 68 | ✍ Callback d'entrée : appelle `setYarderTargetActive(true)` pour confirmer l'arbre cible et activer le câble principal. |
| `YarderTowerSetupActivatable:updateActionEventTexts()` | 74 | ✍ Fixe le texte de bascule (annuler, retirer ou démarrer la mise en place) selon l'état du yarder, et n'active l'action de cible qu'en mode de mise en place avec un câble principal valide. |
| `YarderTowerSetupActivatable:getIsActivatable()` | 96 | ✍ Renvoie si le joueur est dans la zone de mise en place du yarder, via `getIsPlayerInYarderRange`. |
| `YarderTowerSetupActivatable:activate()` | 102 | ✍ Fonction vide ; rien ne se passe quand l'activatable devient celui sélectionné. |
| `YarderTowerSetupActivatable:deactivate()` | 107 | ✍ Fonction vide ; rien ne se passe quand l'activatable n'est plus celui sélectionné. |
| `YarderTowerSetupActivatable:getDistance(x: any, y: any, z: any)` | 112 | ✍ Renvoie la distance 3D jusqu'à `controlTriggerNode`, ou `math.huge` si ce nœud est nil. |
| `YarderTowerSetupActivatable:draw()` | 123 | ✍ Fonction vide ; cet activatable n'affiche rien à l'écran. |
