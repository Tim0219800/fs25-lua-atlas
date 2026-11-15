# gui/hud/GameInfoDisplayMobile.lua

Source : `dataS/scripts/gui/hud/GameInfoDisplayMobile.lua` — FS25 1.25.1.0

- **GameInfoDisplayMobile** hérite de `HUDDisplayElement` (l.31)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GameInfoDisplayMobile.new(hud: string, hudAtlasPath: string, moneyUnit: any, controlHudAtlasPath: any)` | 38 |  |
| `GameInfoDisplayMobile:setVehicle(vehicle: any)` | 70 |  |
| `GameInfoDisplayMobile:onOpenShop()` | 407 |  |
| `GameInfoDisplayMobile:onOpenMap()` | 416 |  |
| `GameInfoDisplayMobile:onOpenMenu()` | 425 |  |
| `GameInfoDisplayMobile:onOpenHelp()` | 434 |  |
| `GameInfoDisplayMobile:setMoneyUnit(moneyUnit: integer)` | 444 |  |
| `GameInfoDisplayMobile:setMissionInfo(missionInfo: table)` | 455 |  |
| `GameInfoDisplayMobile:setEnvironment(environment: table)` | 462 |  |
| `GameInfoDisplayMobile:setMoneyVisible(isVisible: any)` | 468 |  |
| `GameInfoDisplayMobile:setTimeVisible(isVisible: any)` | 473 |  |
| `GameInfoDisplayMobile:setTemperatureVisible(isVisible: any)` | 478 |  |
| `GameInfoDisplayMobile:setWeatherVisible(isVisible: any)` | 483 |  |
| `GameInfoDisplayMobile:setTutorialVisible(isVisible: any)` | 491 |  |
| `GameInfoDisplayMobile:setTutorialProgress(progress: number)` | 497 |  |
| `GameInfoDisplayMobile:draw()` | 525 |  |
| `GameInfoDisplayMobile:setScale(uiScale: any)` | 571 |  |
| `GameInfoDisplayMobile.getBackgroundPositionAndSize(scale: scale) → number, number` | 609 |  |
| `GameInfoDisplayMobile.createBackground()` | 634 |  |

## Messages

- écoute `MessageType.INSETS_CHANGED` (l.63)
