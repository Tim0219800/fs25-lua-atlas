# gui/hud/GameInfoDisplay.lua

*[English version](../../../../scripts/gui/hud/GameInfoDisplay.md)*

Source: `dataS/scripts/gui/hud/GameInfoDisplay.lua` — FS25 1.25.1.0

✍ Barre d'informations HUD en haut à droite affichant l'argent, la date du calendrier, la météo (actuelle et à venir), l'horloge avec aiguilles et un indicateur d'avance rapide. Dérivée de HUDDisplay. Ce fichier ne crée que les overlays (identifiants de tranches météo par WeatherType) et la mise en page à l'échelle ; le code de mise à jour et de dessin n'est pas dans ce fichier (NON VÉRIFIÉ).

- **GameInfoDisplay** hérite de `HUDDisplay` (l.28)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GameInfoDisplay.new()` | 32 | ✍ Constructeur. Crée les tranches de fond argent et infos, les overlays calendrier/météo/horloge/avance rapide aux couleurs du HUD et une table associant chaque WeatherType (soleil, partiellement nuageux, nuageux, pluie, neige, grêle, tornade, orage) à sa tranche d'icône. |
| `GameInfoDisplay:storeScaledValues()` | 102 | ✍ Place la barre sur l'ancre haut-droite du HUD et calcule toutes les tailles et décalages à l'échelle (barre de 65 px de haut, icônes de 48 px, tailles et décalages de texte, aiguilles, icône d'avance rapide, séparateur et espacement). |
