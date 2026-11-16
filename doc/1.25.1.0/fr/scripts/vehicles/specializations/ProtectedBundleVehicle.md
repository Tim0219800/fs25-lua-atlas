# vehicles/specializations/ProtectedBundleVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/ProtectedBundleVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/ProtectedBundleVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules composés de plusieurs éléments qui doivent se comporter comme un seul. La racine du lot reste sélectionnable et réinitialisable, tandis qu'un enfant est masqué de la sélection et de l'aperçu. Elle n'a aucun prérequis et lit ses réglages dans le XML du véhicule sous vehicle.protectedBundleVehicle.

- **ProtectedBundleVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProtectedBundleVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Retourne toujours true : cette spécialisation n'a aucune spécialisation prérequise. |
| `ProtectedBundleVehicle.initSpecialization()` | 23 | ✍ Enregistre dans le schéma XML les entrées isBundleRoot, isBundleChild (booléens, faux par défaut) et bundleFilename (chemin) sous vehicle.protectedBundleVehicle. |
| `ProtectedBundleVehicle.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Surcharge getReloadXML sur le type de véhicule afin qu'une réinitialisation puisse refaire apparaître tout le lot. |
| `ProtectedBundleVehicle.registerEventListeners(vehicleType: any)` | 42 | ✍ Abonne la spécialisation aux événements onLoad et onPostDetach. |
| `ProtectedBundleVehicle:onLoad(savegame: table)` | 50 | ✍ Lit les indicateurs XML et le chemin du fichier de lot, et avertit si aucun article de boutique n'existe pour ce chemin. Un enfant reçoit canBeReset, showInVehicleOverview et allowSelection à false. L'écouteur onPostDetach n'est conservé que pour un enfant côté serveur. |
| `ProtectedBundleVehicle:onPostDetach()` | 75 | ✍ Supprime ce véhicule enfant après son détachement, sauf si un rechargement ou une téléportation est en cours ou s'il est déjà en cours de suppression. Enregistré uniquement pour les enfants de lot côté serveur. |
| `ProtectedBundleVehicle:getReloadXML(superFunc: any) → string` | 84 | ✍ Pour une racine de lot ayant un fichier de lot, retourne le XML de rechargement avec vehicle(0)#filename remplacé par ce fichier, de sorte qu'une réinitialisation fasse apparaître le lot. Sinon retourne le résultat parent inchangé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getReloadXML` | 37 |
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onPostDetach` | 44 |
