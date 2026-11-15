---@meta
-- FS25 1.25.1.0 : objects/Basketball.lua (stub généré, atlas Lua FS25)

---@class Basketball : PhysicsObject
Basketball = {}

---@param id integer
function Basketball:onCreate(id) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Basketball.new(isServer, isClient, customMt) end

function Basketball:delete() end

---@param streamId integer
---@param connection table
function Basketball:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Basketball:writeStream(streamId, connection) end

---@param i3dFilename string
function Basketball:createNode(i3dFilename) end

---@param i3dFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function Basketball:load(i3dFilename, x, y, z, rx, ry, rz) end
