# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua` — FS25 1.25.1.0

✍ Critère du score environnemental pour le désherbage. Il cumule par parcelle la surface traitée selon la méthode (pulvérisation localisée, pulvérisation totale, désherbage mécanique) et convertit les proportions en un score de 0 à 1. Des hooks serveur sur Sprayer, Weeder et HarvestExtension alimentent les données ; les clients ne reçoivent qu'un score compressé. Sous-classe de EnvironmentalScoreValue.

- **EnvironmentalScoreHerbicide** hérite de `EnvironmentalScoreValue` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreHerbicide:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 | ✍ Appelle le loadFromXML parent (via EnvironmentalScoreTillage:superClass(), qui est la même classe parente) et retourne son résultat. À noter : aucun Herbicide.new n'est défini dans ce fichier ; il repose sur le constructeur hérité. |
| `EnvironmentalScoreHerbicide:update(dt: any)` | 39 | ✍ Hook de mise à jour vide. |
| `EnvironmentalScoreHerbicide:getScore(farmlandId: any)` | 44 | ✍ Retourne le score de désherbage d'une parcelle. Utilise le score client s'il existe, 0.5 si rien n'a été traité, sinon une part pondérée : pulvérisation localisée 1, mécanique 0.75, totale 0.6. |
| `EnvironmentalScoreHerbicide:initFarmlandData()` | 70 | ✍ Crée l'enregistrement par parcelle : surface par type de traitement (toutes à 0) et un indicateur pendingReset à false. |
| `EnvironmentalScoreHerbicide:loadFarmlandData(data: any, xmlFile: any, key: any)` | 83 | ✍ Lit depuis les attributs XML de la sauvegarde les trois surfaces traitées et pendingReset. |
| `EnvironmentalScoreHerbicide:saveFarmlandData(data: any, xmlFile: any, key: any)` | 93 | ✍ Écrit les trois surfaces traitées et pendingReset comme attributs XML. |
| `EnvironmentalScoreHerbicide:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 103 | ✍ Côté client : lit le score envoyé sur 8 bits (0 à 255) et le garde comme clientScore, arrondi à deux décimales. |
| `EnvironmentalScoreHerbicide:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 110 | ✍ Côté serveur : écrit le score actuel de la parcelle sur 8 bits (score fois 255). |
| `EnvironmentalScoreHerbicide:onHarvestScoreReset(farmlandId: any)` | 117 | ✍ Marque la parcelle afin que ses surfaces traitées soient effacées au prochain traitement et non immédiatement. |
| `EnvironmentalScoreHerbicide:addWorkedArea(farmlandId: any, area: any, type: any)` | 124 | ✍ Ajoute une surface traitée d'un type donné à une parcelle, en effaçant d'abord les trois surfaces si une réinitialisation est en attente. |
| `EnvironmentalScoreHerbicide:overwriteGameFunctions(pfModule: any)` | 140 | ✍ Serveur uniquement. Accroche Sprayer.processSprayerArea (l'herbicide compte en localisé ou en total selon getIsSpotSprayEnabled), Weeder.processWeederArea (mécanique) et HarvestExtension.setLastScoringValues (les récoltes d'herbe comptent comme surface en pulvérisation localisée). |
