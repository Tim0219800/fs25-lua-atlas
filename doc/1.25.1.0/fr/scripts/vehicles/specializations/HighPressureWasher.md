# vehicles/specializations/HighPressureWasher.lua

*[English version](../../../../scripts/vehicles/specializations/HighPressureWasher.md)*

Source: `dataS/scripts/vehicles/specializations/HighPressureWasher.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour un poste de nettoyeur haute pression qui fournit côté client des nœuds d'animation, des effets et des sons de démarrage, d'arrêt et de travail. Elle écoute les événements de HandToolHolders (outil à main rangé ou pris), mais ce fichier ne définit aucun gestionnaire pour eux. Le comportement réel de lavage n'est pas dans ce fichier (NON VÉRIFIÉ).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HighPressureWasher.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucun prérequis envers d'autres spécialisations. |
| `HighPressureWasher.initSpecialization()` | 21 | ✍ Enregistre les chemins XML sous vehicle.highPressureWasher pour les nœuds d'animation, les effets et les échantillons sonores de démarrage, d'arrêt et de travail. |
| `HighPressureWasher.registerEventListeners(vehicleType: any)` | 36 | ✍ Abonne à onLoad, onDelete, onHandToolStoredInHolder et onHandToolTakenFromHolder. À noter : les deux gestionnaires d'outil à main ne sont pas définis dans ce fichier (NON VÉRIFIÉ). |
| `HighPressureWasher:onLoad(savegame: table)` | 46 | ✍ Client uniquement : charge les nœuds d'animation, les effets et les trois échantillons sonores depuis le XML. Sur un serveur dédié, retire les écouteurs onDelete et onUpdate. |
| `HighPressureWasher:onDelete()` | 67 | ✍ Client uniquement : supprime les échantillons sonores, nœuds d'animation et effets créés dans onLoad. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onHandToolStoredInHolder` | 39 |
| registerEventListener | `onHandToolTakenFromHolder` | 40 |
