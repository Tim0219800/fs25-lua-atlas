# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua` — FS25 1.25.1.0

✍ Central manager of the Precision Farming environmental score. It owns one score object per criterion (herbicide, nitrogen, pH, soil sampling, tillage), loads them from the map XML (scoreValues.scoreValue entries with id, name, className, maxScore), saves and syncs their per-farmland data, draws the score window in the map frame and on farmland hotspots, and hooks CoverMap and SellingStation to track harvests and to add a bonus or penalty to sales revenue.

- **EnvironmentalScore** (l.30)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScore.new(pfModule: any, customMt: any)` | 34 | ✍ Constructor. Creates the five score objects, registers two money change types (reward and penalty), prepares the UI overlays and sizes, and subscribes to PERIOD_CHANGED and the colorblind setting. |
| `EnvironmentalScore:delete()` | 107 | ✍ Deletes the four overlays and unsubscribes this object from all message center subscriptions. |
| `EnvironmentalScore:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 118 | ✍ Reads the scoreValues list from the map XML. Each entry needs an id, a name and a className matching one of the score objects; valid ones get a maxScore (default 10) and a starting score at half of it. Warns about missing fields. |
| `EnvironmentalScore:loadFromItemsXML(xmlFile: any, key: any)` | 167 | ✍ Savegame loading: forwards to each score object and restores the harvestedStates table (farmland id to state) from the environmentalScore section. |
| `EnvironmentalScore:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 188 | ✍ Savegame writing: lets each score object save its data under the environmentalScore key, then writes every farmland id with its harvested state. |
| `EnvironmentalScore:readStream(streamId: integer, connection: Connection, farmId: any)` | 210 | ✍ Client side network read; simply delegates to each score object's readStream in order. |
| `EnvironmentalScore:writeStream(streamId: integer, connection: Connection, farmId: any)` | 223 | ✍ Server side network write for one farm; delegates to each score object's writeStream in the same order as readStream. |
| `EnvironmentalScore:update(dt: any)` | 234 | ✍ Per-frame update. Animates the map frame score window (expands while hovered or forced open), refreshes the UI at an interval, and shows a delayed money-change popup once sales revenue has settled for about one second. |
| `EnvironmentalScore:toggleWindowSize(state: any)` | 288 | ✍ Sets the forced-expanded state of the score window; with no argument it flips the current value. |
| `EnvironmentalScore:setMapFrame(mapFrame: any)` | 298 | ✍ Stores the map frame, remembers the base window size, applies the gradient slice for the colorblind setting to both score bars and refreshes the input glyphs. |
| `EnvironmentalScore:onEnvScoreDetailsButton()` | 312 | ✍ Input callback for the details button; toggles the score window size. |
| `EnvironmentalScore:updateInputGlyphs()` | 318 | ✍ Updates the SWITCH_IMPLEMENT glyph and, in gamepad help mode only, registers the action event that toggles the window; otherwise removes this target's action events. |
| `EnvironmentalScore:onMapFrameOpen(mapFrame: any)` | 333 | ✍ Called when the map frame opens. A pure client asks the server for the score of its farm through RequestEnvironmentalScoreEvent, and the score window is hidden for spectators. |
| `EnvironmentalScore:onHarvestScoreReset(farmlandId: any)` | 346 | ✍ Notifies every score object that supports it that the harvest scoring period of a farmland is over so it can reset on next use. |
| `EnvironmentalScore:getFarmlandScore(farmlandId: any)` | 357 | ✍ Returns the summed score of one farmland, each criterion's 0 to 1 score multiplied by its maxScore. |
| `EnvironmentalScore:getTotalScoreFromValue(scoreValue: any, farmId: any)` | 368 | ✍ Returns one criterion's score for a farm, averaged over its farmlands weighted by field area. Falls back to half of maxScore if no valid farmland exists. |
| `EnvironmentalScore:getTotalScore(farmId: any)` | 402 | ✍ Returns the farm-wide total score (sum over criteria, area-weighted over owned farmlands). Gives 50 for spectators or when the farm has no field area. |
| `EnvironmentalScore:updateUI()` | 447 | ✍ Refreshes the map frame widgets: total score number, gradient bar and indicator, per-criterion bars and values, and the sell-price info text. Note: calls getSellPriceFactor, which is not defined in this dump, so its behaviour is UNVERIFIED. |
| `EnvironmentalScore:onDraw(element: any, ingameMap: any)` | 483 | ✍ Draw hook for the in-game map. For each farmland hotspot visible on screen it computes the map position and draws the field score box, except for spectators. |
| `EnvironmentalScore:onDrawFieldNumber(element: any, ingameMap: any, x: any, y: any, farmland: any)` | 503 | ✍ Draws the score box only for farmlands with a non-trivial field area that belong to the local player's farm. |
| `EnvironmentalScore:drawFarmlandScore(x: any, y: any, dataKey: any, farmlandId: any, zoom: any)` | 514 | ✍ Renders the farmland score panel: fades with map zoom, grows while hovered, and draws icon, numeric score, gradient bar with indicator and, when fully expanded, one small bar per criterion. |
| `EnvironmentalScore:onPeriodChanged(currentPeriod: any)` | 599 | ✍ On each period change, farmlands harvested one period ago (state 2) are reset and notified, and freshly harvested ones (state 1) advance to state 2. |
| `EnvironmentalScore:setColorBlindMode()` | 614 | ✍ Reacts to the colorblind setting: switches the gradient slice on overlays and map frame bars, then refreshes the UI. |
| `EnvironmentalScore:overwriteGameFunctions(pfModule: any)` | 629 | ✍ Installs hooks through pfModule. CoverMap.preUpdateCoverArea marks the farmland as harvested (state 1); SellingStation.sellFillType adds a bonus or penalty to the sale price and shows it as a delayed money change. Also forwards to the score objects. |

## Messages

- subscribes `MessageType.PERIOD_CHANGED` (l.99)
- subscribes `MessageType.SETTING_CHANGED` (l.100)
