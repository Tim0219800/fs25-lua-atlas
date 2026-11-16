---@meta
-- FS25 1.25.1.0 : misc/Logging.lua (generated stub, FS25 Lua Atlas)

--- Global `Logging` table that prints prefixed messages to the console and log file. Variants exist for plain messages, XML files and i3d nodes. All bodies are stripped from the SDK dump, so behaviour is taken from the doc lines only and is UNVERIFIED.
---@class Logging
Logging = {}

--- Signature only (no body in the SDK dump): prints a warning prefixed with the XML file name; accepts an XML file object, handle or string, plus a format message and its arguments. UNVERIFIED.
---@param xmlFile table|integer|string
---@param warningMessage string
function Logging.xmlWarning(xmlFile, warningMessage, ...) end

--- Signature only (no body in the SDK dump): prints an error prefixed with the XML file name, with a format message and arguments. UNVERIFIED.
---@param xmlFile table|integer|string
---@param errorMessage string
function Logging.xmlError(xmlFile, errorMessage, ...) end

--- Signature only (no body in the SDK dump): prints an info line prefixed with the XML file name, with a format message and arguments. UNVERIFIED.
---@param xmlFile table|integer|string
---@param infoMessage string
function Logging.xmlInfo(xmlFile, infoMessage, ...) end

--- Signature only (no body in the SDK dump): prints a warning prefixed with the name path and index path of an i3d node, with a format message and arguments. UNVERIFIED.
---@param node integer
---@param warningMessage string
function Logging.i3dWarning(node, warningMessage, ...) end

--- Signature only (no body in the SDK dump): prints an error prefixed with the name path and index path of an i3d node, with a format message and arguments. UNVERIFIED.
---@param node integer
---@param errorMessage string
function Logging.i3dError(node, errorMessage, ...) end

--- Signature only (no body in the SDK dump): prints an info line prefixed with the name path and index path of an i3d node, with a format message and arguments. UNVERIFIED.
---@param node integer
---@param infoMessage string
function Logging.i3dInfo(node, infoMessage, ...) end

--- Signature only (no body in the SDK dump): prints a message prefixed with Warning:, with a format message and arguments. UNVERIFIED.
---@param warningMessage string
function Logging.warning(warningMessage, ...) end

--- Signature only (no body in the SDK dump): prints a message prefixed with Error:, with a format message and arguments. UNVERIFIED.
---@param errorMessage string
function Logging.error(errorMessage, ...) end

--- Signature only (no body in the SDK dump): prints a message prefixed with Info:, with a format message and arguments. UNVERIFIED.
---@param infoMessage string
function Logging.info(infoMessage, ...) end

--- Signature only (no body in the SDK dump): prints a fatal error and stops the game; documented for unrecoverable errors only. UNVERIFIED.
---@param fatalMessage string
function Logging.fatal(fatalMessage, ...) end
