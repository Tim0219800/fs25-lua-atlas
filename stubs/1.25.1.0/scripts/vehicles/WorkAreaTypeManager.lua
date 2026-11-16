---@meta
-- FS25 1.25.1.0 : vehicles/WorkAreaTypeManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (extends `AbstractManager`) that registers work area types and exposes them by index and name. Registering a type fills the global table `WorkAreaType` (name to index) and stores three flags per type: attracts wildlife, is an AI area, is a steering assist area. Where the types are registered is not in this file (UNVERIFIED).
---@class WorkAreaTypeManager : AbstractManager
WorkAreaTypeManager = {}

--- Constructor, creates the manager through `AbstractManager.new`.
---@param customMt any
---@return table
function WorkAreaTypeManager.new(customMt) end

--- Resets the type list and lookup tables and rebinds the global `WorkAreaType` to the name-to-index table.
function WorkAreaTypeManager:initDataStructures() end

--- Registers a new work area type with upper-cased name and the three optional flags (default false). Logs an error and returns if the name is missing or already used.
---@param name any
---@param attractWildlife any
---@param isAIArea any
---@param isSteeringAssistArea any
function WorkAreaTypeManager:addWorkAreaType(name, attractWildlife, isAIArea, isSteeringAssistArea) end

--- Returns the type name for an index, or nil if unknown.
---@param index any
function WorkAreaTypeManager:getWorkAreaTypeNameByIndex(index) end

--- Returns the index of a type by name (case-insensitive), or nil.
---@param name any
function WorkAreaTypeManager:getWorkAreaTypeIndexByName(name) end

--- Returns the full descriptor table (name, index, flags) for a type name, or nil.
---@param name any
function WorkAreaTypeManager:getConfigurationDescByName(name) end

--- Returns the descriptor table stored at the given index, or nil.
---@param index any
function WorkAreaTypeManager:getWorkAreaTypeByIndex(index) end

--- Returns whether the type at this index is an AI area; false if the index is unknown.
---@param index any
function WorkAreaTypeManager:getWorkAreaTypeIsAIArea(index) end

--- Returns whether the type at this index is a steering assist area; false if the index is unknown.
---@param index any
function WorkAreaTypeManager:getWorkAreaTypeIsSteeringAssistArea(index) end
