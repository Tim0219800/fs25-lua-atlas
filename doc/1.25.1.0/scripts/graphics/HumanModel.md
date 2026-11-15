# graphics/HumanModel.lua

Source: `dataS/scripts/graphics/HumanModel.lua` — FS25 1.25.1.0

- **HumanModel** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HumanModel.registerXMLPaths(xmlSchema: XMLSchema, baseKey: string)` | 18 |  |
| `HumanModel.new(customMt: any) → table` | 43 |  |
| `HumanModel:load(xmlFilename: string, isRealPlayer: boolean, isOwner: boolean, isAnimated: boolean, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table)` | 228 |  |
| `HumanModel:loadFromXMLFileAsync(xmlFile: XMLFile, isRealPlayer: boolean, isOwner: boolean, isAnimated: boolean, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table)` | 260 |  |
| `HumanModel:loadFileFinished(rootNode: any, failedReason: any, arguments: any)` | 294 |  |
| `HumanModel:onAllModelPartsLoaded(playerStyle: any)` | 541 |  |
| `HumanModel:getVisibility() → boolean` | 964 |  |
| `HumanModel:setVisibility(isVisible: boolean)` | 978 |  |
| `HumanModel:debugDraw(x: number, y: number, textSize: number) → number` | 1059 |  |
