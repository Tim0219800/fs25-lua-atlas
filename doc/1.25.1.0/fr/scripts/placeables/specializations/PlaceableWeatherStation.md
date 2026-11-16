# placeables/specializations/PlaceableWeatherStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableWeatherStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWeatherStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une station météo. À la finalisation elle s'enregistre auprès du système de placeables (`addWeatherStation`) et s'en retire à la suppression ; côté client elle joue un son d'ambiance optionnel sous `placeable.weatherStation.sounds`. L'usage des stations enregistrées par le système de placeables n'est pas visible ici (NON VÉRIFIÉ).

- **PlaceableWeatherStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWeatherStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableWeatherStation.registerEventListeners(placeableType: any)` | 24 | ✍ S'abonne à onLoad, onDelete et onFinalizePlacement. |
| `PlaceableWeatherStation.registerXMLPaths(schema: any, basePath: any)` | 32 | ✍ Déclare les chemins XML du son nommé `idle` sous `.weatherStation.sounds`. |
| `PlaceableWeatherStation:onLoad(savegame: table)` | 43 | ✍ Client seulement : charge l'échantillon sonore `idle` depuis le XML dans le groupe audio d'environnement. |
| `PlaceableWeatherStation:onDelete()` | 54 | ✍ Retire cette station météo du système de placeables et, côté client, supprime l'échantillon sonore. |
| `PlaceableWeatherStation:onFinalizePlacement()` | 65 | ✍ Ajoute cette station météo au système de placeables et, côté client, lance le son d'ambiance s'il est chargé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
