---@meta
-- FS25 1.25.1.0 : environment/weather/Twister.lua (generated stub, FS25 Lua Atlas)

--- Twister class, derived from Object (network object): represents a tornado as a synchronized entity. In this dump only the four network functions remain (lines 231-316); everything else in the file (lines 12-230: creation, movement, spawn, despawn, effects, damage, etc.) is empty, so anything about behaviour, particles/effects and weather data reading is UNVERIFIED. What the present functions establish: the synchronized state is the world position of rootNode (compressed by NetworkUtil.readCompressedWorldPosition / writeCompressedWorldPosition with mission.vehicleXZPosCompressionParams for X and Z, vehicleYPosCompressionParams for Y) and a fade value fadeValue (32-bit float). The server is authoritative: it writes; the client only reads when connection:getIsServer() is true. On join, the client applies the position directly, calls setFadeValue(fadeValue, true), then resets networkTimeInterpolator. During play, the update is written only if the self.dirtyFlag bit is raised (server fields sendPosX/Y/Z and sendFadeValue) and the client feeds positionInterpolator, fadeInterpolator and networkTimeInterpolator (startNewPhaseNetwork) for interpolated movement. No direct help for a modder in this file as provided; setFadeValue, the interpolators and dirtyFlag are defined elsewhere (UNVERIFIED). The class is also referenced by PlaceableDestructible.lua.
---@class Twister : Object
Twister = {}

--- Client side on join: calls the parent class read, then, if the connection comes from the server, reads the compressed position (X, Y, Z) and applies it to rootNode via setWorldTranslation, reads fadeValue, calls setFadeValue(fadeValue, true) and resets networkTimeInterpolator.
---@param streamId integer
---@param connection table
function Twister:readStream(streamId, connection) end

--- Server side when a client joins: writes the parent part, then, if the connection is not the server's, the compressed world position of rootNode and fadeValue.
---@param streamId integer
---@param connection table
function Twister:writeStream(streamId, connection) end

--- Client side on update: reads the parent part, then, if a flag boolean is true, the compressed position and fadeValue, which it passes to positionInterpolator:setTargetPosition and fadeInterpolator:setTargetValue, then starts a new network interpolation phase (networkTimeInterpolator:startNewPhaseNetwork).
---@param streamId integer
---@param timestamp integer
---@param connection table
function Twister:readUpdateStream(streamId, timestamp, connection) end

--- Server side on update: writes the parent part, then a boolean telling whether dirtyFlag is present in the mask, and if so the compressed sendPosX/Y/Z and sendFadeValue.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Twister:writeUpdateStream(streamId, connection, dirtyMask) end
