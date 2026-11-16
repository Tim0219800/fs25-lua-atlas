# player/graphical/PlayerStyle.lua

*[Version française](../../../fr/scripts/player/graphical/PlayerStyle.md)*

Source: `dataS/scripts/player/graphical/PlayerStyle.lua` — FS25 1.25.1.0

✍ Holds the look of a player avatar: one PlayerStyleConfig per slot (hair, glasses, headgear, face, beard, top, gloves, bottom, footwear, onepiece and so on), plus presets, attach points and body parts read from the player XML. It can be copied between instances and serialised for multiplayer. Large parts of the file body are absent from the SDK dump, so only the listed functions are documented here.

- **PlayerStyle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStyle.new(customMt: any) → table` | 112 | ✍ Constructor. Creates the empty style, registers all the configs with their getter filters, aligns the hair colours and starts with face item 1 and hair style item 2 selected. |
| `PlayerStyle:writeStream(streamId: integer, connection: table)` | 166 | ✍ Writes the style to a network stream: the network-converted XML filename, then each config in order. Must be read back with readStream in the same order. |
| `PlayerStyle:readStream(streamId: integer, connection: table)` | 178 | ✍ Reads the style from a network stream. Loads the configuration if still needed (selections are sent by name), reads each config, refreshes the disabled options and unifies the hair colours. |
| `PlayerStyle:copyFrom(other: PlayerStyle)` | 203 | ✍ Copies both configuration and selection from another style. If the source has its configuration loaded, shared tables (presets, body parts, hat hair index) are referenced rather than deep-copied; otherwise this style is flagged as not loaded. |
| `PlayerStyle:copyConfigurationFrom(other: PlayerStyle)` | 245 | ✍ Copies only the configuration (filenames, attach points, body parts, presets, config items) from another style, leaving the selection untouched. Logs an error and does nothing if the source is not yet loaded. |
| `PlayerStyle:copySelectionFrom(other: PlayerStyle)` | 290 | ✍ Copies only the selection of each config from another style. The configuration stays flagged as loaded only if both styles use the same XML file. Hair colours are unified afterwards. |
| `PlayerStyle:loadConfigurationXML(xmlFilename: any)` | 320 | ✍ Loads the style from a player XML (keys under player.playerStyle: colors, attachPoints, configs, bodyParts, presets). Reuses an already loaded style if possible, falls back to a default file on failure and tries to keep the previous selection by name, then by index. Invalid or duplicate presets are rejected with a log message. |
| `PlayerStyle:debugDraw(x: number, y: number, textSize: number) → number` | 700 | ✍ Draws debug text on screen: whether the configuration is loaded, the XML filename and the selected item and colour index of each config. Returns the y position after the last line. |
