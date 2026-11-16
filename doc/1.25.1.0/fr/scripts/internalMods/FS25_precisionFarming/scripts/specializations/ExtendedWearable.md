# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule du mod interne Precision Farming. Elle exige Wearable et PrecisionFarmingStatistic, et convertit l'usure en coûts de réparation inscrits dans les statistiques de parcelle quand le véhicule est sur un champ.

- **ExtendedWearable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedWearable.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true uniquement si le type de véhicule possède les spécialisations Wearable et PrecisionFarmingStatistic. |
| `ExtendedWearable:onPostUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 42 | ✍ Compare l'usure actuelle à celle du tick précédent, calcule la différence de prix de réparation via Wearable.calculateRepairPrice et, si elle est positive et que le véhicule est sur un champ, l'ajoute à la statistique 'vehicleCosts'. Mémorise l'usure pour le tick suivant. Dépend de champs de spec initialisés dans du code absent de ce fichier (NON VÉRIFIÉ). |
