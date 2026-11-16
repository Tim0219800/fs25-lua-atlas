# vehicles/specializations/SupportVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/SupportVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/SupportVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation des outils qui font apparaître un « véhicule de support » auxiliaire (par exemple un chariot de transport) au dételage et le suppriment à l'attelage. Elle exige AttacherJoints et Mountable. Le serveur charge le véhicule de support depuis la boutique via VehicleLoadingData, y attelle l'outil et le suit. Clés XML sous vehicle.supportVehicle (fichier, index d'attaches, décalages, configurations).

- **SupportVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SupportVehicle.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie true uniquement si le type de véhicule possède AttacherJoints et Mountable. |
| `SupportVehicle.initSpecialization()` | 21 | ✍ Enregistre le schéma XML : fichier du véhicule de support, index des attaches, décalage au terrain (0,2), décalage d'apparition (0,75) et liste de paires nom/id de configuration. |
| `SupportVehicle.registerFunctions(vehicleType: any)` | 39 | ✍ Enregistre addSupportVehicle, enableSupportVehicle et removeSupportVehicle sur le type de véhicule. |
| `SupportVehicle.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Surcharge getAllowMultipleAttachments, resolveMultipleAttachments, getShowAttachableMapHotspot, getIsReadyToFinishDetachProcess et startDetachProcess. |
| `SupportVehicle.registerEventListeners(vehicleType: any)` | 57 | ✍ S'abonne à onLoad, onDelete, onUpdate et onPostDetach. |
| `SupportVehicle:onLoad(savegame: any)` | 66 | ✍ Lit décalages et index d'attaches, résout l'article de boutique du véhicule de support (avertit s'il manque), précalcule quatre coins d'empreinte pour les hauteurs et lit les paires de configuration. Retire les écouteurs delete/update/post-detach sur les clients ou sans article de boutique. |
| `SupportVehicle:onDelete()` | 128 | ✍ Supprime le véhicule de support sauf si le véhicule est en cours de reconfiguration. |
| `SupportVehicle:onPostDetach(attacherVehicle: table, implement: table)` | 138 | ✍ Après le dételage, active le véhicule de support en attente en y attelant l'outil. |
| `SupportVehicle:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 144 | ✍ À la première mise à jour (hors rechargement des véhicules) : fait apparaître un véhicule de support si l'outil n'est pas attelé, ou adopte l'attelage actuel s'il correspond au fichier de config, avec masse des composants réduite. S'exécute une seule fois. |
| `SupportVehicle:addSupportVehicle(isDetach: any)` | 167 | ✍ Charge de façon asynchrone le véhicule de support au niveau de l'attache d'entrée (décalé du décalage d'apparition au dételage), posé à la hauteur du terrain plus un décalage. Sans effet si un véhicule existe ou se charge déjà. |
| `SupportVehicle:supportVehicleLoaded(vehicles: any, vehicleLoadState: any, asyncCallbackArguments: any)` | 199 | ✍ Callback de chargement : mémorise le véhicule chargé et l'active sauf si le chargement vient d'un dételage. Si le véhicule propriétaire a été supprimé entre-temps, supprime les véhicules chargés. Réinitialise l'indicateur de chargement. |
| `SupportVehicle:enableSupportVehicle()` | 222 | ✍ Positionne le véhicule de support chargé et cet outil à partir des décalages d'attaches, puis y attelle l'outil et le sélectionne. Réduit la masse des composants. Supprime le véhicule de support si les attaches requises manquent. |
| `SupportVehicle:removeSupportVehicle()` | 282 | ✍ Supprime le véhicule de support s'il existe encore, efface la référence et, sur le serveur, rétablit la masse normale des composants. |
| `SupportVehicle:getAllowMultipleAttachments(superFunc: any)` | 296 | ✍ Surcharge renvoyant true quand un fichier de véhicule de support est configuré, pour que le dialogue d'attelage reste affichable pendant l'attelage. |
| `SupportVehicle:resolveMultipleAttachments(superFunc: any)` | 302 | ✍ Surcharge : sur le serveur, supprime d'abord le véhicule de support, puis appelle le parent. |
| `SupportVehicle:getShowAttachableMapHotspot(superFunc: any)` | 312 | ✍ Surcharge : avec un véhicule de support, n'affiche le point d'intérêt que si ce véhicule n'a lui-même aucun véhicule attelant ; sinon utilise le parent. |
| `SupportVehicle:getIsReadyToFinishDetachProcess(superFunc: any)` | 322 | ✍ Surcharge : le dételage ne peut se terminer que si le parent l'autorise et que le véhicule de support n'est pas en chargement ou est déjà chargé. |
| `SupportVehicle:startDetachProcess(superFunc: any, noEventSend: any)` | 329 | ✍ Surcharge : sauf si le véhicule est en cours de suppression, demande l'apparition d'un véhicule de support pour le dételage, puis appelle le parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addSupportVehicle` | 40 |
| registerFunction | `enableSupportVehicle` | 41 |
| registerFunction | `removeSupportVehicle` | 42 |
| registerOverwrittenFunction | `getAllowMultipleAttachments` | 48 |
| registerOverwrittenFunction | `resolveMultipleAttachments` | 49 |
| registerOverwrittenFunction | `getShowAttachableMapHotspot` | 50 |
| registerOverwrittenFunction | `getIsReadyToFinishDetachProcess` | 51 |
| registerOverwrittenFunction | `startDetachProcess` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onDelete` | 59 |
| registerEventListener | `onUpdate` | 60 |
| registerEventListener | `onPostDetach` | 61 |
