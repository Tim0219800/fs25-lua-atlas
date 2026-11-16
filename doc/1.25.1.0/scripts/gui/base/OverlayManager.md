# gui/base/OverlayManager.lua

*[Version française](../../../fr/scripts/gui/base/OverlayManager.md)*

Source: `dataS/scripts/gui/base/OverlayManager.lua` — FS25 1.25.1.0

✍ Loads texture config XML files (image file, size, list of slices with UV rectangles) and creates `Overlay` objects from named slices, identified as "prefix.sliceId". Mods can pass a custom environment name that is prepended to the prefix. The `textureConfigs` table is initialised elsewhere (UNVERIFIED); the global instance is `g_overlayManager`.

- **OverlayManager** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `OverlayManager:addTextureConfigFile(filename: string, prefix: string, customEnv: string?)` | 34 | ✍ Reads the XML (texture.meta filename and size, texture.slices.slice entries with id and uvs) and registers slices under the prefix, with a warning and abort on missing data. Duplicate prefix is refused except during GUI reload. Note: early error returns skip `xmlFile:delete()`. |
| `OverlayManager:createOverlay(identifier: string, posX: number?, posY: number?, width: number?, height: number?, customEnv: string?) → Overlay?` | 153 | ✍ Splits "prefix.sliceId", finds the slice and returns a new `Overlay` with its image and UVs, at the given position (default 0) and size (default slice size). Returns nil with a warning if unknown. |
| `OverlayManager:getSliceInfoById(identifier: string, customEnv: string?) → table?` | 198 | ✍ Returns the stored slice table (id, size, UVs, file, image size) for "prefix.sliceId", or nil with a warning if the identifier or config is invalid. A nil identifier returns nil silently. |
| `OverlayManager:getConfigMetaData(configPrefix: string, customEnv: string?) → table?` | 238 | ✍ Returns a table {filename, imageSize} for a loaded config prefix, or nil with a warning if the prefix is nil or not loaded. |
