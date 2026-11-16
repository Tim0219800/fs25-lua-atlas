# placeables/specializations/PlaceableRiceFieldActivatable.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableRiceFieldActivatable.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableRiceFieldActivatable.lua` — FS25 1.25.1.0

✍ Classe utilitaire (pas une spécialisation) qui permet au joueur local d'interagir avec une rizière d'un PlaceableRiceField. Elle suit l'interface d'activatable (getIsActivatable, getDistance, run) et ouvre RiceFieldDialog pour choisir un niveau d'eau cible. Objet d'interface côté client.

- **PlaceableRiceFieldActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldActivatable.new(riceFieldPlaceable: any)` | 15 | ✍ Crée l'activatable pour un placeable de rizière, sans champ sélectionné et avec le texte d'interaction générique. |
| `PlaceableRiceFieldActivatable:getIsActivatable()` | 28 | ✍ Vrai seulement si un indice de champ est défini, que le champ existe et que la ferme du joueur local peut accéder au terrain du déclencheur du champ. |
| `PlaceableRiceFieldActivatable:setRiceFieldIndex(fieldIndex: any)` | 42 | ✍ Définit le champ du placeable ciblé par cet activatable (nil l'efface). |
| `PlaceableRiceFieldActivatable:getDistance(posX: any, posY: any, posZ: any)` | 48 | ✍ Retourne la distance horizontale (XZ) entre la position donnée et le déclencheur joueur du champ, ou math.huge si aucun champ n'est sélectionné ou s'il n'a pas de nœud de déclencheur. |
| `PlaceableRiceFieldActivatable:run()` | 63 | ✍ Ouvre RiceFieldDialog ; si validé, règle la cible de hauteur d'eau du champ au niveau d'eau max multiplié par le pourcentage choisi via setWaterHeightTarget. |
