# gui/hud/IngameMessage.lua

*[English version](../../../../scripts/gui/hud/IngameMessage.md)*

Source: `dataS/scripts/gui/hud/IngameMessage.lua` — FS25 1.25.1.0

✍ Boîte de message HUD (étend HUDDisplay) affichée en bas au centre, avec titre, texte, lignes de commandes et un bouton de saut (OK). Le constructeur prépare une file de messages en attente, des overlays de boutons et le suivi du mode de saisie. Ce fichier ne contient que la construction, la mise en page à l'échelle et le dessin ; la gestion de la file, updateControls et drawControl n'y sont pas définis (NON VÉRIFIÉ pour leur emplacement). Côté client uniquement.

- **IngameMessage** hérite de `HUDDisplay` (l.37)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IngameMessage.new(customMt: any?) → any` | 43 | ✍ Crée l'affichage de message avec une file vide, des overlays de boutons manette et clavier, le texte localisé button_ok comme libellé de saut, aucun contrôle de saut, hors pause, et un minuteur de message suivant à -1. |
| `IngameMessage:storeScaledValues()` | 73 | ✍ Convertit la mise en page en pixels de référence (boîte de 640 de large, tailles de texte et de titre, décalages, hauteur des lignes de commandes, largeurs minimales de boutons) en unités écran, place la boîte en bas au centre et appelle updateControls. |
| `IngameMessage:draw()` | 248 | ✍ Dessine le message courant : panneau sombre arrondi dimensionné d'après titre, texte et nombre de commandes, titre et texte renvoyés à la ligne, ligne de séparation, chaque commande avec son texte tronqué par des points de suspension, et le libellé de saut avec son bouton. Ignoré si masqué, si une interface est visible ou sans message. |
