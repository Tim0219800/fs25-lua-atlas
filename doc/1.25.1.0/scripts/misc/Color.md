# misc/Color.lua

*[Version française](../../fr/scripts/misc/Color.md)*

Source: `dataS/scripts/misc/Color.lua` — FS25 1.25.1.0

✍ RGBA colour value class with channels from 0 to 1. It converts to and from packed 32-bit integers, hex strings, vectors, 0..255 RGBA values and named presets (Color.PRESETS is referenced but defined outside this file, UNVERIFIED). Its metatable adds numeric indexing (1 to 4), swizzling such as color.rgb, and multiplication with numbers, tables or other colours.

- **Color** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `Color_mt.__index(color: Color, key: string) → any` | 19 | ✍ Index metamethod: looks in the instance, then in the Color class, then maps numeric keys 1 to 4 to r, g, b, a, and finally tries swizzling the key (for example a string of channel letters). |
| `Color_mt.__mul(left: (table\|number\|Color), right: (table\|number\|Color)) → Color` | 55 | ✍ Multiplication metamethod. Two tables multiply their RGB channels (alpha too when both have it), a number scales all four channels; results are clamped to 0..1 and returned as a new Color. Other operand types raise Assert.fail. |
| `Color.new(r: number, g: number, b: number, a: number?) → Color` | 101 | ✍ Constructor taking r, g, b, a in 0..1; missing channels default to 0, alpha to 1 (solid black). Range checks exist only in debug builds. |
| `Color:copy() → Color` | 129 | ✍ Returns a new Color with the same four channels. |
| `Color:copyTo(color: Color)` | 136 | ✍ Writes this colour's four channels into an existing Color, overwriting it. |
| `Color.parseFromString(inputString: string, ignoreAlpha: boolean?) → Color` | 145 | ✍ Parses a string into a Color or returns nil. The code tries, in this order: hex (starts with #), packed integer, space-separated vector of 3 or more numbers, brand colour via g_vehicleMaterialManager if present, then preset name. Note: the in-code doc lists a different order. ignoreAlpha forces alpha to 1. |
| `Color.fromPresetName(presetName: string) → Color` | 203 | ✍ Looks up a preset colour by name, case-insensitive (name uppercased, then read from Color.PRESETS); nil for non-strings or unknown names. |
| `Color.fromPackedValue(packedValue: integer) → Color` | 218 | ✍ Unpacks a 32-bit integer (or numeric string) into a Color, with red in the lowest byte and alpha in the highest, each divided by 255. Returns nil if it is not a number. |
| `Color:toPackedValue() → integer` | 243 | ✍ Packs the colour into a 32-bit integer (red lowest byte, alpha highest), each channel scaled by 255 and rounded up with math.ceil. |
| `Color.fromHex(hexString: string) → Color` | 257 | ✍ Builds a Color from a hex string with or without a leading #, interpreting it as the packed layout (not plain RRGGBB order). Returns nil for non-strings or unparsable text. |
| `Color:toHex(includeHash: boolean) → string` | 283 | ✍ Returns the packed value as a hex string, optionally prefixed with #. Note: the format is %x without zero padding, so the length can vary. |
| `Color.fromVector(vector: table, minLength: integer?, maxLength: integer?) → Color` | 295 | ✍ Builds a Color from an array of channels in 0..1. Returns nil if the argument is not a table or is shorter than minLength; entries beyond maxLength are replaced by defaults (0, alpha 1). |
| `Color:unpack() → number, number, number, number` | 315 | ✍ Returns r, g, b, a as four values in 0..1. |
| `Color:unpack3() → number, number, number` | 324 | ✍ Returns r, g, b as three values in 0..1. |
| `Color:toVector3() → table` | 331 | ✍ Returns a new array {r, g, b}. |
| `Color:toVector4() → table` | 338 | ✍ Returns a new array {r, g, b, a}. |
| `Color.fromRGBA(r: integer, g: integer, b: integer, a: integer?) → Color` | 349 | ✍ Builds a Color from 0..255 integers by dividing by 255; missing r, g, b default to 0 and alpha to 255. |
| `Color:unpackRGBA() → integer, integer, integer, integer` | 359 | ✍ Returns the four channels as integers 0..255, scaled by 255 and rounded up with math.ceil. |
| `Color.fromVectorRGBA(vector: table, minLength: integer?, maxLength: integer?) → Color` | 369 | ✍ Like fromVector but for 0..255 values: returns nil for an invalid or too short table, ignores entries beyond maxLength, then calls fromRGBA. |
| `Color:toVectorRGB() → table` | 386 | ✍ Returns a new array of three integers 0..255 (red, green, blue), rounded up. |
| `Color:toVectorRGBA() → table` | 393 | ✍ Returns a new array of four integers 0..255 (red, green, blue, alpha), rounded up. |
| `Color.blend(first: Color, second: Color, alpha: number) → Color` | 403 | ✍ Linear interpolation between two colours on all four channels via MathUtil.lerp; alpha 0 gives the first, 1 the second. Returns a new Color. |
| `Color:swizzle(key: string) → table` | 414 | ✍ Builds an array from a key of 1 to 4 channel letters (for example rg); returns nil if the key is not a string, has a bad length or contains a letter that is not a field of the colour. |
| `Color.writeStreamRGB(streamId: integer, r: number, g: number, b: number)` | 449 | ✍ Writes r, g, b to a network stream as three 10-bit unsigned values (each clamped to 0..1 and scaled by 1023); alpha is not sent. |
