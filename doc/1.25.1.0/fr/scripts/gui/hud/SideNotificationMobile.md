# gui/hud/SideNotificationMobile.lua

*[English version](../../../../scripts/gui/hud/SideNotificationMobile.md)*

Source: `dataS/scripts/gui/hud/SideNotificationMobile.lua` — FS25 1.25.1.0

✍ Variante mobile de SideNotification (étend SideNotification) ancrée au coin haut-droit, avec ses propres constantes de couleur de fond, position et taille. Elle ne surcharge que la construction et les aides de fond ; applyValues n'est pas défini dans ce fichier (NON VÉRIFIÉ).

- **SideNotificationMobile** hérite de `SideNotification` (l.26)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SideNotificationMobile.new() → table` | 31 | ✍ Crée l'affichage de notification mobile avec l'échelle 1 et sa couleur de fond, puis appelle applyValues. |
| `SideNotificationMobile.getBackgroundPosition(uiScale: number)` | 111 | ✍ Retourne la position du coin haut-droit plus le décalage configuré mis à l'échelle par uiScale. |
| `SideNotificationMobile:createBackground()` | 118 | ✍ Crée un overlay sans image à la position haut-droite avec la taille configurée. À noter : déclarée avec deux-points, bien qu'elle n'utilise pas self. |
