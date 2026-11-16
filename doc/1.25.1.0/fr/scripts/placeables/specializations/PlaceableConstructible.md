# placeables/specializations/PlaceableConstructible.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableConstructible.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableConstructible.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les bâtiments érigés par étapes via une machine à états de classes `ConstructibleState` (construction, finalisation, etc.) définie dans le XML, avec états nommés, transitions, un état de départ et un état d'aperçu. Elle possède une station de déchargement (vente) et un stockage qui reçoivent les matériaux de construction, synchronise l'état courant vers les clients qui rejoignent et sauvegarde le nom de l'état. Plusieurs fonctions enregistrées (`setConstructibleState`, `finalizeConstruction`, `getConstructibleFillLevel`, etc.) n'ont pas de corps dans le dump : NON VÉRIFIÉ.

- **PlaceableConstructible** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableConstructible.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableConstructible.registerFunctions(placeableType: any)` | 31 | ✍ Enregistre 13 fonctions : définition et recherche d'état, finalisation, niveau de remplissage et prise en charge des types, état d'aperçu, réinitialisation, commande console pour terminer un état et sa suppression, nombre d'états terminés et infos de progression. Leurs corps ne sont pas dans le dump : NON VÉRIFIÉ. |
| `PlaceableConstructible.registerOverwrittenFunctions(placeableType: any)` | 49 | ✍ Surcharge `collectPickObjects`, `updateInfo` et `setOwnerFarmId`. Seul `collectPickObjects` a un corps dans le dump. |
| `PlaceableConstructible.registerEventListeners(placeableType: any)` | 57 | ✍ S'abonne à `onLoad`, `onFinalizePlacement`, `onDelete`, `onUpdate`, aux quatre événements de flux réseau et aux événements d'entrée/sortie du déclencheur d'infos. |
| `PlaceableConstructible.registerXMLPaths(schema: any, basePath: any)` | 72 | ✍ Déclare les clés `constructible` : définitions d'états (`name`, `class`, `isStartState`, `isPreviewState` et les clés `ConstructibleState*`), transitions (`from`/`to`), station de vente et stockage. |
| `PlaceableConstructible.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 | ✍ Déclare les clés de sauvegarde `state#index`, `state#name`, et délègue à `ConstructibleStateBuilding` et `Storage`. |
| `PlaceableConstructible:onLoad(savegame: table)` | 104 | ✍ Crée la station de déchargement et le stockage et les enregistre auprès des systèmes de stockage et d'économie, puis construit la machine à états depuis le XML (jusqu'à 255 états, les classes d'état doivent dériver de `ConstructibleState`, les drapeaux de modification sont partagés en rotation sur 10 drapeaux) et ses transitions. Applique l'état d'aperçu si le placeable est en aperçu de construction. |
| `PlaceableConstructible:onFinalizePlacement(savegame: any)` | 232 | ✍ Applique la ferme propriétaire à la station et au stockage. Côté serveur, rejoue les états de 1 jusqu'à l'état chargé (ou de départ), exécute l'étape de chargement différée et reste actif. |
| `PlaceableConstructible:onDelete()` | 268 | ✍ Retire la commande console de fin d'état, se désabonne des messages, désenregistre et supprime la station de déchargement, supprime le stockage et chaque état. |
| `PlaceableConstructible:collectPickObjects(superFunc: any, node: any)` | 297 | ✍ Ignore les nœuds de sélection qui sont le nœud racine de remplissage exact d'un des déclencheurs de déchargement ; les autres nœuds sont transmis au parent. |
| `PlaceableConstructible:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 312 | ✍ Sauvegarde le nom de l'état courant et ses données propres, puis le stockage. |
| `PlaceableConstructible:loadFromXMLFile(xmlFile: any, key: any)` | 327 | ✍ Lit le nom d'état sauvegardé dans un index d'état en attente (1 par défaut), planifie le chargement des données propres de l'état après la finalisation (pour ne pas écraser la physique), et charge le stockage. |
| `PlaceableConstructible:onReadStream(streamId: any, connection: any)` | 346 | ✍ Connexion côté client : lit et enregistre la station de déchargement et le stockage puis, si un état a été envoyé, rejoue les états jusqu'à cet index et lit les données de flux de l'état. |
| `PlaceableConstructible:onWriteStream(streamId: any, connection: any)` | 373 | ✍ Connexion côté serveur : écrit la station et le stockage, puis un indicateur précisant si un état existe, suivi de l'index d'état et de ses données de flux. |
| `PlaceableConstructible.loadSpecValueFillTypes(xmlFile: XMLFile, customEnvironment: string?, baseDir: string?, resultTable: table?) → table?` | 687 | ✍ Chargeur de caractéristique de boutique : si le XML contient une section `constructible`, ajoute à la table de résultat chaque type de remplissage nommé par une entrée `input` d'un état (clé = nom) et la renvoie. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setConstructibleState` | 32 |
| registerFunction | `finalizeConstruction` | 33 |
| registerFunction | `getConstructibleFillLevel` | 34 |
| registerFunction | `getConstructibleSupportsFillType` | 35 |
| registerFunction | `removeConstructibleFillLevel` | 36 |
| registerFunction | `getConstructibleStateIndexByName` | 37 |
| registerFunction | `setConstructiblePreviewState` | 38 |
| registerFunction | `getConstructibleStateIndex` | 39 |
| registerFunction | `resetConstructibleToState` | 40 |
| registerFunction | `consoleCommandFinishConstructionState` | 41 |
| registerFunction | `removeConstructibleFinishStateCommand` | 42 |
| registerFunction | `getNumFinishedConstructibleStates` | 43 |
| registerFunction | `addConstructionProgressInfo` | 44 |
| registerOverwrittenFunction | `collectPickObjects` | 50 |
| registerOverwrittenFunction | `updateInfo` | 51 |
| registerOverwrittenFunction | `setOwnerFarmId` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onFinalizePlacement` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onReadStream` | 62 |
| registerEventListener | `onWriteStream` | 63 |
| registerEventListener | `onReadUpdateStream` | 64 |
| registerEventListener | `onWriteUpdateStream` | 65 |
| registerEventListener | `onInfoTriggerEnter` | 66 |
| registerEventListener | `onInfoTriggerLeave` | 67 |
