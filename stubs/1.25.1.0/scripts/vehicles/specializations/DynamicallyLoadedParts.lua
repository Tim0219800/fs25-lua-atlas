---@meta
-- FS25 1.25.1.0 : vehicles/specializations/DynamicallyLoadedParts.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization with no prerequisites that loads extra i3D files at vehicle load time and attaches a chosen node from each one to a node of the vehicle (for example wheel chocks). Each part is declared under vehicle.dynamicallyLoadedParts in the vehicle XML. Loading goes through the shared i3D system and is asynchronous.
---@class DynamicallyLoadedParts
DynamicallyLoadedParts = {}

--- Always returns true: this specialization can be added to any vehicle type.
---@param specializations any
function DynamicallyLoadedParts.prerequisitesPresent(specializations) end

--- Registers the XML schema keys of each dynamicallyLoadedPart: filename, node, linkNode, position, rotationNode, rotation, shaderParameterName and shaderParameter.
function DynamicallyLoadedParts.initSpecialization() end

--- Registers the vehicle function onDynamicallyPartI3DLoaded, used as the callback when an i3D part finishes loading.
---@param vehicleType any
function DynamicallyLoadedParts.registerFunctions(vehicleType) end

--- Subscribes the specialization to the onLoad and onDelete vehicle events.
---@param vehicleType any
function DynamicallyLoadedParts.registerEventListeners(vehicleType) end

--- Iterates the dynamicallyLoadedPart XML entries and starts a shared sub-i3D load for each one that has a filename, remembering the request ids. Entries without a filename produce an XML warning.
---@param savegame any
function DynamicallyLoadedParts:onLoad(savegame) end

--- Releases every shared i3D load request made in onLoad and clears the list.
function DynamicallyLoadedParts:onDelete() end

--- Load callback: finds the part node and the link node, refuses link nodes that are already runtime-loaded references, applies position, rotation and an optional shader parameter, links the node to the vehicle and deletes the loaded root. Returns true on success, false/nil on failure.
---@param i3dNode any
---@param failedReason any
---@param args any
function DynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode, failedReason, args) end
