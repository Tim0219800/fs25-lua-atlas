# FS25 Lua Atlas — game version 1.25.1.0

*[Version française](fr/index.md)*

961 files, 13390 functions, 819 engine functions. Written descriptions ✍: 961 files, 13390 functions.

- [Specialization events](evenements.md) · [Messages](messages.md) · [g_* globals](globales.md) · [Engine functions](moteur.md) · [In-game scan](releve.md)

## (root)

- [AnimCurve.lua](scripts/AnimCurve.md) — 1 fn ✍

## ai

- [ai/AIJobTypeManager.lua](scripts/ai/AIJobTypeManager.md) — 8 fn ✍
- [ai/AISystem.lua](scripts/ai/AISystem.md) — 54 fn ✍
- [ai/HelperManager.lua](scripts/ai/HelperManager.md) — 14 fn ✍
- [ai/NavigationSystem.lua](scripts/ai/NavigationSystem.md) — 9 fn ✍
- [ai/errors/AIMessage.lua](scripts/ai/errors/AIMessage.md) — 5 fn ✍
- [ai/errors/AIMessageErrorBlockedByObject.lua](scripts/ai/errors/AIMessageErrorBlockedByObject.md) — 1 fn ✍
- [ai/errors/AIMessageErrorCouldNotPrepare.lua](scripts/ai/errors/AIMessageErrorCouldNotPrepare.md) — 4 fn ✍
- [ai/errors/AIMessageErrorFieldNotOwned.lua](scripts/ai/errors/AIMessageErrorFieldNotOwned.md) — 2 fn ✍
- [ai/errors/AIMessageErrorFieldNotReady.lua](scripts/ai/errors/AIMessageErrorFieldNotReady.md) — 2 fn ✍
- [ai/errors/AIMessageErrorGraintankIsFull.lua](scripts/ai/errors/AIMessageErrorGraintankIsFull.md) — 2 fn ✍
- [ai/errors/AIMessageErrorImplementWrongWay.lua](scripts/ai/errors/AIMessageErrorImplementWrongWay.md) — 2 fn ✍
- [ai/errors/AIMessageErrorLoadingStationDeleted.lua](scripts/ai/errors/AIMessageErrorLoadingStationDeleted.md) — 2 fn ✍
- [ai/errors/AIMessageErrorNoFieldFound.lua](scripts/ai/errors/AIMessageErrorNoFieldFound.md) — 2 fn ✍
- [ai/errors/AIMessageErrorNoPalletsLoaded.lua](scripts/ai/errors/AIMessageErrorNoPalletsLoaded.md) — 3 fn ✍
- [ai/errors/AIMessageErrorNoValidFillTypeLoaded.lua](scripts/ai/errors/AIMessageErrorNoValidFillTypeLoaded.md) — 2 fn ✍
- [ai/errors/AIMessageErrorNoVineFound.lua](scripts/ai/errors/AIMessageErrorNoVineFound.md) — 2 fn ✍
- [ai/errors/AIMessageErrorNotReachable.lua](scripts/ai/errors/AIMessageErrorNotReachable.md) — 2 fn ✍
- [ai/errors/AIMessageErrorOutOfFill.lua](scripts/ai/errors/AIMessageErrorOutOfFill.md) — 2 fn ✍
- [ai/errors/AIMessageErrorOutOfFuel.lua](scripts/ai/errors/AIMessageErrorOutOfFuel.md) — 2 fn ✍
- [ai/errors/AIMessageErrorOutOfMoney.lua](scripts/ai/errors/AIMessageErrorOutOfMoney.md) — 2 fn ✍
- [ai/errors/AIMessageErrorPalletsFull.lua](scripts/ai/errors/AIMessageErrorPalletsFull.md) — 3 fn ✍
- [ai/errors/AIMessageErrorThreshingNotAllowed.lua](scripts/ai/errors/AIMessageErrorThreshingNotAllowed.md) — 2 fn ✍
- [ai/errors/AIMessageErrorUnknown.lua](scripts/ai/errors/AIMessageErrorUnknown.md) — 2 fn ✍
- [ai/errors/AIMessageErrorUnloadingStationDeleted.lua](scripts/ai/errors/AIMessageErrorUnloadingStationDeleted.md) — 2 fn ✍
- [ai/errors/AIMessageErrorUnloadingStationFull.lua](scripts/ai/errors/AIMessageErrorUnloadingStationFull.md) — 2 fn ✍
- [ai/errors/AIMessageErrorVehicleBroken.lua](scripts/ai/errors/AIMessageErrorVehicleBroken.md) — 2 fn ✍
- [ai/errors/AIMessageErrorVehicleDeleted.lua](scripts/ai/errors/AIMessageErrorVehicleDeleted.md) — 2 fn ✍
- [ai/errors/AIMessageErrorVineyardNotSupported.lua](scripts/ai/errors/AIMessageErrorVineyardNotSupported.md) — 2 fn ✍
- [ai/errors/AIMessageErrorWrongSeason.lua](scripts/ai/errors/AIMessageErrorWrongSeason.md) — 2 fn ✍
- [ai/errors/AIMessageManager.lua](scripts/ai/errors/AIMessageManager.md) — 6 fn ✍
- [ai/errors/AIMessageSuccessFinishedJob.lua](scripts/ai/errors/AIMessageSuccessFinishedJob.md) — 3 fn ✍
- [ai/errors/AIMessageSuccessSiloEmpty.lua](scripts/ai/errors/AIMessageSuccessSiloEmpty.md) — 3 fn ✍
- [ai/errors/AIMessageSuccessStoppedByUser.lua](scripts/ai/errors/AIMessageSuccessStoppedByUser.md) — 3 fn ✍
- [ai/events/AIJobSkipTaskEvent.lua](scripts/ai/events/AIJobSkipTaskEvent.md) — 5 fn ✍
- [ai/events/AIJobStartEvent.lua](scripts/ai/events/AIJobStartEvent.md) — 5 fn ✍
- [ai/events/AIJobStartRequestEvent.lua](scripts/ai/events/AIJobStartRequestEvent.md) — 6 fn ✍
- [ai/events/AIJobStopEvent.lua](scripts/ai/events/AIJobStopEvent.md) — 5 fn ✍
- [ai/events/AITaskStartEvent.lua](scripts/ai/events/AITaskStartEvent.md) — 5 fn ✍
- [ai/events/AITaskStopEvent.lua](scripts/ai/events/AITaskStopEvent.md) — 5 fn ✍
- [ai/jobs/AIJob.lua](scripts/ai/jobs/AIJob.md) — 39 fn ✍
- [ai/jobs/AIJobConveyor.lua](scripts/ai/jobs/AIJobConveyor.md) — 11 fn ✍
- [ai/jobs/AIJobDeliver.lua](scripts/ai/jobs/AIJobDeliver.md) — 19 fn ✍
- [ai/jobs/AIJobFieldWork.lua](scripts/ai/jobs/AIJobFieldWork.md) — 16 fn ✍
- [ai/jobs/AIJobGoTo.lua](scripts/ai/jobs/AIJobGoTo.md) — 12 fn ✍
- [ai/jobs/AIJobLoadAndDeliver.lua](scripts/ai/jobs/AIJobLoadAndDeliver.md) — 18 fn ✍
- [ai/parameters/AIParameter.lua](scripts/ai/parameters/AIParameter.md) — 8 fn ✍
- [ai/parameters/AIParameterFillType.lua](scripts/ai/parameters/AIParameterFillType.md) — 13 fn ✍
- [ai/parameters/AIParameterGroup.lua](scripts/ai/parameters/AIParameterGroup.md) — 4 fn ✍
- [ai/parameters/AIParameterLoadingStation.lua](scripts/ai/parameters/AIParameterLoadingStation.md) — 14 fn ✍
- [ai/parameters/AIParameterLooping.lua](scripts/ai/parameters/AIParameterLooping.md) — 10 fn ✍
- [ai/parameters/AIParameterPosition.lua](scripts/ai/parameters/AIParameterPosition.md) — 9 fn ✍
- [ai/parameters/AIParameterPositionAngle.lua](scripts/ai/parameters/AIParameterPositionAngle.md) — 12 fn ✍
- [ai/parameters/AIParameterUnloadingStation.lua](scripts/ai/parameters/AIParameterUnloadingStation.md) — 14 fn ✍
- [ai/parameters/AIParameterVehicle.lua](scripts/ai/parameters/AIParameterVehicle.md) — 9 fn ✍
- [ai/tasks/AITask.lua](scripts/ai/tasks/AITask.md) — 9 fn ✍
- [ai/tasks/AITaskConveyor.lua](scripts/ai/tasks/AITaskConveyor.md) — 5 fn ✍
- [ai/tasks/AITaskDischarge.lua](scripts/ai/tasks/AITaskDischarge.md) — 9 fn ✍
- [ai/tasks/AITaskDriveTo.lua](scripts/ai/tasks/AITaskDriveTo.md) — 12 fn ✍
- [ai/tasks/AITaskFieldWork.lua](scripts/ai/tasks/AITaskFieldWork.md) — 6 fn ✍
- [ai/tasks/AITaskLoading.lua](scripts/ai/tasks/AITaskLoading.md) — 10 fn ✍
- [ai/tasks/AITaskWaitForFilling.lua](scripts/ai/tasks/AITaskWaitForFilling.md) — 8 fn ✍

## animals

- [animals/AnimalLoadingTrigger.lua](scripts/animals/AnimalLoadingTrigger.md) — 15 fn ✍
- [animals/Dog.lua](scripts/animals/Dog.md) — 36 fn ✍
- [animals/DogPetActivatable.lua](scripts/animals/DogPetActivatable.md) — 4 fn ✍
- [animals/events/AnimalCleanEvent.lua](scripts/animals/events/AnimalCleanEvent.md) — 5 fn ✍
- [animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua](scripts/animals/events/AnimalHusbandryNoMorePalletSpaceEvent.md) — 5 fn ✍
- [animals/events/AnimalNameEvent.lua](scripts/animals/events/AnimalNameEvent.md) — 6 fn ✍
- [animals/events/AnimalRidingEvent.lua](scripts/animals/events/AnimalRidingEvent.md) — 5 fn ✍
- [animals/events/DogFetchItemEvent.lua](scripts/animals/events/DogFetchItemEvent.md) — 5 fn ✍
- [animals/events/DogFollowEvent.lua](scripts/animals/events/DogFollowEvent.md) — 5 fn ✍
- [animals/events/DogPetEvent.lua](scripts/animals/events/DogPetEvent.md) — 5 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandry.lua](scripts/animals/husbandry/placeables/PlaceableHusbandry.md) — 41 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.md) — 22 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryAnimals.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryAnimals.md) — 52 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.md) — 19 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryFence.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryFence.md) — 18 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryFood.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryFood.md) — 34 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryLiquidManure.md) — 11 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryMeadow.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryMeadow.md) — 14 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryMilk.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryMilk.md) — 15 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryPallets.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryPallets.md) — 27 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryStraw.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryStraw.md) — 17 fn ✍
- [animals/husbandry/placeables/PlaceableHusbandryWater.lua](scripts/animals/husbandry/placeables/PlaceableHusbandryWater.md) — 16 fn ✍
- [animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua](scripts/animals/husbandry/placeables/events/HusbandryCancelCreationEvent.md) — 5 fn ✍
- [animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua](scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.md) — 5 fn ✍
- [animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua](scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.md) — 5 fn ✍
- [animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua](scripts/animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.md) — 5 fn ✍
- [animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua](scripts/animals/husbandry/placeables/events/HusbandryFenceValidateEvent.md) — 5 fn ✍
- [animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua](scripts/animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.md) — 5 fn ✍
- [animals/wildlife/instances/WildlifeInstanceSimple.lua](scripts/animals/wildlife/instances/WildlifeInstanceSimple.md) — 1 fn ✍

## collections

- [collections/BaseStateMachineState.lua](scripts/collections/BaseStateMachineState.md) — 12 fn ✍
- [collections/DataGrid.lua](scripts/collections/DataGrid.md) — 4 fn ✍
- [collections/DynamicDataGrid.lua](scripts/collections/DynamicDataGrid.md) — 7 fn ✍
- [collections/ListenerList.lua](scripts/collections/ListenerList.md) — 4 fn ✍
- [collections/MapDataGrid.lua](scripts/collections/MapDataGrid.md) — 6 fn ✍
- [collections/ObjectPool.lua](scripts/collections/ObjectPool.md) — 5 fn ✍
- [collections/Queue.lua](scripts/collections/Queue.md) — 1 fn ✍
- [collections/StateMachine.lua](scripts/collections/StateMachine.md) — 15 fn ✍
- [collections/ValueInterpolator.lua](scripts/collections/ValueInterpolator.md) — 11 fn ✍

## configurations

- [configurations/ConfigurationManager.lua](scripts/configurations/ConfigurationManager.md) — 13 fn ✍
- [configurations/ConfigurationUtil.lua](scripts/configurations/ConfigurationUtil.md) — 23 fn ✍

## construction

- [construction/events/OrchardBuildCancelEvent.lua](scripts/construction/events/OrchardBuildCancelEvent.md) — 5 fn ✍
- [construction/events/OrchardBuildFinishedEvent.lua](scripts/construction/events/OrchardBuildFinishedEvent.md) — 5 fn ✍
- [construction/events/OrchardBuildRequestEvent.lua](scripts/construction/events/OrchardBuildRequestEvent.md) — 5 fn ✍

## debug

- [debug/DebugManager.lua](scripts/debug/DebugManager.md) — 6 fn ✍
- [debug/DebugUtil.lua](scripts/debug/DebugUtil.md) — 26 fn ✍
- [debug/elements/DebugBitVectorMap.lua](scripts/debug/elements/DebugBitVectorMap.md) — 6 fn ✍
- [debug/elements/DebugBox.lua](scripts/debug/elements/DebugBox.md) — 2 fn ✍
- [debug/elements/DebugCircle.lua](scripts/debug/elements/DebugCircle.md) — 1 fn ✍
- [debug/elements/DebugCylinder.lua](scripts/debug/elements/DebugCylinder.md) — 1 fn ✍
- [debug/elements/DebugDensityMap.lua](scripts/debug/elements/DebugDensityMap.md) — 1 fn ✍
- [debug/elements/DebugElement.lua](scripts/debug/elements/DebugElement.md) — 8 fn ✍
- [debug/elements/DebugFunction.lua](scripts/debug/elements/DebugFunction.md) — 2 fn ✍
- [debug/elements/DebugGizmo.lua](scripts/debug/elements/DebugGizmo.md) — 2 fn ✍
- [debug/elements/DebugInfoTable.lua](scripts/debug/elements/DebugInfoTable.md) — 1 fn ✍
- [debug/elements/DebugLine.lua](scripts/debug/elements/DebugLine.md) — 2 fn ✍
- [debug/elements/DebugPath.lua](scripts/debug/elements/DebugPath.md) — 5 fn ✍
- [debug/elements/DebugPlane.lua](scripts/debug/elements/DebugPlane.md) — 3 fn ✍
- [debug/elements/DebugPoint.lua](scripts/debug/elements/DebugPoint.md) — 2 fn ✍
- [debug/elements/DebugPolygon.lua](scripts/debug/elements/DebugPolygon.md) — 2 fn ✍
- [debug/elements/DebugShapeOutline.lua](scripts/debug/elements/DebugShapeOutline.md) — 1 fn ✍
- [debug/elements/DebugSphere.lua](scripts/debug/elements/DebugSphere.md) — 1 fn ✍
- [debug/elements/DebugSpline.lua](scripts/debug/elements/DebugSpline.md) — 1 fn ✍
- [debug/elements/DebugText.lua](scripts/debug/elements/DebugText.md) — 5 fn ✍
- [debug/elements/DebugText3D.lua](scripts/debug/elements/DebugText3D.md) — 4 fn ✍

