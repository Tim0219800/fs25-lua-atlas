# placeables/specializations/activatables/VehicleBuyingStationActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/VehicleBuyingStationActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/VehicleBuyingStationActivatable.lua` — FS25 1.25.1.0

✍ Objet activable pour un placeable de station d'achat de véhicules. Il reçoit un texte d'invite et un callback, est disponible pour les joueurs qui peuvent accéder au placeable, et son exécution appelle simplement le callback (la boîte de dialogue de boutique y est ouverte).

- **VehicleBuyingStationActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleBuyingStationActivatable.new(placeable: any, callbackFunc: any, text: any)` | 15 | ✍ Crée l'activable pour un placeable avec une fonction de callback et un texte d'invite. |
| `VehicleBuyingStationActivatable:getIsActivatable()` | 27 | ✍ Renvoie si le joueur local peut accéder au placeable selon le gestionnaire d'accès. |
| `VehicleBuyingStationActivatable:run()` | 33 | ✍ Appelle le callback mémorisé sans argument. |
