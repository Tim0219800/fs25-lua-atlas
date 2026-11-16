---@meta
-- FS25 1.25.1.0 : objects/InlineBaleSingle.lua (generated stub, FS25 Lua Atlas)

--- Subclass of Bale for one bale that is part of an InlineBale chain. It cannot be opened or loaded by a bale loader on its own, remembers the owning InlineBale, and manages the skinned connector mesh (loaded from an I3D) that visually links it to the neighbouring bale. Wrapping state changes also toggle the connector visibility.
---@class InlineBaleSingle : Bale
InlineBaleSingle = {}

--- Creates the bale through Bale.new with this class's metatable, registers the class name 'InlineBaleSingle' and starts with no connected inline bale.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function InlineBaleSingle.new(isServer, isClient, customMt) end

--- Always returns false: a bale in an inline chain cannot be picked up by a bale loader.
function InlineBaleSingle:getBaleSupportsBaleLoader() end

--- Always returns false; opening is done on the whole InlineBale instead.
function InlineBaleSingle:getCanBeOpened() end

--- Stores the owning InlineBale (nil to detach).
---@param inlineBale any
function InlineBaleSingle:setConnectedInlineBale(inlineBale) end

--- Returns the owning InlineBale, or nil.
function InlineBaleSingle:getConnectedInlineBale() end

--- Loads the connector I3D (shared) and links its end node to the neighbour bale, its start node and skinned mesh to this bale, offset along the given axis. Copies the neighbour's wrap color and sets visibility from the wrapping state. Returns false if the I3D fails to load.
---@param connectedBale any
---@param filename any
---@param axis any
---@param offset any
function InlineBaleSingle:setConnector(connectedBale, filename, axis, offset) end

--- Shows or hides the connector mesh if one exists.
---@param state any
function InlineBaleSingle:setConnectorVisibility(state) end

--- Returns true if this bale currently has a connector.
function InlineBaleSingle:getHasConnector() end

--- Deletes the connector nodes and mesh when they still exist and releases the shared I3D request. Clears the connector reference.
function InlineBaleSingle:removeConnector() end

--- Makes the connector visible when the state is above 0, then calls Bale's setWrappingState (noEventSend is forwarded).
---@param wrappingState number
---@param noEventSend any
function InlineBaleSingle:setWrappingState(wrappingState, noEventSend) end
