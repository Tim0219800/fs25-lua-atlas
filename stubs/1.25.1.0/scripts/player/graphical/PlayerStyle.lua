---@meta
-- FS25 1.25.1.0 : player/graphical/PlayerStyle.lua (generated stub, FS25 Lua Atlas)

--- Holds the look of a player avatar: one PlayerStyleConfig per slot (hair, glasses, headgear, face, beard, top, gloves, bottom, footwear, onepiece and so on), plus presets, attach points and body parts read from the player XML. It can be copied between instances and serialised for multiplayer. Large parts of the file body are absent from the SDK dump, so only the listed functions are documented here.
---@class PlayerStyle
PlayerStyle = {}

--- Constructor. Creates the empty style, registers all the configs with their getter filters, aligns the hair colours and starts with face item 1 and hair style item 2 selected.
---@param customMt any
---@return table
function PlayerStyle.new(customMt) end

--- Writes the style to a network stream: the network-converted XML filename, then each config in order. Must be read back with readStream in the same order.
---@param streamId integer
---@param connection table
function PlayerStyle:writeStream(streamId, connection) end

--- Reads the style from a network stream. Loads the configuration if still needed (selections are sent by name), reads each config, refreshes the disabled options and unifies the hair colours.
---@param streamId integer
---@param connection table
function PlayerStyle:readStream(streamId, connection) end

--- Copies both configuration and selection from another style. If the source has its configuration loaded, shared tables (presets, body parts, hat hair index) are referenced rather than deep-copied; otherwise this style is flagged as not loaded.
---@param other PlayerStyle
function PlayerStyle:copyFrom(other) end

--- Copies only the configuration (filenames, attach points, body parts, presets, config items) from another style, leaving the selection untouched. Logs an error and does nothing if the source is not yet loaded.
---@param other PlayerStyle
function PlayerStyle:copyConfigurationFrom(other) end

--- Copies only the selection of each config from another style. The configuration stays flagged as loaded only if both styles use the same XML file. Hair colours are unified afterwards.
---@param other PlayerStyle
function PlayerStyle:copySelectionFrom(other) end

--- Loads the style from a player XML (keys under player.playerStyle: colors, attachPoints, configs, bodyParts, presets). Reuses an already loaded style if possible, falls back to a default file on failure and tries to keep the previous selection by name, then by index. Invalid or duplicate presets are rejected with a log message.
---@param xmlFilename any
function PlayerStyle:loadConfigurationXML(xmlFilename) end

--- Draws debug text on screen: whether the configuration is loaded, the XML filename and the selected item and colour index of each config. Returns the y position after the last line.
---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerStyle:debugDraw(x, y, textSize) end
