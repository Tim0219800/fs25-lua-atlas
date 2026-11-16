# placeables/specializations/boatyard/BoatyardActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/boatyard/BoatyardActivatable.md)*

Source: `dataS/scripts/placeables/specializations/boatyard/BoatyardActivatable.lua` — FS25 1.25.1.0

✍ Objet activable qui propose d'acheter un chantier naval qui n'a pas encore de propriétaire. Le texte inclut le nom du chantier et son exécution demande l'achat s'il est toujours sans propriétaire.

- **BoatyardActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BoatyardActivatable.new(boatyard: any)` | 15 | ✍ Crée l'activable pour un chantier naval et construit le texte à partir de `action_buyOBJECT` et du nom du chantier. |
| `BoatyardActivatable:getIsActivatable()` | 26 | ✍ Renvoie true seulement tant que le propriétaire du chantier est le marqueur sans propriétaire (`AccessHandler.EVERYONE`). |
| `BoatyardActivatable:run()` | 33 | ✍ Si le chantier est toujours sans propriétaire, appelle son `buyRequest`. |
