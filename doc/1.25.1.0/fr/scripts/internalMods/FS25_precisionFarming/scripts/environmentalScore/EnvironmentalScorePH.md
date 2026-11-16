# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua` — FS25 1.25.1.0

✍ Critère du score environnemental pour la gestion du pH du sol. À chaque récolte il enregistre l'écart entre le pH réel et le pH cible, moyenné par surface récoltée, et le convertit en score de 0 à 1 via une courbe XML (scoreMapping.scoreValue avec phOffset et score). Hook côté serveur sur HarvestExtension ; les clients reçoivent un score compressé. Sous-classe de EnvironmentalScoreValue.

- **EnvironmentalScorePH** hérite de `EnvironmentalScoreValue` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScorePH.new(pfModule: any, customMt: any)` | 19 | ✍ Constructeur : s'appuie sur le constructeur parent et fixe le xmlKey à "ph". |
| `EnvironmentalScorePH:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 | ✍ Charge la courbe de score depuis les entrées scoreMapping.scoreValue. Chaque phOffset est divisé par la variation de pH d'un état de g_precisionFarming.pHMap si cette carte existe. |
| `EnvironmentalScorePH:update(dt: any)` | 61 | ✍ Hook de mise à jour vide. |
| `EnvironmentalScorePH:getScore(farmlandId: any)` | 66 | ✍ Retourne le score de pH : le score client s'il existe, sinon la valeur de la courbe pour l'écart moyen (somme sur la surface récoltée, remise à l'échelle par COMPRESSION), ou 0.5 sans surface récoltée. |
| `EnvironmentalScorePH:initFarmlandData()` | 83 | ✍ Crée l'enregistrement par parcelle : harvestedArea 0, phOffsetSum 0, pendingReset false. |
| `EnvironmentalScorePH:loadFarmlandData(data: any, xmlFile: any, key: any)` | 93 | ✍ Lit harvestedArea, phOffsetSum et pendingReset depuis le XML de sauvegarde. |
| `EnvironmentalScorePH:saveFarmlandData(data: any, xmlFile: any, key: any)` | 101 | ✍ Écrit harvestedArea, phOffsetSum et pendingReset dans le XML de sauvegarde. |
| `EnvironmentalScorePH:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 109 | ✍ Côté client : lit un score sur 8 bits et le stocke comme clientScore, arrondi à deux décimales. |
| `EnvironmentalScorePH:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 116 | ✍ Côté serveur : écrit le score actuel sur 8 bits (score fois 255). |
| `EnvironmentalScorePH:onHarvestScoreReset(farmlandId: any)` | 123 | ✍ Marque la parcelle afin que ses valeurs cumulées soient effacées au prochain enregistrement de récolte. |
| `EnvironmentalScorePH:addWorkedArea(farmlandId: any, area: any, nOffset: any)` | 130 | ✍ Ajoute une surface récoltée et son écart de pH (tous deux divisés par COMPRESSION) aux sommes de la parcelle, en les réinitialisant d'abord si nécessaire. Le troisième paramètre s'appelle nOffset dans le source mais porte un écart de pH. |
| `EnvironmentalScorePH:overwriteGameFunctions(pfModule: any)` | 148 | ✍ Serveur uniquement. Accroche HarvestExtension.setLastScoringValues et enregistre pHActual moins pHTarget pour la surface récoltée quand les deux valeurs existent. |
