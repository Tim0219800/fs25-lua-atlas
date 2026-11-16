# placeables/specializations/PlaceablePalletBuyingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceablePalletBuyingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceablePalletBuyingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une station d'achat de palettes : un trigger ouvre une boutique de palettes (une par type de remplissage configuré, prix issu de l'objet de magasin de la palette et du multiplicateur d'économie) et un PalletSpawner crée les palettes achetées. La station s'enregistre dans le système de stockage de la mission. Ce fichier ne déclare pas registerEventListeners, le branchement de onLoad/onDelete est donc NON VÉRIFIÉ ici ; PalletBuyingStationActivatable est défini ailleurs.

- **PlaceablePalletBuyingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceablePalletBuyingStation.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceablePalletBuyingStation:onLoad(savegame: table)` | 52 | ✍ Lit le nœud de trigger (erreur et retour anticipé s'il manque), le pallet spawner optionnel et les entrées fillType pour construire la liste de palettes avec prix = prix du magasin x priceScale x multiplicateur d'économie. Crée l'activatable et enregistre la station dans le système de stockage ; renvoie true en cas de succès. Le callback onActivationTriggerCallback n'est pas défini dans ce fichier. |
| `PlaceablePalletBuyingStation:onDelete()` | 115 | ✍ Désenregistre la station du système de stockage, supprime le pallet spawner s'il existe et retire le trigger. |
