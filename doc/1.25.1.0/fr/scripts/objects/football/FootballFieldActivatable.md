# objects/football/FootballFieldActivatable.lua

*[English version](../../../../scripts/objects/football/FootballFieldActivatable.md)*

Source: `dataS/scripts/objects/football/FootballFieldActivatable.lua` — FS25 1.25.1.0

✍ Activatable servant à remettre le ballon en jeu. Ce fichier ne définit que la fonction de distance ; le reste de la classe (constructeur, run) n'est pas dans le dump et reste NON VÉRIFIÉ.

- **FootballFieldResetActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FootballFieldResetActivatable:getDistance(x: any, y: any, z: any)` | 32 | ✍ Renvoie la distance entre le point donné et le noeud de trigger de remise en jeu du terrain, ou `math.huge` si ce noeud n'existe pas. |
