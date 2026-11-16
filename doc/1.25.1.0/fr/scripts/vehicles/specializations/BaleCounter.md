# vehicles/specializations/BaleCounter.lua

*[English version](../../../../scripts/vehicles/specializations/BaleCounter.md)*

Source: `dataS/scripts/vehicles/specializations/BaleCounter.lua` — FS25 1.25.1.0

✍ Spécialisation qui compte les balles éjectées par une presse : un compteur de session remis à zéro à la demande et un compteur à vie, tous deux sauvegardés avec le véhicule et envoyés aux clients qui rejoignent. Elle exige la spécialisation Baler, surcharge `dropBale`, expose les deux compteurs comme valeurs de tableau de bord et les affiche via une extension de HUD. Une commande de remise à zéro existe dans le véhicule et sur un déclencheur externe, et la remise à zéro passe par BaleCounterResetEvent. Les gestionnaires onDelete et onDraw sont enregistrés mais n'ont pas de corps dans le dump du SDK : NON VÉRIFIÉ.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleCounter.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Renvoie true seulement si le type de véhicule contient la spécialisation Baler. |
| `BaleCounter.initSpecialization()` | 29 | ✍ Enregistre les chemins XML de tableau de bord pour `vehicle.baleCounter.dashboards` (sessionCounter, lifetimeCounter) et les deux compteurs de sauvegarde. |
| `BaleCounter.registerFunctions(vehicleType: any)` | 44 | ✍ Enregistre la fonction de véhicule `doBaleCounterReset`. |
| `BaleCounter.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Surcharge `dropBale` pour que chaque balle éjectée incrémente les compteurs. |
| `BaleCounter.registerEventListeners(vehicleType: any)` | 56 | ✍ S'abonne à onLoad, onDelete, onDraw, onRegisterDashboardValueTypes, onReadStream, onWriteStream, onRegisterActionEvents et onRegisterExternalActionEvents. |
| `BaleCounter:onLoad(savegame: any)` | 69 | ✍ Met les deux compteurs à zéro, les restaure depuis une sauvegarde non réinitialisée et crée la BaleCounterHUDExtension du véhicule. |
| `BaleCounter:onRegisterDashboardValueTypes()` | 100 | ✍ Enregistre les types de valeur de tableau de bord `baleCounter.sessionCounter` et `baleCounter.lifetimeCounter`, liés aux champs du spec et non interrogés (mis à jour explicitement). |
| `BaleCounter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 116 | ✍ Sauvegarde les compteurs de session et à vie comme attributs de l'entrée `baleCounter` du véhicule. |
| `BaleCounter:onReadStream(streamId: integer, connection: Connection)` | 126 | ✍ Connexion d'un client : lit les deux compteurs dans le flux avec `BaleCounter.SEND_NUM_BITS` bits chacun. |
| `BaleCounter:onWriteStream(streamId: integer, connection: Connection)` | 136 | ✍ Côté serveur lors de la connexion d'un client : écrit les deux compteurs dans le flux avec `BaleCounter.SEND_NUM_BITS` bits chacun. |
| `BaleCounter:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 144 | ✍ Sur les clients, enregistre l'entrée alimentée BALE_COUNTER_RESET avec une priorité de texte haute quand le véhicule est actif pour la saisie, sans tenir compte de la sélection. |
| `BaleCounter:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 158 | ✍ Quand un déclencheur externe se nomme `baleCounterReset`, enregistre pour lui les callbacks d'événement d'action externe. |
| `BaleCounter.actionEventResetCounter(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 166 | ✍ Callback d'entrée pour la remise à zéro dans le véhicule : appelle `doBaleCounterReset`. |
| `BaleCounter.externalActionEventRegister(data: any, vehicle: any)` | 172 | ✍ Enregistre l'entrée BALE_COUNTER_RESET pour un déclencheur externe, qui remet à zéro le compteur du véhicule donné, avec une priorité de texte haute. |
| `BaleCounter.externalActionEventUpdate(data: any, vehicle: any)` | 184 | ✍ Hook de mise à jour vide pour l'événement d'action externe ; ne fait rien. |
| `BaleCounter:doBaleCounterReset(noEventSend: any)` | 189 | ✍ Met le compteur de session à 0 (le compteur à vie est conservé) et envoie BaleCounterResetEvent sauf si `noEventSend` est défini. La valeur du tableau de bord n'est pas rafraîchie ici. |
| `BaleCounter:dropBale(superFunc: any, baleIndex: any)` | 199 | ✍ Appelle le `dropBale` parent, puis ajoute 1 aux deux compteurs et rafraîchit les deux valeurs de tableau de bord si les tableaux de bord sont disponibles. Aucun test serveur dans cette fonction. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `doBaleCounterReset` | 45 |
| registerOverwrittenFunction | `dropBale` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onDelete` | 58 |
| registerEventListener | `onDraw` | 59 |
| registerEventListener | `onRegisterDashboardValueTypes` | 60 |
| registerEventListener | `onReadStream` | 61 |
| registerEventListener | `onWriteStream` | 62 |
| registerEventListener | `onRegisterActionEvents` | 63 |
| registerEventListener | `onRegisterExternalActionEvents` | 64 |
