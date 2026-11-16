# field/FieldState.lua

*[English version](../../../scripts/field/FieldState.md)*

Source: `dataS/scripts/field/FieldState.lua` — FS25 1.25.1.0

✍ Simple conteneur de données pour l'état d'un champ ou d'un point échantillonné : culture, croissance, mauvaises herbes, cailloux, type de sol, pulvérisation, chaux, rouleau, labour, chaume et eau, parcelle et propriétaire. Aucune logique propre ; d'autres classes le remplissent.

- **FieldState** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FieldState.new(customMt: any) → table` | 33 | ✍ Constructeur. Met tous les niveaux à 0, la validité à false, la culture inconnue, le type de sol à NONE, l'id de parcelle à 0 et le propriétaire à AccessHandler.NOBODY. |
