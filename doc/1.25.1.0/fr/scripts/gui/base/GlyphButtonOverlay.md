# gui/base/GlyphButtonOverlay.lua

*[English version](../../../../scripts/gui/base/GlyphButtonOverlay.md)*

Source: `dataS/scripts/gui/base/GlyphButtonOverlay.lua` — FS25 1.25.1.0

✍ Sous-classe minimale de ButtonOverlay utilisée pour les icônes de boutons de manette. Le fichier ne définit qu'un constructeur et n'ajoute aucun comportement propre ; tout le reste vient de ButtonOverlay (défini ailleurs).

- **GlyphButtonOverlay** hérite de `ButtonOverlay` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GlyphButtonOverlay.new(customMt: table?) → GlyphButtonOverlay` | 18 | ✍ Crée un GlyphButtonOverlay via ButtonOverlay.new. À noter : l'argument customMt est ignoré et la métatable de la classe est toujours transmise au constructeur parent, donc l'héritage par ce biais ne fonctionne pas. |
