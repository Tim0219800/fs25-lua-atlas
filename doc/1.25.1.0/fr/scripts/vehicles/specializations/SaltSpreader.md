# vehicles/specializations/SaltSpreader.lua

*[English version](../../../../scripts/vehicles/specializations/SaltSpreader.md)*

Source: `dataS/scripts/vehicles/specializations/SaltSpreader.lua` — FS25 1.25.1.0

✍ Spécialisation pour les épandeurs de sel routier. Elle exige WorkArea et TurnOnVehicle, enregistre le type de zone de travail "saltSpreader" et consomme du sel dans une unité de remplissage tant qu'elle est allumée (usage en litres par seconde, éventuellement multiplié par la largeur d'une zone de travail). Côté serveur, la zone de travail appelle le SnowSystem (`g_currentMission.snowSystem:saltArea`) ; les effets sont joués côté client via l'EffectManager.

- **SaltSpreader** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SaltSpreader.initSpecialization()` | 15 | ✍ Enregistre le type de zone de travail "saltSpreader" et déclare le schéma XML : index d'unité de remplissage, index d'unload info, zone de travail d'usage, usage en litres par seconde, et effets. |
| `SaltSpreader.prerequisitesPresent(specializations: table) → boolean` | 35 | ✍ Retourne vrai uniquement si le type de véhicule possède WorkArea et TurnOnVehicle. |
| `SaltSpreader.registerFunctions(vehicleType: any)` | 41 | ✍ Enregistre `processSaltSpreaderArea` sur le type de véhicule. |
| `SaltSpreader.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Surcharge `doCheckSpeedLimit`, `getDirtMultiplier`, `getWearMultiplier`, `getAreControlledActionsAllowed`, `getCanBeTurnedOn`, `getTurnedOnNotAllowedWarning` et `getVariableWorkWidthUsage`. |
| `SaltSpreader.registerEventListeners(vehicleType: any)` | 59 | ✍ S'abonne à onLoad, onDelete, onUpdateTick, onTurnedOn et onTurnedOff. |
| `SaltSpreader:onLoad(savegame: table)` | 70 | ✍ Lit l'unité de remplissage, l'unload info, la zone de travail d'usage et l'usage (converti de l/s en l/ms), charge les effets côté client et met en cache le SnowSystem et le texte « remplir d'abord l'outil ». Retire onUpdateTick hors serveur. |
| `SaltSpreader:onDelete()` | 92 | ✍ Supprime les effets via l'EffectManager. |
| `SaltSpreader:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 102 | ✍ Tick serveur : tant que l'épandeur est allumé et que le réservoir n'est pas vide, retire du sel de l'unité de remplissage proportionnellement à dt et à la largeur d'usage ; à 0 il l'éteint. |
| `SaltSpreader:onTurnedOn()` | 125 | ✍ Côté client : si l'unité de remplissage contient un type de remplissage connu, applique ce type aux effets et les démarre. |
| `SaltSpreader:onTurnedOff()` | 139 | ✍ Côté client : arrête les effets. |
| `SaltSpreader:doCheckSpeedLimit(superFunc: any) → boolean` | 149 | ✍ Retourne true si le parent le fait ou si l'épandeur est allumé, la limite de vitesse s'applique donc pendant l'épandage. |
| `SaltSpreader:getDirtMultiplier(superFunc: any)` | 155 | ✍ Ajoute le multiplicateur de salissure de travail à la valeur du parent tant que l'épandeur est allumé. |
| `SaltSpreader:getWearMultiplier(superFunc: any)` | 165 | ✍ Ajoute le multiplicateur d'usure de travail à la valeur du parent tant que l'épandeur est allumé. |
| `SaltSpreader:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 177 | ✍ Retourne false et l'avertissement « remplir d'abord l'outil » quand le réservoir est vide ; sinon délègue au parent. |
| `SaltSpreader:getCanBeTurnedOn(superFunc: any)` | 189 | ✍ Retourne false quand l'unité de remplissage est vide ; sinon délègue au parent. |
| `SaltSpreader:getTurnedOnNotAllowedWarning(superFunc: any)` | 200 | ✍ Retourne l'avertissement « remplir d'abord l'outil » quand le réservoir est vide ; sinon délègue au parent. |
| `SaltSpreader:getVariableWorkWidthUsage(superFunc: any) → number` | 212 | ✍ Si le parent ne fournit pas d'usage, retourne l'usage de sel en litres par minute (usage fois largeur de travail fois 1000 fois 60) quand l'épandeur est allumé, sinon 0 ; sinon retourne la valeur du parent. |
| `SaltSpreader.getDefaultSpeedLimit() → number` | 234 | ✍ Fonction statique retournant la limite de vitesse par défaut, 20 (probablement km/h ; unité non précisée dans ce fichier). |
| `SaltSpreader:processSaltSpreaderArea(workArea: any)` | 240 | ✍ Callback de zone de travail : sur le serveur, appelle `snowSystem:saltArea` avec les coins de la zone et retourne ses deux résultats ; sur les clients retourne 0, 0. La classe SnowSystem n'est pas dans le dump, ses valeurs de retour sont donc NON VÉRIFIÉES. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processSaltSpreaderArea` | 42 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 48 |
| registerOverwrittenFunction | `getDirtMultiplier` | 49 |
| registerOverwrittenFunction | `getWearMultiplier` | 50 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 51 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 52 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 53 |
| registerOverwrittenFunction | `getVariableWorkWidthUsage` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onUpdateTick` | 62 |
| registerEventListener | `onTurnedOn` | 63 |
| registerEventListener | `onTurnedOff` | 64 |
