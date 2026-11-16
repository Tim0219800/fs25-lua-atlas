# vehicles/specializations/IKChains.lua

*[English version](../../../../scripts/vehicles/specializations/IKChains.md)*

Source: `dataS/scripts/vehicles/specializations/IKChains.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui charge des chaînes de cinématique inverse depuis vehicle.ikChains et les met à jour à chaque frame via l'utilitaire IKUtil. Sert à positionner des pièces articulées comme des bras ou des flexibles entre des cibles. Le calcul lui-même est dans IKUtil, non couvert ici (NON VÉRIFIÉ).

- **IKChains** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IKChains.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucun prérequis envers d'autres spécialisations. |
| `IKChains.initSpecialization()` | 21 | ✍ Enregistre via IKUtil les chemins XML d'une chaîne IK sous vehicle.ikChains.ikChain. |
| `IKChains.registerEventListeners(vehicleType: any)` | 30 | ✍ Abonne la spécialisation à onLoad et onUpdate. |
| `IKChains:onLoad(savegame: any)` | 37 | ✍ Charge chaque entrée ikChain avec IKUtil dans la liste de chaînes de la spécialisation. Si aucune n'est chargée, retire l'écouteur onUpdate. |
| `IKChains:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 58 | ✍ À chaque frame, demande à IKUtil de mettre à jour toutes les chaînes IK chargées du véhicule. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onUpdate` | 32 |
