# vehicles/specializations/CylinderedFoldable.lua

*[English version](../../../../scripts/vehicles/specializations/CylinderedFoldable.md)*

Source: `dataS/scripts/vehicles/specializations/CylinderedFoldable.lua` — FS25 1.25.1.0

✍ Petite spécialisation de liaison pour les véhicules qui ont à la fois Cylindered (outils mobiles) et Foldable. Elle permet d'appliquer les états des outils mobiles à un moment choisi, quand l'animation de pliage atteint un temps donné, et corrige l'ordre de synchronisation réseau entre les deux. Elle exige Cylindered et Foldable et lit deux attributs sous vehicle.cylindered dans le XML du véhicule.

- **CylinderedFoldable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CylinderedFoldable.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true seulement si le type de véhicule possède les spécialisations Cylindered et Foldable. |
| `CylinderedFoldable.initSpecialization()` | 23 | ✍ Enregistre dans le schéma XML les entrées vehicle.cylindered#loadMovingToolStatesAfterFolding (booléen, faux par défaut) et vehicle.cylindered#loadMovingToolStatesFoldTime (flottant). |
| `CylinderedFoldable.registerEventListeners(vehicleType: any)` | 35 | ✍ Abonne la spécialisation à onLoad, onPreInitComponentPlacement, onReadStream et onWriteStream. |
| `CylinderedFoldable:onLoad(savegame: table)` | 45 | ✍ Lit les deux réglages XML (indicateur de rechargement et temps de pliage cible) dans spec_cylinderedFoldable. |
| `CylinderedFoldable:onPreInitComponentPlacement(savegame: any)` | 54 | ✍ Si l'indicateur est actif et qu'aucun temps de pliage n'est configuré, ou que le temps courant de l'animation de pliage lui est égal, rappelle Cylindered.onPostLoad pour appliquer les états des outils mobiles après le pliage. |
| `CylinderedFoldable:onReadStream(streamId: any, connection: any)` | 66 | ✍ Synchronisation à la connexion côté client : termine instantanément l'animation de pliage, lit un booléen et, s'il est vrai, relance Cylindered.onReadStream (écrasé par Foldable). Côté client de la connexion, rafraîchit aussi les animations dépendantes des outils mobiles modifiés. |
| `CylinderedFoldable:onWriteStream(streamId: any, connection: any)` | 88 | ✍ Écrit un booléen indiquant si le temps de pliage correspond à celui configuré (ou si aucun n'est configuré) et n'appelle Cylindered.onWriteStream que dans ce cas. Symétrique de la lecture. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 36 |
| registerEventListener | `onPreInitComponentPlacement` | 37 |
| registerEventListener | `onReadStream` | 38 |
| registerEventListener | `onWriteStream` | 39 |
