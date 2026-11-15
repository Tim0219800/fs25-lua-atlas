---@meta
-- FS25 1.25.1.0 : gui/dialogs/ColorPickerDialog.lua (generated stub, FS25 Lua Atlas)

---@class ColorPickerDialog : MessageDialog
ColorPickerDialog = {}

---@param callback function
---@param target table
---@param args table?
---@param colors table?
---@param defaultColorIndex integer?
---@param defaultMaterial string?
---@param customColor table?
---@param customColorsEnabled boolean?
---@param disableOpenSound boolean?
---@param materialSelectionDisabled boolean?
function ColorPickerDialog.show(callback, target, args, colors, defaultColorIndex, defaultMaterial, customColor, customColorsEnabled, disableOpenSound, materialSelectionDisabled) end

---@param _ any
---@param inputValue any
function ColorPickerDialog:onHorizontalCursorInput(_, inputValue) end

---@param _ any
---@param inputValue any
function ColorPickerDialog:onVerticalCursorInput(_, inputValue) end
