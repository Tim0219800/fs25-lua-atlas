---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolTethered.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for tools bound to a holder by a tether, such as a pressure washer lance. It requires HandToolStorable. The tool is forced to mustBeHeld = true and canBeSaved = false, warns the local player when too far from the holder, and returns to the holder when the player goes beyond the maximum range, enters a vehicle or leaves the game.
---@class HandToolTethered
HandToolTethered = {}

--- Registers handTool.tethered XML keys: #warningText (l10n text), #actionRange (default 3 m) and #range (default 5 m, the distance at which the tool snaps back).
---@param xmlSchema any
function HandToolTethered.registerXMLPaths(xmlSchema) end

--- Registers showRangeWarning, returnToHolder and setAttachedHolder on the hand tool type.
---@param handToolType any
function HandToolTethered.registerFunctions(handToolType) end

--- Overrides setHolder on the type. Note: the parameter is named vehicleType in the source although it receives a hand tool type.
---@param vehicleType any
function HandToolTethered.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onCarryingPlayerEnteredVehicle, onCarryingPlayerLeftGame and onPreUpdate.
---@param handToolType any
function HandToolTethered.registerEventListeners(handToolType) end

--- Returns true only if the HandToolStorable specialization is present.
---@param specializations any
function HandToolTethered.prerequisitesPresent(specializations) end

--- Reads the warning text and the two ranges, forces mustBeHeld to true and canBeSaved to false (logging a warning if the XML type had other values) and creates an MD5 identifier used for the blinking warning.
---@param xmlFile any
---@param baseDirectory any
function HandToolTethered:onLoad(xmlFile, baseDirectory) end

--- Clears the spawnedHandTool reference on the attached holder, if any, so the holder no longer points to this tool.
function HandToolTethered:onDelete() end

--- While held by a player, measures the distance between the player and the holder node. Beyond the maximum range it calls returnToHolder; beyond the action range, for the local player only, it shows the range warning.
---@param dt any
function HandToolTethered:onPreUpdate(dt) end

--- Stores the holder this tool is tethered to. It can only be set once; a second call logs a dev warning and is ignored.
---@param holder any
function HandToolTethered:setAttachedHolder(holder) end

--- Event handler: sends the tool back to its holder when the carrying player leaves the game.
function HandToolTethered:onCarryingPlayerLeftGame() end

--- Event handler: sends the tool back to its holder when the carrying player enters a vehicle.
function HandToolTethered:onCarryingPlayerEnteredVehicle() end

--- Override of setHolder. A nil holder is replaced by the attached holder (and ignored if none), so a tethered tool can never be left without a holder. Then it calls the parent implementation.
---@param superFunc any
---@param holder any
---@param noEventSend any
function HandToolTethered:setHolder(superFunc, holder, noEventSend) end

--- Puts the tool back into its attached holder through setHolder; does nothing if no holder is attached. The noEventSend flag is passed through.
---@param noEventSend any
function HandToolTethered:returnToHolder(noEventSend) end

--- Shows a blinking on-screen warning with the remaining distance before the tool snaps back. Skipped when a GUI is visible or the warning text is empty.
---@param holderPlayerDistance any
function HandToolTethered:showRangeWarning(holderPlayerDistance) end
