# gui/elements/PlatformIconElement.lua

*[Version française](../../../fr/scripts/gui/elements/PlatformIconElement.md)*

Source: `dataS/scripts/gui/elements/PlatformIconElement.lua` — FS25 1.25.1.0

✍ Bitmap element that shows the icon of a gaming platform (identified by a PlatformId) by selecting an image slice. On PS5, Xbox Series and Microsoft Store builds only the icon of the same platform is shown; others fall back to a generic slice. The PlatformId, SLICES and ALLOW_COLOR_CHANGE tables are defined elsewhere (UNVERIFIED).

- **PlatformIconElement** inherits from `BitmapElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlatformIconElement.new(target: any, custom_mt: any)` | 20 | ✍ Constructor. Builds a BitmapElement and returns it with no extra fields. |
| `PlatformIconElement:delete()` | 28 | ✍ Deletes the element by calling the parent delete; no extra cleanup. |
| `PlatformIconElement:copyAttributes(src: any)` | 34 | ✍ Copies the platformId from a source element after the base copy. |
| `PlatformIconElement:setPlatformId(platformId: any)` | 42 | ✍ Selects the icon slice for a platform id, replacing it with 0 (generic) when the current platform only allows its own icon. Backs up and neutralizes the selected color for platforms not allowing color change. Note: the source comment mentions a terrain layer, which looks like a copy-paste leftover. |
