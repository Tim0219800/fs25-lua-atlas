# gui/elements/FrameElement.lua

*[Version française](../../../fr/scripts/gui/elements/FrameElement.md)*

Source: `dataS/scripts/gui/elements/FrameElement.lua` — FS25 1.25.1.0

✍ FrameElement extends GuiElement and is the base of all GUI views, both partial frames and full screens. It keeps a list of registered control IDs that are exposed as fields on the view after loading, and holds callbacks for changing screen, toggling a custom input context and playing sounds. It also provides a short input-disable timer.

- **FrameElement** inherits from `GuiElement` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `FrameElement.new(target: any, customMt: any)` | 24 | ✍ Constructor. Creates empty controlIDs, no-op callbacks, the custom-input-context flag off, time counters at 0 and playHoverSoundOnFocus false. |
| `FrameElement:clone(parent: any, includeId: any, suppressOnCreate: any, blockFocusHandlingReload: any)` | 44 | ✍ Clones the frame via GuiElement, exposes the registered controls as fields on the clone and copies the three callbacks and the input-context flag. |
| `FrameElement:copyAttributes(src: any)` | 59 | ✍ Copies attributes through the parent, then marks every control ID of the source as unresolved so it can be exposed again. |
| `FrameElement:delete()` | 69 | ✍ Deletes via the parent, then clears all registered control IDs and the fields exposed under those names. |
| `FrameElement:getRootElement()` | 82 | ✍ Returns the first child element, the frame root. If there is no child, creates an empty GuiElement, adds it and returns it. |
| `FrameElement:exposeControlsAsFields(viewName: viewName)` | 100 | ✍ For every descendant with an id, assigns it as a field of this frame; ids with an index become entries of a list field. Marks the ids resolved and warns about unresolved ones only when debug is enabled. |
| `FrameElement:disableInputForDuration(duration: number)` | 132 | ✍ Blocks input for the given number of milliseconds, clamped between 0 and 10000. |
| `FrameElement:isInputDisabled()` | 138 | ✍ Returns true while the input-disable timer is still above zero. |
| `FrameElement:update(dt: any)` | 144 | ✍ Per-frame update: calls the parent, adds dt to the frame time and counts down the input-disable timer. |
| `FrameElement:setChangeScreenCallback(callback: function)` | 156 | ✍ Registers the function called by changeScreen; nil resets it to a no-op. |
| `FrameElement:setInputContextCallback(callback: function)` | 163 | ✍ Registers the function called to toggle a custom input context; nil resets it to a no-op. |
| `FrameElement:setPlaySampleCallback(callback: function)` | 170 | ✍ Registers the function used to play a named sound sample; nil resets it to a no-op. |
| `FrameElement:changeScreen(targetScreenClass: table, returnScreenClass: any)` | 177 | ✍ Requests a screen change by calling the registered callback with this frame, the target screen class and the return screen class. |
| `FrameElement:toggleCustomInputContext(isContextActive: string, contextName: string)` | 190 | ✍ Calls the input-context callback with the state and context name, but only when the requested state differs from the stored flag, then updates the flag. |
| `FrameElement:playSample(sampleName: string)` | 200 | ✍ Plays a sound sample by name through the registered callback unless sounds are suppressed for this element. |
