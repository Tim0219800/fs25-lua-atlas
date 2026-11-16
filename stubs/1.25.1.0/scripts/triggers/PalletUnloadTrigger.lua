---@meta
-- FS25 1.25.1.0 : triggers/PalletUnloadTrigger.lua (generated stub, FS25 Lua Atlas)

--- Subclass of UnloadTrigger that detects pallets (objects with isPallet) entering a vehicle-collision trigger and either unloads them automatically on the server or lets the player trigger the unload. It tracks pallets carrying a supported fill type and, when autoUnload is off, nearby vehicles and the player. The dump has a gap where methods such as unloadPallets and updateActivatableObject would be, so their code is not visible here (UNVERIFIED).
---@class PalletUnloadTrigger : UnloadTrigger
PalletUnloadTrigger = {}

--- Registers the parent UnloadTrigger XML paths plus triggerNode, autoUnload (default true) and autoUnloadStrapped (default false).
---@param schema any
---@param basePath any
function PalletUnloadTrigger.registerXMLPaths(schema, basePath) end

--- Creates the trigger on top of UnloadTrigger.new with its activatable, empty pallet and vehicle tables, enabled, autoUnload on and autoUnloadStrapped off.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function PalletUnloadTrigger.new(isServer, isClient, customMt) end

--- Calls the parent load, then reads triggerNode and returns false if it is missing or if its collision mask lacks the VEHICLE bit (logged as an XML error). Registers the physics callback `palletTriggerCallback` and reads autoUnload and autoUnloadStrapped.
---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function PalletUnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

--- Removes the physics trigger, drops the delete listeners on tracked pallets, clears the pallet and vehicle tables, then calls the parent delete.
function PalletUnloadTrigger:delete() end

--- Physics callback. A pallet with a non-empty fill unit of a supported type is added on enter (removed on leave); with autoUnload the server then calls unloadPallets. Without autoUnload it counts vehicles in range and tracks the local player, then refreshes the activatable.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function PalletUnloadTrigger:palletTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end
