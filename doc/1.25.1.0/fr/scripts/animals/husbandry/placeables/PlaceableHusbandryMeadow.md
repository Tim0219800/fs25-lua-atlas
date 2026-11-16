# animals/husbandry/placeables/PlaceableHusbandryMeadow.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryMeadow.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryMeadow.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui permet à un élevage de pâturer sur une prairie. Elle exige `PlaceableHusbandryFood`, `PlaceableHusbandryFence` et `PlaceableHusbandryAnimals`, lit les types de fruits comestibles (stades de croissance comestibles et mangés) sous `husbandry.meadow` et utilise éventuellement des tâches `MeadowCreationTask` pour créer ou effacer la prairie dans la carte de densité. Elle suit niveau et capacité par type de remplissage d'andain, les synchronise par le réseau et sauvegarde les tâches en attente ; l'essentiel de la logique de prairie (croissance, consommation, tâches) est absent du dump du SDK.

- **PlaceableHusbandryMeadow** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryMeadow.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Renvoie vrai uniquement si `PlaceableHusbandryFood`, `PlaceableHusbandryFence` et `PlaceableHusbandryAnimals` sont tous présents. |
| `PlaceableHusbandryMeadow.registerOverwrittenFunctions(placeableType: any)` | 41 | ✍ Enregistre les surcharges de `updateInfo`, `getFoodInfos`, `getAvailableFood` et `removeFood`. Les corps de `getAvailableFood` et `removeFood` ne sont pas dans le dump du SDK. |
| `PlaceableHusbandryMeadow.registerEventListeners(placeableType: any)` | 50 | ✍ S'abonne aux événements de chargement, suppression, mise à jour, flux et flux de mise à jour, ainsi qu'à `onFinishedFeeding`, `onHusbandryAnimalsCreated` et `onHusbandryFenceCustomizingUserLeft`. |
| `PlaceableHusbandryMeadow.registerXMLPaths(schema: any, basePath: any)` | 66 | ✍ Enregistre les clés XML sous `husbandry.meadow` : types de fruits supportés avec les noms des stades de croissance comestible début/fin et mangé, tâches de création et d'effacement, et noeuds du polygone d'effacement. |
| `PlaceableHusbandryMeadow.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Enregistre les clés de sauvegarde : tâches de création et d'effacement, et, par type de remplissage, nom, niveau et capacité. |
| `PlaceableHusbandryMeadow:onLoad(savegame: any)` | 93 | ✍ Initialise l'état de la prairie et lit chaque type de fruit supporté avec ses trois stades de croissance (les types dont un stade manque ou est inconnu sont ignorés avec un avertissement). Construit la tâche de création optionnelle et une tâche d'effacement à partir de noeuds de polygone, et active `canCreateMeadow` si l'une existe. |
| `PlaceableHusbandryMeadow:onReadStream(streamId: any, connection: any)` | 268 | ✍ Lecture réseau : lit niveau et capacité pour chaque type de remplissage, puis rafraîchit les informations de prairie (`updateMeadowInfo`, absent du dump). |
| `PlaceableHusbandryMeadow:onWriteStream(streamId: any, connection: any)` | 280 | ✍ Écriture réseau : écrit niveau et capacité pour chaque type de remplissage. |
| `PlaceableHusbandryMeadow:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 291 | ✍ Lecture de mise à jour côté client : si le serveur a envoyé des données, lit niveaux et capacités et rafraîchit les informations de prairie. Ignorée si la connexion ne vient pas du serveur. |
| `PlaceableHusbandryMeadow:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 307 | ✍ Écriture de mise à jour côté serveur : envoie niveaux et capacités quand l'indicateur de modification de la prairie est actif. Sans effet pour la connexion du serveur. |
| `PlaceableHusbandryMeadow:loadFromXMLFile(xmlFile: any, key: any)` | 322 | ✍ Charge les niveaux et capacités sauvegardés pour les types connus, rafraîchit les infos, remet en file les tâches de création et d'effacement sauvegardées comme en attente, et s'abonne aux messages de période de croissance seulement si aucune tâche n'est en attente. |
| `PlaceableHusbandryMeadow:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 370 | ✍ Sauvegarde le nom, le niveau et la capacité de chaque type de remplissage, ainsi que les tâches de création et d'effacement en attente s'il y en a. |
| `PlaceableHusbandryMeadow:getFoodInfos(superFunc: any)` | 704 | ✍ Surcharge : ajoute l'entrée d'information de nourriture de prairie quand au moins un type de fruit est configuré. |
| `PlaceableHusbandryMeadow:updateInfo(superFunc: any, infoTable: any)` | 717 | ✍ Surcharge : ajoute l'entrée d'information de prairie à la liste quand au moins un type de fruit est configuré. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `getFoodInfos` | 43 |
| registerOverwrittenFunction | `getAvailableFood` | 44 |
| registerOverwrittenFunction | `removeFood` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onPostLoad` | 52 |
| registerEventListener | `onDelete` | 53 |
| registerEventListener | `onUpdate` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteStream` | 56 |
| registerEventListener | `onReadUpdateStream` | 57 |
| registerEventListener | `onWriteUpdateStream` | 58 |
| registerEventListener | `onFinishedFeeding` | 59 |
| registerEventListener | `onHusbandryAnimalsCreated` | 60 |
| registerEventListener | `onHusbandryFenceCustomizingUserLeft` | 61 |

## Messages

- s'abonne à `MessageType.START_GROWTH_PERIOD` (l.363)
- s'abonne à `MessageType.FINISHED_GROWTH_PERIOD` (l.364)