## economy

- [economy/Farmland.lua](scripts/economy/Farmland.md) — 5 fn ✍
- [economy/FarmlandManager.lua](scripts/economy/FarmlandManager.md) — 30 fn ✍

## environment

- [environment/weather/Twister.lua](scripts/environment/weather/Twister.md) — 4 fn ✍

## events

- [events/BaleOpenEvent.lua](scripts/events/BaleOpenEvent.md) — 5 fn ✍
- [events/BaleUnpackEvent.lua](scripts/events/BaleUnpackEvent.md) — 5 fn ✍
- [events/InlineBaleOpenEvent.lua](scripts/events/InlineBaleOpenEvent.md) — 5 fn ✍
- [events/PlayerPermissionsEvent.lua](scripts/events/PlayerPermissionsEvent.md) — 1 fn ✍

## fence

- [fence/Fence.lua](scripts/fence/Fence.md) — 5 fn ✍
- [fence/FenceDeleteSegmentEvent.lua](scripts/fence/FenceDeleteSegmentEvent.md) — 4 fn ✍
- [fence/FenceGate.lua](scripts/fence/FenceGate.md) — 9 fn ✍
- [fence/FenceNewSegmentEvent.lua](scripts/fence/FenceNewSegmentEvent.md) — 4 fn ✍
- [fence/FenceRequestDeleteSegmentEvent.lua](scripts/fence/FenceRequestDeleteSegmentEvent.md) — 4 fn ✍
- [fence/FenceRequestDeleteSegmentPartEvent.lua](scripts/fence/FenceRequestDeleteSegmentPartEvent.md) — 6 fn ✍
- [fence/FenceSegment.lua](scripts/fence/FenceSegment.md) — 8 fn ✍
- [fence/FenceSegmentBatchEvent.lua](scripts/fence/FenceSegmentBatchEvent.md) — 6 fn ✍
- [fence/FenceSegmentEvent.lua](scripts/fence/FenceSegmentEvent.md) — 5 fn ✍

## field

- [field/Field.lua](scripts/field/Field.md) — 3 fn ✍
- [field/FieldManager.lua](scripts/field/FieldManager.md) — 7 fn ✍
- [field/FieldState.lua](scripts/field/FieldState.md) — 1 fn ✍

## fillTypes

- [fillTypes/FillTypeDesc.lua](scripts/fillTypes/FillTypeDesc.md) — 2 fn ✍
- [fillTypes/FillTypeManager.lua](scripts/fillTypes/FillTypeManager.md) — 32 fn ✍

## forestry

- [forestry/ForestryHook.lua](scripts/forestry/ForestryHook.md) — 20 fn ✍
- [forestry/ForestryPhysicsRope.lua](scripts/forestry/ForestryPhysicsRope.md) — 29 fn ✍
- [forestry/ForestryRope.lua](scripts/forestry/ForestryRope.md) — 15 fn ✍
- [forestry/TargetTreeMarker.lua](scripts/forestry/TargetTreeMarker.md) — 9 fn ✍

## fruits

- [fruits/FruitTypeDesc.lua](scripts/fruits/FruitTypeDesc.md) — 2 fn ✍
- [fruits/FruitTypeManager.lua](scripts/fruits/FruitTypeManager.md) — 32 fn ✍

## graphics

- [graphics/HumanGraphicsComponent.lua](scripts/graphics/HumanGraphicsComponent.md) — 14 fn ✍
- [graphics/HumanGraphicsComponentState.lua](scripts/graphics/HumanGraphicsComponentState.md) — 1 fn ✍
- [graphics/HumanModel.lua](scripts/graphics/HumanModel.md) — 9 fn ✍
- [graphics/HumanSounds.lua](scripts/graphics/HumanSounds.md) — 1 fn ✍

## gui

- [gui/AnimalScreen.lua](scripts/gui/AnimalScreen.md) — 8 fn ✍
- [gui/ConstructionScreen.lua](scripts/gui/ConstructionScreen.md) — 8 fn ✍
- [gui/InGameMenu.lua](scripts/gui/InGameMenu.md) — 2 fn ✍
- [gui/InGameMenuAnimalsFrame.lua](scripts/gui/InGameMenuAnimalsFrame.md) — 1 fn ✍
- [gui/InGameMenuStatisticsFrame.lua](scripts/gui/InGameMenuStatisticsFrame.md) — 4 fn ✍
- [gui/MainScreen.lua](scripts/gui/MainScreen.md) — 1 fn ✍
- [gui/ShopCategoriesFrame.lua](scripts/gui/ShopCategoriesFrame.md) — 1 fn ✍
- [gui/ShopItemsFrame.lua](scripts/gui/ShopItemsFrame.md) — 3 fn ✍
- [gui/WardrobeScreen.lua](scripts/gui/WardrobeScreen.md) — 1 fn ✍
- [gui/base/ButtonOverlay.lua](scripts/gui/base/ButtonOverlay.md) — 5 fn ✍
- [gui/base/FocusManager.lua](scripts/gui/base/FocusManager.md) — 32 fn ✍
- [gui/base/GlyphButtonOverlay.lua](scripts/gui/base/GlyphButtonOverlay.md) — 1 fn ✍
- [gui/base/Gui.lua](scripts/gui/base/Gui.md) — 47 fn ✍
- [gui/base/GuiDataSource.lua](scripts/gui/base/GuiDataSource.md) — 9 fn ✍
- [gui/base/GuiMixin.lua](scripts/gui/base/GuiMixin.md) — 5 fn ✍
- [gui/base/GuiOverlay.lua](scripts/gui/base/GuiOverlay.md) — 21 fn ✍
- [gui/base/GuiProfile.lua](scripts/gui/base/GuiProfile.md) — 5 fn ✍
- [gui/base/GuiSoundPlayer.lua](scripts/gui/base/GuiSoundPlayer.md) — 3 fn ✍
- [gui/base/GuiTopDownCamera.lua](scripts/gui/base/GuiTopDownCamera.md) — 27 fn ✍
- [gui/base/GuiTopDownCursor.lua](scripts/gui/base/GuiTopDownCursor.md) — 7 fn ✍
- [gui/base/GuiUtils.lua](scripts/gui/base/GuiUtils.md) — 5 fn ✍
- [gui/base/IndexChangeSubjectMixin.lua](scripts/gui/base/IndexChangeSubjectMixin.md) — 5 fn ✍
- [gui/base/MapOverlayGenerator.lua](scripts/gui/base/MapOverlayGenerator.md) — 24 fn ✍
- [gui/base/MultiValueTween.lua](scripts/gui/base/MultiValueTween.md) — 4 fn ✍
- [gui/base/NavigationMarker.lua](scripts/gui/base/NavigationMarker.md) — 1 fn ✍
- [gui/base/Overlay.lua](scripts/gui/base/Overlay.md) — 18 fn ✍
- [gui/base/OverlayCache.lua](scripts/gui/base/OverlayCache.md) — 1 fn ✍
- [gui/base/OverlayManager.lua](scripts/gui/base/OverlayManager.md) — 4 fn ✍
- [gui/base/PlaySampleMixin.lua](scripts/gui/base/PlaySampleMixin.md) — 6 fn ✍
- [gui/base/RoundStatusBar.lua](scripts/gui/base/RoundStatusBar.md) — 5 fn ✍
- [gui/base/SettingsModel.lua](scripts/gui/base/SettingsModel.md) — 112 fn ✍
- [gui/base/StatusBar.lua](scripts/gui/base/StatusBar.md) — 7 fn ✍
- [gui/base/TabbedMenu.lua](scripts/gui/base/TabbedMenu.md) — 41 fn ✍
- [gui/base/TabbedMenuWithDetails.lua](scripts/gui/base/TabbedMenuWithDetails.md) — 19 fn ✍
- [gui/base/ThreePartOverlay.lua](scripts/gui/base/ThreePartOverlay.md) — 1 fn ✍
- [gui/base/Tween.lua](scripts/gui/base/Tween.md) — 9 fn ✍
- [gui/base/TweenSequence.lua](scripts/gui/base/TweenSequence.md) — 16 fn ✍
- [gui/dialogs/AnimalWorkerDialog.lua](scripts/gui/dialogs/AnimalWorkerDialog.md) — 5 fn ✍
- [gui/dialogs/ColorPickerDialog.lua](scripts/gui/dialogs/ColorPickerDialog.md) — 3 fn ✍
- [gui/dialogs/InfoDialog.lua](scripts/gui/dialogs/InfoDialog.md) — 2 fn ✍
- [gui/dialogs/MultiOptionDialog.lua](scripts/gui/dialogs/MultiOptionDialog.md) — 1 fn ✍
- [gui/dialogs/TourDialog.lua](scripts/gui/dialogs/TourDialog.md) — 1 fn ✍
- [gui/dialogs/YesNoDialog.lua](scripts/gui/dialogs/YesNoDialog.md) — 1 fn ✍
- [gui/elements/AnimationElement.lua](scripts/gui/elements/AnimationElement.md) — 8 fn ✍
- [gui/elements/BinaryOptionElement.lua](scripts/gui/elements/BinaryOptionElement.md) — 18 fn ✍
- [gui/elements/BitmapElement.lua](scripts/gui/elements/BitmapElement.md) — 17 fn ✍
- [gui/elements/BoxLayoutElement.lua](scripts/gui/elements/BoxLayoutElement.md) — 14 fn ✍
- [gui/elements/BreadcrumbsElement.lua](scripts/gui/elements/BreadcrumbsElement.md) — 4 fn ✍
- [gui/elements/ButtonElement.lua](scripts/gui/elements/ButtonElement.md) — 39 fn ✍
- [gui/elements/CheckedOptionElement.lua](scripts/gui/elements/CheckedOptionElement.md) — 4 fn ✍
- [gui/elements/ClearElement.lua](scripts/gui/elements/ClearElement.md) — 10 fn ✍
- [gui/elements/ColorPickButtonElement.lua](scripts/gui/elements/ColorPickButtonElement.md) — 7 fn ✍
- [gui/elements/DialogElement.lua](scripts/gui/elements/DialogElement.md) — 5 fn ✍
- [gui/elements/DynamicFadedBitmapElement.lua](scripts/gui/elements/DynamicFadedBitmapElement.md) — 11 fn ✍
- [gui/elements/FrameElement.lua](scripts/gui/elements/FrameElement.md) — 15 fn ✍
- [gui/elements/FrameReferenceElement.lua](scripts/gui/elements/FrameReferenceElement.md) — 3 fn ✍
- [gui/elements/GuiElement.lua](scripts/gui/elements/GuiElement.md) — 79 fn ✍
- [gui/elements/IndexStateElement.lua](scripts/gui/elements/IndexStateElement.md) — 9 fn ✍
- [gui/elements/IngameMapElement.lua](scripts/gui/elements/IngameMapElement.md) — 38 fn ✍
- [gui/elements/IngameMapPreviewElement.lua](scripts/gui/elements/IngameMapPreviewElement.md) — 1 fn ✍
- [gui/elements/InputGlyphElementUI.lua](scripts/gui/elements/InputGlyphElementUI.md) — 7 fn ✍
- [gui/elements/ListItemElement.lua](scripts/gui/elements/ListItemElement.md) — 9 fn ✍
- [gui/elements/MultiOptionElement.lua](scripts/gui/elements/MultiOptionElement.md) — 6 fn ✍
- [gui/elements/MultiTextOptionElement.lua](scripts/gui/elements/MultiTextOptionElement.md) — 27 fn ✍
- [gui/elements/OptionSliderElement.lua](scripts/gui/elements/OptionSliderElement.md) — 12 fn ✍
- [gui/elements/OptionToggleElement.lua](scripts/gui/elements/OptionToggleElement.md) — 1 fn ✍
- [gui/elements/PagingElement.lua](scripts/gui/elements/PagingElement.md) — 12 fn ✍
- [gui/elements/PictureElement.lua](scripts/gui/elements/PictureElement.md) — 5 fn ✍
- [gui/elements/PlatformIconElement.lua](scripts/gui/elements/PlatformIconElement.md) — 4 fn ✍
- [gui/elements/RenderElement.lua](scripts/gui/elements/RenderElement.md) — 15 fn ✍
- [gui/elements/RoundCornerElement.lua](scripts/gui/elements/RoundCornerElement.md) — 6 fn ✍
- [gui/elements/SafeFrameElement.lua](scripts/gui/elements/SafeFrameElement.md) — 2 fn ✍
- [gui/elements/ScreenElement.lua](scripts/gui/elements/ScreenElement.md) — 10 fn ✍
- [gui/elements/ScrollingLayoutElement.lua](scripts/gui/elements/ScrollingLayoutElement.md) — 11 fn ✍
- [gui/elements/SliderElement.lua](scripts/gui/elements/SliderElement.md) — 32 fn ✍
- [gui/elements/SmoothListElement.lua](scripts/gui/elements/SmoothListElement.md) — 46 fn ✍
- [gui/elements/TabbedMenuFrameElement.lua](scripts/gui/elements/TabbedMenuFrameElement.md) — 14 fn ✍
- [gui/elements/TableHeaderElement.lua](scripts/gui/elements/TableHeaderElement.md) — 8 fn ✍
- [gui/elements/TerrainLayerElement.lua](scripts/gui/elements/TerrainLayerElement.md) — 7 fn ✍
- [gui/elements/TextBackdropElement.lua](scripts/gui/elements/TextBackdropElement.md) — 4 fn ✍
- [gui/elements/TextElement.lua](scripts/gui/elements/TextElement.md) — 44 fn ✍
- [gui/elements/TextInputElement.lua](scripts/gui/elements/TextInputElement.md) — 38 fn ✍
- [gui/elements/ThreePartBitmapElement.lua](scripts/gui/elements/ThreePartBitmapElement.md) — 7 fn ✍
- [gui/elements/TimerElement.lua](scripts/gui/elements/TimerElement.md) — 8 fn ✍
- [gui/elements/ToggleButtonElement.lua](scripts/gui/elements/ToggleButtonElement.md) — 13 fn ✍
- [gui/elements/VideoElement.lua](scripts/gui/elements/VideoElement.md) — 16 fn ✍
- [gui/hud/AchievementMessage.lua](scripts/gui/hud/AchievementMessage.md) — 2 fn ✍
- [gui/hud/ChatDisplay.lua](scripts/gui/hud/ChatDisplay.md) — 3 fn ✍
- [gui/hud/ContextActionDisplay.lua](scripts/gui/hud/ContextActionDisplay.md) — 6 fn ✍
- [gui/hud/ControlBarDisplay.lua](scripts/gui/hud/ControlBarDisplay.md) — 18 fn ✍
- [gui/hud/FillLevelsDisplay.lua](scripts/gui/hud/FillLevelsDisplay.md) — 1 fn ✍
- [gui/hud/GameInfoDisplay.lua](scripts/gui/hud/GameInfoDisplay.md) — 2 fn ✍
- [gui/hud/GameInfoDisplayMobile.lua](scripts/gui/hud/GameInfoDisplayMobile.md) — 19 fn ✍
- [gui/hud/GamePausedDisplay.lua](scripts/gui/hud/GamePausedDisplay.md) — 4 fn ✍
- [gui/hud/HUDDisplayElement.lua](scripts/gui/hud/HUDDisplayElement.md) — 10 fn ✍
- [gui/hud/HUDElement.lua](scripts/gui/hud/HUDElement.md) — 32 fn ✍
- [gui/hud/HUDFrameElement.lua](scripts/gui/hud/HUDFrameElement.md) — 8 fn ✍
- [gui/hud/HUDPopupMessageMobile.lua](scripts/gui/hud/HUDPopupMessageMobile.md) — 25 fn ✍
- [gui/hud/HUDSliderElement.lua](scripts/gui/hud/HUDSliderElement.md) — 1 fn ✍
- [gui/hud/HUDTextButtonElement.lua](scripts/gui/hud/HUDTextButtonElement.md) — 1 fn ✍
- [gui/hud/HUDTextDisplay.lua](scripts/gui/hud/HUDTextDisplay.md) — 10 fn ✍
- [gui/hud/InfoDisplay.lua](scripts/gui/hud/InfoDisplay.md) — 3 fn ✍
- [gui/hud/InfoDisplayBox.lua](scripts/gui/hud/InfoDisplayBox.md) — 6 fn ✍
- [gui/hud/InfoDisplayKeyValueBox.lua](scripts/gui/hud/InfoDisplayKeyValueBox.md) — 1 fn ✍
- [gui/hud/InfoDisplayKeyValueBoxMobile.lua](scripts/gui/hud/InfoDisplayKeyValueBoxMobile.md) — 11 fn ✍
- [gui/hud/IngameMessage.lua](scripts/gui/hud/IngameMessage.md) — 3 fn ✍
- [gui/hud/InputGlyphElement.lua](scripts/gui/hud/InputGlyphElement.md) — 15 fn ✍
- [gui/hud/InputHelpDisplay.lua](scripts/gui/hud/InputHelpDisplay.md) — 4 fn ✍
- [gui/hud/POIInfoDisplay.lua](scripts/gui/hud/POIInfoDisplay.md) — 4 fn ✍
- [gui/hud/PlayerControlPadDisplay.lua](scripts/gui/hud/PlayerControlPadDisplay.md) — 14 fn ✍
- [gui/hud/SideNotification.lua](scripts/gui/hud/SideNotification.md) — 4 fn ✍
- [gui/hud/SideNotificationMobile.lua](scripts/gui/hud/SideNotificationMobile.md) — 3 fn ✍
- [gui/hud/SpeakerDisplay.lua](scripts/gui/hud/SpeakerDisplay.md) — 3 fn ✍
- [gui/hud/SpeedMeterDisplay.lua](scripts/gui/hud/SpeedMeterDisplay.md) — 6 fn ✍
- [gui/hud/SpeedSliderDisplay.lua](scripts/gui/hud/SpeedSliderDisplay.md) — 25 fn ✍
- [gui/hud/SteeringSliderDisplay.lua](scripts/gui/hud/SteeringSliderDisplay.md) — 18 fn ✍
- [gui/hud/SwitchVehicleDisplay.lua](scripts/gui/hud/SwitchVehicleDisplay.md) — 13 fn ✍
- [gui/hud/TopNotification.lua](scripts/gui/hud/TopNotification.md) — 3 fn ✍
- [gui/hud/WarningDisplay.lua](scripts/gui/hud/WarningDisplay.md) — 3 fn ✍
- [gui/hud/extensions/AIModeHUDExtension.lua](scripts/gui/hud/extensions/AIModeHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/BaleCounterHUDExtension.lua](scripts/gui/hud/extensions/BaleCounterHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/BalerStationaryHUDExtension.lua](scripts/gui/hud/extensions/BalerStationaryHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/CrabSteeringHUDExtension.lua](scripts/gui/hud/extensions/CrabSteeringHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/CruiseControlHUDExtension.lua](scripts/gui/hud/extensions/CruiseControlHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/MixerWagonHUDExtension.lua](scripts/gui/hud/extensions/MixerWagonHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/VariableWorkWidthHUDExtension.lua](scripts/gui/hud/extensions/VariableWorkWidthHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/WorkModeHUDExtension.lua](scripts/gui/hud/extensions/WorkModeHUDExtension.md) — 1 fn ✍
- [gui/hud/extensions/YarderTowerHUDExtension.lua](scripts/gui/hud/extensions/YarderTowerHUDExtension.md) — 1 fn ✍
- [gui/hud/ingameMap/IngameMap.lua](scripts/gui/hud/ingameMap/IngameMap.md) — 20 fn ✍
- [gui/hud/ingameMap/IngameMapMobile.lua](scripts/gui/hud/ingameMap/IngameMapMobile.md) — 1 fn ✍

