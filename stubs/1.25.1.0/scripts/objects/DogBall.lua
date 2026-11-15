---@meta
-- FS25 1.25.1.0 : objects/DogBall.lua (stub généré, atlas Lua FS25)

---@class DogBall : PhysicsObject
DogBall = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function DogBall.new(isServer, isClient, customMt) end

function DogBall:delete() end

---@param streamId integer
---@param connection table
function DogBall:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function DogBall:writeStream(streamId, connection) end

---@param i3dFilename string
function DogBall:createNode(i3dFilename) end

---@param i3dFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function DogBall:load(i3dFilename, x, y, z, rx, ry, rz) end

function DogBall:reset() end
