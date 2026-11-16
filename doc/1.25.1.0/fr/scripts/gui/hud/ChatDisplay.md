# gui/hud/ChatDisplay.lua

*[English version](../../../../scripts/gui/hud/ChatDisplay.md)*

Source: `dataS/scripts/gui/hud/ChatDisplay.lua` — FS25 1.25.1.0

✍ Panneau HUD de l'historique du chat multijoueur, dérivé de HUDDisplay. Il possède un fond en trois tranches (haut, milieu extensible, bas) teinté de la couleur de fond du HUD, garde une référence à la liste de messages détenue par la mission et suit la position de défilement et le délai de fermeture (durée 10 s, jusqu'à 50 messages). Le code de dessin n'est pas dans ce fichier.

- **ChatDisplay** hérite de `HUDDisplay` (l.24)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ChatDisplay.new() → table` | 29 | ✍ Constructeur. Crée les overlays de fond depuis gui.chat_top/middle/bottom, une référence de messages vide, 50 messages maximum, un décalage de défilement 0 et une durée d'affichage de 10 000 ms. |
| `ChatDisplay:storeScaledValues()` | 57 | ✍ Calcule la position (ancres gauche et bas avec un décalage de 300 px), les tranches de fond de 300 px de large et les tailles/décalages du texte et du titre ainsi que la hauteur maximale du panneau, selon l'échelle de l'interface. |
| `ChatDisplay:scrollChatMessages(delta: integer)` | 181 | ✍ Ajoute un delta (en messages, positif ou négatif) au décalage de défilement, borné entre 0 et le nombre de messages moins un. |
