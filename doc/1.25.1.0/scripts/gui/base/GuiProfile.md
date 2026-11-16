# gui/base/GuiProfile.lua

*[Version française](../../../fr/scripts/gui/base/GuiProfile.md)*

Source: `dataS/scripts/gui/base/GuiProfile.lua` — FS25 1.25.1.0

✍ A named bag of string properties that styles GuiElements, similar to a CSS class. Profiles are read from XML, can inherit from a parent profile (extends) and merge reusable trait profiles (with), and values are resolved up the parent chain through g_gui. Values are stored as strings and converted on read.

- **GuiProfile** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiProfile.new(profiles: table, traits: table) → New` | 20 | ✍ Creates an empty profile holding references to the loaded profiles and traits tables, used later for inheritance lookups. |
| `GuiProfile:loadFromXML(xmlFile: integer, key: string, presets: table, isTrait: boolean?, isVariant: boolean?) → boolean` | 40 | ✍ Reads name, extends and with attributes, copies values from the listed traits, then loads each child element as a name/value pair, replacing $preset_ references from presets. Returns false without a name; raises an error if the profile extends itself; stops at a Variant element. |
| `GuiProfile:getValue(name: string, default: string) → string` | 118 | ✍ Returns the string value for a name, trying the name with the g_baseUIPostfix suffix first, then the plain name, then the parent profile. The literal string "nil" counts as unset; falls back to the default. |
| `GuiProfile:getBool(name: string, default: boolean) → boolean` | 157 | ✍ Reads a value through getValue and returns true only when it equals "true" (case-insensitive), otherwise false for any other string; returns the default when the value is unset. |
| `GuiProfile:getNumber(name: string, default: number) → number` | 173 | ✍ Reads a value through getValue and converts it with tonumber, which yields nil for a non-numeric string; returns the default when the value is unset. |