## guidedTour

- [guidedTour/GuidedTourManager.lua](scripts/guidedTour/GuidedTourManager.md) — 6 fn ✍

## handTools

- [handTools/HandTool.lua](scripts/handTools/HandTool.md) — 47 fn ✍
- [handTools/HandToolHolder.lua](scripts/handTools/HandToolHolder.md) — 32 fn ✍
- [handTools/HandToolHolderActivatable.lua](scripts/handTools/HandToolHolderActivatable.md) — 4 fn ✍
- [handTools/HandToolLoadingData.lua](scripts/handTools/HandToolLoadingData.md) — 7 fn ✍
- [handTools/HandToolSystem.lua](scripts/handTools/HandToolSystem.md) — 15 fn ✍
- [handTools/HandToolUtil.lua](scripts/handTools/HandToolUtil.md) — 2 fn ✍
- [handTools/events/ChainsawCutEvent.lua](scripts/handTools/events/ChainsawCutEvent.md) — 5 fn ✍
- [handTools/events/FlashlightToggleLightEvent.lua](scripts/handTools/events/FlashlightToggleLightEvent.md) — 6 fn ✍
- [handTools/events/HandToolSetHolderEvent.lua](scripts/handTools/events/HandToolSetHolderEvent.md) — 6 fn ✍
- [handTools/events/HandsPickUpFailedEvent.lua](scripts/handTools/events/HandsPickUpFailedEvent.md) — 5 fn ✍
- [handTools/events/HandsPickUpObjectEvent.lua](scripts/handTools/events/HandsPickUpObjectEvent.md) — 7 fn ✍
- [handTools/events/HandsThrowObjectEvent.lua](scripts/handTools/events/HandsThrowObjectEvent.md) — 4 fn ✍
- [handTools/specializations/HandToolBob.lua](scripts/handTools/specializations/HandToolBob.md) — 10 fn ✍
- [handTools/specializations/HandToolChainsaw.lua](scripts/handTools/specializations/HandToolChainsaw.md) — 31 fn ✍
- [handTools/specializations/HandToolFlashlight.lua](scripts/handTools/specializations/HandToolFlashlight.md) — 10 fn ✍
- [handTools/specializations/HandToolHPWLance.lua](scripts/handTools/specializations/HandToolHPWLance.md) — 17 fn ✍
- [handTools/specializations/HandToolHands.lua](scripts/handTools/specializations/HandToolHands.md) — 44 fn ✍
- [handTools/specializations/HandToolHorseBrush.lua](scripts/handTools/specializations/HandToolHorseBrush.md) — 11 fn ✍
- [handTools/specializations/HandToolMotorized.lua](scripts/handTools/specializations/HandToolMotorized.md) — 34 fn ✍
- [handTools/specializations/HandToolSprayCan.lua](scripts/handTools/specializations/HandToolSprayCan.md) — 23 fn ✍
- [handTools/specializations/HandToolStorable.lua](scripts/handTools/specializations/HandToolStorable.md) — 6 fn ✍
- [handTools/specializations/HandToolTethered.lua](scripts/handTools/specializations/HandToolTethered.md) — 14 fn ✍

## i3d

- [i3d/I3DManager.lua](scripts/i3d/I3DManager.md) — 17 fn ✍

## input

- [input/InputBinding.lua](scripts/input/InputBinding.md) — 1 fn ✍

## internalMods

- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.md) — 24 fn ✍
- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.md) — 11 fn ✍
- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.md) — 12 fn ✍
- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.md) — 12 fn ✍
- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.md) — 12 fn ✍
- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.md) — 11 fn ✍
- [internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua](scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.md) — 15 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.md) — 4 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.md) — 4 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.md) — 4 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.md) — 4 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua](scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/hud/ExtendedCombineHUDExtension.lua](scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedCombineHUDExtension.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.lua](scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.lua](scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua](scripts/internalMods/FS25_precisionFarming/scripts/maps/CoverMap.md) — 3 fn ✍
- [internalMods/FS25_precisionFarming/scripts/maps/TramlineMap.lua](scripts/internalMods/FS25_precisionFarming/scripts/maps/TramlineMap.md) — 1 fn ✍
- [internalMods/FS25_precisionFarming/scripts/maps/ValueMap.lua](scripts/internalMods/FS25_precisionFarming/scripts/maps/ValueMap.md) — 1 fn ✍
- [internalMods/FS25_precisionFarming/scripts/maps/YieldMap.lua](scripts/internalMods/FS25_precisionFarming/scripts/maps/YieldMap.md) — 1 fn ✍
- [internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua](scripts/internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.md) — 18 fn ✍
- [internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua](scripts/internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.md) — 8 fn ✍
- [internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua](scripts/internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/misc/InfoDisplayBoxPrecisionFarming.lua](scripts/internalMods/FS25_precisionFarming/scripts/misc/InfoDisplayBoxPrecisionFarming.md) — 1 fn ✍
- [internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua](scripts/internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.md) — 8 fn ✍
- [internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua](scripts/internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.md) — 12 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.md) — 18 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.md) — 9 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.md) — 2 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.md) — 13 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.md) — 49 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.md) — 18 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.md) — 2 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.md) — 8 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.md) — 5 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.md) — 7 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.md) — 24 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.md) — 14 fn ✍
- [internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.lua](scripts/internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.md) — 2 fn ✍
- [internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua](scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.md) — 8 fn ✍
- [internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua](scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.md) — 6 fn ✍
- [internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua](scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.md) — 16 fn ✍

## materials

- [materials/CharacterLine.lua](scripts/materials/CharacterLine.md) — 11 fn ✍
- [materials/FontMaterial.lua](scripts/materials/FontMaterial.md) — 11 fn ✍
- [materials/MaterialManager.lua](scripts/materials/MaterialManager.md) — 19 fn ✍
- [materials/MaterialUtil.lua](scripts/materials/MaterialUtil.md) — 6 fn ✍
- [materials/MotionPathEffectManager.lua](scripts/materials/MotionPathEffectManager.md) — 22 fn ✍
- [materials/ParticleSystemManager.lua](scripts/materials/ParticleSystemManager.md) — 8 fn ✍

## misc

- [misc/AbstractManager.lua](scripts/misc/AbstractManager.md) — 5 fn ✍
- [misc/BaleManager.lua](scripts/misc/BaleManager.md) — 29 fn ✍
- [misc/BezierCurve.lua](scripts/misc/BezierCurve.md) — 5 fn ✍
- [misc/Color.lua](scripts/misc/Color.md) — 24 fn ✍
- [misc/ConnectionHoseManager.lua](scripts/misc/ConnectionHoseManager.md) — 22 fn ✍
- [misc/ConsumableManager.lua](scripts/misc/ConsumableManager.md) — 18 fn ✍
- [misc/Logging.lua](scripts/misc/Logging.md) — 10 fn ✍
- [misc/NoteManager.lua](scripts/misc/NoteManager.md) — 1 fn ✍
- [misc/ProductionChainManager.lua](scripts/misc/ProductionChainManager.md) — 19 fn ✍
- [misc/SplitShapeManager.lua](scripts/misc/SplitShapeManager.md) — 6 fn ✍
- [misc/SprayTypeManager.lua](scripts/misc/SprayTypeManager.md) — 14 fn ✍
- [misc/TensionBeltManager.lua](scripts/misc/TensionBeltManager.md) — 6 fn ✍
- [misc/Timer.lua](scripts/misc/Timer.md) — 16 fn ✍
- [misc/ToolTypeManager.lua](scripts/misc/ToolTypeManager.md) — 7 fn ✍
- [misc/TreePlantManager.lua](scripts/misc/TreePlantManager.md) — 43 fn ✍

## missions

- [missions/AbstractMission.lua](scripts/missions/AbstractMission.md) — 74 fn ✍
- [missions/MissionManager.lua](scripts/missions/MissionManager.md) — 47 fn ✍
- [missions/field/AbstractFieldMission.lua](scripts/missions/field/AbstractFieldMission.md) — 45 fn ✍
- [missions/field/PlowMission.lua](scripts/missions/field/PlowMission.md) — 10 fn ✍
- [missions/field/SowMission.lua](scripts/missions/field/SowMission.md) — 1 fn ✍
- [missions/field/StonePickMission.lua](scripts/missions/field/StonePickMission.md) — 15 fn ✍

## objects

