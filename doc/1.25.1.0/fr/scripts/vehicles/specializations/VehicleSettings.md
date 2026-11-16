# vehicles/specializations/VehicleSettings.lua

*[English version](../../../../scripts/vehicles/specializations/VehicleSettings.md)*

Source: `dataS/scripts/vehicles/specializations/VehicleSettings.lua` — FS25 1.25.1.0

✍ Spécialisation qui reflète sur un véhicule certains réglages de jeu côté client. D'autres spécialisations enregistrent un réglage par identifiant ; l'état est mis à jour quand le réglage du client change pendant qu'il contrôle le véhicule, et envoyé au serveur via `VehicleSettingsChangeEvent` pour que la logique serveur le lise avec `getVehicleSettingState`. Elle déclenche `onVehicleSettingChanged`. Aucun prérequis.

- **VehicleSettings** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSettings.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie toujours true : aucun prérequis. |
| `VehicleSettings.initSpecialization()` | 25 | ✍ Vide : n'enregistre rien dans le schéma XML. |
| `VehicleSettings.registerFunctions(vehicleType: any)` | 30 | ✍ Ajoute registerVehicleSetting, setVehicleSettingState, getVehicleSettingState et forceVehicleSettingsUpdate au type de véhicule. |
| `VehicleSettings.registerEvents(vehicleType: any)` | 39 | ✍ Enregistre l'événement `onVehicleSettingChanged`. |
| `VehicleSettings.registerEventListeners(vehicleType: any)` | 45 | ✍ S'abonne à onPreLoad, onUpdateTick, onStateChange et onPreAttach. À noter : onPreAttach est enregistré mais aucune fonction `VehicleSettings:onPreAttach` n'existe dans ce fichier. |
| `VehicleSettings:onPreLoad(savegame: table)` | 55 | ✍ Initialise la liste de réglages vide et le drapeau « sale » ; sur un serveur, retire l'écouteur onUpdateTick car seuls les clients envoient les réglages. |
| `VehicleSettings:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 71 | ✍ Client uniquement : si un réglage est « sale » et qu'il s'agit d'un client distant (sans serveur local), envoie un `VehicleSettingsChangeEvent` au serveur, puis efface le drapeau du véhicule (les drapeaux individuels restent). |
| `VehicleSettings:registerVehicleSetting(gameSettingId: string, isBool: boolean)` | 96 | ✍ Enregistre un réglage de véhicule lié à un identifiant de réglage de jeu et s'abonne au message de changement. Le rappel n'applique le nouvel état que lorsque le joueur local est actif dans ce véhicule. |
| `VehicleSettings:forceVehicleSettingsUpdate()` | 116 | ✍ Applique au véhicule la valeur courante de chaque réglage de jeu enregistré (sans événement par réglage) et les marque « sales » pour que le client les envoie au serveur. |
| `VehicleSettings:setVehicleSettingState(settingIndex: integer, state: any, noEventSend: boolean)` | 129 | ✍ Définit l'état d'un réglage par indice, le marque « sale » et déclenche `onVehicleSettingChanged`. Sauf `noEventSend`, un client distant envoie d'abord l'événement au serveur (avant que le nouvel état soit stocké). |
| `VehicleSettings:getVehicleSettingState(gameSettingId: integer) → any` | 151 | ✍ Renvoie l'état stocké pour l'identifiant de réglage donné, ou nil s'il n'est pas enregistré ou n'a pas encore d'état. |
| `VehicleSettings:onStateChange(state: any, vehicle: any, isControlling: any)` | 163 | ✍ Quand le joueur qui contrôle entre dans le véhicule (ENTER_VEHICLE), force la mise à jour de tous les réglages du véhicule depuis les réglages de jeu courants. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `registerVehicleSetting` | 31 |
| registerFunction | `setVehicleSettingState` | 32 |
| registerFunction | `getVehicleSettingState` | 33 |
| registerFunction | `forceVehicleSettingsUpdate` | 34 |
| registerEvent | `onVehicleSettingChanged` | 40 |
| registerEventListener | `onPreLoad` | 46 |
| registerEventListener | `onUpdateTick` | 47 |
| registerEventListener | `onStateChange` | 48 |
| registerEventListener | `onPreAttach` | 49 |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.109)
