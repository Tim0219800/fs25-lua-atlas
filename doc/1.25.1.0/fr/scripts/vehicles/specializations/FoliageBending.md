# vehicles/specializations/FoliageBending.lua

*[English version](../../../../scripts/vehicles/specializations/FoliageBending.md)*

Source: `dataS/scripts/vehicles/specializations/FoliageBending.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet à un véhicule d'écarter le feuillage de la carte via g_currentMission.foliageBendingSystem. Les nœuds de courbure sont des rectangles (étendues en X et Z plus un décalage en hauteur) liés à un nœud du véhicule, créés à l'activation du véhicule et détruits à la désactivation ou à la suppression. Des foliageBendingModifier dépendant de la configuration peuvent redimensionner ou désactiver les nœuds. La classe FoliageBendingSystem elle-même est absente du dump (NON VÉRIFIÉ).

- **FoliageBending** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FoliageBending.prerequisitesPresent(specializations: any)` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `FoliageBending.initSpecialization()` | 23 | ✍ Déclare les attributs XML d'un nœud de courbure (nœud, étendues min/max en X et Z, yOffset). |
| `FoliageBending.postInitSpecialization()` | 40 | ✍ Une fois toutes les spécialisations connues, déclare l'élément XML foliageBendingModifier sous chaque type de configuration de véhicule : index ou indices, étendues, yOffset, isActive et overwrite. |
| `FoliageBending.registerFunctions(vehicleType: any)` | 65 | ✍ Enregistre sur le type de véhicule les fonctions de chargement de nœud, de chargement de modificateur, d'activation, de désactivation et de recherche. |
| `FoliageBending.registerEventListeners(vehicleType: any)` | 75 | ✍ Abonne aux événements de post-chargement, suppression, activation et désactivation. |
| `FoliageBending:onPostLoad(savegame: any)` | 84 | ✍ Charge toutes les entrées vehicle.foliageBending.bendingNode, puis applique les foliageBendingModifier des configurations actives : soit en remplaçant les étendues du nœud, soit en les élargissant, avec désactivation optionnelle d'un nœud. Avertit pour les indices non définis. |
| `FoliageBending:onDelete()` | 146 | ✍ Retire du système de courbure du feuillage tous les objets de courbure actifs du véhicule. |
| `FoliageBending:loadBendingNodeFromXML(xmlFile: any, key: any, bendingNode: any)` | 152 | ✍ Lit un nœud de courbure : nœud (par défaut le nœud racine du véhicule), étendues minX/maxX/minZ/maxZ (défaut -1 à 1) et yOffset (défaut 0). Renvoie toujours true. |
| `FoliageBending:loadBendingNodeModifierFromXML(xmlFile: any, key: any)` | 172 | ✍ Lit un modificateur (index ou indices, étendues optionnelles, isActive, overwrite) et le met en file dans spec.bendingModifiers. Ne renvoie rien et journalise un avertissement si aucun index n'est donné. |
| `FoliageBending:activateBendingNodes()` | 205 | ✍ Crée un rectangle dans g_currentMission.foliageBendingSystem pour chaque nœud actif qui n'en a pas encore, en stockant son id. La classe du système est absente du dump (comportement NON VÉRIFIÉ). |
| `FoliageBending:deactivateBendingNodes()` | 218 | ✍ Détruit les objets de courbure du feuillage créés pour ce véhicule et efface leurs ids ; sans danger si aucun nœud n'existe. |
| `FoliageBending:getFoliageBendingNodeByIndex(index: any)` | 232 | ✍ Renvoie la table du nœud de courbure à l'indice donné (nil hors plage). |
| `FoliageBending:onActivate()` | 238 | ✍ Appelle activateBendingNodes quand le véhicule est activé. |
| `FoliageBending:onDeactivate()` | 244 | ✍ Appelle deactivateBendingNodes quand le véhicule est désactivé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadBendingNodeFromXML` | 66 |
| registerFunction | `loadBendingNodeModifierFromXML` | 67 |
| registerFunction | `activateBendingNodes` | 68 |
| registerFunction | `deactivateBendingNodes` | 69 |
| registerFunction | `getFoliageBendingNodeByIndex` | 70 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onDelete` | 77 |
| registerEventListener | `onActivate` | 78 |
| registerEventListener | `onDeactivate` | 79 |
