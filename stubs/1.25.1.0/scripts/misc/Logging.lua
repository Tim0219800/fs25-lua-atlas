---@meta
-- FS25 1.25.1.0 : misc/Logging.lua (generated stub, FS25 Lua Atlas)

---@class Logging
Logging = {}

---@param xmlFile table|integer|string
---@param warningMessage string
function Logging.xmlWarning(xmlFile, warningMessage, ...) end

---@param xmlFile table|integer|string
---@param errorMessage string
function Logging.xmlError(xmlFile, errorMessage, ...) end

---@param xmlFile table|integer|string
---@param infoMessage string
function Logging.xmlInfo(xmlFile, infoMessage, ...) end

---@param node integer
---@param warningMessage string
function Logging.i3dWarning(node, warningMessage, ...) end

---@param node integer
---@param errorMessage string
function Logging.i3dError(node, errorMessage, ...) end

---@param node integer
---@param infoMessage string
function Logging.i3dInfo(node, infoMessage, ...) end

---@param warningMessage string
function Logging.warning(warningMessage, ...) end

---@param errorMessage string
function Logging.error(errorMessage, ...) end

---@param infoMessage string
function Logging.info(infoMessage, ...) end

---@param fatalMessage string
function Logging.fatal(fatalMessage, ...) end
