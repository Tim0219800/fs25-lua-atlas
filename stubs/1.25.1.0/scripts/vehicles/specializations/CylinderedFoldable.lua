---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CylinderedFoldable.lua (generated stub, FS25 Lua Atlas)

--- Small glue specialization for vehicles that have both Cylindered (moving tools) and Foldable. It lets the moving tool states be applied at a chosen moment, once the fold animation has reached a given time, and it repairs the network sync order between the two. It requires Cylindered and Foldable and reads two attributes under vehicle.cylindered in the vehicle XML.
---@class CylinderedFoldable
CylinderedFoldable = {}

--- Returns true only if the vehicle type has both the Cylindered and Foldable specializations.
---@param specializations table
---@return boolean
function CylinderedFoldable.prerequisitesPresent(specializations) end

--- Registers the XML schema entries vehicle.cylindered#loadMovingToolStatesAfterFolding (bool, default false) and vehicle.cylindered#loadMovingToolStatesFoldTime (float).
function CylinderedFoldable.initSpecialization() end

--- Subscribes the specialization to onLoad, onPreInitComponentPlacement, onReadStream and onWriteStream.
---@param vehicleType any
function CylinderedFoldable.registerEventListeners(vehicleType) end

--- Reads the two XML settings (reload flag and target fold time) into spec_cylinderedFoldable.
---@param savegame table
function CylinderedFoldable:onLoad(savegame) end

--- If the reload flag is set and either no fold time is configured or the current fold animation time equals it, it calls Cylindered.onPostLoad again so the moving tool states are applied after folding.
---@param savegame any
function CylinderedFoldable:onPreInitComponentPlacement(savegame) end

--- Client-side join sync: finishes the fold animation instantly, then reads a bool and, if true, re-runs Cylindered.onReadStream (Foldable overrode it). On the client side of the connection it also refreshes dependent animations of dirty moving tools.
---@param streamId any
---@param connection any
function CylinderedFoldable:onReadStream(streamId, connection) end

--- Writes a bool telling whether the fold time matches the configured one (or none is configured), and only in that case calls Cylindered.onWriteStream. Mirrors the read logic.
---@param streamId any
---@param connection any
function CylinderedFoldable:onWriteStream(streamId, connection) end