- [objects/AnimatedMapObject.lua](scripts/objects/AnimatedMapObject.md) — 3 fn ✍
- [objects/AnimatedObject.lua](scripts/objects/AnimatedObject.md) — 25 fn ✍
- [objects/AnimatedObjectActivatable.lua](scripts/objects/AnimatedObjectActivatable.md) — 11 fn ✍
- [objects/Bale.lua](scripts/objects/Bale.md) — 81 fn ✍
- [objects/Basketball.lua](scripts/objects/Basketball.md) — 7 fn ✍
- [objects/BgaSellStation.lua](scripts/objects/BgaSellStation.md) — 1 fn ✍
- [objects/BunkerSilo.lua](scripts/objects/BunkerSilo.md) — 27 fn ✍
- [objects/BunkerSiloCloseEvent.lua](scripts/objects/BunkerSiloCloseEvent.md) — 5 fn ✍
- [objects/BunkerSiloOpenEvent.lua](scripts/objects/BunkerSiloOpenEvent.md) — 5 fn ✍
- [objects/BuyingStation.lua](scripts/objects/BuyingStation.md) — 3 fn ✍
- [objects/DigitalDisplay.lua](scripts/objects/DigitalDisplay.md) — 1 fn ✍
- [objects/DogBall.lua](scripts/objects/DogBall.md) — 7 fn ✍
- [objects/ForestryLog.lua](scripts/objects/ForestryLog.md) — 19 fn ✍
- [objects/HelpIcons.lua](scripts/objects/HelpIcons.md) — 6 fn ✍
- [objects/InlineBale.lua](scripts/objects/InlineBale.md) — 38 fn ✍
- [objects/InlineBaleSingle.lua](scripts/objects/InlineBaleSingle.md) — 10 fn ✍
- [objects/LoadingStation.lua](scripts/objects/LoadingStation.md) — 5 fn ✍
- [objects/MountableObject.lua](scripts/objects/MountableObject.md) — 4 fn ✍
- [objects/NightIllumination.lua](scripts/objects/NightIllumination.md) — 1 fn ✍
- [objects/Nightlight2.lua](scripts/objects/Nightlight2.md) — 1 fn ✍
- [objects/NightlightFlicker.lua](scripts/objects/NightlightFlicker.md) — 4 fn ✍
- [objects/PackedBale.lua](scripts/objects/PackedBale.md) — 9 fn ✍
- [objects/PhysicsObject.lua](scripts/objects/PhysicsObject.md) — 21 fn ✍
- [objects/ProductionPoint.lua](scripts/objects/ProductionPoint.md) — 14 fn ✍
- [objects/ProductionPointActivatable.lua](scripts/objects/ProductionPointActivatable.md) — 5 fn ✍
- [objects/ProductionPointOutputModeEvent.lua](scripts/objects/ProductionPointOutputModeEvent.md) — 6 fn ✍
- [objects/ProductionPointProductionStateEvent.lua](scripts/objects/ProductionPointProductionStateEvent.md) — 6 fn ✍
- [objects/ProductionPointProductionStatusEvent.lua](scripts/objects/ProductionPointProductionStatusEvent.md) — 6 fn ✍
- [objects/Rotator.lua](scripts/objects/Rotator.md) — 3 fn ✍
- [objects/SellingStation.lua](scripts/objects/SellingStation.md) — 5 fn ✍
- [objects/SimParticleSystem.lua](scripts/objects/SimParticleSystem.md) — 2 fn ✍
- [objects/Storage.lua](scripts/objects/Storage.md) — 29 fn ✍
- [objects/SunAdmirer.lua](scripts/objects/SunAdmirer.md) — 4 fn ✍
- [objects/TourIconsMobile.lua](scripts/objects/TourIconsMobile.md) — 8 fn ✍
- [objects/UnloadingStation.lua](scripts/objects/UnloadingStation.md) — 4 fn ✍
- [objects/VehicleSellingPoint.lua](scripts/objects/VehicleSellingPoint.md) — 16 fn ✍
- [objects/WashingStation.lua](scripts/objects/WashingStation.md) — 5 fn ✍
- [objects/WashingStationEvent.lua](scripts/objects/WashingStationEvent.md) — 5 fn ✍
- [objects/football/Football.lua](scripts/objects/football/Football.md) — 2 fn ✍
- [objects/football/FootballField.lua](scripts/objects/football/FootballField.md) — 4 fn ✍
- [objects/football/FootballFieldActivatable.lua](scripts/objects/football/FootballFieldActivatable.md) — 1 fn ✍

## placeables

- [placeables/BeehiveSystem.lua](scripts/placeables/BeehiveSystem.md) — 17 fn ✍
- [placeables/Placeable.lua](scripts/placeables/Placeable.md) — 74 fn ✍
- [placeables/PlaceableLoadingData.lua](scripts/placeables/PlaceableLoadingData.md) — 20 fn ✍
- [placeables/PlaceableNameEvent.lua](scripts/placeables/PlaceableNameEvent.md) — 6 fn ✍
- [placeables/PlaceablePreplacedInfoEvent.lua](scripts/placeables/PlaceablePreplacedInfoEvent.md) — 4 fn ✍
- [placeables/PlaceableSystem.lua](scripts/placeables/PlaceableSystem.md) — 25 fn ✍
- [placeables/configurations/PlaceableConfigurationItem.lua](scripts/placeables/configurations/PlaceableConfigurationItem.md) — 14 fn ✍
- [placeables/configurations/PlaceableConfigurationItemColor.lua](scripts/placeables/configurations/PlaceableConfigurationItemColor.md) — 15 fn ✍
- [placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua](scripts/placeables/configurations/data/PlaceableConfigurationDataObjectChange.md) — 4 fn ✍
- [placeables/specializations/PlaceableAI.lua](scripts/placeables/specializations/PlaceableAI.md) — 13 fn ✍
- [placeables/specializations/PlaceableAnimalLoadingTrigger.lua](scripts/placeables/specializations/PlaceableAnimalLoadingTrigger.md) — 8 fn ✍
- [placeables/specializations/PlaceableAnimatedObjects.lua](scripts/placeables/specializations/PlaceableAnimatedObjects.md) — 15 fn ✍
- [placeables/specializations/PlaceableBeehive.lua](scripts/placeables/specializations/PlaceableBeehive.md) — 13 fn ✍
- [placeables/specializations/PlaceableBeehivePalletSpawner.lua](scripts/placeables/specializations/PlaceableBeehivePalletSpawner.md) — 20 fn ✍
- [placeables/specializations/PlaceableBoatyard.lua](scripts/placeables/specializations/PlaceableBoatyard.md) — 13 fn ✍
- [placeables/specializations/PlaceableBunkerSilo.lua](scripts/placeables/specializations/PlaceableBunkerSilo.md) — 23 fn ✍
- [placeables/specializations/PlaceableBuyable.lua](scripts/placeables/specializations/PlaceableBuyable.md) — 10 fn ✍
- [placeables/specializations/PlaceableBuyingStation.lua](scripts/placeables/specializations/PlaceableBuyingStation.md) — 13 fn ✍
- [placeables/specializations/PlaceableCartridgePlayer.lua](scripts/placeables/specializations/PlaceableCartridgePlayer.md) — 10 fn ✍
- [placeables/specializations/PlaceableChargingStation.lua](scripts/placeables/specializations/PlaceableChargingStation.md) — 6 fn ✍
- [placeables/specializations/PlaceableClearAreas.lua](scripts/placeables/specializations/PlaceableClearAreas.md) — 7 fn ✍
- [placeables/specializations/PlaceableConstructible.lua](scripts/placeables/specializations/PlaceableConstructible.md) — 15 fn ✍
- [placeables/specializations/PlaceableDeletedNodes.lua](scripts/placeables/specializations/PlaceableDeletedNodes.md) — 4 fn ✍
- [placeables/specializations/PlaceableDestructible.lua](scripts/placeables/specializations/PlaceableDestructible.md) — 11 fn ✍
- [placeables/specializations/PlaceableDoghouse.lua](scripts/placeables/specializations/PlaceableDoghouse.md) — 27 fn ✍
- [placeables/specializations/PlaceableDynamicallyLoadedParts.lua](scripts/placeables/specializations/PlaceableDynamicallyLoadedParts.md) — 7 fn ✍
- [placeables/specializations/PlaceableFactory.lua](scripts/placeables/specializations/PlaceableFactory.md) — 12 fn ✍
- [placeables/specializations/PlaceableFarmhouse.lua](scripts/placeables/specializations/PlaceableFarmhouse.md) — 15 fn ✍
- [placeables/specializations/PlaceableFence.lua](scripts/placeables/specializations/PlaceableFence.md) — 63 fn ✍
- [placeables/specializations/PlaceableFoliageAreas.lua](scripts/placeables/specializations/PlaceableFoliageAreas.md) — 7 fn ✍
- [placeables/specializations/PlaceableGreenhouse.lua](scripts/placeables/specializations/PlaceableGreenhouse.md) — 19 fn ✍
- [placeables/specializations/PlaceableHandToolHolders.lua](scripts/placeables/specializations/PlaceableHandToolHolders.md) — 2 fn ✍
- [placeables/specializations/PlaceableHeapSpawner.lua](scripts/placeables/specializations/PlaceableHeapSpawner.md) — 5 fn ✍
- [placeables/specializations/PlaceableHotspots.lua](scripts/placeables/specializations/PlaceableHotspots.md) — 9 fn ✍
- [placeables/specializations/PlaceableIncomePerHour.lua](scripts/placeables/specializations/PlaceableIncomePerHour.md) — 12 fn ✍
- [placeables/specializations/PlaceableIndoorAreas.lua](scripts/placeables/specializations/PlaceableIndoorAreas.md) — 8 fn ✍
- [placeables/specializations/PlaceableInfoTrigger.lua](scripts/placeables/specializations/PlaceableInfoTrigger.md) — 11 fn ✍
- [placeables/specializations/PlaceableLadders.lua](scripts/placeables/specializations/PlaceableLadders.md) — 2 fn ✍
- [placeables/specializations/PlaceableLeveling.lua](scripts/placeables/specializations/PlaceableLeveling.md) — 12 fn ✍
- [placeables/specializations/PlaceableLights.lua](scripts/placeables/specializations/PlaceableLights.md) — 20 fn ✍
- [placeables/specializations/PlaceableManureHeap.lua](scripts/placeables/specializations/PlaceableManureHeap.md) — 19 fn ✍
- [placeables/specializations/PlaceableMultiBunkerSilo.lua](scripts/placeables/specializations/PlaceableMultiBunkerSilo.md) — 24 fn ✍
- [placeables/specializations/PlaceableNPCSpot.lua](scripts/placeables/specializations/PlaceableNPCSpot.md) — 6 fn ✍
- [placeables/specializations/PlaceableNewFence.lua](scripts/placeables/specializations/PlaceableNewFence.md) — 39 fn ✍
- [placeables/specializations/PlaceableObjectStorage.lua](scripts/placeables/specializations/PlaceableObjectStorage.md) — 51 fn ✍
- [placeables/specializations/PlaceablePalletBuyingStation.lua](scripts/placeables/specializations/PlaceablePalletBuyingStation.md) — 3 fn ✍
- [placeables/specializations/PlaceablePlacement.lua](scripts/placeables/specializations/PlaceablePlacement.md) — 21 fn ✍
- [placeables/specializations/PlaceablePointOfInterest.lua](scripts/placeables/specializations/PlaceablePointOfInterest.md) — 7 fn ✍
- [placeables/specializations/PlaceableProductionPoint.lua](scripts/placeables/specializations/PlaceableProductionPoint.md) — 22 fn ✍
- [placeables/specializations/PlaceableRiceField.lua](scripts/placeables/specializations/PlaceableRiceField.md) — 23 fn ✍
- [placeables/specializations/PlaceableRiceFieldActivatable.lua](scripts/placeables/specializations/PlaceableRiceFieldActivatable.md) — 5 fn ✍
- [placeables/specializations/PlaceableRollercoaster.lua](scripts/placeables/specializations/PlaceableRollercoaster.md) — 14 fn ✍
- [placeables/specializations/PlaceableSellingStation.lua](scripts/placeables/specializations/PlaceableSellingStation.md) — 16 fn ✍
- [placeables/specializations/PlaceableShallowWaterSimulation.lua](scripts/placeables/specializations/PlaceableShallowWaterSimulation.md) — 3 fn ✍
- [placeables/specializations/PlaceableSilo.lua](scripts/placeables/specializations/PlaceableSilo.md) — 32 fn ✍
- [placeables/specializations/PlaceableSiloExtension.lua](scripts/placeables/specializations/PlaceableSiloExtension.md) — 19 fn ✍
- [placeables/specializations/PlaceableSolarPanels.lua](scripts/placeables/specializations/PlaceableSolarPanels.md) — 18 fn ✍
- [placeables/specializations/PlaceableTipOcclusionAreas.lua](scripts/placeables/specializations/PlaceableTipOcclusionAreas.md) — 9 fn ✍
- [placeables/specializations/PlaceableTrainSystem.lua](scripts/placeables/specializations/PlaceableTrainSystem.md) — 46 fn ✍
- [placeables/specializations/PlaceableTriggerMarkers.lua](scripts/placeables/specializations/PlaceableTriggerMarkers.md) — 8 fn ✍
- [placeables/specializations/PlaceableVehicle.lua](scripts/placeables/specializations/PlaceableVehicle.md) — 11 fn ✍
- [placeables/specializations/PlaceableVehicleBuyingStation.lua](scripts/placeables/specializations/PlaceableVehicleBuyingStation.md) — 3 fn ✍
- [placeables/specializations/PlaceableVine.lua](scripts/placeables/specializations/PlaceableVine.md) — 25 fn ✍
- [placeables/specializations/PlaceableWardrobe.lua](scripts/placeables/specializations/PlaceableWardrobe.md) — 12 fn ✍
- [placeables/specializations/PlaceableWashingStation.lua](scripts/placeables/specializations/PlaceableWashingStation.md) — 10 fn ✍
- [placeables/specializations/PlaceableWeatherStation.lua](scripts/placeables/specializations/PlaceableWeatherStation.md) — 6 fn ✍
- [placeables/specializations/PlaceableWeighingStation.lua](scripts/placeables/specializations/PlaceableWeighingStation.md) — 9 fn ✍
- [placeables/specializations/PlaceableWindTurbine.lua](scripts/placeables/specializations/PlaceableWindTurbine.md) — 18 fn ✍
- [placeables/specializations/PlaceableWorkshop.lua](scripts/placeables/specializations/PlaceableWorkshop.md) — 7 fn ✍
- [placeables/specializations/activatables/BuyBuildingActivatable.lua](scripts/placeables/specializations/activatables/BuyBuildingActivatable.md) — 3 fn ✍
- [placeables/specializations/activatables/DestructibleActivatable.lua](scripts/placeables/specializations/activatables/DestructibleActivatable.md) — 3 fn ✍
- [placeables/specializations/activatables/DoghouseActivatable.lua](scripts/placeables/specializations/activatables/DoghouseActivatable.md) — 5 fn ✍
- [placeables/specializations/activatables/FactoryActivatable.lua](scripts/placeables/specializations/activatables/FactoryActivatable.md) — 3 fn ✍
- [placeables/specializations/activatables/FarmhouseActivatable.lua](scripts/placeables/specializations/activatables/FarmhouseActivatable.md) — 3 fn ✍
- [placeables/specializations/activatables/PalletBuyingStationActivatable.lua](scripts/placeables/specializations/activatables/PalletBuyingStationActivatable.md) — 3 fn ✍
- [placeables/specializations/activatables/VehicleBuyingStationActivatable.lua](scripts/placeables/specializations/activatables/VehicleBuyingStationActivatable.md) — 3 fn ✍
- [placeables/specializations/activatables/WardrobeActivatable.lua](scripts/placeables/specializations/activatables/WardrobeActivatable.md) — 3 fn ✍
- [placeables/specializations/boatyard/BoatyardActivatable.lua](scripts/placeables/specializations/boatyard/BoatyardActivatable.md) — 3 fn ✍
- [placeables/specializations/events/PlaceableFenceAddGateEvent.lua](scripts/placeables/specializations/events/PlaceableFenceAddGateEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua](scripts/placeables/specializations/events/PlaceableFenceAddSegmentEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua](scripts/placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua](scripts/placeables/specializations/events/PlaceableFenceSegmentBatchEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableLightsStateEvent.lua](scripts/placeables/specializations/events/PlaceableLightsStateEvent.md) — 6 fn ✍
- [placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua](scripts/placeables/specializations/events/PlaceableObjectStorageErrorEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua](scripts/placeables/specializations/events/PlaceableObjectStorageStoreEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua](scripts/placeables/specializations/events/PlaceableObjectStorageUnloadEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua](scripts/placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua](scripts/placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua](scripts/placeables/specializations/events/PlaceableRiceFieldFieldEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua](scripts/placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua](scripts/placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.md) — 5 fn ✍
- [placeables/specializations/events/PlaceableRiceFieldStateEvent.lua](scripts/placeables/specializations/events/PlaceableRiceFieldStateEvent.md) — 6 fn ✍
- [placeables/specializations/events/PlaceableTrainSystemRentEvent.lua](scripts/placeables/specializations/events/PlaceableTrainSystemRentEvent.md) — 6 fn ✍
- [placeables/specializations/events/PlaceableTrainSystemSellEvent.lua](scripts/placeables/specializations/events/PlaceableTrainSystemSellEvent.md) — 5 fn ✍
- [placeables/specializations/rollercoaster/RollercoasterActivatable.lua](scripts/placeables/specializations/rollercoaster/RollercoasterActivatable.md) — 3 fn ✍
- [placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua](scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.md) — 5 fn ✍
- [placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua](scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.md) — 5 fn ✍

