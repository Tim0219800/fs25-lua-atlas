# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.lua` — FS25 1.25.1.0

✍ Spécialisation de Precision Farming ajoutée aux véhicules motorisés (nécessite Motorized et PrecisionFarmingStatistic). Elle ajoute le diesel consommé sur un champ aux statistiques Precision Farming du véhicule. Le commentaire de classe indique qu'elle suit la consommation de carburant sur les champs.

- **ExtendedMotorized** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedMotorized.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true si le type de véhicule possède à la fois Motorized et PrecisionFarmingStatistic. |
| `ExtendedMotorized:updateConsumers(superFunc: any, dt: any, accInput: any)` | 33 | ✍ Surcharge : après la mise à jour de base, si le véhicule est sur un champ, ajoute le diesel utilisé par les consommateurs permanents (lastFuelUsage en l/h ramené au temps de trame dt) à la statistique usedFuel. |
