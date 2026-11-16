# placeables/PlaceableLoadingData.lua

*[English version](../../../scripts/placeables/PlaceableLoadingData.md)*

Source: `dataS/scripts/placeables/PlaceableLoadingData.lua` — FS25 1.25.1.0

✍ Conteneur de données qui rassemble tout ce qu'il faut pour charger un placeable : objet de boutique, ferme propriétaire, état de propriété, configurations, données de sauvegarde, position et rotation, paramètres personnalisés. L'appelant le remplit via les setters puis appelle `load`, qui déclare un chargement en attente auprès de `g_currentMission.placeableSystem`. La méthode de chargement `loadPlaceable` n'est pas définie dans ce fichier (origine NON VÉRIFIÉE).

- **PlaceableLoadingData** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableLoadingData.new(customMt: any) → PlaceableLoadingData` | 17 | ✍ Crée un objet de données de chargement avec des valeurs par défaut : possédé, propriétaire `AccessHandler.EVERYONE`, enregistré, sauvegardé, emplacement valide, position et rotation à zéro, tables de configuration vides. |
| `PlaceableLoadingData:setFilename(filename: string)` | 55 | ✍ Cherche l'objet de boutique par nom de fichier XML et l'applique avec `setStoreItem`. S'il n'est pas trouvé, écrit une erreur et affiche la pile d'appels. |
| `PlaceableLoadingData:setStoreItem(storeItem: table)` | 68 | ✍ Stocke l'objet de boutique, règle la rotation Y d'après la rotation de l'objet, enregistre le nom de fichier XML à charger et marque les données valides si une entrée de placeable existe. |
| `PlaceableLoadingData:setPropertyState(propertyState: integer)` | 84 | ✍ Définit l'état de propriété que le placeable aura après le chargement. |
| `PlaceableLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 91 | ✍ Définit l'identifiant de la ferme qui possédera le placeable. |
| `PlaceableLoadingData:setSavegameData(savegameData: table)` | 98 | ✍ Stocke les données de sauvegarde (xmlFile, key) et, si un objet de boutique est défini, en charge les configurations, configurations achetées et données de configuration, y compris les anciennes entrées `boughtConfiguration`. |
| `PlaceableLoadingData:setConfigurations(configurations: table)` | 146 | ✍ Définit la table des configurations choisies, ou une table vide si nil. |
| `PlaceableLoadingData:setBoughtConfigurations(boughtConfigurations: table)` | 157 | ✍ Définit la table des configurations achetées, ou une table vide si nil. |
| `PlaceableLoadingData:setConfigurationData(configurationData: table)` | 168 | ✍ Définit la table des données par configuration (par exemple les couleurs personnalisées), ou une table vide si nil. |
| `PlaceableLoadingData:getConfigurations(configFileName: string) → table, table, table` | 182 | ✍ Retourne des copies profondes des configurations, des configurations achetées et des données de configuration. Supprime les configurations inconnues de l'objet de boutique du XML cible et complète les manquantes avec l'identifiant par défaut. |
| `PlaceableLoadingData:setIsRegistered(isRegistered: boolean)` | 212 | ✍ Définit si le placeable est enregistré après le chargement. |
| `PlaceableLoadingData:setForceServer(forceServer: boolean)` | 219 | ✍ Définit si le client crée aussi le placeable comme un placeable de type serveur (par exemple avec physique dynamique). |
| `PlaceableLoadingData:setIsSaved(isSaved: boolean)` | 226 | ✍ Définit si le placeable est écrit dans la sauvegarde. |
| `PlaceableLoadingData:setCustomParameter(name: string, value: any)` | 234 | ✍ Stocke un paramètre personnalisé nommé que le placeable pourra lire ensuite. |
| `PlaceableLoadingData:getCustomParameter(name: string) → any` | 242 | ✍ Retourne le paramètre personnalisé stocké sous le nom donné, ou nil. |
| `PlaceableLoadingData:setPosition(x: number, y: number, z: number)` | 251 | ✍ Définit la position de création dans le monde. Si y est nil, la hauteur du terrain en x, z est utilisée. |
| `PlaceableLoadingData:setRotation(rx: number, ry: number, rz: number)` | 264 | ✍ Définit la rotation de création dans le monde sous forme de trois angles d'Euler. |
| `PlaceableLoadingData:setSpawnNode(node: integer)` | 271 | ✍ Copie la position et la rotation depuis la transformation monde d'un nœud. |
| `PlaceableLoadingData:applyPositionData(placeable: table) → boolean` | 281 | ✍ Positionne le placeable chargé : retourne false si l'emplacement est invalide ou si la position de la sauvegarde est incomplète ; retourne true sans le déplacer pour les placeables préplacés ; sinon appelle `setPose` avec les valeurs de la sauvegarde ou stockées. |
| `PlaceableLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 315 | ✍ Lance le chargement : enregistre ces données comme chargement en attente dans le système de placeables, stocke le rappel facultatif, met l'état à OK et appelle `loadPlaceable` (non défini dans ce fichier). |
