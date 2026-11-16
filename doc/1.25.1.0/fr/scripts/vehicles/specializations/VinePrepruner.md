# vehicles/specializations/VinePrepruner.lua

*[English version](../../../../scripts/vehicles/specializations/VinePrepruner.md)*

Source: `dataS/scripts/vehicles/specializations/VinePrepruner.lua` — FS25 1.25.1.0

✍ Spécialisation pour les prétailleuses de vigne. Elle exige `VineDetector` comme prérequis et lit le type de fruit (`FruitType.GRAPE` par défaut), des nœuds de taille qui coulissent selon la distance détectée, une animation de piquet facultative et un effet. Le serveur décide de l'état de l'effet (actif une seconde après le dernier travail) et synchronise les cibles des nœuds et le drapeau d'effet par des valeurs compressées. Les surcharges enregistrées (limite de vitesse, détection de vigne, usage du segment par l'IA) et `loadPreprunerNodeFromXML`/`getIsPreprunerNodeActive` n'ont pas de corps dans ce fichier (NON VÉRIFIÉ).

- **VinePrepruner** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VinePrepruner.initSpecialization()` | 18 | ✍ Enregistre les chemins XML du type de fruit, des nœuds de taille (nœud, décalage, axe, sens, translation min/max, vitesse, bits de synchro), de l'animation de piquet (nom, échelle de vitesse, seuil) et de l'effet. |
| `VinePrepruner.prerequisitesPresent(specializations: any)` | 44 | ✍ Renvoie true uniquement si le type de véhicule possède la spécialisation `VineDetector`. |
| `VinePrepruner.registerFunctions(vehicleType: any)` | 50 | ✍ Enregistre `loadPreprunerNodeFromXML` et `getIsPreprunerNodeActive` sur le type de véhicule ; leurs implémentations ne sont pas dans ce fichier (NON VÉRIFIÉ). |
| `VinePrepruner.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Enregistre des surcharges pour doCheckSpeedLimit, getCanStartVineDetection, getIsValidVinePlaceable, handleVinePlaceable et getAIImplementUseVineSegment (corps absents de ce fichier, NON VÉRIFIÉ). |
| `VinePrepruner.registerEventListeners(vehicleType: any)` | 67 | ✍ S'abonne au chargement, à la suppression, aux quatre événements de flux, à onUpdate, onTurnedOff et onAnimationPartChanged. Seuls certains ont un corps ici (onTurnedOff et onAnimationPartChanged ne sont pas définis dans ce fichier). |
| `VinePrepruner:onLoad(savegame: any)` | 81 | ✍ Charge le type de fruit, les nœuds de taille (via `loadPreprunerNodeFromXML`), les réglages de l'animation de piquet et, côté client, les effets. Alloue un drapeau de modification et place `lastWorkTime` loin dans le passé. |
| `VinePrepruner:onDelete()` | 117 | ✍ Supprime les effets via le gestionnaire d'effets (sans test isClient, donc la table d'effets est nil sur un serveur ; NON VÉRIFIÉ que le gestionnaire accepte nil). |
| `VinePrepruner:onReadStream(streamId: any, connection: any)` | 124 | ✍ Connexion d'un client : lit les positions des nœuds de taille et l'état de l'effet, en forçant les nœuds à ces positions immédiatement. |
| `VinePrepruner:onWriteStream(streamId: any, connection: any)` | 130 | ✍ Côté serveur lors d'une connexion : écrit les cibles des nœuds de taille et l'état de l'effet. |
| `VinePrepruner:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 136 | ✍ Client : si le serveur a signalé un changement, lit l'état ; les cibles sont rejointes progressivement dans onUpdate. |
| `VinePrepruner:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 146 | ✍ Serveur : écrit un booléen indiquant si le drapeau de modification est posé, puis l'état de la prétailleuse si oui. |
| `VinePrepruner.readPrePrunerFromStream(self: any, streamId: any, forceState: any)` | 157 | ✍ Lit la cible de chaque nœud comme entier sur N bits mis à l'échelle entre transMin et transMax, l'applique immédiatement si `forceState`, puis lit le booléen d'effet et démarre ou arrête les effets avec le type de fruit comme information. |
| `VinePrepruner.writePrePrunerToStream(self: any, streamId: any)` | 186 | ✍ Écrit la cible de chaque nœud comme entier sur N bits normalisé entre transMin et transMax, puis le booléen d'effet. |
| `VinePrepruner:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 201 | ✍ Déplace chaque nœud de taille actif vers sa translation cible à `transSpeed` (le pas utilise dt directement, l'unité dépend donc de la valeur XML). Sur le serveur, active l'effet si du travail a eu lieu dans la dernière seconde, le démarre/arrête localement et pose le drapeau de modification. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadPreprunerNodeFromXML` | 51 |
| registerFunction | `getIsPreprunerNodeActive` | 52 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 58 |
| registerOverwrittenFunction | `getCanStartVineDetection` | 59 |
| registerOverwrittenFunction | `getIsValidVinePlaceable` | 60 |
| registerOverwrittenFunction | `handleVinePlaceable` | 61 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onReadStream` | 70 |
| registerEventListener | `onWriteStream` | 71 |
| registerEventListener | `onReadUpdateStream` | 72 |
| registerEventListener | `onWriteUpdateStream` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onTurnedOff` | 75 |
| registerEventListener | `onAnimationPartChanged` | 76 |
