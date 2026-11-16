# vehicles/specializations/VineCutter.lua

*[English version](../../../../scripts/vehicles/specializations/VineCutter.md)*

Source: `dataS/scripts/vehicles/specializations/VineCutter.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils de coupe de vigne (récolte de raisin). Elle dépend d'une spécialisation de détection de vigne (`VineDetector`) fournissant `raycastCallbackVineDetection`, ajoute le type de configuration `vineCutter` et lit le type de fruit d'entrée et un convertisseur facultatif, d'où elle déduit le type de remplissage de sortie et le facteur de conversion. Seuls onLoad et onDraw ont un corps dans ce fichier ; les autres fonctions enregistrées n'y sont pas définies dans le dump (NON VÉRIFIÉ).

- **VineCutter** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VineCutter.initSpecialization()` | 16 | ✍ Ajoute le type de configuration `vineCutter` et enregistre les chemins XML `fruitType` et `fruitTypeConverter`, au niveau de base et par configuration. |
| `VineCutter.prerequisitesPresent(specializations: any)` | 33 | ✍ Renvoie toujours true : aucun prérequis (la dépendance à la détection de vigne est vérifiée au chargement). |
| `VineCutter.registerFunctions(vehicleType: any)` | 39 | ✍ Enregistre `getCombine` et `harvestCallback` sur le type de véhicule. Leurs implémentations ne sont pas dans ce fichier (NON VÉRIFIÉ). |
| `VineCutter.registerOverwrittenFunctions(vehicleType: any)` | 46 | ✍ Enregistre des surcharges pour doCheckSpeedLimit, getCanStartVineDetection, getIsValidVinePlaceable, handleVinePlaceable, clearCurrentVinePlaceable et getAIImplementUseVineSegment. Les corps ne sont pas dans ce fichier (NON VÉRIFIÉ). |
| `VineCutter.registerEventListeners(vehicleType: any)` | 57 | ✍ S'abonne à onLoad, onPostLoad, onDraw et onTurnedOff. Seuls onLoad et onDraw sont définis dans ce fichier. |
| `VineCutter:onLoad(savegame: any)` | 66 | ✍ Avertit et s'arrête si `raycastCallbackVineDetection` n'existe pas. Sinon choisit le type de fruit d'après la configuration ou le XML de base (`FruitType.GRAPE` par défaut), charge un convertisseur facultatif et fixe le type de remplissage de sortie et le facteur de conversion (1 sans convertisseur). |
| `VineCutter:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 128 | ✍ Affiche l'avertissement clignotant d'absence d'accès au terrain tant que le drapeau `showFarmlandNotOwnedWarning` est actif. À noter : si onLoad s'est arrêté tôt, le champ n'existe pas (nil) ; le test du drapeau reste sans effet (déduit du code). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getCombine` | 40 |
| registerFunction | `harvestCallback` | 41 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 47 |
| registerOverwrittenFunction | `getCanStartVineDetection` | 48 |
| registerOverwrittenFunction | `getIsValidVinePlaceable` | 49 |
| registerOverwrittenFunction | `handleVinePlaceable` | 50 |
| registerOverwrittenFunction | `clearCurrentVinePlaceable` | 51 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onPostLoad` | 59 |
| registerEventListener | `onDraw` | 60 |
| registerEventListener | `onTurnedOff` | 61 |
