---@meta
-- FS25 1.25.1.0 : graphics/HumanModel.lua (generated stub, FS25 Lua Atlas)

--- Wraps the 3D model of a human character: it loads the i3d file referenced by a player XML, finds the skeleton, mesh, hand, foot, head, hips, spine and suspension nodes, and links them into the scene. It also creates the swim and plunge particle nodes and keeps the style part nodes (hair, top, footwear...). Many methods (reset, applyFromStyle, updateVisibility, loadIKChains, loadFromStyleAsync...) are called here but absent from this dump (UNVERIFIED).
---@class HumanModel
HumanModel = {}

--- Registers on the given schema the XML paths read by this class: i3d mappings, the model nodes (mesh, skeleton, animationRoot, hips, suspension, hands, feet, head, spine plus spine offset), and the sounds and animation file names.
---@param xmlSchema XMLSchema
---@param baseKey string
function HumanModel.registerXMLPaths(xmlSchema, baseKey) end

--- Creates an empty model with loading flags false, all node references nil, empty tables for model parts, clip mappings, IK chains, i3d mappings and components, and an empty swim/plunge particle information table.
---@param customMt any
---@return table
function HumanModel.new(customMt) end

--- Opens the player XML file and loads the model from it asynchronously, closing the XML at the end. If the XML cannot be opened, the callback is called at once with false. Otherwise it receives a HumanModelLoadingState value, not a boolean.
---@param xmlFilename string
---@param isRealPlayer boolean
---@param isOwner boolean
---@param isAnimated boolean
---@param asyncCallbackFunction function
---@param asyncCallbackObject table
---@param asyncCallbackArguments table
function HumanModel:load(xmlFilename, isRealPlayer, isOwner, isAnimated, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

--- Starts the async load from an already opened XML: stores the file name, resolves the i3d path, releases earlier shared i3d requests and requests the new one; loadFileFinished runs on completion. The caller stays responsible for closing the XML.
---@param xmlFile XMLFile
---@param isRealPlayer boolean
---@param isOwner boolean
---@param isAnimated boolean
---@param asyncCallbackFunction function
---@param asyncCallbackObject table
---@param asyncCallbackArguments table
function HumanModel:loadFromXMLFileAsync(xmlFile, isRealPlayer, isOwner, isAnimated, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

--- Completion callback of the i3d load. Reports FAILED if the i3d or XML is gone. Otherwise resets, reads components, mappings, animation and sound file names and body nodes, then links the skeleton (for a real player, also creates swim and plunge particle systems). Reports INVALID_CONTENT if a real player has no animation root, else OK.
---@param rootNode any
---@param failedReason any
---@param arguments any
function HumanModel:loadFileFinished(rootNode, failedReason, arguments) end

--- Called when every style part is loaded: applies the style unless the model was deleted meanwhile, marks the style loaded, deletes the temporary part nodes, then fires the one-shot finish callback with OK or FAILED.
---@param playerStyle any
function HumanModel:onAllModelPartsLoaded(playerStyle) end

--- Returns the engine visibility of the model's root node.
---@return boolean
function HumanModel:getVisibility() end

--- Stores the requested visibility and calls updateVisibility (defined elsewhere, UNVERIFIED) to apply it.
---@param isVisible boolean
function HumanModel:setVisibility(isVisible) end

--- Draws the skeleton as red debug lines from bone to bone, recursively from the first child of the skeleton node. The x, y and textSize parameters are unused and nothing is returned.
---@param x number
---@param y number
---@param textSize number
---@return number
function HumanModel:debugDraw(x, y, textSize) end
