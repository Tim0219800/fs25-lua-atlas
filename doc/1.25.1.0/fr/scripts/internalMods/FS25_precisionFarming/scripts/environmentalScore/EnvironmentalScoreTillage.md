# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua` — FS25 1.25.1.0

✍ Critère du score environnemental pour le travail du sol. Par parcelle il suit la surface travaillée (en mètres carrés) pour chaque type de travail (aucun, labour profond, travail superficiel, semis direct) et les pondère (0.5, 0, 0.5, 1) en un score de 0 à 1. Des hooks serveur sur Cultivator, SowingMachine, FertilizingSowingMachine et HarvestExtension l'alimentent. Sous-classe de EnvironmentalScoreValue.

- **EnvironmentalScoreTillage** hérite de `EnvironmentalScoreValue` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreTillage.new(pfModule: any, customMt: any)` | 22 | ✍ Constructeur : fixe le xmlKey à "tillage" et le poids de chaque type de travail du sol. |
| `EnvironmentalScoreTillage:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 39 | ✍ Appelle le loadFromXML parent et retourne son résultat. |
| `EnvironmentalScoreTillage:update(dt: any)` | 49 | ✍ Hook de mise à jour vide. |
| `EnvironmentalScoreTillage:getScore(farmlandId: any)` | 54 | ✍ Retourne le score de travail du sol : le score client s'il existe, sinon la somme sur les types de la part travaillée du champ (plafonnée à 1) fois le poids du type, plafonnée à 1. Sans surface de champ, retourne le poids du type aucun. |
| `EnvironmentalScoreTillage:initFarmlandData()` | 75 | ✍ Crée l'enregistrement par parcelle. La surface du type aucun démarre à math.huge comme marqueur "pas encore initialisé" ; les autres démarrent à 0. |
| `EnvironmentalScoreTillage:loadFarmlandData(data: any, xmlFile: any, key: any)` | 89 | ✍ Lit totalFieldArea et les quatre surfaces travaillées (aucun, profond, superficiel, direct) depuis le XML de sauvegarde. |
| `EnvironmentalScoreTillage:saveFarmlandData(data: any, xmlFile: any, key: any)` | 99 | ✍ Écrit la surface totale du champ et les quatre surfaces travaillées, mais seulement une fois l'enregistrement initialisé (surface du type aucun différente de math.huge). |
| `EnvironmentalScoreTillage:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 111 | ✍ Côté client : lit un score sur 8 bits et le stocke comme clientScore, arrondi à deux décimales. |
| `EnvironmentalScoreTillage:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 118 | ✍ Côté serveur : écrit le score actuel sur 8 bits (score fois 255). |
| `EnvironmentalScoreTillage:addWorkedArea(farmlandId: any, area: any, type: any)` | 125 | ✍ Enregistre une surface travaillée avec un type de travail du sol. À la première utilisation, la surface totale de la parcelle devient la surface du type aucun ; la surface convertie est ensuite retirée équitablement des autres types et ajoutée au type donné. |
| `EnvironmentalScoreTillage:overwriteGameFunctions(pfModule: any)` | 165 | ✍ Serveur uniquement. Accroche Cultivator.processCultivatorArea (profond ou superficiel selon useDeepMode), SowingMachine et FertilizingSowingMachine.processSowingMachineArea (semis direct) et HarvestExtension.setLastScoringValues (l'herbe compte comme semis direct). Utilise vehicle:getPFStatisticInfo pour la parcelle. |
