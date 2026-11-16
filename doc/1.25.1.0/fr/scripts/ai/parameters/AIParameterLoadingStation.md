# ai/parameters/AIParameterLoadingStation.lua

*[English version](../../../../scripts/ai/parameters/AIParameterLoadingStation.md)*

Source: `dataS/scripts/ai/parameters/AIParameterLoadingStation.lua` — FS25 1.25.1.0

✍ Paramètre de job IA qui référence une station de chargement, stockée comme id d'objet réseau et choisie dans une liste de stations valides. Il est sauvegardé par id unique du placeable propriétaire plus index de station, et résolu plus tard une fois les placeables de la sauvegarde chargés.

- **AIParameterLoadingStation** hérite de `AIParameter` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterLoadingStation.new(customMt: any)` | 16 | ✍ Crée le paramètre de type LOADING_STATION, sans sélection et avec une liste vide. |
| `AIParameterLoadingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Écrit `#stationUniqueId` (placeable propriétaire) et `#stationIndex` pour la station sélectionnée, seulement si les deux sont déterminables. |
| `AIParameterLoadingStation:loadFromXMLFile(xmlFile: any, key: any)` | 48 | ✍ Lit l'id unique et l'index et résout la station ; si le placeable n'est pas encore chargé, s'abonne une fois à `LOADED_ALL_SAVEGAME_PLACEABLES` pour réessayer. |
| `AIParameterLoadingStation:onPlaceableLoaded(args: any)` | 61 | ✍ Callback de message qui retente de résoudre la station à partir de l'id unique et de l'index mémorisés. |
| `AIParameterLoadingStation:setLoadingStationFromUniqueId(uniqueId: any, index: any)` | 67 | ✍ Cherche le placeable par id unique et sa station de chargement par index dans le système de stockage, la sélectionne et renvoie true ; renvoie false si le placeable est introuvable. |
| `AIParameterLoadingStation:readStream(streamId: any, connection: any)` | 81 | ✍ Lit un id d'objet réseau optionnel pour la station. |
| `AIParameterLoadingStation:writeStream(streamId: any, connection: any)` | 89 | ✍ Écrit un drapeau de présence et, si défini, l'id d'objet réseau. |
| `AIParameterLoadingStation:setLoadingStation(loadingStation: any)` | 97 | ✍ Mémorise l'id d'objet réseau de la station donnée. |
| `AIParameterLoadingStation:getLoadingStation()` | 103 | ✍ Résout la station depuis son id ; ne la renvoie que si son placeable propriétaire existe et est synchronisé, sinon nil. |
| `AIParameterLoadingStation:getString()` | 114 | ✍ Renvoie le nom de la station, ou une chaîne vide. |
| `AIParameterLoadingStation:setValidLoadingStations(loadingStationIds: any)` | 125 | ✍ Remplace les stations sélectionnables par leurs ids réseau, en gardant la courante si elle y est encore, sinon en sélectionnant la première. |
| `AIParameterLoadingStation:setNextItem()` | 144 | ✍ Sélectionne la station suivante de la liste, en bouclant. |
| `AIParameterLoadingStation:setPreviousItem()` | 161 | ✍ Sélectionne la station précédente de la liste, en bouclant. |
| `AIParameterLoadingStation:validate(fillTypeIndex: any, farmId: any)` | 178 | ✍ Échoue avec des erreurs localisées si aucune n'est sélectionnée, si elle n'existe plus, si le type n'est pas géré par l'IA, ou si son niveau pour la ferme est 0 ou moins. Les contrôles de type ne s'exécutent que si un index de type est donné. |