## placement

- [placement/PalletSpawner.lua](scripts/placement/PalletSpawner.md) — 14 fn ✍
- [placement/PlacementGrid2D.lua](scripts/placement/PlacementGrid2D.md) — 7 fn ✍

## player

- [player/Player.lua](scripts/player/Player.md) — 31 fn ✍
- [player/PlayerCCT.lua](scripts/player/PlayerCCT.md) — 8 fn ✍
- [player/PlayerCamera.lua](scripts/player/PlayerCamera.md) — 23 fn ✍
- [player/PlayerInputComponent.lua](scripts/player/PlayerInputComponent.md) — 24 fn ✍
- [player/PlayerMover.lua](scripts/player/PlayerMover.md) — 19 fn ✍
- [player/PlayerSystem.lua](scripts/player/PlayerSystem.md) — 15 fn ✍
- [player/PlayerTargeter.lua](scripts/player/PlayerTargeter.md) — 11 fn ✍
- [player/events/PlayerHoldHandToolEvent.lua](scripts/player/events/PlayerHoldHandToolEvent.md) — 6 fn ✍
- [player/events/PlayerRequestStyleEvent.lua](scripts/player/events/PlayerRequestStyleEvent.md) — 5 fn ✍
- [player/events/PlayerSetFarmAnswerEvent.lua](scripts/player/events/PlayerSetFarmAnswerEvent.md) — 5 fn ✍
- [player/events/PlayerSetFarmEvent.lua](scripts/player/events/PlayerSetFarmEvent.md) — 6 fn ✍
- [player/events/PlayerSetNicknameEvent.lua](scripts/player/events/PlayerSetNicknameEvent.md) — 5 fn ✍
- [player/events/PlayerSetStyleEvent.lua](scripts/player/events/PlayerSetStyleEvent.md) — 6 fn ✍
- [player/events/PlayerSwitchedFarmEvent.lua](scripts/player/events/PlayerSwitchedFarmEvent.md) — 4 fn ✍
- [player/events/PlayerTeleportEvent.lua](scripts/player/events/PlayerTeleportEvent.md) — 6 fn ✍
- [player/graphical/PlayerStyle.lua](scripts/player/graphical/PlayerStyle.md) — 8 fn ✍
- [player/graphical/PlayerStyleConfig.lua](scripts/player/graphical/PlayerStyleConfig.md) — 9 fn ✍
- [player/networking/PlayerLocalNetworkComponent.lua](scripts/player/networking/PlayerLocalNetworkComponent.md) — 5 fn ✍
- [player/networking/PlayerNetworkComponent.lua](scripts/player/networking/PlayerNetworkComponent.md) — 6 fn ✍
- [player/networking/PlayerPositionalInterpolator.lua](scripts/player/networking/PlayerPositionalInterpolator.md) — 6 fn ✍
- [player/networking/PlayerRemoteNetworkComponent.lua](scripts/player/networking/PlayerRemoteNetworkComponent.md) — 2 fn ✍
- [player/networking/PlayerServerNetworkComponent.lua](scripts/player/networking/PlayerServerNetworkComponent.md) — 5 fn ✍
- [player/stateMachine/PlayerOnFootStateMachine.lua](scripts/player/stateMachine/PlayerOnFootStateMachine.md) — 4 fn ✍
- [player/stateMachine/PlayerStateCrouch.lua](scripts/player/stateMachine/PlayerStateCrouch.md) — 9 fn ✍
- [player/stateMachine/PlayerStateFall.lua](scripts/player/stateMachine/PlayerStateFall.md) — 5 fn ✍
- [player/stateMachine/PlayerStateIdle.lua](scripts/player/stateMachine/PlayerStateIdle.md) — 4 fn ✍
- [player/stateMachine/PlayerStateJump.lua](scripts/player/stateMachine/PlayerStateJump.md) — 11 fn ✍
- [player/stateMachine/PlayerStateMachine.lua](scripts/player/stateMachine/PlayerStateMachine.md) — 2 fn ✍
- [player/stateMachine/PlayerStateSwim.lua](scripts/player/stateMachine/PlayerStateSwim.md) — 3 fn ✍
- [player/stateMachine/PlayerStateWalk.lua](scripts/player/stateMachine/PlayerStateWalk.md) — 6 fn ✍

## ship

- [ship/ShipSystem.lua](scripts/ship/ShipSystem.md) — 1 fn ✍
- [ship/ferry/FerryActivatable.lua](scripts/ship/ferry/FerryActivatable.md) — 4 fn ✍
- [ship/ferry/FerryStartEvent.lua](scripts/ship/ferry/FerryStartEvent.md) — 5 fn ✍

## shop

- [shop/BrandManager.lua](scripts/shop/BrandManager.md) — 8 fn ✍
- [shop/BuyHandToolData.lua](scripts/shop/BuyHandToolData.md) — 10 fn ✍
- [shop/BuyPlaceableData.lua](scripts/shop/BuyPlaceableData.md) — 15 fn ✍
- [shop/BuyVehicleData.lua](scripts/shop/BuyVehicleData.md) — 16 fn ✍
- [shop/StoreItemUtil.lua](scripts/shop/StoreItemUtil.md) — 23 fn ✍
- [shop/StoreManager.lua](scripts/shop/StoreManager.md) — 34 fn ✍

## sounds

- [sounds/ServerSoundManager.lua](scripts/sounds/ServerSoundManager.md) — 2 fn ✍
- [sounds/SoundManager.lua](scripts/sounds/SoundManager.md) — 59 fn ✍
- [sounds/SoundMixer.lua](scripts/sounds/SoundMixer.md) — 8 fn ✍

## specialization

- [specialization/SpecializationManager.lua](scripts/specialization/SpecializationManager.md) — 9 fn ✍
- [specialization/SpecializationUtil.lua](scripts/specialization/SpecializationUtil.md) — 14 fn ✍
- [specialization/TypeManager.lua](scripts/specialization/TypeManager.md) — 12 fn ✍

## triggers

- [triggers/BaleUnloadTrigger.lua](scripts/triggers/BaleUnloadTrigger.md) — 6 fn ✍
- [triggers/BasketTrigger.lua](scripts/triggers/BasketTrigger.md) — 5 fn ✍
- [triggers/FillPlane.lua](scripts/triggers/FillPlane.md) — 7 fn ✍
- [triggers/FillTrigger.lua](scripts/triggers/FillTrigger.md) — 7 fn ✍
- [triggers/LadderTrigger.lua](scripts/triggers/LadderTrigger.md) — 4 fn ✍
- [triggers/LoadTrigger.lua](scripts/triggers/LoadTrigger.md) — 27 fn ✍
- [triggers/LoanTrigger.lua](scripts/triggers/LoanTrigger.md) — 10 fn ✍
- [triggers/PalletUnloadTrigger.lua](scripts/triggers/PalletUnloadTrigger.md) — 5 fn ✍
- [triggers/PalletUnloadTriggerActivatable.lua](scripts/triggers/PalletUnloadTriggerActivatable.md) — 4 fn ✍
- [triggers/PointOfInterest.lua](scripts/triggers/PointOfInterest.md) — 1 fn ✍
- [triggers/ShopTrigger.lua](scripts/triggers/ShopTrigger.md) — 11 fn ✍
- [triggers/TransportMissionTrigger.lua](scripts/triggers/TransportMissionTrigger.md) — 4 fn ✍
- [triggers/UnloadTrigger.lua](scripts/triggers/UnloadTrigger.md) — 17 fn ✍
- [triggers/WoodUnloadTrigger.lua](scripts/triggers/WoodUnloadTrigger.md) — 11 fn ✍
- [triggers/WoodUnloadTriggerActivatable.lua](scripts/triggers/WoodUnloadTriggerActivatable.md) — 4 fn ✍

## utils

- [utils/BitmapUtil.lua](scripts/utils/BitmapUtil.md) — 2 fn ✍
- [utils/BlurUtil.lua](scripts/utils/BlurUtil.md) — 7 fn ✍
- [utils/ChainsawUtil.lua](scripts/utils/ChainsawUtil.md) — 1 fn ✍
- [utils/ClassUtil.lua](scripts/utils/ClassUtil.md) — 8 fn ✍
- [utils/DynamicMountUtil.lua](scripts/utils/DynamicMountUtil.md) — 2 fn ✍
- [utils/FSDensityMapUtil.lua](scripts/utils/FSDensityMapUtil.md) — 68 fn ✍
- [utils/FillPlaneUtil.lua](scripts/utils/FillPlaneUtil.md) — 4 fn ✍
- [utils/IKUtil.lua](scripts/utils/IKUtil.md) — 2 fn ✍
- [utils/MathUtil.lua](scripts/utils/MathUtil.md) — 97 fn ✍
- [utils/ObjectChangeUtil.lua](scripts/utils/ObjectChangeUtil.md) — 9 fn ✍
- [utils/ParticleUtil.lua](scripts/utils/ParticleUtil.md) — 40 fn ✍
- [utils/SplineUtil.lua](scripts/utils/SplineUtil.md) — 7 fn ✍
- [utils/SplitShapeUtil.lua](scripts/utils/SplitShapeUtil.md) — 5 fn ✍
- [utils/TargetedFunction.lua](scripts/utils/TargetedFunction.md) — 6 fn ✍
- [utils/Utils.lua](scripts/utils/Utils.md) — 58 fn ✍

## vehicles

