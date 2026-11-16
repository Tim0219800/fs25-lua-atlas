# gui/elements/SafeFrameElement.lua

*[English version](../../../../scripts/gui/elements/SafeFrameElement.md)*

Source: `dataS/scripts/gui/elements/SafeFrameElement.lua` — FS25 1.25.1.0

✍ Élément d'interface minimal qui remplit tout l'écran de noir opaque. Il sert de toile de fond derrière certains écrans pour que le jeu ne soit pas visible lorsque l'interface est décalée par les marges de zone de sécurité. Il étend GuiElement et s'appelle safeFrame.

- **SafeFrameElement** hérite de `GuiElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SafeFrameElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructeur. Crée un GuiElement et fixe son nom à "safeFrame". |
| `SafeFrameElement:draw()` | 29 | ✍ Dessine un rectangle noir couvrant tout l'écran normalisé (0,0 à 1,1). Ignore les limites de clipping et ne dessine pas les enfants. |
