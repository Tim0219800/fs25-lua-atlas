# gui/dialogs/ColorPickerDialog.lua

*[Version française](../../../fr/scripts/gui/dialogs/ColorPickerDialog.md)*

Source: `dataS/scripts/gui/dialogs/ColorPickerDialog.lua` — FS25 1.25.1.0

✍ Dialog letting the player pick a color from a list of preset colors, optionally with a custom color and material choice, derived from MessageDialog. Only `show` and two analog cursor input handlers survive in this dump; most of the 887-line file is empty, so other behaviour is UNVERIFIED. Client-side GUI.

- **ColorPickerDialog** inherits from `MessageDialog` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `ColorPickerDialog.show(callback: function, target: table, args: table?, colors: table?, defaultColorIndex: integer?, defaultMaterial: string?, customColor: table?, customColorsEnabled: boolean?, disableOpenSound: boolean?, materialSelectionDisabled: boolean?)` | 47 | ✍ Stores the color list, default color index, default material and custom color on the shared instance, sets custom/material options, callback and open sound, then opens the dialog. Does nothing without the instance. |
| `ColorPickerDialog:onHorizontalCursorInput(_: any, inputValue: any)` | 879 | ✍ Input event for horizontal cursor movement (bound to the pick-color left/right axis); adds the input value to `accumHorizontalInput`. Where that accumulator is consumed is not visible in the dump. |
| `ColorPickerDialog:onVerticalCursorInput(_: any, inputValue: any)` | 885 | ✍ Input event for vertical cursor movement (pick-color up/down axis); adds the input value to `accumVerticalInput`. Where that accumulator is consumed is not visible in the dump. |
