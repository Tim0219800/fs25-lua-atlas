# vehicles/specializations/CropRowAdjustedNodes.lua

*[English version](../../../../scripts/vehicles/specializations/CropRowAdjustedNodes.md)*

Source: `dataS/scripts/vehicles/specializations/CropRowAdjustedNodes.lua` — FS25 1.25.1.0

✍ Spécialisation qui fait glisser latéralement des noeuds configurés pour aligner les éléments d'un outil sur les rangs de cultures (ou le milieu entre rangs). Les rangs sont déduits de l'espacement de plantation du type de culture et d'une position monde rastérisée, alignés sur des directions à 90 degrés ; actif seulement outil abaissé, à peu près aligné avec les rangs et à distance configurable du joueur. Lit 'vehicle.cropRowAdjustedNodes'.

- **CropRowAdjustedNodes** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CropRowAdjustedNodes.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `CropRowAdjustedNodes.initSpecialization()` | 21 | ✍ Enregistre le schéma XML : distance maximale de mise à jour et, par noeud, noeud, axe et limites de translation, vitesse, drapeau entre-rangs, types de culture et limites de temps de repliage. |
| `CropRowAdjustedNodes.registerFunctions(vehicleType: any)` | 46 | ✍ Enregistre loadCropRowAdjustedNodeFromXML, updateCropRowAdjustedNode et getIsCropRowAdjustedNodeActive. |
| `CropRowAdjustedNodes.registerEventListeners(vehicleType: any)` | 54 | ✍ S'abonne aux événements de chargement et de mise à jour. |
| `CropRowAdjustedNodes:onLoad(savegame: any)` | 61 | ✍ Charge tous les noeuds ajustés depuis le XML et la distance maximale de mise à jour ; retire l'écouteur de mise à jour si aucun n'est chargé. |
| `CropRowAdjustedNodes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 81 | ✍ À chaque image, si le véhicule est plus proche du joueur que la distance maximale, met à jour chaque noeud ajusté. |
| `CropRowAdjustedNodes:loadCropRowAdjustedNodeFromXML(xmlFile: any, key: any, adjustedNode: any)` | 92 | ✍ Charge un noeud ajusté : crée un groupe de transformation de référence à côté, mémorise translation initiale, axe, limites, vitesse (m/s converti en m/ms), drapeau entre-rangs, cultures et limites de repliage. Renvoie false avec avertissement si le noeud ou les cultures manquent. |
| `CropRowAdjustedNodes:updateCropRowAdjustedNode(adjustedNode: any, dt: any)` | 153 | ✍ Calcule le décalage latéral du noeud vers le rang le plus proche d'après la culture située dessous, le borne aux translations min/max et déplace le noeud vers lui à la vitesse configurée. Revient à sa position initiale quand il devient inactif. |
| `CropRowAdjustedNodes:getIsCropRowAdjustedNodeActive(adjustedNode: any)` | 231 | ✍ Renvoie true seulement si le temps de repliage est dans les limites du noeud, l'outil est abaissé et son cap est à moins de CropRowAdjustedNodes.MAX_ACTIVE_ANGLE (valeur absente de ce fichier) d'un multiple de 90 degrés. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCropRowAdjustedNodeFromXML` | 47 |
| registerFunction | `updateCropRowAdjustedNode` | 48 |
| registerFunction | `getIsCropRowAdjustedNodeActive` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onUpdate` | 56 |
