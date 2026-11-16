# internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule de Precision Farming qui met en cache, pour chaque véhicule, la parcelle sous lui, l'accès de la ferme du joueur, la mission active et un indicateur lissé « sur champ ». Elle expose ces données et permet aux autres spécialisations d'alimenter les statistiques de parcelle. La majeure partie du code d'initialisation (chargement, champs de spec) est absente du dump (NON VÉRIFIÉ).

- **PrecisionFarmingStatistic** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PrecisionFarmingStatistic.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PrecisionFarmingStatistic:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 60 | ✍ À chaque tick, cumule la distance parcourue ; quand elle dépasse la distance de mise à jour (ou sans parcelle connue), rafraîchit l'id de parcelle, le droit d'accès, la mission à cette position et les indicateurs sur-champ. L'indicateur lissé ne rebascule qu'après plus de 20 m depuis la dernière position. |
| `PrecisionFarmingStatistic:getPFStatisticInfo()` | 101 | ✍ Renvoie cinq valeurs : l'objet de statistiques de parcelle, isOnField, farmlandId, isOnFieldSmoothed et la mission à la position du véhicule. |
| `PrecisionFarmingStatistic:updatePFStatistic(name: any, value: any)` | 108 | ✍ Ajoute une valeur à la statistique de parcelle nommée, uniquement si les statistiques existent, que le véhicule est sur une parcelle accessible à la ferme et qu'aucune mission n'y est active. |
| `PrecisionFarmingStatistic:getPFYieldMap()` | 119 | ✍ Renvoie l'objet de carte de rendement stocké dans la table de la spécialisation (NON VÉRIFIÉ : lieu d'affectation). |
