---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/AttacherJointTopArm.lua (generated stub, FS25 Lua Atlas)

---@class AttacherJointTopArm
AttacherJointTopArm = {}

---@param vehicle any
---@param customMt any
function AttacherJointTopArm.new(vehicle, customMt) end

function AttacherJointTopArm:delete() end

---@param callback any
---@param callbackTarget any
function AttacherJointTopArm:setCallback(callback, callbackTarget) end

---@param success any
function AttacherJointTopArm:onFinished(success) end

---@param vehicle any
---@param key any
function AttacherJointTopArm.loadFromVehicleXML(vehicle, key) end

---@param linkNode any
---@param xmlFilename any
---@param baseDirectory any
function AttacherJointTopArm:loadFromXML(linkNode, xmlFilename, baseDirectory) end

---@param i3dNode any
---@param failedReason any
---@param args any
function AttacherJointTopArm:onI3DLoaded(i3dNode, failedReason, args) end

function AttacherJointTopArm:finalize() end

---@param isActive any
function AttacherJointTopArm:setIsActive(isActive) end

---@param dt any
---@param targetNode any
function AttacherJointTopArm:update(dt, targetNode) end

---@param schema any
---@param baseKey any
function AttacherJointTopArm.registerVehicleXMLPaths(schema, baseKey) end

---@param schema any
function AttacherJointTopArm.registerXMLPaths(schema) end
