# misc/BezierCurve.lua

*[English version](../../../scripts/misc/BezierCurve.md)*

Source: `dataS/scripts/misc/BezierCurve.lua` — FS25 1.25.1.0

✍ Courbe de Bézier cubique pour lisser des animations, avec les extrémités fixées à (0,0) et (1,1) et deux points de contrôle libres. Elle conserve les coefficients polynomiaux de chaque axe et les recalcule quand un point de contrôle change. Seuls ces setters figurent dans le dump ; le constructeur et le code d'échantillonnage sont absents (NON VÉRIFIÉ).

- **BezierCurve** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BezierCurve:recalculateCoefficients()` | 47 | ✍ Recalcule les coefficients cubiques ax, bx, cx et ay, by, cy à partir des deux points de contrôle ; appelé par chaque setter. |
| `BezierCurve:setPositionX1(newValue: number)` | 60 | ✍ Fixe le X du premier point de contrôle, borné à 0..1, puis recalcule les coefficients. |
| `BezierCurve:setPositionY1(newValue: number)` | 69 | ✍ Fixe le Y du premier point de contrôle, borné à 0..1, puis recalcule les coefficients. |
| `BezierCurve:setPositionX2(newValue: number)` | 78 | ✍ Fixe le X du second point de contrôle, borné à 0..1, puis recalcule les coefficients. |
| `BezierCurve:setPositionY2(newValue: number)` | 87 | ✍ Fixe le Y du second point de contrôle, borné à 0..1, puis recalcule les coefficients. |
