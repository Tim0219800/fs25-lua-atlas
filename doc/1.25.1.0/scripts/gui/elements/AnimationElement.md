# gui/elements/AnimationElement.lua

*[Version française](../../../fr/scripts/gui/elements/AnimationElement.md)*

Source: `dataS/scripts/gui/elements/AnimationElement.lua` — FS25 1.25.1.0

✍ GUI image element that animates itself, either by stepping UV coordinates across the frames of a sprite sheet (UV_SHIFT, default) or by continuously rotating the overlay. Derived from BitmapElement and uses the "image" layer. Client-side GUI only.

- **AnimationElement** inherits from `BitmapElement` (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimationElement.new(target: any, custom_mt: any)` | 31 | ✍ Constructor. Defaults: UV_SHIFT mode, 8 frames, 120 ms per step (or per rotation turn), no rotation pivot; creates the element through BitmapElement. |
| `AnimationElement:loadFromXML(xmlFile: any, key: any)` | 51 | ✍ Reads animationOffset, animationFrames, animationSpeed, animationRotationPivot, animationUVOffset and animationMode ("uvshift" or anything else = rotate) from the XML node, remembers the default UVs, then computes frame data. |
| `AnimationElement:loadProfile(profile: any, applyProfile: any)` | 82 | ✍ Same settings as the XML loader (offset, frames, speed, rotation pivot, UV offset, mode) but read from a GUI profile. Does not recompute frame data itself. |
| `AnimationElement:copyAttributes(src: any)` | 108 | ✍ Copies the animation settings and default UVs from a source element, resets the image UVs to those defaults and recomputes the frame data. |
| `AnimationElement:update(dt: any)` | 125 | ✍ Per-frame update. In UV_SHIFT mode advances to the next frame (wrapping to 0) each time the timer of animationSpeed ms elapses; in ROTATE mode turns the overlay by a full turn per animationSpeed ms. |
| `AnimationElement:updateAnimationUVs()` | 149 | ✍ In UV_SHIFT mode, sets the image UVs to the horizontal slice of the current frame (start position plus frame size and optional gap times the frame index). No effect in rotate mode. |
| `AnimationElement:updateRotation()` | 158 | ✍ Applies the current rotation angle to the overlay around the pivot (the custom rotation pivot if set, otherwise the element pivot) scaled by the absolute size. |
| `AnimationElement:setAnimationData()` | 170 | ✍ If an overlay exists, derives the width of one frame and the start position from the overlay UVs, frame count and gap, then refreshes the UVs. |
