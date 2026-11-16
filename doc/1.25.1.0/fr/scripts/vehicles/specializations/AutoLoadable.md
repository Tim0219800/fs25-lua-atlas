# vehicles/specializations/AutoLoadable.lua

*[English version](../../../../scripts/vehicles/specializations/AutoLoadable.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoadable.lua` — FS25 1.25.1.0

✍ Spécialisation marqueur pour les véhicules qu'un véhicule AutoLoader peut ramasser et monter sur sa zone de chargement. Elle fournit la taille et la boîte englobante de l'objet d'après `self.size` et le monte de façon cinématique à une position de la grille. Elle n'a aucun prérequis et ne positionne son indicateur que sur le serveur.

- **AutoLoadable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoadable.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `AutoLoadable.registerFunctions(vehicleType: any)` | 21 | ✍ Enregistre `getAutoLoadIsSupported`, `getAutoLoadIsAllowed`, `getAutoLoadBoundingBox`, `getAutoLoadSize` et `autoLoad` sur le type de véhicule. |
| `AutoLoadable.registerEventListeners(vehicleType: any)` | 31 | ✍ Abonne le véhicule à `onLoad`. |
| `AutoLoadable:onLoad(savegame: any)` | 37 | ✍ Sur le serveur uniquement, marque le véhicule comme compatible avec le chargement automatique. Sur les clients l'indicateur reste non défini. |
| `AutoLoadable:getAutoLoadIsSupported()` | 47 | ✍ Renvoie l'indicateur de compatibilité défini au chargement (true sur le serveur, nil ailleurs). |
| `AutoLoadable:getAutoLoadIsAllowed()` | 54 | ✍ Renvoie toujours true ; d'autres spécialisations peuvent la surcharger pour refuser le chargement. |
| `AutoLoadable:getAutoLoadSize()` | 60 | ✍ Renvoie la taille du véhicule sous la forme largeur, hauteur, longueur, tirée de `self.size`. |
| `AutoLoadable:getAutoLoadBoundingBox()` | 71 | ✍ Renvoie une boîte englobante orientée en espace monde : centre, directions avant et haut, puis demi-étendues. Le centre utilise les décalages de taille relatifs au noeud racine. |
| `AutoLoadable:autoLoad(autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 85 | ✍ Monte le véhicule de façon cinématique sur le noeud du chargeur à la position de grille donnée, sans rotation, et renvoie true. À noter : le décalage Z ajoute la moitié de la hauteur et non de la longueur, ce qui ressemble à une erreur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getAutoLoadIsSupported` | 22 |
| registerFunction | `getAutoLoadIsAllowed` | 23 |
| registerFunction | `getAutoLoadBoundingBox` | 24 |
| registerFunction | `getAutoLoadSize` | 25 |
| registerFunction | `autoLoad` | 26 |
| registerEventListener | `onLoad` | 32 |
