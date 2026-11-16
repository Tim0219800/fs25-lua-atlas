# placeables/specializations/PlaceableChargingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableChargingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableChargingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une borne de recharge de véhicules électriques, construite sur `PlaceableBuyingStation` (requis). Elle réutilise le déclencheur de chargement de la station d'achat pour détecter les véhicules en charge d'ELECTRICCHARGE, pilote un nœud et une lumière d'indicateur (couleur, clignotement) et affiche le temps de charge restant aux joueurs proches. Le dump ne contient pas de `registerEventListeners` pour elle : le branchement de `onLoad` et `onUpdate` est NON VÉRIFIÉ.

- **PlaceableChargingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableChargingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie true seulement si la spécialisation `PlaceableBuyingStation` est présente sur le type de placeable. |
| `PlaceableChargingStation.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `getIsCharging` et `getChargeState`. |
| `PlaceableChargingStation:onLoad(savegame: table)` | 58 | ✍ Lit les réglages de l'indicateur de charge (intensité 20, vitesse de clignotement 5, couleurs, rayon d'interaction 5 par défaut), initialise le shader et la lumière de l'indicateur, prend le déclencheur de chargement de la station d'achat et charge le son de remplissage, qui devient le son de chargement du déclencheur s'il n'en a pas. |
| `PlaceableChargingStation:getIsCharging()` | 102 | ✍ Renvoie si le déclencheur de chargement est en cours de chargement ; false s'il n'y a pas de déclencheur. |
| `PlaceableChargingStation:getChargeState()` | 113 | ✍ Renvoie le niveau et la capacité de l'unité de remplissage ELECTRICCHARGE du premier véhicule dans le déclencheur ; renvoie 0, 1 s'il n'y en a aucun. |
| `PlaceableChargingStation:onUpdate(dt: number)` | 134 | ✍ Mise à jour de type client : colore l'indicateur (couleur « pleine » au-dessus de 95 pour cent), active le clignotement pendant la charge et règle l'alpha de la lumière. Pendant la charge, affiche le temps restant et le pourcentage en texte HUD pour un joueur proche ou assis dans le véhicule en charge. Reste actif tant qu'un véhicule est présent. À noter : appelle `localPlayer:getCurrentVehicle()` dans une branche atteignable quand `g_localPlayer` est nil. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsCharging` | 25 |
| registerFunction | `getChargeState` | 26 |
