# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua` — FS25 1.25.1.0

✍ Gestionnaire de tous les objets FarmlandStatistic de Precision Farming, créé par le module precision farming. Il les sauvegarde/charge, synchronise les statistiques d'une parcelle vers les clients sur demande, ouvre la boîte d'analyse économique depuis la carte et convertit des quantités en poids ou en prix. Il se branche sur FarmlandManager.loadFarmlandData pour créer une statistique par parcelle.

- **FarmlandStatistics** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandStatistics.new(pfModule: any, customMt: any)` | 20 | ✍ Constructeur. Garde une référence au module precision farming et crée des listes vides de statistiques (ordonnée et indexée par id de parcelle). |
| `FarmlandStatistics:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 34 | ✍ S'abonne au message FARMLAND_OWNER_CHANGED (gestionnaire onFarmlandStateChanged, absent de ce fichier, NON VÉRIFIÉ) et renvoie true. Ignore les arguments XML. |
| `FarmlandStatistics:loadFromItemsXML(xmlFile: any, key: any)` | 42 | ✍ Charge chaque statistique depuis '<key>.farmlandStatistics.farmlandStatistic(i)' dans l'ordre de la liste, en s'arrêtant à la première entrée manquante. |
| `FarmlandStatistics:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 58 | ✍ Sauvegarde chaque statistique comme entrée farmlandStatistic indexée sous '<key>.farmlandStatistics'. |
| `FarmlandStatistics:delete()` | 71 | ✍ Se désabonne de tous les messages et vide les listes de statistiques. |
| `FarmlandStatistics:readStatisticFromStream(farmlandId: any, streamId: any, connection: any)` | 80 | ✍ Côté client : lit une surface de champ totale optionnelle (stockée sur la parcelle) et la statistique de la parcelle, puis ouvre le dialogue sans renvoyer de requête. |
| `FarmlandStatistics:writeStatisticToStream(farmlandId: any, streamId: any, connection: any)` | 100 | ✍ Côté serveur : écrit un indicateur et la surface de champ totale si la parcelle existe, puis la statistique de la parcelle. Pendant de readStatisticFromStream. |
| `FarmlandStatistics:setMapFrame(mapFrame: any)` | 114 | ✍ Mémorise le cadre de carte utilisé plus tard pour effacer la sélection quand les statistiques s'ouvrent. |
| `FarmlandStatistics:collectFarmlandHotspotActions(actions: any)` | 120 | ✍ Ajoute une action « analyse économique » à la liste d'actions du point d'intérêt de parcelle, liée à openStatistics. |
| `FarmlandStatistics:openStatistics(farmlandId: any, noEventSend: any)` | 126 | ✍ Efface la sélection de carte et affiche FarmlandStatsDialog si la parcelle a une statistique et une surface de champ d'au moins 0,01. Un client distant envoie RequestFarmlandStatisticsEvent sauf si noEventSend est défini. |
| `FarmlandStatistics:getFarmlandFieldInfo(farmlandId: any)` | 146 | ✍ Délègue à getFarmlandFieldInfo du module precision farming et renvoie numéro et surface du champ (implémentation absente de ce fichier, NON VÉRIFIÉ). |
| `FarmlandStatistics:updateStatistic(farmlandId: any, name: any, value: any)` | 152 | ✍ Ajoute une valeur au compteur nommé de la statistique de la parcelle donnée, si elle en a une. |
| `FarmlandStatistics:resetStatistic(farmlandId: any, clearTotal: any)` | 161 | ✍ Remet à zéro le compteur de période de la statistique d'une parcelle, et le total si clearTotal est vrai. |
| `FarmlandStatistics:getFillLevelWeight(fillLevel: any, fillTypeIndex: any)` | 170 | ✍ Convertit un niveau de remplissage en poids avec massPerLiter du type divisé par FillTypeManager.MASS_SCALE ; renvoie le niveau inchangé pour un type inconnu. |
| `FarmlandStatistics:getFillLevelPrice(fillLevel: any, fillTypeIndex: any)` | 181 | ✍ Renvoie fillLevel fois le prix par litre. L'id spécial 'soilSamples' utilise le prix par échantillon de la carte des sols selon la difficulté économique. Un type inconnu renvoie le niveau inchangé. |
| `FarmlandStatistics:overwriteGameFunctions(pfModule: any)` | 206 | ✍ Enregistre FarmlandStatsDialog et surcharge FarmlandManager.loadFarmlandData : après le succès de l'original, crée une FarmlandStatistic par parcelle. Renvoie false si l'original échoue. |

## Messages

- s'abonne à `MessageType.FARMLAND_OWNER_CHANGED` (l.35)
