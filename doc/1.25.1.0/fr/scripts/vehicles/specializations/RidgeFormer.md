# vehicles/specializations/RidgeFormer.lua

*[English version](../../../../scripts/vehicles/specializations/RidgeFormer.md)*

Source: `dataS/scripts/vehicles/specializations/RidgeFormer.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les outils de buttage (type de zone de travail ridgeFormer). En déplacement, elle efface les traces de pneus et forme des buttes dans la density map, alignées sur le multiple de 90 degrés le plus proche, et joue un son de travail. Elle ajuste la saleté et l'usure (avec un facteur lié aux pierres) et maintient la limite de vitesse en travail. Aucun prérequis ; elle ajoute aussi des exigences de sol pour l'IA si disponibles.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RidgeFormer.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Retourne toujours true : aucune spécialisation prérequise. |
| `RidgeFormer.initSpecialization()` | 32 | ✍ Enregistre le type de zone de travail ridgeFormer auprès du gestionnaire de types et déclare les chemins XML du son de travail sous vehicle.ridgeFormer.sounds. |
| `RidgeFormer.registerFunctions(vehicleType: any)` | 45 | ✍ Enregistre processRidgeFormerArea sur le type de véhicule. |
| `RidgeFormer.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Surcharge doCheckSpeedLimit, getDirtMultiplier et getWearMultiplier sur le type de véhicule. |
| `RidgeFormer.registerEventListeners(vehicleType: any)` | 59 | ✍ S'abonne à onLoad, onDelete, onDeactivate, onStartWorkAreaProcessing et onEndWorkAreaProcessing. |
| `RidgeFormer:onLoad(savegame: any)` | 69 | ✍ Initialise l'état des pierres et récupère les multiplicateurs d'usure liés aux pierres pour le type SOWINGMACHINE depuis le système de pierres. Ajoute les exigences de sol IA si supportées et, côté client, charge le son de travail. |
| `RidgeFormer:onDelete()` | 88 | ✍ Supprime les échantillons sonores chargés. |
| `RidgeFormer:onDeactivate()` | 95 | ✍ Côté client, arrête les échantillons sonores et réinitialise l'indicateur de lecture du son de travail. |
| `RidgeFormer:onStartWorkAreaProcessing(dt: any)` | 105 | ✍ Réinitialise l'indicateur isWorking avant le traitement des zones de travail de cette frame. |
| `RidgeFormer:onEndWorkAreaProcessing(dt: any)` | 112 | ✍ Côté client, démarre le son de travail quand isWorking est devenu vrai et l'arrête sinon, en suivant l'état de lecture. |
| `RidgeFormer:processRidgeFormerArea(workArea: any, dt: any)` | 132 | ✍ Callback de zone de travail. Le travail suppose une vitesse supérieure à 0,5. Efface les traces de pneus dans la zone, puis (sur le serveur, ou client assez proche) forme les buttes dans la density map avec un cap arrondi à 90 degrés, mémorise l'état des pierres et retourne la surface modifiée et totale. |
| `RidgeFormer:doCheckSpeedLimit(superFunc: any)` | 169 | ✍ Retourne le résultat parent, ou true quand la chaîne d'outils est abaissée et que le butteur travaille. |
| `RidgeFormer:getDirtMultiplier(superFunc: any)` | 176 | ✍ Ajoute la saleté de travail, proportionnelle à la vitesse sur la limite, au multiplicateur parent, seulement en marche avant et en travail. |
| `RidgeFormer:getWearMultiplier(superFunc: any) → number` | 190 | ✍ Ajoute l'usure de travail, proportionnelle à la vitesse sur la limite et au multiplicateur de pierres du dernier état, au multiplicateur parent, seulement en marche avant et en travail. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processRidgeFormerArea` | 46 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 52 |
| registerOverwrittenFunction | `getDirtMultiplier` | 53 |
| registerOverwrittenFunction | `getWearMultiplier` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onDeactivate` | 62 |
| registerEventListener | `onStartWorkAreaProcessing` | 63 |
| registerEventListener | `onEndWorkAreaProcessing` | 64 |
