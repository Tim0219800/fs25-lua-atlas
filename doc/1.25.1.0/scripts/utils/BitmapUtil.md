# utils/BitmapUtil.lua

*[Version française](../../fr/scripts/utils/BitmapUtil.md)*

Source: `dataS/scripts/utils/BitmapUtil.lua` — FS25 1.25.1.0

✍ Small utility for dumping pixel data to disk as portable anymap (PNM) images, mostly useful for debugging maps and density data. The format table BitmapUtil.FORMAT_TO_PNM used by both functions is not defined in the SDK dump (UNVERIFIED).

- **BitmapUtil** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BitmapUtil.writeBitmapToFile(pixels: table, width: integer, height: integer, filepath: string, imageFormat: integer) → boolean` | 58 | ✍ Writes a table of pixels to a PNM file, adding the format's extension to the path. Logs an error and returns false on an unknown format or if the file cannot be created; returns true after writing and logging. |
| `BitmapUtil.writeBitmapToFileFromIterator(iterator: function, width: integer, height: integer, filepath: string, imageFormat: integer) → boolean` | 107 | ✍ Like writeBitmapToFile but pulls pixels from an iterator function instead of a table, flushing to disk in chunks. Returns false on bad format or file creation failure, true on success. |
