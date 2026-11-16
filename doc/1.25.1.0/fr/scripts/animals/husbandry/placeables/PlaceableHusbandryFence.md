# animals/husbandry/placeables/PlaceableHusbandryFence.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryFence.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFence.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui donne à un élevage une clôture construite depuis un XML et un i3D séparés (classe `Fence`). Les sections de `placeable.husbandry.fence` définissent des segments par défaut à partir de positions de noeuds, éventuellement une dernière section personnalisable que le joueur place à la main, et des noeuds de contour de navigation supplémentaires. Elle valide le placement (collisions, terrain non possédé) pendant la prévisualisation, synchronise la clôture dans les flux réseau et surcharge la création du maillage de navigation (le corps de plusieurs méthodes enregistrées n'est pas dans le dump du SDK).

- **PlaceableHusbandryFence** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryFence.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Renvoie toujours vrai : cette spécialisation n'a aucun prérequis. |
| `PlaceableHusbandryFence.registerFunctions(placeableType: any)` | 36 | ✍ Enregistre les méthodes de clôture (personnalisation, clôture par défaut, positions de contour, règles de suppression de segments, rappels de chargement) sur le type de placeable. Plusieurs méthodes enregistrées n'ont pas de corps dans le dump du SDK. |
| `PlaceableHusbandryFence.registerOverwrittenFunctions(placeableType: any)` | 59 | ✍ Enregistre les surcharges de `setPreviewPosition`, `getCanBePlacedAt` et `createNavigationMesh`. |
| `PlaceableHusbandryFence.registerEventListeners(placeableType: any)` | 67 | ✍ S'abonne à `onLoad`, `onDelete`, `onPreFinalizePlacement`, `onPostFinalizePlacement`, `onReadStream` et `onWriteStream`. |
| `PlaceableHusbandryFence.registerXMLPaths(schema: XMLSchema, basePath: string)` | 80 | ✍ Enregistre les clés XML sous `husbandry.fence` : fichier XML de clôture, sections (identifiant de segment, indicateur inversé, indicateur personnalisable, noeuds) et noeuds de maillage de navigation supplémentaires. |
| `PlaceableHusbandryFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 | ✍ Enregistre les chemins XML de sauvegarde sous `.fence` en déléguant à `Fence.registerSavegameXMLPaths`. |
| `PlaceableHusbandryFence:onLoad(savegame: any)` | 102 | ✍ Réinitialise l'état de personnalisation puis, sauf si le générateur d'icônes tourne, charge le XML de clôture indiqué dans le XML du placeable et lance le chargement asynchrone de son i3D. Retourne silencieusement avec un avertissement si le fichier ou son chemin i3D manque. |
| `PlaceableHusbandryFence:onFenceI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 152 | ✍ Rappel du chargement asynchrone de l'i3D : construit la `Fence`, lit les sections par défaut (chacune avec un identifiant de segment valide ; une section personnalisable doit être la dernière) et les noeuds de contour de navigation, et crée la clôture par défaut en prévisualisation de construction. Nettoie le XML temporaire et termine la tâche de chargement. |
| `PlaceableHusbandryFence:onDelete()` | 236 | ✍ Libère le XML de clôture temporaire, marque la clôture comme en cours de suppression, supprime les segments de prévisualisation et la clôture elle-même, et libère le fichier i3D partagé. |
| `PlaceableHusbandryFence:onReadStream(streamId: any, connection: any)` | 270 | ✍ Lecture réseau : supprime les segments de clôture existants, lit la clôture et les indicateurs personnalisable/par défaut de chaque segment, finalise la clôture, puis lit l'indicateur de personnalisation et masque la clôture par défaut si l'utilisateur personnalise. |
| `PlaceableHusbandryFence:onWriteStream(streamId: any, connection: any)` | 296 | ✍ Écriture réseau : écrit la clôture, les indicateurs personnalisable et par défaut de chaque segment, et si l'utilisateur est en train de personnaliser. |
| `PlaceableHusbandryFence:loadFromXMLFile(xmlFile: XMLFile, key: string)` | 334 | ✍ Charge la clôture depuis la clé `.fence` de la sauvegarde si elle existe. |
| `PlaceableHusbandryFence:onPreFinalizePlacement()` | 345 | ✍ Serveur uniquement et seulement pour un placeable nouvellement posé (pas issu d'une sauvegarde) : crée la clôture par défaut, reconstruit et finalise chaque segment de prévisualisation, puis finalise la clôture. Sans effet si aucune clôture n'est chargée. |
| `PlaceableHusbandryFence:updateHusbandryFence() → boolean` | 648 | ✍ Positionne chaque segment de prévisualisation entre les noeuds de sa section, reconstruit les maillages, vérifie chevauchements et propriété, et renseigne `spec.fenceErrorMessageKey`. Renvoie faux en cas d'erreur de maillage, de collision ou de terrain non possédé. |
| `PlaceableHusbandryFence:setPreviewPosition(superFunc: any, x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any)` | 706 | ✍ Surcharge : appelle le parent, puis met à jour la clôture et mémorise dans `spec.canBePlaced` si elle convient à la nouvelle position de prévisualisation. |
| `PlaceableHusbandryFence:getHasCustomizableFence()` | 717 | ✍ Indique si le XML définit une section personnalisable (vrai ou nil). |
| `PlaceableHusbandryFence:getFence()` | 724 | ✍ Renvoie l'objet `Fence`, ou nil si aucun n'a été chargé. |
| `PlaceableHusbandryFence:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 754 | ✍ Surcharge : renvoie faux avec le texte d'erreur de clôture mémorisé (ou un texte par défaut) quand la clôture ne peut pas être posée ; sinon délègue au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getHasCustomizableFence` | 37 |
| registerFunction | `getFence` | 38 |
| registerFunction | `getCustomizeableSectionStartAndEndPositions` | 39 |
| registerFunction | `getDefaultFenceOrientation` | 40 |
| registerFunction | `getFenceContourPositions` | 41 |
| registerFunction | `getCanFinishFenceCustomization` | 42 |
| registerFunction | `updateHusbandryFence` | 43 |
| registerFunction | `finalizeHusbandryFence` | 44 |
| registerFunction | `createDefaultFence` | 45 |
| registerFunction | `deleteCustomizableSegments` | 46 |
| registerFunction | `onFenceI3DLoaded` | 47 |
| registerFunction | `startFenceCustomization` | 48 |
| registerFunction | `finishFenceCustomization` | 49 |
| registerFunction | `onHusbandryFenceUserRemoved` | 50 |
| registerFunction | `hideDefaultFence` | 51 |
| registerFunction | `restoreDefaultFence` | 52 |
| registerFunction | `tryFinalizeFence` | 53 |
| registerFunction | `getAllowFenceSegmentDeletion` | 54 |
| registerOverwrittenFunction | `setPreviewPosition` | 60 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 61 |
| registerOverwrittenFunction | `createNavigationMesh` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onPreFinalizePlacement` | 70 |
| registerEventListener | `onPostFinalizePlacement` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
