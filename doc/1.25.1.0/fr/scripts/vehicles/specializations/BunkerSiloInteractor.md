# vehicles/specializations/BunkerSiloInteractor.lua

*[English version](../../../../scripts/vehicles/specializations/BunkerSiloInteractor.md)*

Source: `dataS/scripts/vehicles/specializations/BunkerSiloInteractor.lua` — FS25 1.25.1.0

✍ Petite spécialisation permettant à un silo-tranchée de se brancher sur un véhicule : le silo enregistre un rappel sur le véhicule, et celui-ci l'appelle pour signaler un changement de niveau avec une position monde. La classe ne décide pas quand notifier ; d'autres spécialisations ou le code du silo appellent notifiyBunkerSilo (l'orthographe est celle de la source).

- **BunkerSiloInteractor** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSiloInteractor.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `BunkerSiloInteractor.registerFunctions(vehicleType: any)` | 23 | ✍ Enregistre setBunkerSiloInteractorCallback et notifiyBunkerSilo sur le type de véhicule. |
| `BunkerSiloInteractor.registerEventListeners(vehicleType: any)` | 30 | ✍ Enregistre uniquement l'écouteur onLoad. |
| `BunkerSiloInteractor:onLoad(savegame: any)` | 36 | ✍ Remet à nil le rappel mémorisé et sa cible. |
| `BunkerSiloInteractor:setBunkerSiloInteractorCallback(callback: function, callbackTarget: table)` | 47 | ✍ Mémorise la fonction et l'objet cible à appeler plus tard ; passer nil supprime le lien. Un seul rappel est conservé à la fois. |
| `BunkerSiloInteractor:notifiyBunkerSilo(changedFillLevel: any, fillType: any, x: any, y: any, z: any)` | 55 | ✍ Si un rappel est défini, l'appelle avec la cible, ce véhicule, le niveau modifié, le type de remplissage et la position x, y, z. Sinon ne fait rien. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setBunkerSiloInteractorCallback` | 24 |
| registerFunction | `notifiyBunkerSilo` | 25 |
| registerEventListener | `onLoad` | 31 |
