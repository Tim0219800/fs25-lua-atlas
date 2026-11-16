---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/AttacherJointTopArm.lua (generated stub, FS25 Lua Atlas)

--- Visual top link (upper link) of a three-point attacher joint. It can be loaded from a shared XML/i3d asset linked to a vehicle node, or built from nodes already in the vehicle, and it re-aims itself at a target node each update, stretching its translation and scale parts to match the distance. It also applies brand material templates and object changes. Purely cosmetic and client-side; `RENAMED_UPPER_LINKS` and `xmlSchema` are used here but not defined in this file (UNVERIFIED where they are set).
---@class AttacherJointTopArm
AttacherJointTopArm = {}

--- Creates a top arm object bound to a vehicle with default settings: z scale -1, mount arm and brand decal enabled, no visibility toggle, empty component and change-object tables.
---@param vehicle any
---@param customMt any
function AttacherJointTopArm.new(vehicle, customMt) end

--- Deletes the top arm node and releases the shared i3d load request if any.
function AttacherJointTopArm:delete() end

--- Stores a callback (and optional target) that is invoked with the success flag when loading finishes.
---@param callback any
---@param callbackTarget any
function AttacherJointTopArm:setCallback(callback, callbackTarget) end

--- Called when loading ends: deletes the temporary XML file, runs `finalize` and then calls the registered callback with the success flag.
---@param success any
function AttacherJointTopArm:onFinished(success) end

--- Builds a top arm from a vehicle XML key: either from `#baseNode` plus `#filename` (an XML asset, with warnings for i3d paths and renamed upper links) or from existing `#rotationNode`/`#translationNode` nodes. Then reads zScale, visibility, mount arm, material templates and object changes. Returns the top arm or nil.
---@param vehicle any
---@param key any
function AttacherJointTopArm.loadFromVehicleXML(vehicle, key) end

--- Loads the top arm definition XML, reads its i3d filename and starts the asynchronous shared i3d load (via the vehicle when present). Returns false and finishes with failure if the XML or filename is missing.
---@param linkNode any
---@param xmlFilename any
---@param baseDirectory any
function AttacherJointTopArm:loadFromXML(linkNode, xmlFilename, baseDirectory) end

--- Async i3d callback: links the root node under the link node, resolves translation, scale, decal and mount-arm nodes, hides unused parts and applies brand materials. Note: the decal material built from the brightness of the main material is never assigned to `self.decalMaterial`, so it has no effect.
---@param i3dNode any
---@param failedReason any
---@param args any
function AttacherJointTopArm:onI3DLoaded(i3dNode, failedReason, args) end

--- Computes the reference distance and default translation of the translating part, and the reference length of the scaled part, used later by `update`.
function AttacherJointTopArm:finalize() end

--- Switches between attached and detached pose: sets mount-arm rotation, optionally toggles visibility, resets rotation, translation and scale when inactive, and applies the configured object changes.
---@param isActive any
function AttacherJointTopArm:setIsActive(isActive) end

--- Aims the top arm node at `targetNode` (direction plus an up vector depending on whether the node is in the front or rear half of the vehicle) and adjusts translation and scale to the current distance.
---@param dt any
---@param targetNode any
function AttacherJointTopArm:update(dt, targetNode) end

--- Registers the vehicle-side XML paths for a top arm (filename, baseNode, zScale, visibility, mount arm, material templates, decal, fallback nodes) plus object-change paths.
---@param schema any
---@param baseKey any
function AttacherJointTopArm.registerVehicleXMLPaths(schema, baseKey) end

--- Registers the XML paths of the top arm asset file (`topArm.*`: filename, root, translation, scale, brand decal and mount arm nodes) and i3d mappings.
---@param schema any
function AttacherJointTopArm.registerXMLPaths(schema) end
