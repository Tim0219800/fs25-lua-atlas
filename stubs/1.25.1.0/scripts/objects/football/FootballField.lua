---@meta
-- FS25 1.25.1.0 : objects/football/FootballField.lua (generated stub, FS25 Lua Atlas)

---@class FootballField : Object
FootballField = {}

---@param _ integer
---@param id integer
function FootballField.onCreate(_, id) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table
---@return table
function FootballField.new(isServer, isClient, customMt) end

function FootballField:delete() end

---@param streamId integer
---@param connection table
function FootballField:writeStream(streamId, connection) end
