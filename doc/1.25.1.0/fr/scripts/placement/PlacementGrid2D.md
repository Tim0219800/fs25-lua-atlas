# placement/PlacementGrid2D.lua

*[English version](../../../scripts/placement/PlacementGrid2D.md)*

Source: `dataS/scripts/placement/PlacementGrid2D.lua` — FS25 1.25.1.0

✍ Utilitaire qui modélise une zone rectangulaire rattachée à un node (largeur sur X, longueur sur Z) et suit les parties occupées. L'occupation est stockée par tranche en Z de taille `spacing`, chacune avec le X min et max bloqués. Deux modes de placement (SIDES et FILL) sont évoqués dans les commentaires du fichier ; les constantes comme `MODE_SIDES` sont absentes du dump, leurs valeurs sont donc NON VÉRIFIÉ. La recherche de position libre n'est pas dans ce dump.

- **PlacementGrid2D** (l.54)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlacementGrid2D.new(node: any, width: any, length: any, spacing: any, mode: any)` | 58 | ✍ Crée une grille pour le node, la largeur, la longueur et l'espacement de tranche donnés. Le mode vaut par défaut `PlacementGrid2D.MODE_SIDES`. Démarre sans zone bloquée et avec deux enregistrements de position basse/haute invalides. |
| `PlacementGrid2D:delete()` | 78 | ✍ Destructeur vide, rien n'est libéré. |
| `PlacementGrid2D:reset()` | 83 | ✍ Efface toutes les zones bloquées : la grille entière redevient libre. |
| `PlacementGrid2D:blockAreaLocal(x: any, z: any, width: any, length: any)` | 182 | ✍ Bloque un rectangle exprimé dans l'espace local de la grille (coin x, z puis largeur et longueur) en transmettant ses bornes à `updateBlockedArea`. Aucun écrêtage à la taille de la grille n'est fait ici. |
| `PlacementGrid2D:blockAreaByBoundingBox(x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, upX: any, upY: any, upZ: any, extendX: any, extendY: any, extendZ: any)` | 193 | ✍ Bloque l'emprise d'une boîte orientée donnée par position monde, direction, vecteur haut et demi-dimensions. Les huit coins sont convertis dans l'espace local du node de la grille et leurs bornes sont limitées à la grille avant blocage. |
| `PlacementGrid2D:updateBlockedArea(minX: any, maxX: any, minZ: any, maxZ: any)` | 213 | ✍ Marque chaque tranche en Z touchée par l'intervalle donné, crée les tranches manquantes et élargit le X min/max bloqué de chacune pour inclure le nouvel intervalle. Les indices de tranche commencent à 1 et la taille est `spacing`. |
| `PlacementGrid2D:drawDebug()` | 242 | ✍ Dessin de débogage : trace le contour de la grille en blanc et, pour chaque tranche bloquée, ses bords en blanc plus une ligne centrale rouge. À appeler à chaque image pour rester visible. |
