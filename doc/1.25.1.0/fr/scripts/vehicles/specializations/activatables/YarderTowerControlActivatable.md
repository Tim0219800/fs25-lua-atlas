# vehicles/specializations/activatables/YarderTowerControlActivatable.lua

*[English version](../../../../../scripts/vehicles/specializations/activatables/YarderTowerControlActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/YarderTowerControlActivatable.lua` — FS25 1.25.1.0

✍ Activatable pour manoeuvrer le chariot d'une tour de débardage par câble (yarder) : modes de suivi, déplacement et levage manuels, attache et détachement d'arbres. Sélectionné quand le joueur est dans la zone de commande du véhicule. Le comportement des méthodes appelées se trouve dans la spécialisation YarderTower (NON VÉRIFIÉ, absent de ce fichier).

- **YarderTowerControlActivatable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTowerControlActivatable.new(vehicle: table) → table` | 20 | ✍ Crée l'activatable pour un véhicule de tour de débardage (yarder) avec un texte d'invite vide. |
| `YarderTowerControlActivatable:registerCustomInput(inputContext: any)` | 32 | ✍ Enregistre les événements d'action du chariot de yarder (suivre, retour, ramassage, déplacement gauche/droite, levage haut/bas, attacher, détacher) à priorité très haute, fixe leurs textes puis appelle `updateActionEventTexts`. |
| `YarderTowerControlActivatable:removeCustomInput(inputContext: any)` | 64 | ✍ Retire tous les événements d'action d'entrée enregistrés par cet objet (tous ceux dont il est la cible). |
| `YarderTowerControlActivatable:onToggleFollowMeMode()` | 70 | ✍ Callback d'entrée : bascule le mode où le chariot suit le joueur ; passe à `FOLLOW_MODE_NONE` s'il suit déjà, sinon à `FOLLOW_MODE_ME`. |
| `YarderTowerControlActivatable:onToggleFollowHome()` | 81 | ✍ Callback d'entrée : met le mode de suivi du chariot sur `FOLLOW_MODE_HOME` (retour vers la tour). |
| `YarderTowerControlActivatable:onToggleFollowPickup()` | 87 | ✍ Callback d'entrée : met le mode de suivi du chariot sur `FOLLOW_MODE_PICKUP` (aller à la position de ramassage mémorisée). |
| `YarderTowerControlActivatable:onManualControlLeftRight(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 93 | ✍ Callback d'entrée : transmet la valeur à `setYarderCarriageMoveInput` pour le déplacement manuel du chariot le long du câble. |
| `YarderTowerControlActivatable:onManualControlUpDown(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 99 | ✍ Callback d'entrée : transmet la valeur à `setYarderCarriageLiftInput` pour monter ou descendre la charge du chariot. |
| `YarderTowerControlActivatable:onTreeAttach(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 105 | ✍ Callback d'entrée : appelle `onYarderCarriageAttach` sur le véhicule pour accrocher les arbres proches du chariot. |
| `YarderTowerControlActivatable:onTreeDetach(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 111 | ✍ Callback d'entrée : appelle `onYarderCarriageDetach` avec la valeur d'entrée pour libérer les arbres attachés. |
| `YarderTowerControlActivatable:update(dt: any)` | 117 | ✍ À chaque frame, si un véhicule chariot existe : active l'attache seulement avec un arbre à portée de montage, et le détachement et le levage seulement si des arbres sont attachés. |
| `YarderTowerControlActivatable:updateActionEventTexts()` | 130 | ✍ Rafraîchit le texte de suivi et n'active retour/ramassage que si aucun mode de suivi n'est actif et que le chariot est à plus de 5 (unités de longueur de câble, des mètres vraisemblablement) de la cible. |
| `YarderTowerControlActivatable:getIsActivatable()` | 153 | ✍ Renvoie si le joueur est dans la zone de commande du yarder, via `getIsPlayerInYarderControlRange`. |
| `YarderTowerControlActivatable:activate()` | 160 | ✍ Fonction vide ; rien ne se passe quand l'activatable devient celui sélectionné. |
| `YarderTowerControlActivatable:deactivate()` | 165 | ✍ Fonction vide ; rien ne se passe quand l'activatable n'est plus celui sélectionné. |
| `YarderTowerControlActivatable:getDistance(x: any, y: any, z: any)` | 170 | ✍ Renvoie la distance calculée par `getIsPlayerInYarderControlRange` (l'argument de point est ignoré). |
| `YarderTowerControlActivatable:draw()` | 177 | ✍ Fonction vide ; cet activatable n'affiche rien à l'écran. |
