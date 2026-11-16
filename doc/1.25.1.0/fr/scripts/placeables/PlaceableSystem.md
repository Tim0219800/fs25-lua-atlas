# placeables/PlaceableSystem.lua

*[English version](../../../scripts/placeables/PlaceableSystem.md)*

Source: `dataS/scripts/placeables/PlaceableSystem.lua` — FS25 1.25.1.0

✍ Registre de tous les placeables au niveau de la mission, accessible par `g_currentMission.placeableSystem`. Il suit les placeables par identifiant unique, les chargements en attente, les données de préplacés, les stations météo, les maisons de ferme et les silos-couloirs, les sauvegarde et charge depuis le XML de sauvegarde, publie `PLACEABLE_ADDED` et `PLACEABLE_REMOVED` sur le centre de messages et fournit des commandes console de développement quand `g_addTestCommands` est actif. Il utilise `PlaceableLoadingData` pour chaque chargement. Plusieurs membres utilisés ici (`readStreamPreplacedInfo`, `loadFromXMLFile`, `savePlaceableToXML`) ne sont pas définis dans ce fichier (NON VÉRIFIÉ).

- **PlaceableSystem** (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSystem.new(mission: table, customMt: table?) → PlaceableSystem` | 27 | ✍ Crée le système pour une mission avec des listes vides. Enregistre les commandes console de test gsPlaceablesDeleteAll, gsPlaceablesReloadAll, gsPlaceablesLoadAll (serveur), gsPlaceablesPendingLoadings et gsPlaceableSystemDrawBoundary, seulement si `g_addTestCommands` est actif. |
| `PlaceableSystem:delete()` | 90 | ✍ Arrête le système : annule les chargements en attente, supprime les placeables en file et tous les placeables existants, libère le XML de sauvegarde, vide les listes et retire les commandes console. |
| `PlaceableSystem:deleteAll()` | 128 | ✍ Supprime tous les placeables (du dernier au premier) et retourne leur nombre. |
| `PlaceableSystem:addPlaceable(placeable: any)` | 297 | ✍ Enregistre un placeable. Rejette les objets qui ne sont pas des placeables et les identifiants uniques en double ; attribue un nouvel identifiant unique s'il n'en a pas ; publie `PLACEABLE_ADDED`. |
| `PlaceableSystem:removePlaceable(placeable: any)` | 325 | ✍ Retire un placeable de la liste et de la table des identifiants uniques, puis publie `PLACEABLE_REMOVED`. |
| `PlaceableSystem:addPendingPlaceableLoad(placeableLoadingData: any)` | 470 | ✍ Ajoute un objet de données de chargement à la liste des chargements en cours. |
| `PlaceableSystem:removePendingPlaceableLoad(placeableLoadingData: any)` | 476 | ✍ Retire un objet de données de chargement de la liste des chargements en attente. |
| `PlaceableSystem:canStartMission()` | 486 | ✍ Retourne true uniquement si tous les placeables sont synchronisés et qu'aucun chargement n'est en attente. |
| `PlaceableSystem:addWeatherStation(weatherStation: any)` | 502 | ✍ Enregistre un placeable de station météo. |
| `PlaceableSystem:removeWeatherStation(weatherStation: any)` | 508 | ✍ Désenregistre un placeable de station météo. |
| `PlaceableSystem:addBunkerSilo(bunkerSilo: any)` | 514 | ✍ Enregistre un silo-couloir. |
| `PlaceableSystem:removeBunkerSilo(bunkerSilo: any)` | 520 | ✍ Désenregistre un silo-couloir. |
| `PlaceableSystem:getBunkerSilos()` | 526 | ✍ Retourne la liste des silos-couloirs enregistrés. |
| `PlaceableSystem:getExistingPlaceableByXMLFilename(xmlFilename: string, ownerFarmId: integer?, excludeBoughtWithFarmland: boolean?) → Placeable?` | 537 | ✍ Retourne le premier placeable non marqué pour suppression chargé depuis le XML donné, avec filtre facultatif sur la ferme propriétaire et exclusion facultative de ceux achetés avec un terrain. Utile pour les placeables uniques. Retourne nil s'il n'y en a pas. |
| `PlaceableSystem:getHasWeatherStation(farmId: any)` | 557 | ✍ Retourne true si une station météo existe, éventuellement seulement une appartenant à l'identifiant de ferme donné. |
| `PlaceableSystem:addFarmhouse(farmhouse: any)` | 569 | ✍ Enregistre un placeable de maison de ferme. |
| `PlaceableSystem:removeFarmhouse(farmhouse: any)` | 575 | ✍ Désenregistre un placeable de maison de ferme. |
| `PlaceableSystem:getFarmhouse(farmId: any)` | 581 | ✍ Retourne la première maison de ferme, éventuellement celle appartenant à l'identifiant de ferme donné, ou nil. |
| `PlaceableSystem:save(xmlFilename: any, usedModNames: any)` | 604 | ✍ Crée un fichier XML `placeables` au chemin donné, y écrit tous les placeables avec `saveToXML`, puis l'enregistre et le ferme. |
| `PlaceableSystem:saveToXML(xmlFile: any, usedModNames: any, savePreplaced: any)` | 615 | ✍ Écrit la version du système, puis (sauf désactivation) les entrées préplacées avec identifiant unique, indicateurs supprimé et terrain, et image personnalisée, puis chaque placeable à sauvegarder qui n'est pas préplacé. |
| `PlaceableSystem:loadPlaceableFromXML(xmlFile: any, key: any, defaultItemsToSPFarm: any, preplacedData: any, callback: any, callbackTarget: any, callbackArguments: any)` | 762 | ✍ Lance un chargement asynchrone d'un placeable depuis une entrée de sauvegarde si les règles de propriété par défaut et de mission le permettent. Retourne true si un chargement a été mis en file, false (avec log XML) si le nom de fichier ou l'objet de boutique manque. Incrémente `placeablesToLoad`, jamais initialisé dans ce fichier (NON VÉRIFIÉ). |
| `PlaceableSystem:loadPlaceableFinished(placeable: any, loadingState: any, arguments: any)` | 832 | ✍ Rappel d'un chargement terminé : collecte les placeables réussis, conserve le premier état d'échec, et quand le compteur atteint zéro exécute le rappel asynchrone comme tâche avec la liste chargée et l'état. |
| `PlaceableSystem:consoleCommandDeleteAllPlaceables(includePreplaced: any)` | 873 | ✍ Commande console : supprime tous les placeables, en conservant les préplacés sauf si l'argument est fourni, et retourne un message de résultat. |
| `PlaceableSystem:consoleCommandReloadAllPlaceables()` | 894 | ✍ Commande console, solo uniquement : sauvegarde tous les placeables non préplacés dans un XML temporaire, les supprime puis les recharge depuis celui-ci pour tester des XML/i3d modifiés. Ceux qui échouent restent en attente pour un nouvel essai. |
| `PlaceableSystem:consoleCommandLoadAllPlaceables(modsOnly: string?)` | 973 | ✍ Commande console, solo uniquement : charge tous les placeables de la boutique l'un après l'autre à la position 0,0 de la carte, les finalise et les supprime, en journalisant les échecs. L'argument modsOnly limite aux mods et DLC. |

## Messages

- publie `MessageType.PLACEABLE_ADDED` (l.317)
- publie `MessageType.PLACEABLE_REMOVED` (l.333)
