# placeables/specializations/activatables/PalletBuyingStationActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/PalletBuyingStationActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/PalletBuyingStationActivatable.lua` — FS25 1.25.1.0

✍ Objet activable pour un placeable de station d'achat de palettes. Il est disponible pour les joueurs qui peuvent accéder au placeable, avec un texte fourni par l'appelant, et son exécution ouvre la boutique du placeable.

- **PalletBuyingStationActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletBuyingStationActivatable.new(placeable: any, text: any)` | 15 | ✍ Crée l'activable pour un placeable avec le texte d'invite donné. |
| `PalletBuyingStationActivatable:getIsActivatable()` | 26 | ✍ Renvoie si le joueur local peut accéder au placeable selon le gestionnaire d'accès. |
| `PalletBuyingStationActivatable:run()` | 32 | ✍ Appelle `openShop` sur le placeable. |
