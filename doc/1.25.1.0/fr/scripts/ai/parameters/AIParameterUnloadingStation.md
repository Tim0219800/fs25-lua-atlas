# ai/parameters/AIParameterUnloadingStation.lua

*[English version](../../../../scripts/ai/parameters/AIParameterUnloadingStation.md)*

Source: `dataS/scripts/ai/parameters/AIParameterUnloadingStation.lua` — FS25 1.25.1.0

✍ Paramètre de job IA qui désigne une station de déchargement (point de vente, stockage, etc.) où l'IA doit livrer. Il conserve des identifiants d'objets réseau, permet de parcourir une liste de stations valides et sauvegarde le choix via l'identifiant unique du placeable propriétaire et l'index de la station. Il s'appuie sur g_currentMission.storageSystem et placeableSystem.

- **AIParameterUnloadingStation** hérite de `AIParameter` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterUnloadingStation.new(customMt: any)` | 16 | ✍ Crée le paramètre de type UNLOADING_STATION, sans station sélectionnée et avec une liste vide d'identifiants de stations valides. |
| `AIParameterUnloadingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Sauvegarde la station choisie sous forme de l'identifiant unique du placeable propriétaire (`#stationUniqueId`) et de son index (`#stationIndex`). Rien n'est écrit si la station, le propriétaire ou l'index est introuvable. |
| `AIParameterUnloadingStation:loadFromXMLFile(xmlFile: any, key: any)` | 48 | ✍ Lit l'identifiant unique et l'index de la station. Si le placeable n'est pas encore chargé, il s'abonne une seule fois au message LOADED_ALL_SAVEGAME_PLACEABLES pour réessayer. |
| `AIParameterUnloadingStation:onPlaceableLoaded(args: any)` | 61 | ✍ Callback de message qui retente la recherche de la station avec l'identifiant unique et l'index fournis dans la table args. |
| `AIParameterUnloadingStation:setUnloadingStationFromUniqueId(uniqueId: any, index: any)` | 67 | ✍ Retrouve le placeable par son identifiant unique, récupère sa station de déchargement à l'index donné via le système de stockage et la sélectionne. Retourne true si le placeable existe, sinon false. |
| `AIParameterUnloadingStation:readStream(streamId: any, connection: any)` | 81 | ✍ Lit un indicateur de présence puis, s'il est actif, l'identifiant d'objet réseau de la station sélectionnée. |
| `AIParameterUnloadingStation:writeStream(streamId: any, connection: any)` | 89 | ✍ Écrit un indicateur de présence puis, si une station est sélectionnée, son identifiant d'objet réseau. |
| `AIParameterUnloadingStation:setUnloadingStation(unloadingStation: any)` | 97 | ✍ Sélectionne la station donnée en stockant son identifiant d'objet réseau. |
| `AIParameterUnloadingStation:getUnloadingStation()` | 103 | ✍ Résout l'identifiant stocké en objet station. Ne le retourne que si son placeable propriétaire existe et est synchronisé, sinon nil. |
| `AIParameterUnloadingStation:getString()` | 114 | ✍ Retourne le nom de la station pour l'affichage, ou une chaîne vide si elle est introuvable. |
| `AIParameterUnloadingStation:setValidUnloadingStations(unloadingStations: any)` | 125 | ✍ Remplace la liste des stations sélectionnables par les identifiants des stations données. Conserve la sélection actuelle si elle figure encore dans la liste, sinon choisit la première. |
| `AIParameterUnloadingStation:setNextItem()` | 145 | ✍ Sélectionne la station suivante de la liste valide, en revenant à la première après la dernière. |
| `AIParameterUnloadingStation:setPreviousItem()` | 162 | ✍ Sélectionne la station précédente de la liste valide, en passant à la dernière avant la première. |
| `AIParameterUnloadingStation:validate(fillTypeIndex: any, farmId: any)` | 179 | ✍ Échoue si aucune station n'est sélectionnée ou si elle n'existe plus. Avec un type de remplissage, exige aussi la prise en charge IA de ce type et de la capacité libre pour la ferme. Retourne un booléen et une erreur localisée. |
