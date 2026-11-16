# animals/wildlife/instances/WildlifeInstanceSimple.lua

*[English version](../../../../../scripts/animals/wildlife/instances/WildlifeInstanceSimple.md)*

Source: `dataS/scripts/animals/wildlife/instances/WildlifeInstanceSimple.lua` — FS25 1.25.1.0

✍ Classe d'instance de faune simple, fille de `WildlifeInstance`. Le fichier ne définit que le test de disparition basé sur sa machine à états de fuite.

- **WildlifeInstanceSimple** hérite de `WildlifeInstance` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WildlifeInstanceSimple:getCanDespawnNow() → boolean` | 94 | ✍ Renvoie true si l'instance ne fuit pas pour disparaître, possède un `despawnTime` et a vécu au moins cette durée depuis son apparition. |