- [vehicles/AnimationValueBool.lua](scripts/vehicles/AnimationValueBool.md) — 6 fn ✍
- [vehicles/AnimationValueFloat.lua](scripts/vehicles/AnimationValueFloat.md) — 9 fn ✍
- [vehicles/DashboardValueType.lua](scripts/vehicles/DashboardValueType.md) — 15 fn ✍
- [vehicles/LicensePlate.lua](scripts/vehicles/LicensePlate.md) — 15 fn ✍
- [vehicles/LicensePlateManager.lua](scripts/vehicles/LicensePlateManager.md) — 18 fn ✍
- [vehicles/Vehicle.lua](scripts/vehicles/Vehicle.md) — 197 fn ✍
- [vehicles/VehicleActionController.lua](scripts/vehicles/VehicleActionController.md) — 28 fn ✍
- [vehicles/VehicleActionControllerAction.lua](scripts/vehicles/VehicleActionControllerAction.md) — 26 fn ✍
- [vehicles/VehicleAttachEvent.lua](scripts/vehicles/VehicleAttachEvent.md) — 5 fn ✍
- [vehicles/VehicleAttachRequestEvent.lua](scripts/vehicles/VehicleAttachRequestEvent.md) — 5 fn ✍
- [vehicles/VehicleBrokenEvent.lua](scripts/vehicles/VehicleBrokenEvent.md) — 5 fn ✍
- [vehicles/VehicleCamera.lua](scripts/vehicles/VehicleCamera.md) — 29 fn ✍
- [vehicles/VehicleCharacter.lua](scripts/vehicles/VehicleCharacter.md) — 20 fn ✍
- [vehicles/VehicleDetachEvent.lua](scripts/vehicles/VehicleDetachEvent.md) — 5 fn ✍
- [vehicles/VehicleEnterRequestEvent.lua](scripts/vehicles/VehicleEnterRequestEvent.md) — 5 fn ✍
- [vehicles/VehicleEnterResponseEvent.lua](scripts/vehicles/VehicleEnterResponseEvent.md) — 5 fn ✍
- [vehicles/VehicleLeaveEvent.lua](scripts/vehicles/VehicleLeaveEvent.md) — 6 fn ✍
- [vehicles/VehicleLoadingData.lua](scripts/vehicles/VehicleLoadingData.md) — 25 fn ✍
- [vehicles/VehicleLowerImplementEvent.lua](scripts/vehicles/VehicleLowerImplementEvent.md) — 6 fn ✍
- [vehicles/VehicleMaterial.lua](scripts/vehicles/VehicleMaterial.md) — 13 fn ✍
- [vehicles/VehicleMaterialManager.lua](scripts/vehicles/VehicleMaterialManager.md) — 12 fn ✍
- [vehicles/VehicleMotor.lua](scripts/vehicles/VehicleMotor.md) — 95 fn ✍
- [vehicles/VehicleSetIsReconfiguratingEvent.lua](scripts/vehicles/VehicleSetIsReconfiguratingEvent.md) — 4 fn ✍
- [vehicles/VehicleStateRecorder.lua](scripts/vehicles/VehicleStateRecorder.md) — 7 fn ✍
- [vehicles/VehicleSystem.lua](scripts/vehicles/VehicleSystem.md) — 46 fn ✍
- [vehicles/VehicleTeleportEvent.lua](scripts/vehicles/VehicleTeleportEvent.md) — 2 fn ✍
- [vehicles/WheelsUtil.lua](scripts/vehicles/WheelsUtil.md) — 9 fn ✍
- [vehicles/WorkAreaTypeManager.lua](scripts/vehicles/WorkAreaTypeManager.md) — 9 fn ✍
- [vehicles/ai/AICollisionTriggerHandler.lua](scripts/vehicles/ai/AICollisionTriggerHandler.md) — 11 fn ✍
- [vehicles/ai/AIDriveStrategy.lua](scripts/vehicles/ai/AIDriveStrategy.md) — 7 fn ✍
- [vehicles/ai/AIDriveStrategyBaler.lua](scripts/vehicles/ai/AIDriveStrategyBaler.md) — 5 fn ✍
- [vehicles/ai/AIDriveStrategyCombine.lua](scripts/vehicles/ai/AIDriveStrategyCombine.md) — 5 fn ✍
- [vehicles/ai/AIDriveStrategyConveyor.lua](scripts/vehicles/ai/AIDriveStrategyConveyor.md) — 4 fn ✍
- [vehicles/ai/AIDriveStrategyFieldCourse.lua](scripts/vehicles/ai/AIDriveStrategyFieldCourse.md) — 10 fn ✍
- [vehicles/ai/AIDriveStrategyStonePicker.lua](scripts/vehicles/ai/AIDriveStrategyStonePicker.md) — 5 fn ✍
- [vehicles/ai/AIVehicleUtil.lua](scripts/vehicles/ai/AIVehicleUtil.md) — 17 fn ✍
- [vehicles/ai/settings/AIUserSetting.lua](scripts/vehicles/ai/settings/AIUserSetting.md) — 1 fn ✍
- [vehicles/configurations/VehicleConfigurationItem.lua](scripts/vehicles/configurations/VehicleConfigurationItem.md) — 15 fn ✍
- [vehicles/configurations/VehicleConfigurationItemColor.lua](scripts/vehicles/configurations/VehicleConfigurationItemColor.md) — 18 fn ✍
- [vehicles/configurations/VehicleConfigurationItemMotor.lua](scripts/vehicles/configurations/VehicleConfigurationItemMotor.md) — 3 fn ✍
- [vehicles/configurations/VehicleConfigurationItemTreeSapling.lua](scripts/vehicles/configurations/VehicleConfigurationItemTreeSapling.md) — 5 fn ✍
- [vehicles/configurations/VehicleConfigurationItemVehicleType.lua](scripts/vehicles/configurations/VehicleConfigurationItemVehicleType.md) — 3 fn ✍
- [vehicles/configurations/VehicleConfigurationItemWheel.lua](scripts/vehicles/configurations/VehicleConfigurationItemWheel.md) — 10 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.md) — 2 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.md) — 2 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataDependentConfig.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataDependentConfig.md) — 2 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataMaterial.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataMaterial.md) — 2 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataObjectChange.md) — 4 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataOverwrites.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataOverwrites.md) — 2 fn ✍
- [vehicles/configurations/data/VehicleConfigurationDataSize.lua](scripts/vehicles/configurations/data/VehicleConfigurationDataSize.md) — 2 fn ✍
- [vehicles/specializations/AIAutomaticSteering.lua](scripts/vehicles/specializations/AIAutomaticSteering.md) — 38 fn ✍
- [vehicles/specializations/AIConveyorBelt.lua](scripts/vehicles/specializations/AIConveyorBelt.md) — 23 fn ✍
- [vehicles/specializations/AIDischargeable.lua](scripts/vehicles/specializations/AIDischargeable.md) — 2 fn ✍
- [vehicles/specializations/AIDrivable.lua](scripts/vehicles/specializations/AIDrivable.md) — 42 fn ✍
- [vehicles/specializations/AIFieldWorker.lua](scripts/vehicles/specializations/AIFieldWorker.md) — 7 fn ✍
- [vehicles/specializations/AIImplement.lua](scripts/vehicles/specializations/AIImplement.md) — 73 fn ✍
- [vehicles/specializations/AIJobVehicle.lua](scripts/vehicles/specializations/AIJobVehicle.md) — 19 fn ✍
- [vehicles/specializations/AIModeSelection.lua](scripts/vehicles/specializations/AIModeSelection.md) — 24 fn ✍
- [vehicles/specializations/AIVehicle.lua](scripts/vehicles/specializations/AIVehicle.md) — 18 fn ✍
- [vehicles/specializations/AIVehicleObstacle.lua](scripts/vehicles/specializations/AIVehicleObstacle.md) — 2 fn ✍
- [vehicles/specializations/AdditionalToolConnections.lua](scripts/vehicles/specializations/AdditionalToolConnections.md) — 9 fn ✍
- [vehicles/specializations/AnimatedVehicle.lua](scripts/vehicles/specializations/AnimatedVehicle.md) — 60 fn ✍
- [vehicles/specializations/ArticulatedAxis.lua](scripts/vehicles/specializations/ArticulatedAxis.md) — 11 fn ✍
- [vehicles/specializations/Attachable.lua](scripts/vehicles/specializations/Attachable.md) — 103 fn ✍
- [vehicles/specializations/AttacherJointControl.lua](scripts/vehicles/specializations/AttacherJointControl.md) — 26 fn ✍
- [vehicles/specializations/AttacherJoints.lua](scripts/vehicles/specializations/AttacherJoints.md) — 147 fn ✍
- [vehicles/specializations/AttacherJointsCompControl.lua](scripts/vehicles/specializations/AttacherJointsCompControl.md) — 13 fn ✍
- [vehicles/specializations/AutoLoadFork.lua](scripts/vehicles/specializations/AutoLoadFork.md) — 17 fn ✍
- [vehicles/specializations/AutoLoadForwarder.lua](scripts/vehicles/specializations/AutoLoadForwarder.md) — 19 fn ✍
- [vehicles/specializations/AutoLoadable.lua](scripts/vehicles/specializations/AutoLoadable.md) — 9 fn ✍
- [vehicles/specializations/AutoLoader.lua](scripts/vehicles/specializations/AutoLoader.md) — 20 fn ✍
- [vehicles/specializations/AutoLoaderBales.lua](scripts/vehicles/specializations/AutoLoaderBales.md) — 16 fn ✍
- [vehicles/specializations/AutomaticArmControlForwarder.lua](scripts/vehicles/specializations/AutomaticArmControlForwarder.md) — 30 fn ✍
- [vehicles/specializations/AutomaticArmControlHarvester.lua](scripts/vehicles/specializations/AutomaticArmControlHarvester.md) — 32 fn ✍
- [vehicles/specializations/BaleCounter.lua](scripts/vehicles/specializations/BaleCounter.md) — 17 fn ✍
- [vehicles/specializations/BaleGrab.lua](scripts/vehicles/specializations/BaleGrab.md) — 25 fn ✍
- [vehicles/specializations/BaleLoader.lua](scripts/vehicles/specializations/BaleLoader.md) — 83 fn ✍
- [vehicles/specializations/BaleWrapper.lua](scripts/vehicles/specializations/BaleWrapper.md) — 72 fn ✍
- [vehicles/specializations/Baler.lua](scripts/vehicles/specializations/Baler.md) — 82 fn ✍
- [vehicles/specializations/BalerStationary.lua](scripts/vehicles/specializations/BalerStationary.md) — 2 fn ✍
- [vehicles/specializations/BaseMaterial.lua](scripts/vehicles/specializations/BaseMaterial.md) — 5 fn ✍
- [vehicles/specializations/BigBag.lua](scripts/vehicles/specializations/BigBag.md) — 9 fn ✍
- [vehicles/specializations/BunkerSiloCompacter.lua](scripts/vehicles/specializations/BunkerSiloCompacter.md) — 12 fn ✍
- [vehicles/specializations/BunkerSiloInteractor.lua](scripts/vehicles/specializations/BunkerSiloInteractor.md) — 6 fn ✍
- [vehicles/specializations/CCTDrivable.lua](scripts/vehicles/specializations/CCTDrivable.md) — 15 fn ✍
- [vehicles/specializations/ChainRollers.lua](scripts/vehicles/specializations/ChainRollers.md) — 12 fn ✍
- [vehicles/specializations/Combine.lua](scripts/vehicles/specializations/Combine.md) — 70 fn ✍
- [vehicles/specializations/ConnectedAttributes.lua](scripts/vehicles/specializations/ConnectedAttributes.md) — 16 fn ✍
- [vehicles/specializations/ConnectionHoses.lua](scripts/vehicles/specializations/ConnectionHoses.md) — 53 fn ✍
- [vehicles/specializations/Consumable.lua](scripts/vehicles/specializations/Consumable.md) — 31 fn ✍
- [vehicles/specializations/ConveyorBelt.lua](scripts/vehicles/specializations/ConveyorBelt.md) — 24 fn ✍
- [vehicles/specializations/Cover.lua](scripts/vehicles/specializations/Cover.md) — 32 fn ✍
- [vehicles/specializations/CrabSteering.lua](scripts/vehicles/specializations/CrabSteering.md) — 29 fn ✍
- [vehicles/specializations/CraneShovel.lua](scripts/vehicles/specializations/CraneShovel.md) — 19 fn ✍
- [vehicles/specializations/Crawlers.lua](scripts/vehicles/specializations/Crawlers.md) — 17 fn ✍
- [vehicles/specializations/CropRowAdjustedNodes.lua](scripts/vehicles/specializations/CropRowAdjustedNodes.md) — 9 fn ✍
- [vehicles/specializations/Cultivator.lua](scripts/vehicles/specializations/Cultivator.md) — 26 fn ✍
- [vehicles/specializations/Cutter.lua](scripts/vehicles/specializations/Cutter.md) — 54 fn ✍
- [vehicles/specializations/Cylindered.lua](scripts/vehicles/specializations/Cylindered.md) — 110 fn ✍
- [vehicles/specializations/CylinderedFoldable.lua](scripts/vehicles/specializations/CylinderedFoldable.md) — 7 fn ✍
- [vehicles/specializations/Dashboard.lua](scripts/vehicles/specializations/Dashboard.md) — 30 fn ✍
- [vehicles/specializations/Dischargeable.lua](scripts/vehicles/specializations/Dischargeable.md) — 74 fn ✍
- [vehicles/specializations/Drivable.lua](scripts/vehicles/specializations/Drivable.md) — 58 fn ✍
- [vehicles/specializations/DynamicMountAttacher.lua](scripts/vehicles/specializations/DynamicMountAttacher.md) — 41 fn ✍
- [vehicles/specializations/DynamicallyLoadedParts.lua](scripts/vehicles/specializations/DynamicallyLoadedParts.md) — 7 fn ✍
- [vehicles/specializations/Enterable.lua](scripts/vehicles/specializations/Enterable.md) — 82 fn ✍
- [vehicles/specializations/EnterablePassenger.lua](scripts/vehicles/specializations/EnterablePassenger.md) — 48 fn ✍
- [vehicles/specializations/ExternalVehicleControl.lua](scripts/vehicles/specializations/ExternalVehicleControl.md) — 18 fn ✍
- [vehicles/specializations/FellerBuncher.lua](scripts/vehicles/specializations/FellerBuncher.md) — 39 fn ✍
- [vehicles/specializations/FertilizingCultivator.lua](scripts/vehicles/specializations/FertilizingCultivator.md) — 7 fn ✍
- [vehicles/specializations/FertilizingSowingMachine.lua](scripts/vehicles/specializations/FertilizingSowingMachine.md) — 8 fn ✍
- [vehicles/specializations/FillTriggerVehicle.lua](scripts/vehicles/specializations/FillTriggerVehicle.md) — 8 fn ✍
- [vehicles/specializations/FillUnit.lua](scripts/vehicles/specializations/FillUnit.md) — 125 fn ✍
- [vehicles/specializations/FillVolume.lua](scripts/vehicles/specializations/FillVolume.md) — 25 fn ✍
- [vehicles/specializations/Foldable.lua](scripts/vehicles/specializations/Foldable.md) — 123 fn ✍
- [vehicles/specializations/FoldableSteps.lua](scripts/vehicles/specializations/FoldableSteps.md) — 34 fn ✍
- [vehicles/specializations/FoliageBending.lua](scripts/vehicles/specializations/FoliageBending.md) — 14 fn ✍
- [vehicles/specializations/ForageWagon.lua](scripts/vehicles/specializations/ForageWagon.md) — 27 fn ✍
- [vehicles/specializations/FrontloaderAttacher.lua](scripts/vehicles/specializations/FrontloaderAttacher.md) — 6 fn ✍
- [vehicles/specializations/FruitExtraObjects.lua](scripts/vehicles/specializations/FruitExtraObjects.md) — 14 fn ✍
- [vehicles/specializations/FruitPreparer.lua](scripts/vehicles/specializations/FruitPreparer.md) — 23 fn ✍
- [vehicles/specializations/GroundAdjustedNodes.lua](scripts/vehicles/specializations/GroundAdjustedNodes.md) — 17 fn ✍
- [vehicles/specializations/GroundReference.lua](scripts/vehicles/specializations/GroundReference.md) — 19 fn ✍
- [vehicles/specializations/HUDInfoTrigger.lua](scripts/vehicles/specializations/HUDInfoTrigger.md) — 11 fn ✍
- [vehicles/specializations/HandToolHolders.lua](scripts/vehicles/specializations/HandToolHolders.md) — 11 fn ✍
- [vehicles/specializations/HeadlandAnimation.lua](scripts/vehicles/specializations/HeadlandAnimation.md) — 7 fn ✍
- [vehicles/specializations/HighPressureWasher.lua](scripts/vehicles/specializations/HighPressureWasher.md) — 5 fn ✍
- [vehicles/specializations/Honk.lua](scripts/vehicles/specializations/Honk.md) — 13 fn ✍
- [vehicles/specializations/HookLiftContainer.lua](scripts/vehicles/specializations/HookLiftContainer.md) — 15 fn ✍
- [vehicles/specializations/HookLiftTrailer.lua](scripts/vehicles/specializations/HookLiftTrailer.md) — 24 fn ✍
- [vehicles/specializations/HydraulicHammer.lua](scripts/vehicles/specializations/HydraulicHammer.md) — 15 fn ✍
- [vehicles/specializations/IKChains.lua](scripts/vehicles/specializations/IKChains.md) — 5 fn ✍
- [vehicles/specializations/InlineWrapper.lua](scripts/vehicles/specializations/InlineWrapper.md) — 50 fn ✍
- [vehicles/specializations/JigglingParts.lua](scripts/vehicles/specializations/JigglingParts.md) — 9 fn ✍
- [vehicles/specializations/Leveler.lua](scripts/vehicles/specializations/Leveler.md) — 14 fn ✍
- [vehicles/specializations/LicensePlates.lua](scripts/vehicles/specializations/LicensePlates.md) — 17 fn ✍
- [vehicles/specializations/LiftableAxle.lua](scripts/vehicles/specializations/LiftableAxle.md) — 22 fn ✍
- [vehicles/specializations/Lights.lua](scripts/vehicles/specializations/Lights.md) — 83 fn ✍
- [vehicles/specializations/LivestockTrailer.lua](scripts/vehicles/specializations/LivestockTrailer.md) — 47 fn ✍
- [vehicles/specializations/Locomotive.lua](scripts/vehicles/specializations/Locomotive.md) — 35 fn ✍
- [vehicles/specializations/LogGrab.lua](scripts/vehicles/specializations/LogGrab.md) — 37 fn ✍
- [vehicles/specializations/ManureBarrel.lua](scripts/vehicles/specializations/ManureBarrel.md) — 9 fn ✍
- [vehicles/specializations/MixerWagon.lua](scripts/vehicles/specializations/MixerWagon.md) — 27 fn ✍
- [vehicles/specializations/Motorbike.lua](scripts/vehicles/specializations/Motorbike.md) — 9 fn ✍
- [vehicles/specializations/Motorized.lua](scripts/vehicles/specializations/Motorized.md) — 110 fn ✍
- [vehicles/specializations/Mountable.lua](scripts/vehicles/specializations/Mountable.md) — 42 fn ✍
- [vehicles/specializations/Mower.lua](scripts/vehicles/specializations/Mower.md) — 35 fn ✍
- [vehicles/specializations/Mulcher.lua](scripts/vehicles/specializations/Mulcher.md) — 25 fn ✍
- [vehicles/specializations/MultipleItemPurchase.lua](scripts/vehicles/specializations/MultipleItemPurchase.md) — 16 fn ✍
- [vehicles/specializations/Pallet.lua](scripts/vehicles/specializations/Pallet.md) — 22 fn ✍
- [vehicles/specializations/PalletFiller.lua](scripts/vehicles/specializations/PalletFiller.md) — 42 fn ✍
- [vehicles/specializations/Pickup.lua](scripts/vehicles/specializations/Pickup.md) — 26 fn ✍
- [vehicles/specializations/Pipe.lua](scripts/vehicles/specializations/Pipe.md) — 54 fn ✍
- [vehicles/specializations/Plow.lua](scripts/vehicles/specializations/Plow.md) — 60 fn ✍
- [vehicles/specializations/PlowPacker.lua](scripts/vehicles/specializations/PlowPacker.md) — 23 fn ✍
- [vehicles/specializations/PowerConsumer.lua](scripts/vehicles/specializations/PowerConsumer.md) — 27 fn ✍
- [vehicles/specializations/PowerTakeOffs.lua](scripts/vehicles/specializations/PowerTakeOffs.md) — 50 fn ✍
- [vehicles/specializations/ProtectedBundleVehicle.lua](scripts/vehicles/specializations/ProtectedBundleVehicle.md) — 7 fn ✍
- [vehicles/specializations/PushHandTool.lua](scripts/vehicles/specializations/PushHandTool.md) — 30 fn ✍
- [vehicles/specializations/RandomlyMovingParts.lua](scripts/vehicles/specializations/RandomlyMovingParts.md) — 9 fn ✍
- [vehicles/specializations/ReceivingHopper.lua](scripts/vehicles/specializations/ReceivingHopper.md) — 19 fn ✍
- [vehicles/specializations/ReverseDriving.lua](scripts/vehicles/specializations/ReverseDriving.md) — 31 fn ✍
- [vehicles/specializations/Rideable.lua](scripts/vehicles/specializations/Rideable.md) — 69 fn ✍
- [vehicles/specializations/RidgeFormer.lua](scripts/vehicles/specializations/RidgeFormer.md) — 14 fn ✍
- [vehicles/specializations/RidgeMarker.lua](scripts/vehicles/specializations/RidgeMarker.md) — 28 fn ✍
- [vehicles/specializations/Roller.lua](scripts/vehicles/specializations/Roller.md) — 20 fn ✍
- [vehicles/specializations/Ropes.lua](scripts/vehicles/specializations/Ropes.md) — 11 fn ✍
- [vehicles/specializations/SaltSpreader.lua](scripts/vehicles/specializations/SaltSpreader.md) — 19 fn ✍
- [vehicles/specializations/SeedTreater.lua](scripts/vehicles/specializations/SeedTreater.md) — 10 fn ✍
- [vehicles/specializations/SemiTrailerFront.lua](scripts/vehicles/specializations/SemiTrailerFront.md) — 10 fn ✍
- [vehicles/specializations/ShallowWaterObstacles.lua](scripts/vehicles/specializations/ShallowWaterObstacles.md) — 9 fn ✍
- [vehicles/specializations/Shovel.lua](scripts/vehicles/specializations/Shovel.md) — 28 fn ✍
- [vehicles/specializations/SlopeCompensation.lua](scripts/vehicles/specializations/SlopeCompensation.md) — 17 fn ✍
- [vehicles/specializations/SmartAttach.lua](scripts/vehicles/specializations/SmartAttach.md) — 19 fn ✍
- [vehicles/specializations/SowingMachine.lua](scripts/vehicles/specializations/SowingMachine.md) — 57 fn ✍
- [vehicles/specializations/SpeedRotatingParts.lua](scripts/vehicles/specializations/SpeedRotatingParts.md) — 17 fn ✍
- [vehicles/specializations/SplineVehicle.lua](scripts/vehicles/specializations/SplineVehicle.md) — 18 fn ✍
- [vehicles/specializations/Sprayer.lua](scripts/vehicles/specializations/Sprayer.md) — 53 fn ✍
- [vehicles/specializations/StandaloneMotor.lua](scripts/vehicles/specializations/StandaloneMotor.md) — 19 fn ✍
- [vehicles/specializations/StonePicker.lua](scripts/vehicles/specializations/StonePicker.md) — 29 fn ✍
- [vehicles/specializations/StrawBlower.lua](scripts/vehicles/specializations/StrawBlower.md) — 15 fn ✍
- [vehicles/specializations/StumpCutter.lua](scripts/vehicles/specializations/StumpCutter.md) — 20 fn ✍
- [vehicles/specializations/StumpCutterLight.lua](scripts/vehicles/specializations/StumpCutterLight.md) — 17 fn ✍
- [vehicles/specializations/SupportVehicle.lua](scripts/vehicles/specializations/SupportVehicle.md) — 18 fn ✍
- [vehicles/specializations/Suspensions.lua](scripts/vehicles/specializations/Suspensions.md) — 14 fn ✍
- [vehicles/specializations/Tedder.lua](scripts/vehicles/specializations/Tedder.md) — 27 fn ✍
- [vehicles/specializations/TensionBeltObject.lua](scripts/vehicles/specializations/TensionBeltObject.md) — 8 fn ✍
- [vehicles/specializations/TensionBelts.lua](scripts/vehicles/specializations/TensionBelts.md) — 49 fn ✍
- [vehicles/specializations/TestAreas.lua](scripts/vehicles/specializations/TestAreas.md) — 23 fn ✍
- [vehicles/specializations/TipOccluder.lua](scripts/vehicles/specializations/TipOccluder.md) — 10 fn ✍
- [vehicles/specializations/TireTracks.lua](scripts/vehicles/specializations/TireTracks.md) — 12 fn ✍
- [vehicles/specializations/Trailer.lua](scripts/vehicles/specializations/Trailer.md) — 52 fn ✍
- [vehicles/specializations/TreePlanter.lua](scripts/vehicles/specializations/TreePlanter.md) — 58 fn ✍
- [vehicles/specializations/TreeSaplingPallet.lua](scripts/vehicles/specializations/TreeSaplingPallet.md) — 15 fn ✍
- [vehicles/specializations/TreeSaw.lua](scripts/vehicles/specializations/TreeSaw.md) — 13 fn ✍
- [vehicles/specializations/TurnOnVehicle.lua](scripts/vehicles/specializations/TurnOnVehicle.md) — 63 fn ✍
- [vehicles/specializations/VariableWorkWidth.lua](scripts/vehicles/specializations/VariableWorkWidth.md) — 27 fn ✍
- [vehicles/specializations/VehicleSettings.lua](scripts/vehicles/specializations/VehicleSettings.md) — 12 fn ✍
- [vehicles/specializations/VineCutter.lua](scripts/vehicles/specializations/VineCutter.md) — 7 fn ✍
- [vehicles/specializations/VineDetector.lua](scripts/vehicles/specializations/VineDetector.md) — 6 fn ✍
- [vehicles/specializations/VinePrepruner.lua](scripts/vehicles/specializations/VinePrepruner.md) — 14 fn ✍
- [vehicles/specializations/Washable.lua](scripts/vehicles/specializations/Washable.md) — 41 fn ✍
- [vehicles/specializations/WaterTrailer.lua](scripts/vehicles/specializations/WaterTrailer.md) — 17 fn ✍
- [vehicles/specializations/Wearable.lua](scripts/vehicles/specializations/Wearable.md) — 45 fn ✍
- [vehicles/specializations/Weeder.lua](scripts/vehicles/specializations/Weeder.md) — 22 fn ✍
- [vehicles/specializations/Wheels.lua](scripts/vehicles/specializations/Wheels.md) — 74 fn ✍
- [vehicles/specializations/Winch.lua](scripts/vehicles/specializations/Winch.md) — 44 fn ✍
- [vehicles/specializations/WindBending.lua](scripts/vehicles/specializations/WindBending.md) — 6 fn ✍
- [vehicles/specializations/Windrower.lua](scripts/vehicles/specializations/Windrower.md) — 25 fn ✍
- [vehicles/specializations/Wipers.lua](scripts/vehicles/specializations/Wipers.md) — 11 fn ✍
- [vehicles/specializations/WoodContainer.lua](scripts/vehicles/specializations/WoodContainer.md) — 16 fn ✍
- [vehicles/specializations/WoodCrusher.lua](scripts/vehicles/specializations/WoodCrusher.md) — 30 fn ✍
- [vehicles/specializations/WoodHarvester.lua](scripts/vehicles/specializations/WoodHarvester.md) — 50 fn ✍
- [vehicles/specializations/WoodHarvesterLight.lua](scripts/vehicles/specializations/WoodHarvesterLight.md) — 18 fn ✍
- [vehicles/specializations/WorkArea.lua](scripts/vehicles/specializations/WorkArea.md) — 27 fn ✍
- [vehicles/specializations/WorkMode.lua](scripts/vehicles/specializations/WorkMode.md) — 38 fn ✍
- [vehicles/specializations/WorkParticles.lua](scripts/vehicles/specializations/WorkParticles.md) — 22 fn ✍
- [vehicles/specializations/YarderCarriage.lua](scripts/vehicles/specializations/YarderCarriage.md) — 42 fn ✍
- [vehicles/specializations/YarderTower.lua](scripts/vehicles/specializations/YarderTower.md) — 67 fn ✍
- [vehicles/specializations/activatables/ConsumableActivatable.lua](scripts/vehicles/specializations/activatables/ConsumableActivatable.md) — 4 fn ✍
- [vehicles/specializations/activatables/LivestockTrailerActivatable.lua](scripts/vehicles/specializations/activatables/LivestockTrailerActivatable.md) — 3 fn ✍
- [vehicles/specializations/activatables/WinchAttachTreeActivatable.lua](scripts/vehicles/specializations/activatables/WinchAttachTreeActivatable.md) — 11 fn ✍
- [vehicles/specializations/activatables/WinchControlRopeActivatable.lua](scripts/vehicles/specializations/activatables/WinchControlRopeActivatable.md) — 12 fn ✍
- [vehicles/specializations/activatables/YarderTowerControlActivatable.lua](scripts/vehicles/specializations/activatables/YarderTowerControlActivatable.md) — 17 fn ✍
- [vehicles/specializations/activatables/YarderTowerSetupActivatable.lua](scripts/vehicles/specializations/activatables/YarderTowerSetupActivatable.md) — 11 fn ✍
- [vehicles/specializations/components/AttacherJointTopArm.lua](scripts/vehicles/specializations/components/AttacherJointTopArm.md) — 12 fn ✍
- [vehicles/specializations/components/BeaconLight.lua](scripts/vehicles/specializations/components/BeaconLight.md) — 17 fn ✍
- [vehicles/specializations/components/RealLight.lua](scripts/vehicles/specializations/components/RealLight.md) — 19 fn ✍
- [vehicles/specializations/components/SharedLight.lua](scripts/vehicles/specializations/components/SharedLight.md) — 12 fn ✍
- [vehicles/specializations/components/StaticLight.lua](scripts/vehicles/specializations/components/StaticLight.md) — 9 fn ✍
- [vehicles/specializations/components/StaticLightCompound.lua](scripts/vehicles/specializations/components/StaticLightCompound.md) — 7 fn ✍
- [vehicles/specializations/components/ToolConnectionHoseMount.lua](scripts/vehicles/specializations/components/ToolConnectionHoseMount.md) — 12 fn ✍
- [vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua](scripts/vehicles/specializations/events/AIAutomaticSteeringCourseEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua](scripts/vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua](scripts/vehicles/specializations/events/AIAutomaticSteeringRequestEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua](scripts/vehicles/specializations/events/AIAutomaticSteeringStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua](scripts/vehicles/specializations/events/AIConveyorBeltSetAngleEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AIFieldWorkerStateEvent.lua](scripts/vehicles/specializations/events/AIFieldWorkerStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AIJobVehicleStateEvent.lua](scripts/vehicles/specializations/events/AIJobVehicleStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AIModeSelectionSettingsEvent.lua](scripts/vehicles/specializations/events/AIModeSelectionSettingsEvent.md) — 6 fn ✍
- [vehicles/specializations/events/AISetModeEvent.lua](scripts/vehicles/specializations/events/AISetModeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/AIVehicleIsBlockedEvent.lua](scripts/vehicles/specializations/events/AIVehicleIsBlockedEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AnimatedVehicleStartEvent.lua](scripts/vehicles/specializations/events/AnimatedVehicleStartEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AnimatedVehicleStopEvent.lua](scripts/vehicles/specializations/events/AnimatedVehicleStopEvent.md) — 5 fn ✍
- [vehicles/specializations/events/AttachableStartDetachEvent.lua](scripts/vehicles/specializations/events/AttachableStartDetachEvent.md) — 6 fn ✍
- [vehicles/specializations/events/BaleCounterResetEvent.lua](scripts/vehicles/specializations/events/BaleCounterResetEvent.md) — 6 fn ✍
- [vehicles/specializations/events/BaleLoaderStateEvent.lua](scripts/vehicles/specializations/events/BaleLoaderStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/BaleWrapperAutomaticDropEvent.lua](scripts/vehicles/specializations/events/BaleWrapperAutomaticDropEvent.md) — 6 fn ✍
- [vehicles/specializations/events/BaleWrapperDropEvent.lua](scripts/vehicles/specializations/events/BaleWrapperDropEvent.md) — 5 fn ✍
- [vehicles/specializations/events/BaleWrapperStateEvent.lua](scripts/vehicles/specializations/events/BaleWrapperStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/BalerAutomaticDropEvent.lua](scripts/vehicles/specializations/events/BalerAutomaticDropEvent.md) — 6 fn ✍
- [vehicles/specializations/events/BalerBaleTypeEvent.lua](scripts/vehicles/specializations/events/BalerBaleTypeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/BalerCreateBaleEvent.lua](scripts/vehicles/specializations/events/BalerCreateBaleEvent.md) — 5 fn ✍
- [vehicles/specializations/events/BalerDropFromPlatformEvent.lua](scripts/vehicles/specializations/events/BalerDropFromPlatformEvent.md) — 6 fn ✍
- [vehicles/specializations/events/BalerSetBaleTimeEvent.lua](scripts/vehicles/specializations/events/BalerSetBaleTimeEvent.md) — 5 fn ✍
- [vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua](scripts/vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.md) — 6 fn ✍
- [vehicles/specializations/events/CombineStrawEnableEvent.lua](scripts/vehicles/specializations/events/CombineStrawEnableEvent.md) — 6 fn ✍
- [vehicles/specializations/events/ConsumableRefillEvent.lua](scripts/vehicles/specializations/events/ConsumableRefillEvent.md) — 6 fn ✍
- [vehicles/specializations/events/CraneShovelEvent.lua](scripts/vehicles/specializations/events/CraneShovelEvent.md) — 6 fn ✍
- [vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua](scripts/vehicles/specializations/events/EnterablePassengerEnterRequestEvent.md) — 5 fn ✍
- [vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua](scripts/vehicles/specializations/events/EnterablePassengerEnterResponseEvent.md) — 5 fn ✍
- [vehicles/specializations/events/EnterablePassengerLeaveEvent.lua](scripts/vehicles/specializations/events/EnterablePassengerLeaveEvent.md) — 6 fn ✍
- [vehicles/specializations/events/FellerBuncherCutEvent.lua](scripts/vehicles/specializations/events/FellerBuncherCutEvent.md) — 6 fn ✍
- [vehicles/specializations/events/FellerBuncherReleaseEvent.lua](scripts/vehicles/specializations/events/FellerBuncherReleaseEvent.md) — 6 fn ✍
- [vehicles/specializations/events/FillUnitUnloadEvent.lua](scripts/vehicles/specializations/events/FillUnitUnloadEvent.md) — 6 fn ✍
- [vehicles/specializations/events/FillUnitUnloadedEvent.lua](scripts/vehicles/specializations/events/FillUnitUnloadedEvent.md) — 5 fn ✍
- [vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua](scripts/vehicles/specializations/events/FoldableSetFoldDirectionEvent.md) — 5 fn ✍
- [vehicles/specializations/events/FoldableStepsChangeStateEvent.lua](scripts/vehicles/specializations/events/FoldableStepsChangeStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/HonkEvent.lua](scripts/vehicles/specializations/events/HonkEvent.md) — 6 fn ✍
- [vehicles/specializations/events/InlineWrapperPushOffEvent.lua](scripts/vehicles/specializations/events/InlineWrapperPushOffEvent.md) — 5 fn ✍
- [vehicles/specializations/events/JumpEvent.lua](scripts/vehicles/specializations/events/JumpEvent.md) — 5 fn ✍
- [vehicles/specializations/events/LiftableAxleEvent.lua](scripts/vehicles/specializations/events/LiftableAxleEvent.md) — 6 fn ✍
- [vehicles/specializations/events/LocomotiveStateEvent.lua](scripts/vehicles/specializations/events/LocomotiveStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/LogGrabClawStateEvent.lua](scripts/vehicles/specializations/events/LogGrabClawStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.lua](scripts/vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.md) — 5 fn ✍
- [vehicles/specializations/events/MotorClutchCreakingEvent.lua](scripts/vehicles/specializations/events/MotorClutchCreakingEvent.md) — 5 fn ✍
- [vehicles/specializations/events/MotorGearShiftEvent.lua](scripts/vehicles/specializations/events/MotorGearShiftEvent.md) — 6 fn ✍
- [vehicles/specializations/events/MotorSetTurnedOnEvent.lua](scripts/vehicles/specializations/events/MotorSetTurnedOnEvent.md) — 6 fn ✍
- [vehicles/specializations/events/MotorStateEvent.lua](scripts/vehicles/specializations/events/MotorStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/MountableSetMountTypeEvent.lua](scripts/vehicles/specializations/events/MountableSetMountTypeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/MowerToggleWindrowDropEvent.lua](scripts/vehicles/specializations/events/MowerToggleWindrowDropEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PalletFillerBuyPalletEvent.lua](scripts/vehicles/specializations/events/PalletFillerBuyPalletEvent.md) — 5 fn ✍
- [vehicles/specializations/events/PalletFillerStateEvent.lua](scripts/vehicles/specializations/events/PalletFillerStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PickupSetStateEvent.lua](scripts/vehicles/specializations/events/PickupSetStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PlantLimitToFieldEvent.lua](scripts/vehicles/specializations/events/PlantLimitToFieldEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PlowLimitToFieldEvent.lua](scripts/vehicles/specializations/events/PlowLimitToFieldEvent.md) — 5 fn ✍
- [vehicles/specializations/events/PlowPackerStateEvent.lua](scripts/vehicles/specializations/events/PlowPackerStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PlowRotationCenterEvent.lua](scripts/vehicles/specializations/events/PlowRotationCenterEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PlowRotationEvent.lua](scripts/vehicles/specializations/events/PlowRotationEvent.md) — 6 fn ✍
- [vehicles/specializations/events/PushHandToolDriveModeEvent.lua](scripts/vehicles/specializations/events/PushHandToolDriveModeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua](scripts/vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.md) — 6 fn ✍
- [vehicles/specializations/events/ReverseDrivingSetStateEvent.lua](scripts/vehicles/specializations/events/ReverseDrivingSetStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/RideableStableNotificationEvent.lua](scripts/vehicles/specializations/events/RideableStableNotificationEvent.md) — 5 fn ✍
- [vehicles/specializations/events/RidgeMarkerSetStateEvent.lua](scripts/vehicles/specializations/events/RidgeMarkerSetStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetCoverStateEvent.lua](scripts/vehicles/specializations/events/SetCoverStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetCrabSteeringEvent.lua](scripts/vehicles/specializations/events/SetCrabSteeringEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetCruiseControlSpeedEvent.lua](scripts/vehicles/specializations/events/SetCruiseControlSpeedEvent.md) — 5 fn ✍
- [vehicles/specializations/events/SetCruiseControlStateEvent.lua](scripts/vehicles/specializations/events/SetCruiseControlStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/SetDischargeStateEvent.lua](scripts/vehicles/specializations/events/SetDischargeStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetFillUnitCapacityEvent.lua](scripts/vehicles/specializations/events/SetFillUnitCapacityEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetFillUnitIsFillingEvent.lua](scripts/vehicles/specializations/events/SetFillUnitIsFillingEvent.md) — 5 fn ✍
- [vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua](scripts/vehicles/specializations/events/SetPipeDischargeToGroundEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetPipeStateEvent.lua](scripts/vehicles/specializations/events/SetPipeStateEvent.md) — 5 fn ✍
- [vehicles/specializations/events/SetSeedIndexEvent.lua](scripts/vehicles/specializations/events/SetSeedIndexEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetTurnedOnEvent.lua](scripts/vehicles/specializations/events/SetTurnedOnEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SetWorkModeEvent.lua](scripts/vehicles/specializations/events/SetWorkModeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/SprayerDoubledAmountEvent.lua](scripts/vehicles/specializations/events/SprayerDoubledAmountEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TensionBeltsEvent.lua](scripts/vehicles/specializations/events/TensionBeltsEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TensionBeltsRefreshEvent.lua](scripts/vehicles/specializations/events/TensionBeltsRefreshEvent.md) — 5 fn ✍
- [vehicles/specializations/events/TrailerToggleManualDoorEvent.lua](scripts/vehicles/specializations/events/TrailerToggleManualDoorEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TrailerToggleManualTipEvent.lua](scripts/vehicles/specializations/events/TrailerToggleManualTipEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TrailerToggleTipSideEvent.lua](scripts/vehicles/specializations/events/TrailerToggleTipSideEvent.md) — 5 fn ✍
- [vehicles/specializations/events/TreeAttachEvent.lua](scripts/vehicles/specializations/events/TreeAttachEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TreeAttachRequestEvent.lua](scripts/vehicles/specializations/events/TreeAttachRequestEvent.md) — 5 fn ✍
- [vehicles/specializations/events/TreeAttachResponseEvent.lua](scripts/vehicles/specializations/events/TreeAttachResponseEvent.md) — 5 fn ✍
- [vehicles/specializations/events/TreeDetachEvent.lua](scripts/vehicles/specializations/events/TreeDetachEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TreePlanterCreateTreeEvent.lua](scripts/vehicles/specializations/events/TreePlanterCreateTreeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TreePlanterLoadPalletEvent.lua](scripts/vehicles/specializations/events/TreePlanterLoadPalletEvent.md) — 6 fn ✍
- [vehicles/specializations/events/TreePlanterTreeTypeEvent.lua](scripts/vehicles/specializations/events/TreePlanterTreeTypeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/VariableWorkWidthStateEvent.lua](scripts/vehicles/specializations/events/VariableWorkWidthStateEvent.md) — 6 fn ✍
- [vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua](scripts/vehicles/specializations/events/VehiclePlayerStyleChangedEvent.md) — 5 fn ✍
- [vehicles/specializations/events/VehicleSetBeaconLightEvent.lua](scripts/vehicles/specializations/events/VehicleSetBeaconLightEvent.md) — 5 fn ✍
- [vehicles/specializations/events/VehicleSetLightEvent.lua](scripts/vehicles/specializations/events/VehicleSetLightEvent.md) — 5 fn ✍
- [vehicles/specializations/events/VehicleSetTurnLightEvent.lua](scripts/vehicles/specializations/events/VehicleSetTurnLightEvent.md) — 5 fn ✍
- [vehicles/specializations/events/VehicleSettingsChangeEvent.lua](scripts/vehicles/specializations/events/VehicleSettingsChangeEvent.md) — 5 fn ✍
- [vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua](scripts/vehicles/specializations/events/WaterTrailerSetIsFillingEvent.md) — 6 fn ✍
- [vehicles/specializations/events/WearableRepaintEvent.lua](scripts/vehicles/specializations/events/WearableRepaintEvent.md) — 5 fn ✍
- [vehicles/specializations/events/WearableRepairEvent.lua](scripts/vehicles/specializations/events/WearableRepairEvent.md) — 5 fn ✍
- [vehicles/specializations/events/WoodContainerWrongLengthEvent.lua](scripts/vehicles/specializations/events/WoodContainerWrongLengthEvent.md) — 5 fn ✍
- [vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua](scripts/vehicles/specializations/events/WoodHarvesterCutLengthEvent.md) — 6 fn ✍
- [vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua](scripts/vehicles/specializations/events/WoodHarvesterCutTreeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua](scripts/vehicles/specializations/events/WoodHarvesterDropTreeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua](scripts/vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.md) — 6 fn ✍
- [vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua](scripts/vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.md) — 5 fn ✍
- [vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua](scripts/vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.md) — 5 fn ✍
- [vehicles/specializations/events/YarderTowerFollowModeEvent.lua](scripts/vehicles/specializations/events/YarderTowerFollowModeEvent.md) — 6 fn ✍
- [vehicles/specializations/events/YarderTowerSetTargetEvent.lua](scripts/vehicles/specializations/events/YarderTowerSetTargetEvent.md) — 6 fn ✍
- [vehicles/wheels/Wheel.lua](scripts/vehicles/wheels/Wheel.md) — 23 fn ✍
- [vehicles/wheels/WheelAxle.lua](scripts/vehicles/wheels/WheelAxle.md) — 7 fn ✍
- [vehicles/wheels/WheelChock.lua](scripts/vehicles/wheels/WheelChock.md) — 6 fn ✍
- [vehicles/wheels/WheelDebug.lua](scripts/vehicles/wheels/WheelDebug.md) — 5 fn ✍
- [vehicles/wheels/WheelDestruction.lua](scripts/vehicles/wheels/WheelDestruction.md) — 10 fn ✍
- [vehicles/wheels/WheelEffects.lua](scripts/vehicles/wheels/WheelEffects.md) — 14 fn ✍
- [vehicles/wheels/WheelManager.lua](scripts/vehicles/wheels/WheelManager.md) — 6 fn ✍
- [vehicles/wheels/WheelPhysics.lua](scripts/vehicles/wheels/WheelPhysics.md) — 40 fn ✍
- [vehicles/wheels/WheelSteering.lua](scripts/vehicles/wheels/WheelSteering.md) — 5 fn ✍
- [vehicles/wheels/WheelVisual.lua](scripts/vehicles/wheels/WheelVisual.md) — 14 fn ✍
- [vehicles/wheels/WheelVisualPart.lua](scripts/vehicles/wheels/WheelVisualPart.md) — 11 fn ✍
- [vehicles/wheels/WheelVisualPartConnector.lua](scripts/vehicles/wheels/WheelVisualPartConnector.md) — 4 fn ✍
- [vehicles/wheels/WheelVisualPartTire.lua](scripts/vehicles/wheels/WheelVisualPartTire.md) — 5 fn ✍
- [vehicles/wheels/WheelXMLObject.lua](scripts/vehicles/wheels/WheelXMLObject.md) — 10 fn ✍
