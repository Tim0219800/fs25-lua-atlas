---@meta
-- FS25 1.25.1.0 : missions/field/SowMission.lua (generated stub, FS25 Lua Atlas)

--- Sowing contract, a subclass of AbstractFieldMission. In this file it only provides the partition completion query; everything else is inherited.
---@class SowMission : AbstractFieldMission
SowMission = {}

--- Sets the region of the given partition, then runs the completion modifier with its filter and returns summed pixels, area and total area. Returns 0, 0, 0 if no completion modifier exists.
---@param partitionIndex any
function SowMission:getPartitionCompletion(partitionIndex) end
