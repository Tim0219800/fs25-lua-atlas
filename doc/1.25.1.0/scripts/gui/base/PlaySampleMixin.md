# gui/base/PlaySampleMixin.lua

*[Version française](../../../fr/scripts/gui/base/PlaySampleMixin.md)*

Source: `dataS/scripts/gui/base/PlaySampleMixin.lua` — FS25 1.25.1.0

✍ GuiMixin that lets a GuiElement ask for UI sound samples through a replaceable callback; muting is possible per element. Sample names are expected to come from `GuiSoundPlayer.SOUND_SAMPLES` (defined elsewhere, UNVERIFIED). Client-side only.

- **PlaySampleMixin** inherits from `GuiMixin` (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaySampleMixin.new()` | 25 | ✍ Creates the mixin instance through `GuiMixin.new` with its own metatable. |
| `PlaySampleMixin:addTo(guiElement: any)` | 31 | ✍ Attaches the mixin to a GuiElement and adds `setPlaySampleCallback`, `playSample` and `disablePlaySample`; the callback starts as the empty `NO_CALLBACK`. Returns whether it was added. |
| `PlaySampleMixin.setPlaySampleCallback(guiElement: table, callback: function)` | 50 | ✍ Sets the function called with a sample name whenever the element wants to play a UI sound. |
| `PlaySampleMixin.playSample(guiElement: table, sampleName: string)` | 58 | ✍ Calls the play callback with the sample name unless the element's `soundDisabled` field is truthy. |
| `PlaySampleMixin.disablePlaySample(guiElement: any)` | 66 | ✍ Replaces the callback with `NO_CALLBACK`; a later `setPlaySampleCallback` can set a new one again. |
| `PlaySampleMixin:clone(srcGuiElement: any, dstGuiElement: any)` | 72 | ✍ Copies the play callback from a source element to its clone. |
