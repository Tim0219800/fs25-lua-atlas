---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SupportVehicle.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements that spawn a helper 'support vehicle' (for example a transport trolley) when detached and remove it again when attached. It requires AttacherJoints and Mountable. The server loads the support vehicle from the store through VehicleLoadingData, attaches the tool to it and tracks it. XML keys live under vehicle.supportVehicle (filename, joint indices, offsets, configurations).
---@class SupportVehicle
SupportVehicle = {}

--- Returns true only if the vehicle type has both AttacherJoints and Mountable.
---@param specializations any
function SupportVehicle.prerequisitesPresent(specializations) end

--- Registers the XML schema: support vehicle filename, attacher joint indices, terrain offset (0.2), spawn offset (0.75) and a list of configuration name/id pairs.
function SupportVehicle.initSpecialization() end

--- Registers addSupportVehicle, enableSupportVehicle and removeSupportVehicle on the vehicle type.
---@param vehicleType any
function SupportVehicle.registerFunctions(vehicleType) end

--- Overrides getAllowMultipleAttachments, resolveMultipleAttachments, getShowAttachableMapHotspot, getIsReadyToFinishDetachProcess and startDetachProcess.
---@param vehicleType any
function SupportVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdate and onPostDetach.
---@param vehicleType any
function SupportVehicle.registerEventListeners(vehicleType) end

--- Reads offsets and joint indices, resolves the support vehicle store item (warns if missing), precomputes four footprint corners for height checks and reads configuration pairs. Removes the delete/update/post-detach listeners on clients or when no store item exists.
---@param savegame any
function SupportVehicle:onLoad(savegame) end

--- Removes the support vehicle unless the vehicle is being reconfigured.
function SupportVehicle:onDelete() end

--- After detachment, enables the pending support vehicle by attaching the tool to it.
---@param attacherVehicle table
---@param implement table
function SupportVehicle:onPostDetach(attacherVehicle, implement) end

--- On the first update (not during a vehicle reload): spawns a support vehicle if unattached, or adopts the current attacher as support vehicle if its config file matches, reducing component mass. Runs once.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SupportVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Asynchronously loads the support vehicle at the input attacher joint (shifted by the spawn offset when detaching), placed on terrain height plus offset. Does nothing if one exists or is loading.
---@param isDetach any
function SupportVehicle:addSupportVehicle(isDetach) end

--- Load callback: stores the loaded vehicle and enables it unless the load came from a detach. If the owner vehicle was deleted meanwhile, deletes the loaded vehicles. Clears the loading flag.
---@param vehicles any
---@param vehicleLoadState any
---@param asyncCallbackArguments any
function SupportVehicle:supportVehicleLoaded(vehicles, vehicleLoadState, asyncCallbackArguments) end

--- Positions the loaded support vehicle and this tool using joint offsets, then attaches the tool to it and selects the tool. Reduces component mass. Deletes the support vehicle if the needed joints are missing.
function SupportVehicle:enableSupportVehicle() end

--- Deletes the current support vehicle if still alive, clears the reference, and on the server restores normal component mass.
function SupportVehicle:removeSupportVehicle() end

--- Override returning true when a support vehicle filename is configured, so the attach dialog can still be shown while attached.
---@param superFunc any
function SupportVehicle:getAllowMultipleAttachments(superFunc) end

--- Override: on the server removes the support vehicle first, then calls the parent.
---@param superFunc any
function SupportVehicle:resolveMultipleAttachments(superFunc) end

--- Override: with a support vehicle, shows the hotspot only if that support vehicle itself has no attacher vehicle; otherwise uses the parent.
---@param superFunc any
function SupportVehicle:getShowAttachableMapHotspot(superFunc) end

--- Override: detach may finish only if the parent allows it and the support vehicle is either not loading or already loaded.
---@param superFunc any
function SupportVehicle:getIsReadyToFinishDetachProcess(superFunc) end

--- Override: unless the vehicle is being deleted, requests a support vehicle spawn for the detach, then calls the parent.
---@param superFunc any
---@param noEventSend any
function SupportVehicle:startDetachProcess(superFunc, noEventSend) end
