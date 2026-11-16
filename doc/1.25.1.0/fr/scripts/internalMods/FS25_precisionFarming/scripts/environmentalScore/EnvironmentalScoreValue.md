# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua` — FS25 1.25.1.0

✍ Classe de base d'un critère du score environnemental. Elle garde une table de données par parcelle (farmlandDatas), gère le chargement et la sauvegarde génériques sous le xmlKey du critère, et le format du flux réseau (nombre, puis id de parcelle et données). Les sous-classes redéfinissent getScore (0 à 1), initFarmlandData, les hooks de chargement/sauvegarde/flux et overwriteGameFunctions.

- **EnvironmentalScoreValue** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreValue.new(pfModule: any, customMt: any)` | 16 | ✍ Constructeur : mémorise pfModule et fixe le xmlKey par défaut à "default". Les sous-classes passent leur propre métatable et leur xmlKey. |
| `EnvironmentalScoreValue:initFarmlandData()` | 27 | ✍ Retourne une nouvelle table de données par parcelle ; la version de base renvoie une table vide et est faite pour être redéfinie. |
| `EnvironmentalScoreValue:getFarmlandData(farmlandId: any)` | 33 | ✍ Retourne la table de données d'une parcelle, en la créant via initFarmlandData (avec le farmlandId) au premier accès. Retourne nil si l'id est nil. |
| `EnvironmentalScoreValue:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 44 | ✍ Initialise une table farmlandDatas vide et retourne true. Les sous-classes l'appellent en premier lors du chargement de leur configuration XML de carte. |
| `EnvironmentalScoreValue:loadFromItemsXML(xmlFile: any, key: any)` | 52 | ✍ Chargement de sauvegarde : parcourt les entrées <xmlKey>.farmland et transmet chacune à loadFarmlandData pour la parcelle correspondante. |
| `EnvironmentalScoreValue:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 64 | ✍ Écriture de sauvegarde : écrit une entrée <xmlKey>.farmland par parcelle stockée et laisse saveFarmlandData ajouter les détails. |
| `EnvironmentalScoreValue:loadFarmlandData(data: any, xmlFile: any, key: any)` | 76 | ✍ Hook vide pour lire les valeurs sauvegardées d'une parcelle ; redéfini par les sous-classes. |
| `EnvironmentalScoreValue:saveFarmlandData(data: any, xmlFile: any, key: any)` | 81 | ✍ Hook vide pour écrire les valeurs d'une parcelle ; redéfini par les sous-classes. |
| `EnvironmentalScoreValue:readStream(streamId: integer, connection: Connection, farmId: any)` | 88 | ✍ Lecture côté client : lit un nombre de parcelles, puis pour chaque entrée un id de parcelle et les données via readFarmlandDataFromStream. La largeur en bits vient de g_farmlandManager.numberOfBits. |
| `EnvironmentalScoreValue:writeStream(streamId: integer, connection: Connection, farmId: any)` | 101 | ✍ Écriture côté serveur : compte les parcelles appartenant à la ferme donnée, puis écrit chaque id de parcelle suivi de ses données via writeFarmlandDataToStream. |
| `EnvironmentalScoreValue:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 121 | ✍ Hook vide pour lire les données d'une parcelle depuis un flux ; redéfini par les sous-classes. |
| `EnvironmentalScoreValue:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 126 | ✍ Hook vide pour écrire les données d'une parcelle dans un flux ; redéfini par les sous-classes. |
| `EnvironmentalScoreValue:update(dt: any)` | 131 | ✍ Hook de mise à jour vide, par frame, pour les sous-classes. |
| `EnvironmentalScoreValue:getScore()` | 136 | ✍ Retourne un score neutre de 0.5 ; les sous-classes retournent une valeur de 0 à 1 pour un id de parcelle donné. |
| `EnvironmentalScoreValue:overwriteGameFunctions(pfModule: any)` | 142 | ✍ Accroche FertilizingSowingMachine.processSowingMachineArea pour comptabiliser la surface en semis direct via addWorkedArea. À noter : la classe de base n'a pas d'addWorkedArea et chaque sous-classe redéfinit cette méthode, ce corps semble donc être un reste inutilisé. |
