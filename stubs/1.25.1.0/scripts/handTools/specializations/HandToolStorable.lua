---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolStorable.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for tools that can be hung in a hand tool holder. It reads a list of holder types from the tool XML, each with an optional node used to orient the tool in that holder, and exposes a lookup by holder type. It has no prerequisites and only listens to onLoad.
---@class HandToolStorable
HandToolStorable = {}

--- Registers the repeated handTool.storable.holderType XML entries: a required #type string and an optional #node index pointing at the orientation node.
---@param xmlSchema any
function HandToolStorable.registerXMLPaths(xmlSchema) end

--- Registers the function getHolsterNodeByType on the hand tool type.
---@param handToolType any
function HandToolStorable.registerFunctions(handToolType) end

--- Subscribes the specialization to the onLoad event.
---@param handToolType any
function HandToolStorable.registerEventListeners(handToolType) end

--- Always returns true: this specialization has no prerequisites.
---@param specializations any
function HandToolStorable.prerequisitesPresent(specializations) end

--- Builds a table of holder type to orientation node from the XML. Entries without a type are logged as XML errors and skipped; entries without a resolvable node are not stored, so that holder type is not accepted.
---@param xmlFile any
function HandToolStorable:onLoad(xmlFile) end

--- Returns the orientation node registered for the given holder type name, or nil if the tool cannot be stored in that kind of holder.
---@param typeName any
function HandToolStorable:getHolsterNodeByType(typeName) end
