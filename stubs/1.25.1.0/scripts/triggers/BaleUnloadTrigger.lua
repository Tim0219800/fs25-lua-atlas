---@meta
-- FS25 1.25.1.0 : triggers/BaleUnloadTrigger.lua (generated stub, FS25 Lua Atlas)

--- Unload trigger subclass (parent UnloadTrigger) that accepts bales. Bales entering its trigger node are tracked on the server and drained gradually into the trigger's fill unit at a configurable liters-per-second rate until empty, then deleted. It also registers itself with BaleLoader vehicles entering the trigger so they can unload bales automatically. UnloadTrigger itself is not in this file (UNVERIFIED details).
---@class BaleUnloadTrigger : UnloadTrigger
BaleUnloadTrigger = {}

--- Registers the parent's XML paths plus #triggerNode, #deleteLitersPerSecond (default 4000) and the fill type config keys from FillTypeManager.registerConfigXMLFilltypes.
---@param schema any
---@param basePath any
function BaleUnloadTrigger.registerXMLPaths(schema, basePath) end

--- Constructor. Builds the parent UnloadTrigger with this class's metatable and initialises the trigger node and an empty list of bales currently inside.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function BaleUnloadTrigger.new(isServer, isClient, customMt) end

--- Loads the parent, then the trigger node, which must have the dynamic object collision flag (and the vehicle flag when automatic bale drop is enabled on the platform), else it logs an XML error and returns false. On the server it registers the trigger callback; reads the delete rate. Returns true on success.
---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function BaleUnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

--- Server only: removes the trigger registration, clears the trigger node and bale list, then calls the parent delete.
function BaleUnloadTrigger:delete() end

--- Server only. For each tracked bale that can be sold and is not mounted, moves up to the rate times dt of its content into the trigger's fill unit and lowers the bale level. When almost empty, updates cotton bale stats and the achievement, deletes the bale and removes it from the list. Stays active while bales remain; invalid bales are dropped.
---@param dt number
function BaleUnloadTrigger:update(dt) end

--- Trigger callback (enabled triggers only). A Bale entering is added to the tracked list if the unload trigger supports it, and removed when it leaves. A Vehicle with the BaleLoader specialization is registered or unregistered through addBaleUnloadTrigger and removeBaleUnloadTrigger on enter and leave.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleUnloadTrigger:baleTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end
