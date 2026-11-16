# vehicles/specializations/FillTriggerVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/FillTriggerVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/FillTriggerVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui transforme un véhicule doté d'une unité de remplissage (remorques de carburant, lait, eau ou lisier par exemple) en source de remplissage : elle crée un FillTrigger sur un nœud du véhicule afin que d'autres véhicules puissent s'y remplir. Exige la spécialisation FillUnit. Configurée sous vehicle.fillTriggerVehicle dans le XML.

- **FillTriggerVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillTriggerVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true seulement si la spécialisation FillUnit est présente. |
| `FillTriggerVehicle.initSpecialization()` | 23 | ✍ Enregistre les clés XML triggerNode, fillUnitIndex (1 par défaut) et litersPerSecond (200 par défaut) sous vehicle.fillTriggerVehicle. |
| `FillTriggerVehicle.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Surcharge getDrawFirstFillText sur le type de véhicule. |
| `FillTriggerVehicle.registerEventListeners(vehicleType: any)` | 42 | ✍ S'abonne à onLoad, onDelete, onReadStream et onWriteStream. À noter : aucune fonction onReadStream n'est définie dans ce fichier, ce rappel ne pointe donc sur rien ici. |
| `FillTriggerVehicle:onLoad(savegame: table)` | 52 | ✍ Si un triggerNode est configuré, crée le FillTrigger avec l'indice d'unité de remplissage et le débit. Hors configuration en boutique, le serveur enregistre aussi un type d'argent (finance_purchaseFuel) sur le trigger. |
| `FillTriggerVehicle:onDelete()` | 72 | ✍ Supprime le fill trigger s'il existe. |
| `FillTriggerVehicle:onWriteStream(streamId: any, connection: any)` | 95 | ✍ Serveur vers client : écrit l'identifiant du type de changement d'argent du trigger sur 16 bits s'il existe. Aucune fonction de lecture correspondante n'est dans ce fichier, le côté client est donc NON VÉRIFIÉ. |
| `FillTriggerVehicle:getDrawFirstFillText(superFunc: any)` | 106 | ✍ Sur les clients, renvoie true quand l'unité de remplissage configurée est vide mais de capacité non nulle ; sinon délègue à l'implémentation parente. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getDrawFirstFillText` | 37 |
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onReadStream` | 45 |
| registerEventListener | `onWriteStream` | 46 |
