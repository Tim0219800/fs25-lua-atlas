---@meta
-- FS25 1.25.1.0 : objects/TourIconsMobile.lua (generated stub, FS25 Lua Atlas)

--- Scripted guided tour for the mobile-style tutorial, created from a map node whose children are the tour step triggers, each with an icon child. It shows one icon at a time with a map hotspot, waits for scripted conditions on the tour vehicles stored in `g_currentMission.tourVehicles` (harvesting, cultivating, sowing, trailer, selling), and pops up info dialogs with localized texts. Update runs on the mission updateable list; the tour ends by publishing `GUIDED_TOUR_FINISHED` and deleting itself.
---@class TourIconsMobile
TourIconsMobile = {}

--- i3d onCreate callback: creates the tour object for the node, adds it to the mission updateables and stores it in `g_currentMission.tourIconsBase`.
---@param id integer
function TourIconsMobile:onCreate(id) end

--- Constructor: for each child of the node registers a trigger (callback `triggerCallback`, which is not defined in this file, UNVERIFIED) and hides its icon, then initializes the tour state and reads the plow and lime density map maximum values.
---@param id integer
---@return table
function TourIconsMobile.new(id) end

--- Removes the object from the mission updateables, removes all step triggers and deletes the root node.
function TourIconsMobile:delete() end

--- Shows a yes/no dialog asking whether to start the tour, answered via `reactToDialog`.
function TourIconsMobile:showTourDialog() end

--- Dialog callback: on yes, shows the tour and activates the first icon and hides the ordinary help icons; on no, shows an abort info dialog and deletes the tour object.
---@param yes boolean
function TourIconsMobile:reactToDialog(yes) end

--- Per-frame logic: on a new savegame on the server it fades the screen and allows the start dialog (field preparation is commented out and logs a dev warning), delays queued messages while a GUI is open, and for specific step numbers checks tour vehicle conditions to pause then advance to the next icon.
---@param dt number
function TourIconsMobile:update(dt) end

--- Shows the given icon, creates or moves the tour map hotspot to its position, and sets it as the map target only when the icon is above the terrain height.
---@param tourIconId integer
function TourIconsMobile:makeIconVisible(tourIconId) end

--- Hides earlier icons and clears their trigger masks, shows the next icon or ends the tour (removes the hotspot, restores help icons, publishes `GUIDED_TOUR_FINISHED`, deletes itself), turns cruise control off, and shows the localized instruction text for the current step in a dialog or queues it, then increments the step.
function TourIconsMobile:activateNextIcon() end
