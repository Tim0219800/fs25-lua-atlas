# gui/base/NavigationMarker.lua

*[English version](../../../../scripts/gui/base/NavigationMarker.md)*

Source: `dataS/scripts/gui/base/NavigationMarker.lua` — FS25 1.25.1.0

✍ Marqueur de HUD qui pointe vers une position du monde : il la projette à l'écran, la limite au bord de l'écran, dessine un overlay pulsant avec une flèche hors champ et affiche la distance. Seule la méthode de rendu figure dans ce fichier ; le constructeur et les champs comme `worldPosX` viennent d'ailleurs (NON VÉRIFIÉ).

- **NavigationMarker** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `NavigationMarker:render()` | 62 | ✍ Dessin côté client : sort si masqué, sans joueur local ou plus proche que `minDistance`. Projette la cible via la caméra active, la limite aux bords, fait pulser l'alpha avec `g_time`, dessine le marqueur, la flèche si limité, et le texte de distance. |
