# gui/base/StatusBar.lua

*[English version](../../../../scripts/gui/base/StatusBar.md)*

Source: `dataS/scripts/gui/base/StatusBar.lua` — FS25 1.25.1.0

✍ Barre de progression horizontale simple dessinée avec des overlays de couleur unie : un fond, un remplissage de valeur et un marqueur optionnel. La valeur est une fraction entre 0 et 1. Simple utilitaire d'affichage, sans gestion d'événements.

- **StatusBar** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StatusBar.new(x: any, y: any, width: any, height: any, bgColor: any, valueColor: any, markerSize: any, custom_mt: any)` | 16 | ✍ Crée une barre en x, y avec la taille, la couleur de fond et la couleur de valeur données (tables de couleurs dépaquetées). Une table markerSize {l, h} ajoute un marqueur centré sur le bord du remplissage. Démarre à la valeur 0. |
| `StatusBar:delete()` | 50 | ✍ Supprime les overlays de fond, de valeur et de marqueur qui existent. |
| `StatusBar:setDisabled(isDisabled: any)` | 64 | ✍ Définit l'état désactivé ; tant qu'il est actif, seul le fond est affiché. |
| `StatusBar:setPosition(x: any, y: any)` | 70 | ✍ Déplace la barre et ses overlays en x, y, en gardant le marqueur centré verticalement. À noter : le marqueur va au bord gauche de la barre, pas à la position de la valeur, jusqu'au prochain appel de setValue. |
| `StatusBar:setColor(r: any, g: any, b: any, a: any)` | 86 | ✍ Définit la couleur du remplissage et du marqueur ; le fond garde sa couleur. |
| `StatusBar:setValue(newValue: any)` | 97 | ✍ Stocke la valeur bornée à 0..1, redimensionne le remplissage et déplace le marqueur. À noter : la largeur de l'overlay et le marqueur utilisent newValue non borné, donc une valeur hors plage dépasse de la barre. |
| `StatusBar:render()` | 108 | ✍ Dessine le fond, puis le remplissage et le marqueur sauf si la barre est désactivée. |
