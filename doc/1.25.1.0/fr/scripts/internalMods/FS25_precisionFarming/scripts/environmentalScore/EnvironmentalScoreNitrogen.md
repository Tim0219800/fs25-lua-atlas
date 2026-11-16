# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua` — FS25 1.25.1.0

✍ Critère du score environnemental pour la précision de la fertilisation azotée. À chaque récolte il enregistre l'écart entre l'azote appliqué et l'azote cible, moyenné par surface récoltée, et le convertit en score de 0 à 1 via une courbe lue dans le XML (scoreMapping.scoreValue avec nOffset et score). Hook côté serveur sur HarvestExtension ; les clients reçoivent un score compressé. Sous-classe de EnvironmentalScoreValue.

- **EnvironmentalScoreNitrogen** hérite de `EnvironmentalScoreValue` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreNitrogen.new(pfModule: any, customMt: any)` | 19 | ✍ Constructeur : s'appuie sur le constructeur parent et fixe le xmlKey à "nitrogen". |
| `EnvironmentalScoreNitrogen:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 | ✍ Charge la courbe de score depuis les entrées scoreMapping.scoreValue. Chaque nOffset est divisé par l'azote d'un changement d'état de g_precisionFarming.nitrogenMap si cette carte existe, la courbe étant ainsi exprimée en états de la carte. |
| `EnvironmentalScoreNitrogen:update(dt: any)` | 61 | ✍ Hook de mise à jour vide. |
| `EnvironmentalScoreNitrogen:getScore(farmlandId: any)` | 66 | ✍ Retourne le score d'azote : le score client s'il existe, sinon la valeur de la courbe pour l'écart moyen (somme des écarts sur la surface récoltée, remise à l'échelle par COMPRESSION), ou 0.5 sans surface récoltée. |
| `EnvironmentalScoreNitrogen:initFarmlandData()` | 83 | ✍ Crée l'enregistrement par parcelle : harvestedArea 0, nOffsetSum 0, pendingReset false. |
| `EnvironmentalScoreNitrogen:loadFarmlandData(data: any, xmlFile: any, key: any)` | 93 | ✍ Lit harvestedArea, nOffsetSum et pendingReset depuis le XML de sauvegarde. |
| `EnvironmentalScoreNitrogen:saveFarmlandData(data: any, xmlFile: any, key: any)` | 101 | ✍ Écrit harvestedArea, nOffsetSum et pendingReset dans le XML de sauvegarde. |
| `EnvironmentalScoreNitrogen:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 109 | ✍ Côté client : lit un score sur 8 bits et le stocke comme clientScore, arrondi à deux décimales. |
| `EnvironmentalScoreNitrogen:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 116 | ✍ Côté serveur : écrit le score actuel sur 8 bits (score fois 255). |
| `EnvironmentalScoreNitrogen:onHarvestScoreReset(farmlandId: any)` | 123 | ✍ Marque la parcelle afin que ses valeurs cumulées soient effacées au prochain enregistrement de récolte. |
| `EnvironmentalScoreNitrogen:addWorkedArea(farmlandId: any, area: any, nOffset: any)` | 130 | ✍ Ajoute une surface récoltée et son écart d'azote (tous deux divisés par COMPRESSION) aux sommes de la parcelle, en les réinitialisant d'abord si une réinitialisation est en attente. |
| `EnvironmentalScoreNitrogen:overwriteGameFunctions(pfModule: any)` | 148 | ✍ Serveur uniquement. Accroche HarvestExtension.setLastScoringValues et enregistre nActual moins nTarget pour la surface récoltée ; avec ignoreOverfertilization, les écarts positifs sont ramenés à 0. |
