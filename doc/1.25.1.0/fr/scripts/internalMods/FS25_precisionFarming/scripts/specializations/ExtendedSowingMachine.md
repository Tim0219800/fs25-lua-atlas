# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua` — FS25 1.25.1.0

✍ Spécialisation de Precision Farming ajoutée aux semoirs (nécessite SowingMachine et PrecisionFarmingStatistic). Elle ajoute un mode de taux de semis (automatique selon le type de sol ou manuel) synchronisé par ExtendedSowingMachineRateEvent, ajuste la consommation de semences selon le taux réel, enregistre les statistiques de semences et lit le taux recommandé et la largeur de passage de roues depuis les cartes. Elle encadre processSowingMachineArea et processOverSeedingArea.

- **ExtendedSowingMachine** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSowingMachine.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Renvoie true si le type de véhicule possède à la fois SowingMachine et PrecisionFarmingStatistic. |
| `ExtendedSowingMachine:onDelete()` | 84 | ✍ Supprime l'extension du HUD si elle a été créée. |
| `ExtendedSowingMachine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 93 | ✍ Une fois le véhicule suffisamment déplacé, échantillonne les cartes de sol et de passages de roues sur la première zone de travail et mémorise le taux de semis recommandé et la largeur de passage de roues (nil hors champ). Ajoute aussi l'extension du HUD quand le véhicule est actif pour les entrées. |
| `ExtendedSowingMachine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 141 | ✍ Serveur uniquement : quand une surface a été semée, calcule la consommation de semences d'après l'usage par m² du fruit, le facteur d'usage et les dégâts du véhicule, pour la surface ajustée et la surface normale, et l'ajoute aux statistiques usedSeeds et usedSeedsRegular. |
| `ExtendedSowingMachine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 169 | ✍ Client uniquement : quand le véhicule est actif pour les entrées, enregistre les actions de bascule du mode auto et de changement de taux de semis (priorité haute) et met à jour leur état ; signale que l'état d'attelage a changé. |
| `ExtendedSowingMachine:setSeedRateAutoMode(state: any, noEventSend: any)` | 191 | ✍ Définit ou bascule (state nil) le mode de taux de semis automatique, rafraîchit les textes d'action côté client et envoie ExtendedSowingMachineRateEvent sauf si noEventSend est défini. |
| `ExtendedSowingMachine:setManualSeedRate(seedRate: any, noEventSend: any)` | 210 | ✍ Borne le taux de semis manuel entre ExtendedSowingMachine.MIN_SEED_RATE et MAX_SEED_RATE, le mémorise s'il change et envoie ExtendedSowingMachineRateEvent sauf si noEventSend est défini. |
| `ExtendedSowingMachine:onTramlinesChanged()` | 222 | ✍ Force le prochain onUpdate à rééchantillonner les données du sol en mettant le compteur de distance parcourue à l'infini. |
| `ExtendedSowingMachine:processSowingMachineArea(superFunc: any, workArea: any, dt: any)` | 229 | ✍ Surcharge : après le semis de base, demande à la carte des taux de semis de mettre à jour la zone avec le taux auto ou manuel, et redimensionne la surface modifiée selon le rapport de consommation réelle de semences. Mémorise le dernier taux et son indice, renvoie les surfaces de base. |
| `ExtendedSowingMachine:processOverSeedingArea(superFunc: any, workArea: any, dt: any)` | 262 | ✍ Surcharge avec la même logique que processSowingMachineArea, appliquée aux zones de travail de sursemis. |
| `ExtendedSowingMachine.actionEventToggleAuto(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 295 | ✍ Callback d'entrée qui bascule le mode de taux de semis automatique. |
| `ExtendedSowingMachine.actionEventChangeSeedRate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, ...: any)` | 301 | ✍ Callback d'entrée qui modifie le taux de semis manuel d'un pas dans le sens du signe de la valeur d'entrée. |
| `ExtendedSowingMachine.updateActionEventState(self: any)` | 308 | ✍ Définit le texte de l'action de mode auto selon le mode courant et n'active l'action de changement de taux de semis que lorsque le mode auto est désactivé. |
