# vehicles/specializations/Honk.lua

*[English version](../../../../scripts/vehicles/specializations/Honk.md)*

Source: `dataS/scripts/vehicles/specializations/Honk.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui ajoute un klaxon aux véhicules conduisibles (nécessite Drivable). Elle charge un son depuis vehicle.honk, lie l'action d'entrée HONK tant que le véhicule est actif pour les entrées, et joue ou arrête le son tant que la touche est maintenue. Les changements d'état du klaxon sont diffusés via HonkEvent pour que les autres clients l'entendent.

- **Honk** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Honk.prerequisitesPresent(specializations: any)` | 18 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation Drivable. |
| `Honk.initSpecialization()` | 24 | ✍ Enregistre les chemins XML d'échantillon sonore sous vehicle.honk (clé « sound »). |
| `Honk.registerFunctions(vehicleType: any)` | 33 | ✍ Enregistre getIsHonkAvailable, setHonkInput et playHonk sur le type de véhicule. |
| `Honk.registerEventListeners(vehicleType: any)` | 41 | ✍ Abonne à onLoad, onDelete, onUpdate, onLeaveVehicle et onRegisterActionEvents. |
| `Honk:onLoad(savegame: any)` | 51 | ✍ Réinitialise les indicateurs d'entrée et de lecture et, côté client, charge l'échantillon du klaxon. Sur un serveur dédié, retire l'écouteur onUpdate. |
| `Honk:onDelete()` | 67 | ✍ Supprime l'échantillon sonore du klaxon. |
| `Honk:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 74 | ✍ Client uniquement, pour le véhicule contrôlé : démarre le klaxon tant que l'entrée est pressée et que l'échantillon ne joue pas déjà, l'arrête au relâchement et efface l'indicateur d'appui à chaque frame. |
| `Honk:onLeaveVehicle()` | 92 | ✍ Arrête le klaxon quand le joueur quitte le véhicule, sans envoyer d'événement réseau. |
| `Honk:getIsHonkAvailable()` | 98 | ✍ Renvoie true par défaut ; peut être surchargée par d'autres spécialisations pour désactiver le klaxon. |
| `Honk:setHonkInput()` | 104 | ✍ Marque l'entrée du klaxon comme pressée pour la frame courante. |
| `Honk:playHonk(isPlaying: any, noEventSend: any)` | 111 | ✍ Envoie HonkEvent, mémorise l'état de lecture, puis joue l'échantillon côté client si le véhicule est actif, ou l'arrête. Passer noEventSend évite de rediffuser. |
| `Honk:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 132 | ✍ Client uniquement : reconstruit les événements d'action et, si le véhicule est actif pour les entrées et possède un échantillon de klaxon, lie InputAction.HONK avec un texte d'aide de faible priorité. |
| `Honk.actionEventHonk(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 148 | ✍ Callback d'entrée de l'action HONK : appelle setHonkInput sur le véhicule. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsHonkAvailable` | 34 |
| registerFunction | `setHonkInput` | 35 |
| registerFunction | `playHonk` | 36 |
| registerEventListener | `onLoad` | 42 |
| registerEventListener | `onDelete` | 43 |
| registerEventListener | `onUpdate` | 44 |
| registerEventListener | `onLeaveVehicle` | 45 |
| registerEventListener | `onRegisterActionEvents` | 46 |
