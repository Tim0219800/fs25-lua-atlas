# gui/hud/TopNotification.lua

*[English version](../../../../scripts/gui/hud/TopNotification.md)*

Source: `dataS/scripts/gui/hud/TopNotification.lua` — FS25 1.25.1.0

✍ Élément HUD (sous-classe de HUDDisplay) affichant une notification encadrée en haut au centre de l'écran avec titre, texte, ligne d'info et icône optionnelle. Une seule notification est conservée à la fois ; une nouvelle remplace l'actuelle. Hors les méthodes listées, aucun code de rendu n'est défini dans ce fichier.

- **TopNotification** hérite de `HUDDisplay` (l.25)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TopNotification.new()` | 29 | ✍ Crée l'affichage avec une notification courante vide et invalide et les overlays de fond gauche/milieu/droit teintés de la couleur de fond du HUD. Prépare aussi un cache d'icônes. |
| `TopNotification:storeScaledValues()` | 59 | ✍ Recalcule les tailles, décalages et la position d'ancrage (centre de l'écran, ancre haute) pour l'échelle d'interface courante. |
| `TopNotification:setNotification(title: string, text: string, info: string, iconFilename: string?, duration: integer?)` | 156 | ✍ Remplace la notification courante : titre et texte sont mis en majuscules, l'icône est chargée une fois par nom de fichier puis mise en cache, et la durée vaut TopNotification.DEFAULT_DURATION si nil. Marque la notification comme valide. |
