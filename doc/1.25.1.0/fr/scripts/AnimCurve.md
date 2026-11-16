# AnimCurve.lua

*[English version](../../scripts/AnimCurve.md)*

Source: `dataS/scripts/AnimCurve.lua` — FS25 1.25.1.0

✍ Classe de courbe d'animation contenant des keyframes et un temps courant/maximal. Ce dump ne contient que `reset` ; le constructeur et le code d'interpolation sont absents, le reste est donc NON VÉRIFIÉ.

- **AnimCurve** (l.167)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimCurve:reset()` | 187 | ✍ Supprime tous les keyframes et remet à 0 le nombre de keyframes, le temps courant et le temps maximal. L'interpolateur est conservé. |
