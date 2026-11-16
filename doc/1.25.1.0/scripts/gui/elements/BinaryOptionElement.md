# gui/elements/BinaryOptionElement.lua

*[Version française](../../../fr/scripts/gui/elements/BinaryOptionElement.md)*

Source: `dataS/scripts/gui/elements/BinaryOptionElement.lua` — FS25 1.25.1.0

✍ Two-choice option element (left/right, default texts off/on or no/yes) with two buttons and a slider that glides between them. Derived from MultiTextOptionElement; similar to CheckedOptionElement but driven by left/right input and an animated slider. Texts come from `g_i18n` strings; STATE_LEFT, STATE_RIGHT, NUM_SLIDER_STATES and STRING_* constants are defined elsewhere. Client-side GUI.

- **BinaryOptionElement** inherits from `MultiTextOptionElement` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `BinaryOptionElement.new(target: any, custom_mt: any)` | 30 | ✍ Constructor; initializes slider state (no slider element, not moving, direction 0) and the yes/no text flag to false. |
| `BinaryOptionElement:loadFromXML(xmlFile: any, key: any)` | 45 | ✍ Reads the optional `useYesNoTexts` boolean from the XML node after the parent attributes. |
| `BinaryOptionElement:loadProfile(profile: any, applyProfile: any)` | 53 | ✍ Reads useYesNoTexts, sliderOffset and the default slider profiles (plain, round, three-part) from a GUI profile. |
| `BinaryOptionElement:copyAttributes(src: any)` | 66 | ✍ Copies useYesNoTexts and the three default slider profile names from a source element. |
| `BinaryOptionElement:setElementsByName()` | 77 | ✍ Re-scans the children after naming: finds the child named "slider" (warns if missing), binds the two buttons' selected state and scroll permission to this element's state/focus, and computes the slider travel per animation step. |
| `BinaryOptionElement:addDefaultElements()` | 105 | ✍ When automatic default elements are enabled and no "slider" child exists, creates one (RoundCornerElement, ThreePartBitmapElement or BitmapElement depending on which default slider profile is set) and applies that profile. |
| `BinaryOptionElement:onGuiSetupFinished()` | 132 | ✍ Sets the two button texts to localized no/yes or off/on depending on `useYesNoTexts` and hides the inherited text element. |
| `BinaryOptionElement:getIsChecked()` | 146 | ✍ Returns true when the right-hand state is selected (the right choice counts as checked). |
| `BinaryOptionElement:setIsChecked(isChecked: any, skipAnimation: any, forceEvent: any)` | 152 | ✍ Sets the state to right (checked) or left (unchecked), optionally forcing the click callback, then stores `skipAnimation` so the slider can jump instead of gliding on the next update. |
| `BinaryOptionElement:getIsActiveNonRec()` | 164 | ✍ Reports the element as active whenever it is visible, even if disabled, so `update` keeps running and the slider movement can finish. |
| `BinaryOptionElement:setTexts(texts: any)` | 170 | ✍ Sets the texts of the left and right buttons. Logs a warning with call stack when the table does not contain exactly two entries. |
| `BinaryOptionElement:update(dt: any)` | 184 | ✍ Per-frame update that advances the slider one step toward its target, or jumps to the end when skipping animation, stops at either end, and repositions the slider element. Resets `skipAnimation` afterwards. |
| `BinaryOptionElement:inputLeft()` | 206 | ✍ Handles a left input: if the slider is idle and the element is focused or its left button is pressed, triggers the left click and returns true; otherwise returns false. |
| `BinaryOptionElement:inputRight()` | 218 | ✍ Handles a right input: if the slider is idle and the element is focused or its right button is pressed, triggers the right click and returns true; otherwise returns false. |
| `BinaryOptionElement:setState(state: any, forceEvent: any, skipAnimation: any)` | 230 | ✍ Validates that the state is left or right (warns otherwise). If unchanged, optionally raises the click callback when forced; if changed, applies it via the parent, refreshes selection and slider direction, and stores `skipAnimation`. |
| `BinaryOptionElement:onRightButtonClicked()` | 255 | ✍ Gives focus to the element silently, then if changes are allowed and the state is not already right, plays the click sound, switches to right, updates content, raises the click callback (false) and notifies the index change. |
| `BinaryOptionElement:onLeftButtonClicked()` | 273 | ✍ Gives focus silently, then if allowed and not already left, plays the click sound, switches to left, updates content, raises the click callback (true) and notifies the index change. |
| `BinaryOptionElement:updateSelection()` | 291 | ✍ Marks the matching button as selected and sets the slider direction (+1 toward right, -1 toward left) so `update` animates it. |
