---@meta
-- FS25 1.25.1.0 : misc/NoteManager.lua (generated stub, FS25 Lua Atlas)

--- Debug manager (extends AbstractManager) for creating note nodes at runtime and exporting them as an i3d file. In this dump only the data-structure initialisation is visible; the export and list handlers are referenced but not defined here (UNVERIFIED).
---@class NoteManager : AbstractManager
NoteManager = {}

--- Resets session fields and builds the colour list (white plus DebugUtil.COLORS). On first call it registers the console commands gsNoteExport and gsNoteList, whose handlers consoleCommandExportNotes and consoleCommandListNotes are not in this file.
function NoteManager:initDataStructures() end
