# utils/SplineUtil.lua

*[English version](../../../scripts/utils/SplineUtil.md)*

Source: `dataS/scripts/utils/SplineUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Utilitaires statiques pour les noeuds de spline : bornage du temps, recherches du point le plus proche, pente, centre, conversion d'une spline cubique en polyligne linéaire sur XZ et requêtes sur le point d'édition le plus proche. Le dump contient des signatures annotées sans corps ; le comportement vient des annotations et est NON VÉRIFIÉ.

- **SplineUtil** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SplineUtil.getValidSplineTime(t: number) → number` | 17 | ✍ Signature seule (pas de corps dans le dump du SDK) : Ramène une entrée à un temps de spline valide entre 0 et 1 ; le fait qu'il borne ou boucle n'est pas visible. |
| `SplineUtil.getSplineTimeAtWorldPos(spline: integer, t: number, posX: number, posZ: number, checkDistance: number, maxSteps: number) → number, integer` | 31 | ✍ Signature seule (pas de corps dans le dump du SDK) : Cherche le temps de spline le plus proche d'une position monde (x et z seulement), depuis le temps t, par pas d'une distance de contrôle jusqu'à un nombre maximal de pas. Renvoie le temps et le nombre de pas utilisés. |
| `SplineUtil.getSlopeAngle(spline: integer, splineTime: number) → number` | 69 | ✍ Signature seule (pas de corps dans le dump du SDK) : Renvoie l'angle de pente en radians de la spline à un temps donné. |
| `SplineUtil.getCenterPosition(splineNode: integer) → number, number, number` | 81 | ✍ Signature seule (pas de corps dans le dump du SDK) : Renvoie la position centrale x, y, z d'un noeud de spline ; le mode de calcul du centre n'est pas visible. |
| `SplineUtil.convertToLinearSplineXZ(cubicSpline: integer, thresholdAngleDeg: number?, stepSizeInMeter: number?) → array` | 130 | ✍ Signature seule (pas de corps dans le dump du SDK) : Convertit une spline cubique en tableau de positions l'approchant linéairement sur XZ, avec un seuil d'angle optionnel (5 degrés par défaut) et un pas optionnel (0,5 m par défaut). |
| `SplineUtil.getClosestEditPoint(splineNode: integer, posX: number, posY: number, posZ: number) → integer?, number?, number?, number?, number?` | 182 | ✍ Signature seule (pas de corps dans le dump du SDK) : Trouve le point d'édition le plus proche en 3D d'une position monde par recherche exacte parmi tous les points d'édition. Renvoie un index à partir de 0, la distance et la position, ou nil si le noeud est invalide. |
| `SplineUtil.getClosestEditPointsOnCurve(splineNode: integer, posX: number, posY: number, posZ: number, eps: number?) → number?, number?, number?, number?, integer?, integer?` | 227 | ✍ Signature seule (pas de corps dans le dump du SDK) : Projette une position monde sur la courbe et renvoie le point de courbe le plus proche, son temps de spline et les index (à partir de 0) des points d'édition avant et après lui (nil hors des extrémités). Une tolérance d'erreur optionnelle peut être donnée. |
