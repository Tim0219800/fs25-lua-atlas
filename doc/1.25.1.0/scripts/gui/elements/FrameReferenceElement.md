# gui/elements/FrameReferenceElement.lua

*[Version française](../../../fr/scripts/gui/elements/FrameReferenceElement.md)*

Source: `dataS/scripts/gui/elements/FrameReferenceElement.lua` — FS25 1.25.1.0

✍ FrameReferenceElement is a placeholder GuiElement that names a frame to display. It stores the name from the XML attribute ref. Resolution and removal of the placeholder happen in the GUI loading code, which is not in this file: UNVERIFIED.

- **FrameReferenceElement** inherits from `GuiElement` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `FrameReferenceElement.new(target: any, custom_mt: any)` | 22 | ✍ Constructor. Creates the element with an empty referencedFrameName. |
| `FrameReferenceElement:loadFromXML(xmlFile: any, key: any)` | 32 | ✍ Loads the base attributes and reads the referenced frame name from the ref attribute (empty string if absent). |
| `FrameReferenceElement:copyAttributes(src: any)` | 40 | ✍ Copies base attributes and the referenced frame name from a source element. |
