# misc/Color.lua

Source : `dataS/scripts/misc/Color.lua` — FS25 1.25.1.0

- **Color** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Color_mt.__index(color: Color, key: string) → any` | 19 |  |
| `Color_mt.__mul(left: (table\|number\|Color), right: (table\|number\|Color)) → Color` | 55 |  |
| `Color.new(r: number, g: number, b: number, a: number?) → Color` | 101 |  |
| `Color:copy() → Color` | 129 |  |
| `Color:copyTo(color: Color)` | 136 |  |
| `Color.parseFromString(inputString: string, ignoreAlpha: boolean?) → Color` | 145 |  |
| `Color.fromPresetName(presetName: string) → Color` | 203 |  |
| `Color.fromPackedValue(packedValue: integer) → Color` | 218 |  |
| `Color:toPackedValue() → integer` | 243 |  |
| `Color.fromHex(hexString: string) → Color` | 257 |  |
| `Color:toHex(includeHash: boolean) → string` | 283 |  |
| `Color.fromVector(vector: table, minLength: integer?, maxLength: integer?) → Color` | 295 |  |
| `Color:unpack() → number, number, number, number` | 315 |  |
| `Color:unpack3() → number, number, number` | 324 |  |
| `Color:toVector3() → table` | 331 |  |
| `Color:toVector4() → table` | 338 |  |
| `Color.fromRGBA(r: integer, g: integer, b: integer, a: integer?) → Color` | 349 |  |
| `Color:unpackRGBA() → integer, integer, integer, integer` | 359 |  |
| `Color.fromVectorRGBA(vector: table, minLength: integer?, maxLength: integer?) → Color` | 369 |  |
| `Color:toVectorRGB() → table` | 386 |  |
| `Color:toVectorRGBA() → table` | 393 |  |
| `Color.blend(first: Color, second: Color, alpha: number) → Color` | 403 |  |
| `Color:swizzle(key: string) → table` | 414 |  |
| `Color.writeStreamRGB(streamId: integer, r: number, g: number, b: number)` | 449 |  |
