# vehicles/specializations/AutoLoadFork.lua

*[English version](../../../../scripts/vehicles/specializations/AutoLoadFork.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoadFork.lua` — FS25 1.25.1.0

✍ Spécialisation pour un véhicule de type fourche qui prend une palette ou une balle entrant dans un trigger et la transporte montée sur un noeud d'articulation, avec une animation de levage optionnelle et une touche de déchargement. La détection se fait uniquement côté serveur. Les balles ou identifiants de véhicules montés sont sauvegardés et restaurés. Plusieurs fonctions enregistrées (`mountObjectToFork`, `doUnloadFork`, `getCanUnloadFork`, `getIsForkUnloadingAllowed`, `onUnmountObject`) n'ont pas de corps dans le dump du SDK : NON VÉRIFIÉ.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoadFork.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : cette spécialisation n'a aucun prérequis. |
| `AutoLoadFork.initSpecialization()` | 26 | ✍ Enregistre les clés XML `vehicle.autoLoadFork` (noeud trigger, noeud d'articulation, nom et vitesse de l'animation de levage) et les clés de sauvegarde pour l'animation de levage et les véhicules ou balles montés. |
| `AutoLoadFork.registerFunctions(vehicleType: any)` | 46 | ✍ Enregistre les fonctions de véhicule de cette spécialisation : callback du trigger, vérifications de déchargement, `doUnloadFork`, `onUnmountObject` et `mountObjectToFork`. |
| `AutoLoadFork.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Surcharge `addToPhysics` et `removeFromPhysics` pour que les objets transportés suivent le véhicule dans et hors du monde physique. |
| `AutoLoadFork.registerEventListeners(vehicleType: any)` | 64 | ✍ S'abonne à onLoad, onPostLoad, onDelete, onUpdate, onDeactivate, onRootVehicleChanged et onRegisterActionEvents. |
| `AutoLoadFork:onLoad(savegame: any)` | 76 | ✍ Lit la configuration XML. Sur le serveur, elle enregistre le trigger de détection des palettes ; partout, elle lit le noeud d'articulation et l'animation de levage et crée les listes vides d'objets montés et démontés. |
| `AutoLoadFork:onPostLoad(savegame: any)` | 100 | ✍ Au chargement d'une sauvegarde non réinitialisée, restaure le temps d'animation de levage, met en attente les véhicules sauvegardés par identifiant unique, et recrée, enregistre et monte les balles sauvegardées sur la fourche. |
| `AutoLoadFork:onDelete()` | 138 | ✍ Sur le serveur, libère chaque objet monté avec `unmountKinematic`, puis retire le trigger s'il existe. |
| `AutoLoadFork:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 185 | ✍ Sauvegarde le temps d'animation de levage et chaque objet monté : un véhicule par identifiant unique, une balle via sa propre routine de sauvegarde. |
| `AutoLoadFork:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 210 | ✍ Sur les clients, enregistre l'action d'entrée UNLOAD_FORK quand le véhicule est actif pour la saisie, sans tenir compte de la sélection, avec une priorité de texte normale. |
| `AutoLoadFork:onRootVehicleChanged(rootVehicle: table)` | 224 | ✍ Maintient une action `forkLifting` dans l'action controller du véhicule racine : la crée avec son callback et ses icônes, la rattache à un nouveau contrôleur, ou la supprime s'il n'y en a plus. |
| `AutoLoadFork.actionControllerEvent(self: any, direction: any)` | 246 | ✍ Callback de l'action controller : joue l'animation de levage vers l'avant ou l'arrière selon `direction`, à sa vitesse. Renvoie toujours true. |
| `AutoLoadFork.onDeleteMountedObject(self: any, object: any)` | 258 | ✍ Écouteur de suppression : quand un objet monté est supprimé, le retire de la liste des objets montés et l'ajoute à celle des objets démontés avec l'heure courante. |
| `AutoLoadFork:onAutoLoadForkTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 272 | ✍ Callback du trigger pour palettes et balles. À l'entrée, si rien n'est monté et que la distance de remontage est nulle ou négative, monte l'objet sauf s'il vient de sortir (`BLOCK_REMOUNT_TIME`). À la sortie, l'oublie. À noter : la première boucle interne sur les objets montés ne peut jamais s'exécuter. |
| `AutoLoadFork.actionEventUnloadFork(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 360 | ✍ Callback d'entrée pour UNLOAD_FORK : appelle simplement `doUnloadFork` sur le véhicule. |
| `AutoLoadFork:addToPhysics(superFunc: any)` | 385 | ✍ Appelle la fonction parente puis, sur le serveur, rajoute chaque objet transporté à la physique. Renvoie false si le parent a échoué. |
| `AutoLoadFork:removeFromPhysics(superFunc: any)` | 406 | ✍ Appelle la fonction parente puis, sur le serveur, retire chaque objet transporté de la physique. Renvoie le résultat du parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onAutoLoadForkTriggerCallback` | 47 |
| registerFunction | `getCanUnloadFork` | 48 |
| registerFunction | `getIsForkUnloadingAllowed` | 49 |
| registerFunction | `doUnloadFork` | 50 |
| registerFunction | `onUnmountObject` | 51 |
| registerFunction | `mountObjectToFork` | 52 |
| registerOverwrittenFunction | `addToPhysics` | 58 |
| registerOverwrittenFunction | `removeFromPhysics` | 59 |
| registerEventListener | `onLoad` | 65 |
| registerEventListener | `onPostLoad` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onUpdate` | 68 |
| registerEventListener | `onDeactivate` | 69 |
| registerEventListener | `onRootVehicleChanged` | 70 |
| registerEventListener | `onRegisterActionEvents` | 71 |
