# vehicles/specializations/LicensePlates.lua

*[English version](../../../../scripts/vehicles/specializations/LicensePlates.md)*

Source: `dataS/scripts/vehicles/specializations/LicensePlates.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet à un véhicule de porter des plaques d'immatriculation. Chaque entrée `vehicle.licensePlates.licensePlate` rattache une plaque issue de `g_licensePlateManager` à un nœud, la met à l'échelle et la décale pour tenir dans une zone de placement, et active d'éventuels object changes. Les données de plaque (variation, caractères, couleur, placement) sont sauvegardées par véhicule et envoyées aux clients qui rejoignent ; aucun prérequis.

- **LicensePlates** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LicensePlates.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours vrai : aucune autre spécialisation n'est requise. |
| `LicensePlates.initSpecialization()` | 23 | ✍ Enregistre le type de spec boutique `licensePlate` et le schéma XML (placement par défaut, nœuds de plaque, type préféré, zone de placement, position, cadre, object changes) ainsi que les attributs de sauvegarde. |
| `LicensePlates.registerFunctions(vehicleType: any)` | 49 | ✍ Enregistre sur le type de véhicule les accesseurs de données de plaque, la comparaison, `getHasLicensePlates` et `getLicensePlateDialogSettings`. |
| `LicensePlates.registerEventListeners(vehicleType: any)` | 59 | ✍ S'abonne aux événements onLoad, onDelete, onPostLoad, onReadStream et onWriteStream. |
| `LicensePlates:onLoad(savegame: table)` | 70 | ✍ Lit le placement par défaut et, si la carte propose des plaques, crée chaque plaque via le manager, la rattache à son nœud, la masque et l'ajuste à la zone de placement. Sans plaques disponibles, elle réinitialise les object changes. |
| `LicensePlates:onPostLoad(savegame: any)` | 176 | ✍ Désactive tous les object changes de plaque, puis restaure les données sauvegardées (les caractères sont découpés octet par octet, sans gestion UTF-8) et les applique avec `setLicensePlatesData`. |
| `LicensePlates:onDelete(savegame: any)` | 205 | ✍ Vide la liste des plaques du véhicule. |
| `LicensePlates:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 213 | ✍ Écrit variation, caractères, couleur et placement dans la sauvegarde, sauf si le véhicule n'a pas de plaque ou si le placement vaut NONE. |
| `LicensePlates:onReadStream(streamId: integer, connection: Connection)` | 234 | ✍ Connexion client : lit les données de plaque depuis le flux et les applique. |
| `LicensePlates:onWriteStream(streamId: integer, connection: Connection)` | 244 | ✍ Connexion côté serveur : écrit les données de plaque actuelles dans le flux. |
| `LicensePlates:setLicensePlatesData(licensePlateData: any)` | 251 | ✍ Applique les données de plaque à toutes les plaques : affiche ou masque chacune selon l'option de placement (NONE, BACK_ONLY), met à jour texte, variation et couleur, et active les object changes. Des données incomplètes masquent toutes les plaques. |
| `LicensePlates:getLicensePlatesData()` | 288 | ✍ Renvoie la table des données de plaque actuelles (variation, caractères, colorIndex, placementIndex), ou nil. |
| `LicensePlates:getLicensePlatesDataIsEqual(data: any)` | 294 | ✍ Compare les données fournies avec celles du véhicule. Renvoie vrai si l'une est nil, sinon vrai seulement si variation, couleur, placement et caractères sont identiques. |
| `LicensePlates:getHasLicensePlates() → boolean` | 323 | ✍ Renvoie vrai si au moins une plaque a été chargée sur le véhicule. |
| `LicensePlates:getLicensePlateDialogSettings() → string, boolean` | 331 | ✍ Renvoie l'index de placement par défaut et si le véhicule a une plaque avant, pour la boîte de dialogue d'édition. |
| `LicensePlates.loadSpecValuePlateText(xmlFile: any, customEnvironment: any, baseDir: any)` | 347 | ✍ Chargeur de spec boutique ; renvoie toujours nil car la spec ne concerne que les véhicules existants. |
| `LicensePlates.getSpecValuePlateText(storeItem: any, realItem: any)` | 354 | ✍ Getter de spec boutique : pour un véhicule possédé avec plaques, renvoie le texte formaté de la plaque arrière (ou de la dernière) ; sinon nil. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setLicensePlatesData` | 50 |
| registerFunction | `getLicensePlatesData` | 51 |
| registerFunction | `getLicensePlatesDataIsEqual` | 52 |
| registerFunction | `getHasLicensePlates` | 53 |
| registerFunction | `getLicensePlateDialogSettings` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onWriteStream` | 64 |
