# gui/base/RoundStatusBar.lua

*[English version](../../../../scripts/gui/base/RoundStatusBar.md)*

Source: `dataS/scripts/gui/base/RoundStatusBar.lua` — FS25 1.25.1.0

✍ Barre de progression circulaire (anneau) composée de plusieurs overlays de tranches : deux demi-anneaux de fond, deux demi-anneaux de valeur tournés selon la valeur, un overlay avant optionnel et un marqueur optionnel au bout de la progression. Les overlays sont créés via `g_overlayManager`. Élément de HUD côté client.

- **RoundStatusBar** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RoundStatusBar.new(frontSliceId: any, valueSliceId: any, markerSliceId: any, x: any, y: any, width: any, height: any, valueWidth: any, valueHeight: any, radius: any, color: any, bgColor: any, valueColor: any, markerSize: any, custom_mt: any)` | 17 | ✍ Crée la barre à partir d'identifiants de tranches, position, tailles, rayon et couleurs, puis fixe la valeur à 0. À noter : `overlayFront` n'est jamais affecté (l'overlay avant est stocké dans `overlayBackground`) et le marqueur utilise l'id de tranche de valeur, pas celui du marqueur. |
| `RoundStatusBar:delete()` | 61 | ✍ Supprime les overlays avant, de fond, de valeur et de marqueur existants. À noter : l'overlay avant étant stocké dans `overlayBackground`, il n'est jamais supprimé. |
| `RoundStatusBar:setPosition(x: any, y: any)` | 84 | ✍ Déplace la barre (nil conserve une coordonnée) et repositionne les overlays de l'anneau avec leur décalage de centrage et l'overlay avant si `overlayFront` existe. Le marqueur n'est pas déplacé ici. |
| `RoundStatusBar:setValue(newValue: any)` | 99 | ✍ Borne la valeur entre 0 et 1, fait tourner les demi-anneaux de valeur et de fond en conséquence et place le marqueur sur l'ellipse définie par `radius`. |
| `RoundStatusBar:render()` | 113 | ✍ Dessine les couches dans l'ordre, selon que la valeur dépasse la moitié : fonds, moitiés de valeur, puis l'overlay avant et le marqueur s'ils existent. |
