# economy/Farmland.lua

*[English version](../../../scripts/economy/Farmland.md)*

Source: `dataS/scripts/economy/Farmland.lua` — FS25 1.25.1.0

✍ Objet de données pour une parcelle achetable : id, nom, surface, prix, PNJ, ferme propriétaire et hotspot de carte. Chargé depuis le XML des parcelles de la carte par FarmlandManager. updatePrice est appelée ici mais n'est pas définie dans ce fichier.

- **Farmland** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Farmland.new(customMt: any) → table` | 29 | ✍ Constructeur. Démarre sans propriétaire, sans position d'indicateur, sans champ et sans boîte englobante. |
| `Farmland:load(xmlFile: XMLFile, key: string) → boolean` | 46 | ✍ Lit une parcelle depuis le XML (#id, #indicatorPosition, #name, #areaInHa par défaut 2.5, #price ou #priceScale, #npcName, #showOnFarmlandsScreen, #defaultFarmProperty). Renvoie false avec une erreur XML si l'id est absent ou vaut 0. |
| `Farmland:delete()` | 88 | ✍ Retire et supprime le hotspot de carte de cette parcelle, s'il existe. |
| `Farmland:setIndicatorPosition(xWorldPos: number, zWorldPos: number)` | 113 | ✍ Mémorise la position monde X/Z de l'indicateur de la parcelle et y déplace le hotspot de carte s'il existe. |
| `Farmland:setArea(areaInHa: number)` | 167 | ✍ Définit la surface en hectares et recalcule le prix, sauf si la parcelle a un prix fixe. |
