# vehicles/specializations/WaterTrailer.lua

*[English version](../../../../scripts/vehicles/specializations/WaterTrailer.md)*

Source: `dataS/scripts/vehicles/specializations/WaterTrailer.lua` — FS25 1.25.1.0

✍ Spécialisation permettant de remplir une citerne à eau (nécessite FillUnit) depuis n'importe quel plan d'eau du monde, pas seulement depuis un déclencheur. Quand le nœud de remplissage est à moins de 0,2 m de la hauteur d'eau (`self.waterY`, fournie par le moteur, NON VÉRIFIÉ), un activable est proposé ; le serveur ajoute alors de l'eau à l'unité de remplissage configurée à `fillLitersPerSecond` (500 par défaut) et synchronise l'état avec `WaterTrailerSetIsFillingEvent`. Le fichier définit aussi la classe auxiliaire `WaterTrailerActivatable`.

- **WaterTrailer** (l.10)
- **WaterTrailerActivatable** (l.197)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WaterTrailer.prerequisitesPresent(specializations: table) → boolean` | 16 | ✍ Renvoie true uniquement si le type de véhicule possède la spécialisation `FillUnit`. |
| `WaterTrailer.initSpecialization()` | 22 | ✍ Enregistre les chemins XML `vehicle.waterTrailer#fillUnitIndex`, `#fillLitersPerSecond` (500 par défaut), `#fillNode` (composant racine par défaut) et le son `refill`. |
| `WaterTrailer.registerFunctions(vehicleType: any)` | 37 | ✍ Ajoute `setIsWaterTrailerFilling` au type de véhicule. |
| `WaterTrailer.registerOverwrittenFunctions(vehicleType: any)` | 43 | ✍ Surcharge `getDrawFirstFillText`. |
| `WaterTrailer.registerEventListeners(vehicleType: any)` | 49 | ✍ S'abonne à onLoad, onDelete, aux flux de lecture/écriture, onUpdateTick et onPreDetach. |
| `WaterTrailer:onLoad(savegame: table)` | 61 | ✍ Lit l'indice de l'unité de remplissage, le débit et le nœud de remplissage (seulement si un indice est donné), crée l'activable, charge le son de remplissage côté client et pose `needWaterInfo` pour que le moteur fournisse la hauteur d'eau. À noter : onUpdateTick utilise `waterFillNode` sans test nil, donc un `fillUnitIndex` absent la ferait échouer. |
| `WaterTrailer:onDelete()` | 84 | ✍ Retire l'activable du système d'objets activables et supprime les échantillons sonores. |
| `WaterTrailer:onReadStream(streamId: integer, connection: Connection)` | 95 | ✍ Connexion d'un client : lit le booléen de remplissage et l'applique sans envoyer d'événement. |
| `WaterTrailer:onWriteStream(streamId: integer, connection: Connection)` | 104 | ✍ Côté serveur lors d'une connexion : écrit le booléen de remplissage courant. |
| `WaterTrailer:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 114 | ✍ Ajoute ou retire l'activable selon que le nœud de remplissage est près de l'eau. Sur le serveur, arrête le remplissage en quittant l'eau et, pendant le remplissage, ajoute de l'eau à l'unité au débit configuré (l'eau doit être un type autorisé) ; s'arrête quand plus rien n'est ajouté. |
| `WaterTrailer:setIsWaterTrailerFilling(isFilling: boolean, noEventSend: boolean)` | 149 | ✍ Change l'état de remplissage : envoie `WaterTrailerSetIsFillingEvent` (sauf `noEventSend`), mémorise l'état et joue ou arrête le son de remplissage côté client. |
| `WaterTrailer:getDrawFirstFillText(superFunc: any)` | 168 | ✍ Surcharge : côté client, renvoie true si la citerne est sélectionnée et active pour l'entrée, que son unité est vide et de capacité non nulle ; sinon on s'en remet à l'implémentation précédente. |
| `WaterTrailer:onPreDetach(attacherVehicle: table, implement: table)` | 185 | ✍ Retire l'activable de remplissage juste avant le détachement de la citerne. |
| `WaterTrailerActivatable.new(trailer: any)` | 201 | ✍ Constructeur : crée l'activable pour la citerne donnée avec un texte d'activation provisoire. |
| `WaterTrailerActivatable:getIsActivatable()` | 212 | ✍ Renvoie true (et met à jour le texte) quand la citerne est active pour l'entrée, que son unité n'est pas pleine et accepte l'eau. |
| `WaterTrailerActivatable:run()` | 223 | ✍ Bascule l'état de remplissage de la citerne et met à jour le texte affiché. |
| `WaterTrailerActivatable:updateActivateText()` | 230 | ✍ Définit le texte d'activation sur l'étiquette arrêter/remplir (localisée), formatée avec la description du type de véhicule. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setIsWaterTrailerFilling` | 38 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 44 |
| registerEventListener | `onLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onReadStream` | 52 |
| registerEventListener | `onWriteStream` | 53 |
| registerEventListener | `onUpdateTick` | 54 |
| registerEventListener | `onPreDetach` | 55 |
