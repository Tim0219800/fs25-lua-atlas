# gui/elements/TextBackdropElement.lua

*[Version française](../../../fr/scripts/gui/elements/TextBackdropElement.md)*

Source: `dataS/scripts/gui/elements/TextBackdropElement.lua` — FS25 1.25.1.0

✍ Bitmap element (derived from BitmapElement) meant to size itself around a child text element, with a four-value padding (left, top, right, bottom) read from the XML attribute or profile key padding. This file only handles loading and copying the padding; the resizing logic is not in it (UNVERIFIED).

- **TextBackdropElement** inherits from `BitmapElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TextBackdropElement.new(target: any, custom_mt: any)` | 18 | ✍ Constructor. Sets the padding to zero on all four sides. |
| `TextBackdropElement:loadFromXML(xmlFile: any, key: any)` | 28 | ✍ Loads the padding attribute from the XML node as normalised screen values after the parent class, keeping the current padding as default. |
| `TextBackdropElement:loadProfile(profile: any, applyProfile: any)` | 36 | ✍ Loads the padding value from the GUI profile as normalised screen values, keeping the current padding as default. |
| `TextBackdropElement:copyAttributes(src: any)` | 44 | ✍ Copies parent attributes and clones the padding table from the source. |
