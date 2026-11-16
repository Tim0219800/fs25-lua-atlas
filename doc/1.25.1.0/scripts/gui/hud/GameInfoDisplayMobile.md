# gui/hud/GameInfoDisplayMobile.lua

*[Version française](../../../fr/scripts/gui/hud/GameInfoDisplayMobile.md)*

Source: `dataS/scripts/gui/hud/GameInfoDisplayMobile.lua` — FS25 1.25.1.0

✍ Top HUD bar for the mobile/touch layout, derived from HUDDisplayElement. It spans the screen width inside the safe-frame insets and hosts menu, shop, map and help buttons plus weather, money and fuel/fitness elements. The create* helpers, updateInsets and updateButtonPosition are called here but not defined in this file (UNVERIFIED). The button handlers forward to g_currentMission toggles unless the sleep manager is sleeping.

- **GameInfoDisplayMobile** inherits from `HUDDisplayElement` (l.31)

## Functions

| Function | Line | Description |
|---|---|---|
| `GameInfoDisplayMobile.new(hud: string, hudAtlasPath: string, moneyUnit: any, controlHudAtlasPath: any)` | 38 | ✍ Constructor taking the HUD, the HUD atlas path, the money unit and the control atlas path. Creates the background frame, builds the buttons and weather/money/fuel elements through create* helpers and subscribes to MessageType.INSETS_CHANGED. |
| `GameInfoDisplayMobile:setVehicle(vehicle: any)` | 70 | ✍ Stores the controlled vehicle, flags whether it has the Rideable specialization, and shows the fuel/fitness element only when a vehicle is set. |
| `GameInfoDisplayMobile:onOpenShop()` | 407 | ✍ Button handler calling g_currentMission:onToggleStore(); ignored while the sleep manager is sleeping. |
| `GameInfoDisplayMobile:onOpenMap()` | 416 | ✍ Button handler calling g_currentMission:onToggleMap(); ignored while the sleep manager is sleeping. |
| `GameInfoDisplayMobile:onOpenMenu()` | 425 | ✍ Button handler calling g_currentMission:onToggleMenu(); ignored while the sleep manager is sleeping. |
| `GameInfoDisplayMobile:onOpenHelp()` | 434 | ✍ Button handler calling g_currentMission:onToggleHelp(); ignored while the sleep manager is sleeping. |
| `GameInfoDisplayMobile:setMoneyUnit(moneyUnit: integer)` | 444 | ✍ Sets the currency unit (GS_MONEY_EURO, POUND or DOLLAR); any other value falls back to dollar. |
| `GameInfoDisplayMobile:setMissionInfo(missionInfo: table)` | 455 | ✍ Stores the MissionInfo reference used for base information; it should not be modified. |
| `GameInfoDisplayMobile:setEnvironment(environment: table)` | 462 | ✍ Stores the environment reference used for weather display; its class is not in the SDK dump (UNVERIFIED). |
| `GameInfoDisplayMobile:setMoneyVisible(isVisible: any)` | 468 | ✍ Empty stub: the body is empty in this version, so it has no effect. |
| `GameInfoDisplayMobile:setTimeVisible(isVisible: any)` | 473 | ✍ Empty stub: the body is empty in this version, so it has no effect. |
| `GameInfoDisplayMobile:setTemperatureVisible(isVisible: any)` | 478 | ✍ Empty stub: the body is empty in this version, so it has no effect. |
| `GameInfoDisplayMobile:setWeatherVisible(isVisible: any)` | 483 | ✍ Empty stub: the body is empty in this version, so it has no effect. |
| `GameInfoDisplayMobile:setTutorialVisible(isVisible: any)` | 491 | ✍ Empty stub: the body is empty in this version, so it has no effect. |
| `GameInfoDisplayMobile:setTutorialProgress(progress: number)` | 497 | ✍ Empty stub: the body is empty in this version, so it has no effect. |
| `GameInfoDisplayMobile:draw()` | 525 | ✍ Runs every registered text draw function in textElements, then draws the parent element. |
| `GameInfoDisplayMobile:setScale(uiScale: any)` | 571 | ✍ Applies a uniform UI scale, recomputes the bar position and size, stores the original position, repositions the shop/menu/map/help buttons relative to the bar corner and moves the help highlight. |
| `GameInfoDisplayMobile.getBackgroundPositionAndSize(scale: scale) → number, number` | 609 | ✍ Returns x, y, width and height of the bar: it fills the screen width minus the larger of the safe-frame inset and the scaled offset on each side, and sits at the top edge. |
| `GameInfoDisplayMobile.createBackground()` | 634 | ✍ Creates an image-less overlay with the computed bar rectangle, used as a positioning frame. |

## Messages

- subscribes `MessageType.INSETS_CHANGED` (l.63)
