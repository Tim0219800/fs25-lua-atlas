# placeables/specializations/PlaceableAnimatedObjects.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableAnimatedObjects.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableAnimatedObjects.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable (`spec_animatedObjects`) qui possède une liste d'instances `AnimatedObject` (portes, portails, etc.) chargées depuis `placeable.animatedObjects`. Elle gère des dépendances entre objets selon le temps d'animation, enregistre les objets à la fin du placement, les synchronise aux clients qui rejoignent, les sauvegarde et aligne leur ferme propriétaire sur celle du placeable. Aucun prérequis.

- **PlaceableAnimatedObjects** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableAnimatedObjects.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Vérification des prérequis ; retourne toujours true. |
| `PlaceableAnimatedObjects.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `getCanTriggerAnimatedObject` et `getAnimatedObjectBySaveId` sur le type de placeable. À noter : aucune fonction `getCanTriggerAnimatedObject` n'est définie dans ce fichier, la valeur enregistrée est donc nil ici (NON VÉRIFIÉ si un autre fichier la fournit). |
| `PlaceableAnimatedObjects.registerOverwrittenFunctions(placeableType: any)` | 31 | ✍ Enregistre une surcharge de `setOwnerFarmId` du placeable. |
| `PlaceableAnimatedObjects.registerEventListeners(placeableType: any)` | 37 | ✍ S'abonne à `onLoad`, `onDelete`, `onReadStream`, `onWriteStream` et `onPostFinalizePlacement`. |
| `PlaceableAnimatedObjects.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Enregistre le schéma `.animatedObjects` via `AnimatedObject.registerXMLPaths`, plus des entrées `dependency` par objet avec `animatedObjectIndex`, `minTime` et `maxTime`. |
| `PlaceableAnimatedObjects.registerSavegameXMLPaths(schema: any, basePath: any)` | 58 | ✍ Enregistre les chemins de sauvegarde de chaque `animatedObject` en déléguant à `AnimatedObject.registerSavegameXMLPaths`. |
| `PlaceableAnimatedObjects:onLoad(savegame: table)` | 65 | ✍ Crée et charge chaque `AnimatedObject` avec sa liste de dépendances, puis enveloppe son `getCanBeTriggered` pour exiger aussi `getCanTriggerAnimatedObject` du placeable et que le temps d'animation de chaque objet dépendant soit entre son min et son max. |
| `PlaceableAnimatedObjects:onDelete()` | 124 | ✍ Supprime tous les objets animés et vide la liste. |
| `PlaceableAnimatedObjects:onPostFinalizePlacement()` | 137 | ✍ Enregistre chaque objet animé comme objet réseau et lui attribue l'identifiant de ferme propriétaire du placeable. |
| `PlaceableAnimatedObjects:onReadStream(streamId: any, connection: any)` | 148 | ✍ Côté client : pour chaque objet animé, lit son identifiant d'objet réseau et son état depuis le flux, puis termine son enregistrement auprès de `g_client`. |
| `PlaceableAnimatedObjects:onWriteStream(streamId: integer, connection: table)` | 163 | ✍ Côté serveur, quand un client rejoint : écrit pour chaque objet animé sa référence de nœud et son état dans le flux et l'enregistre pour cette connexion. |
| `PlaceableAnimatedObjects:loadFromXMLFile(xmlFile: any, key: any)` | 176 | ✍ Charge l'état sauvegardé de chaque objet animé depuis le XML de sauvegarde sous `<key>.animatedObject(i)`. |
| `PlaceableAnimatedObjects:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 185 | ✍ Sauvegarde chaque objet animé dans le XML de sauvegarde sous `<key>.animatedObject(i)`, en transmettant les noms de mods utilisés. |
| `PlaceableAnimatedObjects:getAnimatedObjectBySaveId(saveId: string) → table?` | 207 | ✍ Retourne l'objet animé dont le `saveId` correspond, ou nil s'il n'y en a aucun. |
| `PlaceableAnimatedObjects:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 219 | ✍ Surcharge : appelle la fonction parente, puis applique le même identifiant de ferme propriétaire à chaque objet animé sans envoyer d'événement. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getCanTriggerAnimatedObject` | 25 |
| registerFunction | `getAnimatedObjectBySaveId` | 26 |
| registerOverwrittenFunction | `setOwnerFarmId` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onDelete` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
| registerEventListener | `onPostFinalizePlacement` | 42 |
