# gui/base/GlyphButtonOverlay.lua

*[Version française](../../../fr/scripts/gui/base/GlyphButtonOverlay.md)*

Source: `dataS/scripts/gui/base/GlyphButtonOverlay.lua` — FS25 1.25.1.0

✍ Minimal subclass of ButtonOverlay used for gamepad button glyph icons. The file defines only a constructor and adds no behaviour of its own; everything else comes from ButtonOverlay (defined elsewhere).

- **GlyphButtonOverlay** inherits from `ButtonOverlay` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `GlyphButtonOverlay.new(customMt: table?) → GlyphButtonOverlay` | 18 | ✍ Creates a GlyphButtonOverlay by calling ButtonOverlay.new. Note: the customMt argument is ignored and the class metatable is always passed to the parent constructor, so subclassing through it does not work. |
