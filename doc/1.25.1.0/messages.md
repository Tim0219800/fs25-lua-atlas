# MessageType

*[Version française](fr/messages.md)*

| Message | Published by | Subscribers |
|---|---|---|
| `MessageType.AI_JOB_REMOVED` | ai/AISystem.lua | 0 |
| `MessageType.AI_JOB_STARTED` | ai/AISystem.lua | 0 |
| `MessageType.AI_JOB_STOPPED` | ai/AISystem.lua | 0 |
| `MessageType.AI_SYSTEM_LOADED` | ai/AISystem.lua | 0 |
| `MessageType.AI_TASK_SKIPPED` | ai/events/AIJobSkipTaskEvent.lua | 0 |
| `MessageType.APP_WINDOW_FOCUS_CHANGED` | — | 1 |
| `MessageType.DAY_CHANGED` | — | 2 |
| `MessageType.DAY_NIGHT_CHANGED` | — | 5 |
| `MessageType.FARMLAND_OWNER_CHANGED` | economy/FarmlandManager.lua | 2 |
| `MessageType.FARM_DELETED` | — | 3 |
| `MessageType.FARM_PROPERTY_CHANGED` | placeables/Placeable.lua | 0 |
| `MessageType.FARM_SETTINGS_CHANGED` | — | 1 |
| `MessageType.FINISHED_GROWTH_PERIOD` | — | 3 |
| `MessageType.GAME_STATE_CHANGED` | — | 1 |
| `MessageType.GUIDED_TOUR_DIALOG` | — | 1 |
| `MessageType.GUIDED_TOUR_FINISHED` | objects/TourIconsMobile.lua | 0 |
| `MessageType.GUI_AFTER_CLOSE` | gui/base/Gui.lua | 0 |
| `MessageType.GUI_AFTER_OPEN` | gui/base/Gui.lua | 0 |
| `MessageType.GUI_BEFORE_CLOSE` | gui/base/Gui.lua | 0 |
| `MessageType.GUI_BEFORE_OPEN` | gui/base/Gui.lua | 1 |
| `MessageType.GUI_DIALOG_OPENED` | gui/base/Gui.lua | 1 |
| `MessageType.GUI_INGAME_OPEN_AI_SCREEN` | vehicles/specializations/AIJobVehicle.lua | 0 |
| `MessageType.GUI_INGAME_OPEN_FINANCES_SCREEN` | triggers/LoanTrigger.lua | 0 |
| `MessageType.GUI_INGAME_OPEN_PRODUCTION_SCREEN` | objects/ProductionPoint.lua | 0 |
| `MessageType.HANDTOOL_ADDED` | handTools/HandToolSystem.lua | 0 |
| `MessageType.HANDTOOL_REMOVED` | handTools/HandToolSystem.lua | 0 |
| `MessageType.HOUR_CHANGED` | — | 6 |
| `MessageType.HUSBANDRY_ANIMALS_CHANGED` | animals/husbandry/placeables/PlaceableHusbandryAnimals.lua | 0 |
| `MessageType.INPUT_BINDINGS_CHANGED` | — | 2 |
| `MessageType.INPUT_DEVICES_CHANGED` | — | 2 |
| `MessageType.INPUT_MODE_CHANGED` | — | 3 |
| `MessageType.INSETS_CHANGED` | — | 2 |
| `MessageType.LOADED_ALL_SAVEGAME_PLACEABLES` | — | 1 |
| `MessageType.LOADING_STATIONS_CHANGED` | placeables/Placeable.lua | 0 |
| `MessageType.MINUTE_CHANGED` | — | 1 |
| `MessageType.MISSION_DELETED` | missions/AbstractMission.lua | 0 |
| `MessageType.MISSION_GENERATED` | missions/AbstractMission.lua, missions/MissionManager.lua | 0 |
| `MessageType.MISSION_GENERATION_END` | missions/MissionManager.lua | 1 |
| `MessageType.MISSION_GENERATION_START` | missions/MissionManager.lua | 1 |
| `MessageType.MONEY_CHANGED` | — | 1 |
| `MessageType.OWN_PLAYER_ENTERED` | player/Player.lua | 0 |
| `MessageType.PAUSE` | — | 1 |
| `MessageType.PERIOD_CHANGED` | — | 4 |
| `MessageType.PLACEABLE_ADDED` | placeables/PlaceableSystem.lua | 0 |
| `MessageType.PLACEABLE_PRE_DELETE` | placeables/Placeable.lua | 0 |
| `MessageType.PLACEABLE_REMOVED` | placeables/PlaceableSystem.lua | 0 |
| `MessageType.PLAYER_CREATED` | — | 3 |
| `MessageType.PLAYER_FARM_CHANGED` | player/events/PlayerSetFarmEvent.lua, player/events/PlayerSwitchedFarmEvent.lua | 7 |
| `MessageType.PLAYER_PRE_TELEPORT` | player/PlayerMover.lua | 1 |
| `MessageType.PLAYER_STYLE_CHANGED` | — | 2 |
| `MessageType.SAVEGAME_LOADED` | — | 1 |
| `MessageType.SETTING_CHANGED` | — | 23 |
| `MessageType.SLOT_USAGE_CHANGED` | — | 1 |
| `MessageType.SNOW_HEIGHT_CHANGED` | — | 1 |
| `MessageType.START_GROWTH_PERIOD` | — | 1 |
| `MessageType.STORAGE_ADDED_TO_LOADING_STATION` | — | 1 |
| `MessageType.STORAGE_ADDED_TO_UNLOADING_STATION` | — | 1 |
| `MessageType.STORAGE_REMOVED_FROM_LOADING_STATION` | — | 1 |
| `MessageType.STORAGE_REMOVED_FROM_UNLOADING_STATION` | — | 1 |
| `MessageType.STORE_ITEMS_RELOADED` | shop/StoreManager.lua | 0 |
| `MessageType.TREE_SHAPE_CUT` | misc/TreePlantManager.lua | 4 |
| `MessageType.TREE_SHAPE_MOUNTED` | vehicles/specializations/FellerBuncher.lua, vehicles/specializations/LogGrab.lua, vehicles/specializations/TensionBelts.lua, vehicles/specializations/Winch.lua, vehicles/specializations/WoodHarvester.lua, vehicles/specializations/YarderCarriage.lua | 3 |
| `MessageType.UNLOADING_STATIONS_CHANGED` | placeables/Placeable.lua | 0 |
| `MessageType.USER_REMOVED` | — | 1 |
| `MessageType.VEHICLE_ADDED` | vehicles/VehicleSystem.lua | 0 |
| `MessageType.VEHICLE_LOADED` | — | 1 |
| `MessageType.VEHICLE_REMOVED` | vehicles/VehicleSystem.lua | 0 |
| `MessageType.VEHICLE_REPAINTED` | vehicles/specializations/events/WearableRepaintEvent.lua | 0 |
| `MessageType.VEHICLE_REPAIRED` | vehicles/specializations/events/WearableRepairEvent.lua | 0 |
| `MessageType.VEHICLE_RESET` | vehicles/Vehicle.lua | 1 |
