# vehicles/specializations/DynamicallyLoadedParts.lua

*[English version](../../../../scripts/vehicles/specializations/DynamicallyLoadedParts.md)*

Source: `dataS/scripts/vehicles/specializations/DynamicallyLoadedParts.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule sans prérequis qui charge des fichiers i3D supplémentaires au chargement du véhicule et rattache un nœud choisi de chacun à un nœud du véhicule (par exemple des cales de roue). Chaque pièce est déclarée sous vehicle.dynamicallyLoadedParts dans le XML du véhicule. Le chargement passe par le système d'i3D partagés et est asynchrone.

- **DynamicallyLoadedParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DynamicallyLoadedParts.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : cette spécialisation peut être ajoutée à n'importe quel type de véhicule. |
| `DynamicallyLoadedParts.initSpecialization()` | 21 | ✍ Enregistre dans le schéma XML les clés de chaque dynamicallyLoadedPart : filename, node, linkNode, position, rotationNode, rotation, shaderParameterName et shaderParameter. |
| `DynamicallyLoadedParts.registerFunctions(vehicleType: any)` | 40 | ✍ Enregistre la fonction de véhicule onDynamicallyPartI3DLoaded, utilisée comme rappel quand un i3D de pièce a fini de charger. |
| `DynamicallyLoadedParts.registerEventListeners(vehicleType: any)` | 46 | ✍ Abonne la spécialisation aux événements de véhicule onLoad et onDelete. |
| `DynamicallyLoadedParts:onLoad(savegame: any)` | 53 | ✍ Parcourt les entrées XML dynamicallyLoadedPart et lance un chargement d'i3D partagé pour chacune ayant un filename, en mémorisant les identifiants de requête. Une entrée sans filename produit un avertissement XML. |
| `DynamicallyLoadedParts:onDelete()` | 79 | ✍ Libère toutes les requêtes de chargement d'i3D partagé faites dans onLoad et vide la liste. |
| `DynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 92 | ✍ Rappel de chargement : trouve le nœud de la pièce et le nœud de liaison, refuse les nœuds de liaison déjà référencés au runtime, applique position, rotation et un paramètre de shader optionnel, lie le nœud au véhicule puis supprime la racine chargée. Renvoie true en cas de succès, false/nil sinon. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onDynamicallyPartI3DLoaded` | 41 |
| registerEventListener | `onLoad` | 47 |
| registerEventListener | `onDelete` | 48 |
