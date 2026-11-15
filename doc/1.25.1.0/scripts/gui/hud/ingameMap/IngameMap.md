# gui/hud/ingameMap/IngameMap.lua

Source: `dataS/scripts/gui/hud/ingameMap/IngameMap.lua` — FS25 1.25.1.0

- **IngameMap** inherits from `HUDElement` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `IngameMap.new(customMt: table?) → table` | 43 |  |
| `IngameMap:delete()` | 120 |  |
| `IngameMap:setFullscreen(isFullscreen: any)` | 139 |  |
| `IngameMap:toggleSize(state: any, force: any)` | 177 |  |
| `IngameMap:resetSettings()` | 217 |  |
| `IngameMap:setAllowToggle(isAllowed: any)` | 249 |  |
| `IngameMap:loadMap(filename: any, worldSizeX: any, worldSizeZ: any, fieldColor: any, grassFieldColor: any)` | 270 |  |
| `IngameMap:setWorldSize(worldSizeX: any, worldSizeZ: any)` | 293 |  |
| `IngameMap:addMapHotspot(mapHotspot: any)` | 313 |  |
| `IngameMap:removeMapHotspot(mapHotspot: any)` | 327 |  |
| `IngameMap:setSelectedHotspot(hotspot: any)` | 353 |  |
| `IngameMap:drawPlayersCoordinates()` | 737 |  |
| `IngameMap:drawLatencyToServer()` | 746 |  |
| `IngameMap:drawHotspot(hotspot: any, smallVersion: any, scale: any, doDebug: any)` | 801 |  |
| `IngameMap:setScale(uiScale: number)` | 846 |  |
| `IngameMap:storeScaledValues(uiScale: any)` | 855 |  |
| `IngameMap:getBackgroundPosition()` | 882 |  |
| `IngameMap:createBackground()` | 895 |  |
| `IngameMap:createComponents()` | 907 |  |
| `IngameMap:createToggleMapSizeGlyph(baseX: any, baseY: any, baseWidth: any, baseHeight: any)` | 916 |  |
