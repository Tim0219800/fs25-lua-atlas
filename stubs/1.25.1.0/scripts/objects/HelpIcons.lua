---@meta
-- FS25 1.25.1.0 : objects/HelpIcons.lua (generated stub, FS25 Lua Atlas)

--- Manages the collectable help icons placed on a map: a root node whose children are trigger nodes, each holding an icon child. Entering a trigger with the local player's vehicle hides the icon, stores the found state in the savegame mission info and shows an in-game message from the i18n texts helpIcon_title and helpIcon_text.
---@class HelpIcons
HelpIcons = {}

--- Map callback for an i3d node: builds the HelpIcons object, adds it to the non-updateables of the mission and stores it in g_currentMission.helpIconsBase.
---@param id integer
function HelpIcons:onCreate(id) end

--- Constructor. For each child of the node, takes the first grandchild as icon, reads the customNumber user attribute (default 0), adds a trigger with triggerCallback and records the entry. Starts visible.
---@param name integer
---@return table
function HelpIcons.new(name) end

--- Removes the triggers of all help icons.
function HelpIcons:delete() end

--- Trigger callback, enter only and local player only. Requires the player to be in a vehicle that matches the entering node. Hides that icon, disables its trigger, rebuilds the foundHelpIcons string ('1' for found, '0' for visible) and shows the message numbered by customNumber or by index.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function HelpIcons:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Shows or hides all icons. Unless clearIconStates is true, an icon is shown only if its entry in foundHelpIcons is '0'. Sets the trigger collision mask to 3145728 for visible icons and 0 otherwise.
---@param visible boolean
---@param clearIconStates boolean
function HelpIcons:showHelpIcons(visible, clearIconStates) end

--- Hides the icon with the given index and disables its trigger collision mask. Does nothing if the index does not exist.
---@param i integer
function HelpIcons:deleteHelpIcon(i) end
