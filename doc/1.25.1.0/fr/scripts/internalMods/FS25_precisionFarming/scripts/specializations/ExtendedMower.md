# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua` — FS25 1.25.1.0

✍ Spécialisation de Precision Farming ajoutée aux faucheuses (nécessite Mower et PrecisionFarmingStatistic). Elle affiche la carte de rendement sur la minicarte sur un champ et encadre processMowerArea par le pré- et post-traitement de l'extension de récolte. Le commentaire de classe de la source parle d'un basculement du zoom de la minicarte.

- **ExtendedMower** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedMower.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true si le type de véhicule possède à la fois Mower et PrecisionFarmingStatistic. |
| `ExtendedMower:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 36 | ✍ Client uniquement : tant que le véhicule est actif pour les entrées (hors IA), rafraîchit l'état d'affichage de la carte de rendement sur la minicarte. |
| `ExtendedMower:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 46 | ✍ Client uniquement : rafraîchit l'état de la minicarte en le forçant à faux quand le véhicule n'est pas actif pour les entrées. |
| `ExtendedMower.updateMinimapActiveState(self: any, forcedState: any)` | 58 | ✍ Indique à la carte de rendement de s'afficher sur la minicarte quand la faucheuse est sur un champ, sauf état forcé. À noter : contrairement à ExtendedCombine, elle ne vérifie pas que la carte de rendement n'est pas nil. |
| `ExtendedMower:processMowerArea(superFunc: any, workArea: any, dt: any)` | 72 | ✍ Surcharge : appelle preProcessMowerArea et postProcessMowerArea de g_precisionFarming.harvestExtension autour de la fonction de base, ignoré pour les clients éloignés au-delà de Mower.CLIENT_DM_UPDATE_RADIUS. Renvoie la surface modifiée et totale de la fonction de base. |
