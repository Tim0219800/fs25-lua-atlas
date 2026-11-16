---@meta
-- FS25 1.25.1.0 : gui/dialogs/ColorPickerDialog.lua (generated stub, FS25 Lua Atlas)

--- Dialog letting the player pick a color from a list of preset colors, optionally with a custom color and material choice, derived from MessageDialog. Only `show` and two analog cursor input handlers survive in this dump; most of the 887-line file is empty, so other behaviour is UNVERIFIED. Client-side GUI.
---@class ColorPickerDialog : MessageDialog
ColorPickerDialog = {}

--- Stores the color list, default color index, default material and custom color on the shared instance, sets custom/material options, callback and open sound, then opens the dialog. Does nothing without the instance.
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

--- Input event for horizontal cursor movement (bound to the pick-color left/right axis); adds the input value to `accumHorizontalInput`. Where that accumulator is consumed is not visible in the dump.
---@param _ any
---@param inputValue any
function ColorPickerDialog:onHorizontalCursorInput(_, inputValue) end

--- Input event for vertical cursor movement (pick-color up/down axis); adds the input value to `accumVerticalInput`. Where that accumulator is consumed is not visible in the dump.
---@param _ any
---@param inputValue any
function ColorPickerDialog:onVerticalCursorInput(_, inputValue) end
