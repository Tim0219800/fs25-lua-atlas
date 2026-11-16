# placeables/specializations/PlaceableHandToolHolders.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableHandToolHolders.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableHandToolHolders.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les placeables qui contiennent des supports d'outils à main (râteliers où l'on accroche les outils). Dans ce dump du SDK, seuls un squelette d'enregistrement d'événements et une surcharge de setName sont présents ; le chargement des supports eux-mêmes est NON VÉRIFIÉ.

- **PlaceableHandToolHolders** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHandToolHolders.registerEvents(vehicleType: any)` | 28 | ✍ Corps vide dans ce dump : n'enregistre aucun événement. Les événements prévus éventuels sont NON VÉRIFIÉS. |
| `PlaceableHandToolHolders:setName(superFunc: any, name: any, noEventSend: any)` | 183 | ✍ Surcharge setName : appelle le parent, puis transmet le nouveau nom à chaque support d'outil à main de spec.handToolHolders pour que leur affichage suive le placeable. |
