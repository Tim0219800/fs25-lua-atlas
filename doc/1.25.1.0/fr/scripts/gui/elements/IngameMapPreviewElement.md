# gui/elements/IngameMapPreviewElement.lua

*[English version](../../../../scripts/gui/elements/IngameMapPreviewElement.md)*

Source: `dataS/scripts/gui/elements/IngameMapPreviewElement.lua` — FS25 1.25.1.0

✍ IngameMapPreviewElement est une petite sous-classe de GuiElement qui ne fait que restaurer la mini-carte partagée à sa fermeture. Elle attend un champ ingameMap (défini ailleurs, NON VÉRIFIÉ) et annule la disposition personnalisée, le clipping des hotspots et la zone de découpe appliqués pour un aperçu de carte.

- **IngameMapPreviewElement** hérite de `GuiElement` (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IngameMapPreviewElement:onClose()` | 62 | ✍ Appelle le onClose du parent, puis réinitialise la carte : disposition personnalisée à nil, clipHotspots à false et zone de découpe effacée. |
