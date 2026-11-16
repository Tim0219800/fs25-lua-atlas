# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua` — FS25 1.25.1.0

✍ Critère du score environnemental pour l'échantillonnage du sol. Il stocke par parcelle la fraction du champ déjà échantillonnée (-1 si inconnue) et l'utilise directement comme score. La fraction est rafraîchie depuis le coverMap de Precision Farming après le travail du préleveur, l'achat de cartes de sol et la commande de triche d'analyse (hooks serveur). Sous-classe de EnvironmentalScoreValue.

- **EnvironmentalScoreSoilSample** hérite de `EnvironmentalScoreValue` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreSoilSample.new(pfModule: any, customMt: any)` | 20 | ✍ Constructeur : fixe le xmlKey à "soilSample" et définit les poids par type (aucun 0, échantillonné 1). |
| `EnvironmentalScoreSoilSample:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 35 | ✍ Appelle le loadFromXML parent (via EnvironmentalScoreTillage:superClass(), la même classe parente) et retourne son résultat. |
| `EnvironmentalScoreSoilSample:update(dt: any)` | 45 | ✍ Hook de mise à jour vide. |
| `EnvironmentalScoreSoilSample:getScore(farmlandId: any)` | 50 | ✍ Retourne la fraction échantillonnée de la parcelle (0 à 1), le score client s'il existe, ou 0.5 tant qu'aucun état d'échantillonnage n'est connu. |
| `EnvironmentalScoreSoilSample:initFarmlandData()` | 66 | ✍ Crée l'enregistrement par parcelle avec samplePercentage à -1 (inconnu). |
| `EnvironmentalScoreSoilSample:loadFarmlandData(data: any, xmlFile: any, key: any)` | 74 | ✍ Lit samplePercentage depuis le XML de sauvegarde. |
| `EnvironmentalScoreSoilSample:saveFarmlandData(data: any, xmlFile: any, key: any)` | 80 | ✍ Écrit samplePercentage dans le XML de sauvegarde. |
| `EnvironmentalScoreSoilSample:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 86 | ✍ Côté client : lit un score sur 8 bits et le stocke comme clientScore, arrondi à deux décimales. |
| `EnvironmentalScoreSoilSample:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 93 | ✍ Côté serveur : écrit le score actuel sur 8 bits (score fois 255). |
| `EnvironmentalScoreSoilSample:onHarvestScoreReset(farmlandId: any)` | 100 | ✍ Quand la période de notation de récolte se termine, recalcule le pourcentage échantillonné de la parcelle au lieu de poser un indicateur de réinitialisation. |
| `EnvironmentalScoreSoilSample:updateFarmlandSampleState(farmlandId: any)` | 106 | ✍ Lit la part échantillonnée d'une parcelle via pfModule.coverMap:getFarmlandSampleState et la stocke bornée entre 0 et 1. |
| `EnvironmentalScoreSoilSample:overwriteGameFunctions(pfModule: any)` | 124 | ✍ Serveur uniquement. Accroche SoilSampler.processSoilSampling, CoverMap.onCoverUpdateFinished et CoverMap.analyseArea. À noter : le deuxième hook appelle self:onFarmlandSampleStatesFinished, absent de ce dump (NON VÉRIFIÉ). |
