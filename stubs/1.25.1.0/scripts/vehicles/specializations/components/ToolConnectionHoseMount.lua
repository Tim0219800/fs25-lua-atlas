---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/ToolConnectionHoseMount.lua (generated stub, FS25 Lua Atlas)

--- Loads an extra hose-mount asset (XML plus shared i3d) that sits between two connection hose targets of a vehicle, so hoses of an attached tool can be routed through an intermediate mount. After loading it registers new hose targets and tool connector hoses into the vehicle's `spec_connectionHoses` (the ConnectionHoses specialization, defined elsewhere, UNVERIFIED) and can stretch itself to a requested length. Client-side visual/setup helper.
---@class ToolConnectionHoseMount
ToolConnectionHoseMount = {}

--- Creates a hose mount object for a vehicle with empty component and i3d mapping tables.
---@param vehicle any
---@param customMt any
function ToolConnectionHoseMount.new(vehicle, customMt) end

--- Deletes the pending XML file and the mount node, and releases the shared i3d request.
function ToolConnectionHoseMount:delete() end

--- Stores a callback (and optional target) called with the success flag after loading.
---@param callback any
---@param callbackTarget any
function ToolConnectionHoseMount:setCallback(callback, callbackTarget) end

--- Invokes the registered callback, with or without target, passing the success flag.
---@param success any
function ToolConnectionHoseMount:onFinished(success) end

--- Stores the start and end hose targets the mount sits between and looks up the parent tool connection hose of the start target in `spec_connectionHoses`.
---@param startTarget any
---@param endTarget any
function ToolConnectionHoseMount:setReferenceTargets(startTarget, endTarget) end

--- Stores the node to link under and the local translation and rotation (default 0) of the mount.
---@param linkNode any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function ToolConnectionHoseMount:setLinkNode(linkNode, x, y, z, rx, ry, rz) end

--- Loads the mount XML and starts the async shared i3d load. Requires start/end targets and a link node, otherwise logs a warning, calls `onFinished(false)` and returns false.
---@param xmlFilename any
---@param baseDirectory any
function ToolConnectionHoseMount:loadFromXML(xmlFilename, baseDirectory) end

--- Async callback: reads default length, hose targets (back/front/mounting nodes, type name, options), extra hoses, adjust nodes and scale nodes; links and places the root, creates the hoses and applies a pending length.
---@param i3dNode any
---@param failedReason any
---@param args any
function ToolConnectionHoseMount:onI3DLoaded(i3dNode, failedReason, args) end

--- Stretches the mount to the given length by scaling adjust node z translations and scale node z scales relative to the default length. If not loaded yet, the length is kept and applied after loading.
---@param length any
function ToolConnectionHoseMount:setLength(length) end

--- Adds a hose target for a node into the vehicle's target list and type index, copying joints, straightening factor and adapter name from a source target. Returns the new target index.
---@param node any
---@param sourceTarget any
---@param newType any
function ToolConnectionHoseMount:addHoseTarget(node, sourceTarget, newType) end

--- For each configured target, creates front and back hose targets and a new tool connection hose entry linking them (hiding the mounting node) and registers it in `toolConnectorHoses` and `targetNodeToToolConnection`.
function ToolConnectionHoseMount:createToolConnectionHoses() end

--- Registers the XML paths of the hose mount asset (i3d mappings under `toolConnectionHoseMount`; other paths registration lines may exist but are not summarised).
---@param schema any
function ToolConnectionHoseMount.registerExternalXMLPaths(schema) end
