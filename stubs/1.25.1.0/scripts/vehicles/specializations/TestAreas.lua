---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TestAreas.lua (generated stub, FS25 Lua Atlas)

--- Helper specialization (requires WorkArea) that adds 'test areas' to work areas: small ground rectangles checked for crops or fill material so other specializations know where the tool actually has contact. Areas come from XML or are auto-generated across the work area width. The server samples the density maps and syncs contact flags to clients as a compact first/last-contact stream. It exposes the contact width and a charge ratio per work area.
---@class TestAreas
TestAreas = {}

--- Registers the XML schema for testAreas under work areas and work area configurations: auto-generate, root/start/width nodes, offsets, length, count (10), width scale (0.9), scale, and explicit testArea nodes.
function TestAreas.initSpecialization() end

--- Returns true only if the vehicle type also has the WorkArea specialization.
---@param specializations any
function TestAreas.prerequisitesPresent(specializations) end

--- Registers the stream read/write, generation, dimension calculation, registration, requirements, activity, processing and width/charge query functions.
---@param vehicleType any
function TestAreas.registerFunctions(vehicleType) end

--- Overrides loadWorkAreaFromXML.
---@param vehicleType any
function TestAreas.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPreLoad, onPostLoad, the four stream events (read/write, plain and update) and onUpdateTick.
---@param vehicleType any
function TestAreas.registerEventListeners(vehicleType) end

--- Creates the test area lists and reserves a dirty flag used to sync contact changes.
---@param savegame any
function TestAreas:onPreLoad(savegame) end

--- Builds the lookup of test areas by work area index from the by-work-area table.
---@param savegame any
function TestAreas:onPostLoad(savegame) end

--- Initial sync on join: reads the contact flags.
---@param streamId any
---@param connection any
function TestAreas:onReadStream(streamId, connection) end

--- Initial sync on join: writes the contact flags.
---@param streamId any
---@param connection any
function TestAreas:onWriteStream(streamId, connection) end

--- Client side: reads the contact flags when the server flagged a change in this update.
---@param streamId any
---@param timestamp any
---@param connection any
function TestAreas:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes a bool for the dirty flag and, if set, the contact flags.
---@param streamId any
---@param connection any
---@param dirtyMask any
function TestAreas:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads the compact contact state: first-contact scan from the left, then last-contact scan from the right, and marks every area between them as in contact.
---@param streamId any
---@param connection any
function TestAreas:readTestAreasStream(streamId, connection) end

--- Writes the compact contact state: bools up to the first contact from the left, then from the right up to the last contact.
---@param streamId any
---@param connection any
function TestAreas:writeTestAreasStream(streamId, connection) end

--- For each active work area, tests areas from the left to find the first contact, then from the right for the last, fills the area in between as in contact, and stores the resulting min/max width. Inactive areas reset to unlimited width.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function TestAreas:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Override: after the parent loads the work area, reads its testAreas settings (warns where the platform disallows them), then auto-generates areas or reads explicit testArea entries. Returns false if the parent fails.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function TestAreas:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Creates transform nodes and splits the work area width into numAreas equal test areas (with side offsets, length and z offset), registering each one.
---@param workArea any
function TestAreas:generateTestAreasForWorkArea(workArea) end

--- Computes the test area's min/max X relative to the work area root node and widens the work area's overall X range.
---@param workArea any
---@param testArea any
function TestAreas:calculateTestAreaDimensions(workArea, testArea) end

--- Resets the contact flags of a test area and adds it to the per-work-area list and the global list.
---@param workArea any
---@param testArea any
function TestAreas:registerTestAreaForWorkArea(workArea, testArea) end

--- Sets what the areas look for: a fruit type (with optional forage growth states) or a fill type; FruitType.UNKNOWN and FillType.UNKNOWN count as none.
---@param fruitTypeIndex any
---@param fillTypeIndex any
---@param allowsForageGrowthState any
function TestAreas:setTestAreaRequirements(fruitTypeIndex, fillTypeIndex, allowsForageGrowthState) end

--- Hook returning true by default; other specializations may override it to disable an individual area.
---@param testArea any
function TestAreas:getIsTestAreaActive(testArea) end

--- Server: samples the density map (fruit area or height fill level) under the area and sets its contact flag, raising the dirty flag on change. Clients only draw debug. Returns the area's current contact state.
---@param testArea any
function TestAreas:processTestArea(testArea) end

--- Returns current contact min/max X, total min/max X and true when the work area has test areas; otherwise half-width bounds and false, or unlimited values if the index is unknown.
---@param workAreaIndex any
function TestAreas:getTestAreaWidthByWorkAreaIndex(workAreaIndex) end

--- Returns the fraction (0 to 1) of the work area's test areas currently in contact, or 1 when it has none.
---@param workAreaIndex any
function TestAreas:getTestAreaChargeByWorkAreaIndex(workAreaIndex) end
