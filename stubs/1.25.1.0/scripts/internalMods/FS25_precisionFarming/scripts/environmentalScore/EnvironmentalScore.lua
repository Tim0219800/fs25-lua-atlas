---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua (generated stub, FS25 Lua Atlas)

--- Central manager of the Precision Farming environmental score. It owns one score object per criterion (herbicide, nitrogen, pH, soil sampling, tillage), loads them from the map XML (scoreValues.scoreValue entries with id, name, className, maxScore), saves and syncs their per-farmland data, draws the score window in the map frame and on farmland hotspots, and hooks CoverMap and SellingStation to track harvests and to add a bonus or penalty to sales revenue.
---@class EnvironmentalScore
EnvironmentalScore = {}

--- Constructor. Creates the five score objects, registers two money change types (reward and penalty), prepares the UI overlays and sizes, and subscribes to PERIOD_CHANGED and the colorblind setting.
---@param pfModule any
---@param customMt any
function EnvironmentalScore.new(pfModule, customMt) end

--- Deletes the four overlays and unsubscribes this object from all message center subscriptions.
function EnvironmentalScore:delete() end

--- Reads the scoreValues list from the map XML. Each entry needs an id, a name and a className matching one of the score objects; valid ones get a maxScore (default 10) and a starting score at half of it. Warns about missing fields.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScore:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Savegame loading: forwards to each score object and restores the harvestedStates table (farmland id to state) from the environmentalScore section.
---@param xmlFile any
---@param key any
function EnvironmentalScore:loadFromItemsXML(xmlFile, key) end

--- Savegame writing: lets each score object save its data under the environmentalScore key, then writes every farmland id with its harvested state.
---@param xmlFile any
---@param key any
---@param usedModNames any
function EnvironmentalScore:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side network read; simply delegates to each score object's readStream in order.
---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScore:readStream(streamId, connection, farmId) end

--- Server side network write for one farm; delegates to each score object's writeStream in the same order as readStream.
---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScore:writeStream(streamId, connection, farmId) end

--- Per-frame update. Animates the map frame score window (expands while hovered or forced open), refreshes the UI at an interval, and shows a delayed money-change popup once sales revenue has settled for about one second.
---@param dt any
function EnvironmentalScore:update(dt) end

--- Sets the forced-expanded state of the score window; with no argument it flips the current value.
---@param state any
function EnvironmentalScore:toggleWindowSize(state) end

--- Stores the map frame, remembers the base window size, applies the gradient slice for the colorblind setting to both score bars and refreshes the input glyphs.
---@param mapFrame any
function EnvironmentalScore:setMapFrame(mapFrame) end

--- Input callback for the details button; toggles the score window size.
function EnvironmentalScore:onEnvScoreDetailsButton() end

--- Updates the SWITCH_IMPLEMENT glyph and, in gamepad help mode only, registers the action event that toggles the window; otherwise removes this target's action events.
function EnvironmentalScore:updateInputGlyphs() end

--- Called when the map frame opens. A pure client asks the server for the score of its farm through RequestEnvironmentalScoreEvent, and the score window is hidden for spectators.
---@param mapFrame any
function EnvironmentalScore:onMapFrameOpen(mapFrame) end

--- Notifies every score object that supports it that the harvest scoring period of a farmland is over so it can reset on next use.
---@param farmlandId any
function EnvironmentalScore:onHarvestScoreReset(farmlandId) end

--- Returns the summed score of one farmland, each criterion's 0 to 1 score multiplied by its maxScore.
---@param farmlandId any
function EnvironmentalScore:getFarmlandScore(farmlandId) end

--- Returns one criterion's score for a farm, averaged over its farmlands weighted by field area. Falls back to half of maxScore if no valid farmland exists.
---@param scoreValue any
---@param farmId any
function EnvironmentalScore:getTotalScoreFromValue(scoreValue, farmId) end

--- Returns the farm-wide total score (sum over criteria, area-weighted over owned farmlands). Gives 50 for spectators or when the farm has no field area.
---@param farmId any
function EnvironmentalScore:getTotalScore(farmId) end

--- Refreshes the map frame widgets: total score number, gradient bar and indicator, per-criterion bars and values, and the sell-price info text. Note: calls getSellPriceFactor, which is not defined in this dump, so its behaviour is UNVERIFIED.
function EnvironmentalScore:updateUI() end

--- Draw hook for the in-game map. For each farmland hotspot visible on screen it computes the map position and draws the field score box, except for spectators.
---@param element any
---@param ingameMap any
function EnvironmentalScore:onDraw(element, ingameMap) end

--- Draws the score box only for farmlands with a non-trivial field area that belong to the local player's farm.
---@param element any
---@param ingameMap any
---@param x any
---@param y any
---@param farmland any
function EnvironmentalScore:onDrawFieldNumber(element, ingameMap, x, y, farmland) end

--- Renders the farmland score panel: fades with map zoom, grows while hovered, and draws icon, numeric score, gradient bar with indicator and, when fully expanded, one small bar per criterion.
---@param x any
---@param y any
---@param dataKey any
---@param farmlandId any
---@param zoom any
function EnvironmentalScore:drawFarmlandScore(x, y, dataKey, farmlandId, zoom) end

--- On each period change, farmlands harvested one period ago (state 2) are reset and notified, and freshly harvested ones (state 1) advance to state 2.
---@param currentPeriod any
function EnvironmentalScore:onPeriodChanged(currentPeriod) end

--- Reacts to the colorblind setting: switches the gradient slice on overlays and map frame bars, then refreshes the UI.
function EnvironmentalScore:setColorBlindMode() end

--- Installs hooks through pfModule. CoverMap.preUpdateCoverArea marks the farmland as harvested (state 1); SellingStation.sellFillType adds a bonus or penalty to the sale price and shows it as a delayed money change. Also forwards to the score objects.
---@param pfModule any
function EnvironmentalScore:overwriteGameFunctions(pfModule) end
