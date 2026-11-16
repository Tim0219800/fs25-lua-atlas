# graphics/HumanGraphicsComponent.lua

*[Version française](../../fr/scripts/graphics/HumanGraphicsComponent.md)*

Source: `dataS/scripts/graphics/HumanGraphicsComponent.lua` — FS25 1.25.1.0

✍ Visual side of a human character (player or NPC). It owns the scene root node, a shoulder camera node, a foliage bending node, the HumanModel, the PlayerStyle objects, an optional facial animation, the sounds object and a ConditionalAnimation with its registered parameters (speed, grounded, swimming, crouching, chainsaw...). The model, style and facial animation classes are defined elsewhere (UNVERIFIED).

- **HumanGraphicsComponent** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HumanGraphicsComponent.new() → HumanGraphicsComponent` | 20 | ✍ Builds the component with empty model, two PlayerStyle objects (current and base), sounds, and a ConditionalAnimation registering about twenty typed parameters. Then calls defaultAllParameters, which is not defined in this file (UNVERIFIED). |
| `HumanGraphicsComponent:initialize()` | 95 | ✍ Creates the scene nodes under the root node: graphics root, right shoulder camera node (fixed local offset) and foliage bending node. Call once when the character enters the map. |
| `HumanGraphicsComponent:show()` | 113 | ✍ Makes the character model visible by calling setModelVisibility(true). |
| `HumanGraphicsComponent:hide()` | 119 | ✍ Hides the character model by calling setModelVisibility(false), which also removes foliage bending. |
| `HumanGraphicsComponent:delete()` | 125 | ✍ Releases everything: facial animation, sounds, animation, model, the graphics root node and the foliage bending object registered in the mission's foliageBendingSystem. |
| `HumanGraphicsComponent:setModel(model: HumanModel)` | 156 | ✍ Replaces the current model by another with a root node (logs an error and returns if absent). Deletes the old model, links the new root under the graphics node, then calls loadAnimation and loadSounds (not defined in this file, UNVERIFIED) and shows it. |
| `HumanGraphicsComponent:setModelVisibility(visibility: boolean, overrideFoliageBending: any)` | 309 | ✍ Shows or hides the model, re-applies the root node visibility, and creates or destroys the foliage bending rectangle (about 1 m square) depending on visibility or the optional override. |
| `HumanGraphicsComponent:applyCustomWorkStyle(presetName: string, isOwner: any)` | 374 | ✍ Applies a named style preset (for example work clothes) on a copy of the base style, as a temporary style. With an empty or unknown preset name it goes back to the base style. Style loading is asynchronous. |
| `HumanGraphicsComponent:getStyle(currentStyle: boolean?) → PlayerStyle` | 398 | ✍ Returns the current style if the flag is true, otherwise the base style (falling back to the current one if no base exists). |
| `HumanGraphicsComponent:getRequiresModelReload(style: PlayerStyle) → boolean` | 411 | ✍ Returns true if the style uses a different model XML than the current model, meaning the model is reloaded and its node ids become invalid. |
| `HumanGraphicsComponent:setStyleAsync(style: PlayerStyle, callback: function?, callbackObject: table?, callbackArgs: table?, isTempStyle: boolean?, xmlFile: XMLFile?, isOwner: boolean?)` | 436 | ✍ Applies a style, either by updating the existing model parts or by loading a new model first, then optionally loads facial animation. The callback receives the loading state and whether a new model was loaded; per its own doc it may not run in multiplayer. A failed model load only logs a warning. |
| `HumanGraphicsComponent:update(dt: number)` | 530 | ✍ Per-frame update (dt in ms) of the animation, the sounds and, if present, the facial animation and its emotions. |
| `HumanGraphicsComponent:debugDraw(x: number, y: number, textSize: number, debugDrawModel: boolean?) → number` | 603 | ✍ Draws debug overlays: the model (unless disabled), the root and shoulder camera nodes, a header, the yaw of the root node and the style info. Returns the next y screen position. |
| `HumanGraphicsComponent:debugDrawAnimator(x: number, y: number, textSize: number) → number` | 634 | ✍ Draws the animation debug info at the given position and returns the new y position. |
