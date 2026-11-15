---@meta
-- FS25 1.25.1.0 : objects/InlineBaleSingle.lua (stub généré, atlas Lua FS25)

---@class InlineBaleSingle : Bale
InlineBaleSingle = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function InlineBaleSingle.new(isServer, isClient, customMt) end

function InlineBaleSingle:getBaleSupportsBaleLoader() end

function InlineBaleSingle:getCanBeOpened() end

---@param inlineBale any
function InlineBaleSingle:setConnectedInlineBale(inlineBale) end

function InlineBaleSingle:getConnectedInlineBale() end

---@param connectedBale any
---@param filename any
---@param axis any
---@param offset any
function InlineBaleSingle:setConnector(connectedBale, filename, axis, offset) end

---@param state any
function InlineBaleSingle:setConnectorVisibility(state) end

function InlineBaleSingle:getHasConnector() end

function InlineBaleSingle:removeConnector() end

---@param wrappingState number
---@param noEventSend any
function InlineBaleSingle:setWrappingState(wrappingState, noEventSend) end
