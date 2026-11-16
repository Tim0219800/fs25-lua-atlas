# placeables/specializations/activatables/FactoryActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/FactoryActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/FactoryActivatable.lua` — FS25 1.25.1.0

✍ Objet activable qui propose d'acheter une usine qui n'a pas encore de propriétaire. Le texte inclut le nom de l'usine et son exécution demande l'achat si l'usine est toujours sans propriétaire.

- **FactoryActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FactoryActivatable.new(factory: any)` | 15 | ✍ Crée l'activable pour une usine et construit le texte à partir de `action_buyOBJECT` et du nom de l'usine. |
| `FactoryActivatable:getIsActivatable()` | 26 | ✍ Renvoie true seulement tant que le propriétaire de l'usine est le marqueur sans propriétaire (`AccessHandler.EVERYONE`). |
| `FactoryActivatable:run()` | 33 | ✍ Si l'usine est toujours sans propriétaire, appelle son `buyRequest`. |
