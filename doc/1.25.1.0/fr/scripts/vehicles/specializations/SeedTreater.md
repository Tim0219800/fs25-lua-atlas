# vehicles/specializations/SeedTreater.lua

*[English version](../../../../scripts/vehicles/specializations/SeedTreater.md)*

Source: `dataS/scripts/vehicles/specializations/SeedTreater.lua` — FS25 1.25.1.0

✍ Spécialisation pour les machines de traitement de semences. Elle exige Dischargeable et FillUnit : une unité de remplissage dédiée contient le liquide de traitement (LIQUIDSEEDTREATMENT), consommé proportionnellement aux semences déchargées par un nœud de déchargement choisi, et la vitesse de décharge est réduite tant que le traitement est actif. Côté serveur, elle déclenche aussi le remplissage depuis les triggers proches quand le réservoir de liquide a de la place.

- **SeedTreater** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SeedTreater.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Retourne vrai uniquement si le type de véhicule possède Dischargeable et FillUnit. |
| `SeedTreater.initSpecialization()` | 23 | ✍ Déclare les attributs XML `vehicle.seedTreater` : index de l'unité de liquide, index du nœud de décharge, usage par litre (0,1 par défaut), seuil de remplissage depuis un trigger (5 par défaut) et facteur de vitesse de traitement (0,1 par défaut). |
| `SeedTreater.registerFunctions(vehicleType: any)` | 38 | ✍ N'enregistre aucune nouvelle fonction (corps vide). |
| `SeedTreater.registerOverwrittenFunctions(vehicleType: any)` | 43 | ✍ Surcharge `discharge`, `getDischargeFillType` et `getDischargeNodeEmptyFactor`. |
| `SeedTreater.registerEventListeners(vehicleType: any)` | 51 | ✍ S'abonne à onLoad et onUpdate. |
| `SeedTreater:onLoad(savegame: any)` | 58 | ✍ Lit les valeurs XML seedTreater dans la spec : index d'unité de remplissage, index du nœud de décharge, usage par litre, seuil de trigger et facteur de vitesse de traitement. |
| `SeedTreater:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 70 | ✍ Serveur uniquement : si l'unité de liquide a plus de 5 litres de capacité libre et qu'un trigger de remplissage proche propose du LIQUIDSEEDTREATMENT et est activable, lance le remplissage ; l'arrête quand elle est presque pleine pendant une décharge. À noter : le 5 est codé en dur, `fillFromTriggerThreshold` est lu mais non utilisé ici. |
| `SeedTreater:discharge(superFunc: any, dischargeNode: any, emptyLiters: any)` | 95 | ✍ Appelle la décharge parente puis, pour le nœud de décharge configuré et seulement si son fillTypeConverter convertit le type de remplissage actuel, retire du liquide de traitement (litres déchargés fois usagePerLiter) de l'unité de liquide. Retourne inchangées les trois valeurs du parent. |
| `SeedTreater:getDischargeFillType(superFunc: any, dischargeNode: any)` | 117 | ✍ Quand l'unité de liquide est vide, retourne le type de l'unité de remplissage du nœud de décharge avec une seconde valeur 1, sans passer par le parent ; sinon délègue au parent. |
| `SeedTreater:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 128 | ✍ Retourne le facteur de vidage du parent multiplié par `treatmentSpeedFactor` quand du liquide de traitement est disponible et que le type de remplissage est convertible ; sinon retourne la valeur du parent inchangée. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `discharge` | 44 |
| registerOverwrittenFunction | `getDischargeFillType` | 45 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 46 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
