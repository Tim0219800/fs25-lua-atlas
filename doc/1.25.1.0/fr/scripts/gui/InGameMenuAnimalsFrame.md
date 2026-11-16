# gui/InGameMenuAnimalsFrame.lua

*[English version](../../../scripts/gui/InGameMenuAnimalsFrame.md)*

Source: `dataS/scripts/gui/InGameMenuAnimalsFrame.lua` — FS25 1.25.1.0

✍ Cadre du menu en jeu, dérivé de TabbedMenuFrameElement, qui affiche des informations sur les enclos d'animaux et les chevaux du joueur. Seul le nettoyage delete est décrit ici. L'essentiel du fichier est hors des entrées décrites.

- **InGameMenuAnimalsFrame** hérite de `TabbedMenuFrameElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InGameMenuAnimalsFrame:delete()` | 71 | ✍ Supprime les éléments points clonés de la boîte de points des sous-catégories et le modèle de point, puis appelle le delete du parent. |
