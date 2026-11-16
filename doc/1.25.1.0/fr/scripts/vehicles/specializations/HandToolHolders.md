# vehicles/specializations/HandToolHolders.lua

*[English version](../../../../scripts/vehicles/specializations/HandToolHolders.md)*

Source: `dataS/scripts/vehicles/specializations/HandToolHolders.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui donne à un véhicule un ou plusieurs supports d'outils à main, créés via la classe HandToolHolder depuis le XML du véhicule (éventuellement par configuration). Elle nomme chaque support d'après le véhicule et la marque, sauvegarde et restaure leur contenu, les synchronise aux clients qui rejoignent et propage la ferme propriétaire. Elle déclenche les événements onHandToolStoredInHolder et onHandToolTakenFromHolder. Aucune prerequisitesPresent n'est déclarée dans ce fichier.

- **HandToolHolders** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHolders.registerEvents(vehicleType: any)` | 35 | ✍ Enregistre les événements de véhicule onHandToolStoredInHolder et onHandToolTakenFromHolder. |
| `HandToolHolders.registerFunctions(vehicleType: any)` | 42 | ✍ Enregistre onHandToolHolderFinished comme fonction de véhicule, utilisée comme callback de fin de chargement de chaque support. |
| `HandToolHolders.registerOverwrittenFunctions(vehicleType: any)` | 48 | ✍ Surcharge setOwnerFarmId pour propager le propriétaire aux supports. |
| `HandToolHolders.registerEventListeners(vehicleType: any)` | 54 | ✍ Abonne aux événements onLoad, onDelete, saveToXMLFile, onWriteStream, onReadStream et onRegistered. À noter : aucune fonction onRegistered n'est définie dans ce fichier, cet écouteur est donc NON VÉRIFIÉ. |
| `HandToolHolders:onLoad(savegame: any)` | 65 | ✍ Choisit la configuration des supports (repli sur le nœud vehicle.handToolHolders), construit un nom d'affichage à partir de la marque et du véhicule et lance le chargement asynchrone de chaque handToolHolder avec une tâche de chargement. |
| `HandToolHolders:onHandToolHolderFinished(handToolHolder: any, args: any)` | 103 | ✍ Callback de fin de chargement : définit la ferme propriétaire du support, relie ses callbacks de dépôt et de prise aux deux événements du véhicule, l'ajoute à la liste et restaure son état sauvegardé selon son indice. Termine toujours la tâche de chargement. |
| `HandToolHolders:onDelete()` | 134 | ✍ Supprime chaque support d'outil à main et vide la liste. |
| `HandToolHolders:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 147 | ✍ Sauvegarde chaque support dans des entrées handToolHolder avec un attribut d'indice base 1, en déléguant le contenu au support. |
| `HandToolHolders:onWriteStream(streamId: any, connection: any)` | 161 | ✍ Côté serveur : écrit l'identifiant réseau et l'état de chaque support pour le client qui se connecte et enregistre l'objet dans ce flux. |
| `HandToolHolders:onReadStream(streamId: any, connection: any)` | 176 | ✍ Côté client : lit l'identifiant réseau et l'état de chaque support, puis termine l'enregistrement de l'objet auprès du client. |
| `HandToolHolders:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 191 | ✍ Appelle le parent, puis transmet le même identifiant de ferme propriétaire à chaque support sans envoyer d'autre événement réseau. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onHandToolStoredInHolder` | 36 |
| registerEvent | `onHandToolTakenFromHolder` | 37 |
| registerFunction | `onHandToolHolderFinished` | 43 |
| registerOverwrittenFunction | `setOwnerFarmId` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onDelete` | 56 |
| registerEventListener | `saveToXMLFile` | 57 |
| registerEventListener | `onWriteStream` | 58 |
| registerEventListener | `onReadStream` | 59 |
| registerEventListener | `onRegistered` | 60 |
