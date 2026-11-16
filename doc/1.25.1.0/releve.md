# In-game scan — FS25 1.25.1.0

*[Version française](fr/releve.md)*

`# atlas_releve	version=1.25.1.0	debug=false`

4308 globals found, 2651 of them missing from the SDK sources (1353 functions, probably engine).

## Explored roots

| Root | Type | Keys |
|---|---|---|
| env | table | 35 |
| mt1 | table | 4366 |
| mt2 | nil | -1 |
| getfenv0 | table | 35 |

Third-party mod environments skipped: 73.

## Mod environment overrides

Names defined directly in the sandboxed environment where mod code runs (they shadow or replace the global version).

- `AtlasReleve` (table)
- `ClassUtil` (table)
- `GS_IS_CONSOLE_VERSION` (boolean)
- `InitEventClass` (function)
- `InitObjectClass` (function)
- `InitStaticEventClass` (string)
- `InitStaticObjectClass` (string)
- `_G` (table)
- `deleteFile` (function)
- `deleteFolder` (function)
- `g_adsSystem` (table)
- `g_constructionBrushTypeManager` (table)
- `g_effectManager` (table)
- `g_handToolSpecializationManager` (table)
- `g_handToolTypeManager` (table)
- `g_i18n` (table)
- `g_isDevelopmentVersion` (boolean)
- `g_onCreateUtil` (table)
- `g_placeableSpecializationManager` (table)
- `g_placeableTypeManager` (table)
- `g_specializationManager` (table)
- `g_vehicleTypeManager` (table)
- `getUniqueUserId` (function)
- `getfenv` (function)
- `isAbsolutePath` (function)
- `loadDlcs` (string)
- `loadDlcsFromDirectory` (string)
- `loadMod` (string)
- `loadModDesc` (string)
- `loadMods` (string)
- `loadstring` (function)
- `registerObjectClassName` (function)
- `reloadDlcsAndMods` (string)
- `source` (function)
- `verifyDlcs` (string)

## Tables missing from the SDK sources

### AIDebugDump (13 members)
`addData`, `class`, `copy`, `delete`, `isa`, `new`, `setTarget`, `startPlanningRecording`, `startRecording`, `stopPlanningRecording`, `stopRecording`, `superClass`

### AIDebugVehicle (12 members)
`addCurrentPosition`, `class`, `clear`, `copy`, `delete`, `draw`, `isa`, `new`, `setForcedY`, `setTarget`, `superClass`, `update`

### AIFieldCourse (33 members)
`addDebugTexts`, `class`, `clearAlternativeSegments`, `copy`, `debugPrint`, `draw`, `finalize`, `getActiveSegment`, `getActiveSegmentData`, `getActiveSegmentSideOffset`, `getDriveData`, `getIsCornerCutOutActive`, `getIsSegmentAreaValid`, `getNextSegmentData`, `getPositionOffsetToActiveSegment`, `isa`, `new`, `onNextSegmentFound`, `setInitialSegmentCallback`, `setLastActiveSegmentId`, `setOverwrittenSegments`, `setSegmentAreaValidityFunction`, `setSegmentSwitchedCallback`, `setSegmentsToSkip`, `setStartPosition`, `skipCurrentSubSegment`, `superClass`, `update`, `updateHeadlandTailAvoidance`, `updateSegmentInitialization`

### AIFieldCourseCornerCutOut (11 members)
`class`, `copy`, `isa`, `new`, `onSegmentTurnDataFound`, `processSegments`, `setCallback`, `superClass`, `validateSegments`

### AIFieldCourseFirstSegmentDetection (17 members)
`class`, `copy`, `debugPrint`, `debugScoring`, `detect`, `doCallback`, `getSegmentScore`, `isa`, `new`, `overlapCallback`, `setCallback`, `setLastActiveSegmentId`, `setSegmentsToSkip`, `setStartPosition`, `splitClosestSegment`, `superClass`, `update`

### AIFieldCourseInitialSegment (15 members)
`class`, `copy`, `debugPrint`, `doCallback`, `generate`, `generateFinalSegment`, `isa`, `new`, `onFirstSegmentFound`, `onIntoFieldSegmentTurnDataFound`, `onSegmentOutsideFieldCollisionCheckFinished`, `onSegmentOutsideFieldTurnDataFound`, `onSegmentTurnDataFound`, `setCallback`, `superClass`

### AIFieldCourseReconstructionData (12 members)
`apply`, `class`, `copy`, `doCallback`, `generateFieldCourse`, `isa`, `loadFromXML`, `new`, `registerXMLPaths`, `saveToXML`, `setDataByAIFieldCourse`, `superClass`

### AIFieldCourseSegment (23 members)
`class`, `clone`, `copy`, `draw`, `drawToolPreview`, `getDriveData`, `getIsOnActualLine`, `getPosition`, `getPositionOffset`, `getSegmentPosition`, `getSignedOffsetToSegment`, `getSubSegmentPosition`, `isReady`, `isValid`, `isa`, `new`, `overlapCallback`, `reset`, `setPositions`, `setSegment`, `setTurn`, `skipCurrentSubSegment`, `superClass`

### AIFieldCourseSegmentCollisionCheck (10 members)
`checkSegment`, `class`, `copy`, `doCallback`, `isa`, `new`, `next`, `overlapCallback`, `overlapCheck`, `superClass`

### AIFieldCourseSegmentCollisionCheckState (18 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### AIFieldCourseSegmentOrderTask (38 members)
`adjustSegmentLength`, `class`, `copy`, `fillBuffer`, `fillNextBufferSlot`, `findClosestSegment`, `findClosestStraightSegment`, `findNextHeadlandSegment`, `findNextSegment`, `findNextValidSegment`, `getBoundaryCorrectedDistance`, `getBoundaryCorrectedDistanceByBoundary`, `getCloserSegment`, `getClosestSegmentToPosition`, `getCostDistanceToSegment`, `getIsSegmentValid`, `getNeighbouringUsedSegment`, `getNextDirectConnectBoundaryPosition`, `getPreferedOffsetSide`, `getSegmentDirectionFactor`, `getSegmentSearchPending`, `getSegmentToSegmentFactor`, `hasFinished`, `isa`, `new`, `next`, `onBufferFillFinished`, `onBufferSlotFilled`, `onCutOutSegmentFound`, `onFoundFirstSegment`, `onFoundSegment`, `onSegmentTurnDataFound`, `setAlternativeTurnSegmentData`, `setLastActiveSegmentId`, `setOverwrittenSegments`, `setSegmentsToSkip`, `setStartPosition`, `superClass`

### AIFieldCourseState (20 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### AIFieldCourseTurn (11 members)
`class`, `copy`, `draw`, `getOverallCost`, `getPosition`, `isa`, `iterate`, `new`, `superClass`, `updateCost`, `updateLength`

### AIFieldCourseTurnCollisionCheck (8 members)
`class`, `copy`, `doCallback`, `isa`, `new`, `overlapCallback`, `superClass`, `update`

### AIFieldCourseTurnGenerator (28 members)
`class`, `copy`, `doIntersectionChecks`, `findCommonTurnRadiusIntersection`, `generatePositionToPosition`, `generatePositionToSegment`, `generateSegmentToSegment`, `generateTurnIntersectionPoints`, `generateTurnsByData`, `getBestTurnByTurnData`, `getIntersectionTurn`, `getLowestCostTurn`, `getLowestCostTurnByData`, `getSegmentMinOffset`, `getSkipToPositionIndex`, `isPositionOutsideField`, `isa`, `new`, `onFinished`, `setAllowProtectedBoundary`, `setCallback`, `setForcedDrivingDirection`, `setIgnoreBoundaryIntersections`, `setMaxOffset`, `setOverwrittenTurnRadius`, `setPreferOneDrivingDirection`, `superClass`, `update`

### AIFieldCourseTurnGeneratorState (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### AIFieldCourseTurnSegment (9 members)
`class`, `copy`, `getLength`, `inverseDirection`, `inverseSteering`, `isa`, `move`, `new`, `superClass`

### AIFieldCourseTurnSegmentType (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### AIFieldCourseUtil (10 members)
`cutSegmentByDistance`, `drawPath`, `drawPathArea`, `extendHeadlandSegment`, `getClosestPositionOnSegment`, `getSegmentPosition`, `getSegmentPositionAndDirection`, `getSegmentPositionOffset`, `getSegmentSideOffset`, `getSegmentToSegmentDistance`

### AIHotspot (43 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getVehicle`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setAIHelperName`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVehicle`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### AIJobType (5 members)
—

### AILoadable (20 members)
`aiCancelLoadingFromTrigger`, `aiFinishLoading`, `aiFinishedLoadingFromTrigger`, `aiPrepareLoading`, `aiStartLoadingFromTrigger`, `aiStoppedLoadingFromTrigger`, `getAIFillUnits`, `getAIHasFinishedLoading`, `getAILoadingNodeZAlignedOffset`, `initSpecialization`, `loadFillUnitFromXML`, `onLoad`, `onPostLoad`, `onPreLoad`, `onUpdate`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`

### AIMessageType (3 members)
—

### AIParameterType (7 members)
—

### AIPlaceableMarkerHotspot (41 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### AISettingsDialog (157 members)
`addCallback`, `addElement`, `applyProfile`, `assignSettingsOptions`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `drawLineOnMap`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBinary`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickMode`, `onClickOk`, `onClickOption`, `onClickReset`, `onClickShop`, `onClose`, `onCreate`, `onDrawPostIngameMapHotspots`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFieldCourse`, `updateFieldCourseSettings`, `updateFramePosition`, `updateMapState`, `updateSettingsStates`, `updateSettingsValues`, `verifyConfiguration`

### AITargetHotspot (40 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### AIUserSettingCruiseControl (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingHeadlandFirst (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingImplementWidth (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingNumHeadlands (13 members)
`adjustToCourse`, `apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingShowLines (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingSideOffset (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingSkipNumLines (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingWorkDirection (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettingWorkHeadlands (12 members)
`apply`, `class`, `copy`, `getIsDisabled`, `init`, `isa`, `loadFromXML`, `new`, `onSettingsChanged`, `registerXMLPath`, `saveToXML`, `superClass`

### AIUserSettings (12 members)
`adjustToCourse`, `apply`, `class`, `copy`, `isa`, `loadFromXML`, `new`, `registerXMLPaths`, `reinitialize`, `saveToXML`, `superClass`

### AbstractFieldMissionHotspot (43 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `postUpdate`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setField`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRadius`, `setWorldRotation`, `superClass`

### AccessHandler (12 members)
`canFarmAccess`, `canFarmAccessLand`, `canFarmAccessOtherId`, `canPlayerAccess`, `class`, `copy`, `delete`, `isa`, `new`, `superClass`

### AchievementManager (18 members)
`addAchievement`, `class`, `copy`, `getCanUnlockAchievement`, `getLockedImageData`, `handleStandardScoreAchievement`, `initDataStructures`, `isa`, `load`, `loadAchievementsState`, `loadMapData`, `new`, `resetAchievementsState`, `superClass`, `tryUnlock`, `unloadMapData`, `update`, `updateAchievements`

### AchievementsScreen (137 members)
`addCallback`, `addElement`, `applyProfile`, `assignAchievementsStatsValue`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `checkAchievementSynchronization`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAchievements`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onCancelAchievementsSync`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateInsets`, `updateTheme`, `verifyConfiguration`

### ActionFarmlandSetFarm (10 members)
`class`, `copy`, `createFromXML`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionFieldUpdate (10 members)
`class`, `copy`, `createFromXML`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionIngameMap (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionNPCMove (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionNPCStartConversation (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionNavigationMarker (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionPlaceableSetFarm (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionPlayerSetSpawnPosition (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionShowProgress (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleAttach (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockAIStart (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockAIStop (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockAttacherJoint (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockDetaching (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockDischarge (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockFolding (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockLeaving (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockPipeChange (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleBlockToggleSeeds (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleDetach (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleDismissHelper (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleReset (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleSetCustomBrake (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleSetFarm (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActionVehicleSetFillLevel (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ActivatableObjectsSystem (19 members)
`activate`, `addActivatable`, `class`, `consoleCommandDebugState`, `copy`, `deactivate`, `draw`, `getActivatable`, `isa`, `new`, `onActivateObjectInput`, `registerInput`, `removeActivatable`, `removeInput`, `setDirection`, `setPosition`, `superClass`, `update`, `updateObjects`

### AdLight (9 members)
`class`, `copy`, `delete`, `isa`, `loadFromNode`, `new`, `onCreate`, `superClass`, `update`

### AdditionalToolConnections (10 members)
`initSpecialization`, `loadAttacherJointFromXML`, `onPostAttach`, `onPostLoad`, `onPreDetach`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`

### AdsSystem (11 members)
`addGroupRegion`, `class`, `clearGroupRegion`, `copy`, `delete`, `drawDebug`, `isa`, `new`, `setGroupActive`, `superClass`

### AgentState (5 members)
—

### AmbientSoundSystem (24 members)
`addMovingSound`, `class`, `consoleCommandReload`, `consoleCommandToggleDebugView`, `copy`, `delete`, `draw`, `isSamplePossible`, `isa`, `loadFromConfigFile`, `loadMapData`, `new`, `onPlayerEntered`, `onPlayerLeft`, `onWeatherChanged`, `removeMovingSound`, `setIsEnabled`, `setIsIndoor`, `sound3DFileLoaded`, `superClass`, `unloadAmbientSounds`, `update`, `updateMask`

### AmbientSoundUtil (2 members)
`onCreateMovingSound`, `onCreateSoundNode`

### AnimalAnimationSystemSource (1 members)
`registerXMLPaths`

### AnimalBuyEvent (21 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `validate`, `writeStream`

### AnimalCluster (56 members)
`addInfos`, `changeAge`, `changeHealth`, `changeNumAnimals`, `changeReproduction`, `class`, `clearPendingSpawnWorldPosition`, `clone`, `copy`, `getAge`, `getAgeFactor`, `getCanBeSold`, `getCanReproduce`, `getHash`, `getHealthChangeFactor`, `getHealthFactor`, `getMaxNumAnimals`, `getMergeSupport`, `getNextClusterId`, `getNumAnimals`, `getPendingSpawnWorldPosition`, `getReproductionDelta`, `getReproductionFactor`, `getRidableFilename`, `getSellPrice`, `getSubTypeIndex`, `getSupportsMerging`, `getSupportsReproduction`, `getTranportationFee`, `getVisual`, `isa`, `loadFromXMLFile`, `merge`, `new`, `onDayChanged`, `onPeriodChanged`, `readStream`, `readUpdateStream`, `registerSavegameXMLPaths`, `resetClusterIds`, `saveToXMLFile`, `setClusterSystem`, `setDirty`, `setPendingSpawnWorldPosition`, `showInfo`, `superClass`, `updateHealth`, `updateReproduction`, `writeStream`, `writeUpdateStream`

### AnimalClusterHorse (74 members)
`addInfos`, `applyExercise`, `applyGrooming`, `changeAge`, `changeDirt`, `changeFitness`, `changeHealth`, `changeNumAnimals`, `changeReproduction`, `changeRiding`, `class`, `clearPendingSpawnWorldPosition`, `clone`, `copy`, `getAge`, `getAgeFactor`, `getCanBeSold`, `getCanReproduce`, `getDailyRidingTime`, `getDirtFactor`, `getFitnessFactor`, `getHash`, `getHealthChangeFactor`, `getHealthFactor`, `getMaxNumAnimals`, `getMergeSupport`, `getName`, `getNeedsExercise`, `getNeedsGrooming`, `getNextClusterId`, `getNumAnimals`, `getPendingSpawnWorldPosition`, `getReproductionDelta`, `getReproductionFactor`, `getRidableFilename`, `getRidingFactor`, `getSellPrice`, `getSubTypeIndex`, `getSupportsExercise`, `getSupportsGrooming`, `getSupportsMerging`, `getSupportsReproduction`, `getTranportationFee`, `getVisual`, `isa`, `loadFromXMLFile`, `merge`, `new`, `onDayChanged`, `onPeriodChanged`, `readStream`, `readUpdateStream`, `registerSavegameXMLPaths`, `resetClusterIds`, `resetRiding`, `saveToXMLFile`, `setClusterSystem`, `setDirty`, `setName`, `setPendingSpawnWorldPosition`, `setRiding`, `showInfo`, `superClass`, `updateHealth`, `updateReproduction`, `writeStream`, `writeUpdateStream`

### AnimalClusterHusbandry (19 members)
`class`, `copy`, `create`, `delete`, `deleteHusbandry`, `getAnimalPosition`, `getClusterByAnimalId`, `getHusbandryId`, `getNeedsUpdate`, `getPlaceable`, `isa`, `new`, `onIndoorStateChanged`, `setClusters`, `setMaxNumVisualAnimals`, `sortClusters`, `superClass`, `update`, `updateVisuals`

### AnimalClusterSystem (23 members)
`addCluster`, `addPendingAddCluster`, `addPendingRemoveCluster`, `class`, `copy`, `delete`, `getCluster`, `getClusterById`, `getClusters`, `isa`, `loadFromXMLFile`, `new`, `readStream`, `registerSavegameXMLPaths`, `removeCluster`, `saveToXMLFile`, `setDirty`, `superClass`, `update`, `updateClusters`, `updateIdMapping`, `updateNow`, `writeStream`

### AnimalClusterUpdateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### AnimalCompanionManager (1 members)
`registerXMLPaths`

### AnimalFoodSystem (26 members)
`class`, `consumeFood`, `consumeFoodGroup`, `consumeFoodParallelly`, `consumeFoodSerially`, `copy`, `delete`, `getAnimalFood`, `getFillTypesFromXML`, `getMixtureByFillType`, `getMixturesByAnimalTypeIndex`, `getRecipeByFillTypeIndex`, `getTotalFillLevelInGroup`, `isa`, `loadAnimalFood`, `loadAnimalFoodData`, `loadMapData`, `loadMixture`, `loadMixtures`, `loadRecipe`, `loadRecipes`, `new`, `superClass`

### AnimalHusbandryFeedingType (2 members)
—

### AnimalItemNew (14 members)
`class`, `copy`, `getAge`, `getDescription`, `getFilename`, `getInfos`, `getName`, `getPrice`, `getSubTypeIndex`, `getTitle`, `getTranportationFee`, `isa`, `new`, `superClass`

### AnimalItemStock (17 members)
`class`, `copy`, `getCanBeSold`, `getCluster`, `getClusterId`, `getDescription`, `getFilename`, `getInfos`, `getName`, `getNumAnimals`, `getPrice`, `getSubTypeIndex`, `getTitle`, `getTranportationFee`, `isa`, `new`, `superClass`

### AnimalLoadEvent (21 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `validate`, `writeStream`

### AnimalMoveEvent (22 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `validate`, `writeStream`

### AnimalNameSystem (8 members)
`class`, `copy`, `delete`, `getRandomName`, `isa`, `loadMapData`, `new`, `superClass`

### AnimalScreenBase (33 members)
`class`, `copy`, `getMaxNumAnimals`, `getSourceActionText`, `getSourceAnimalTypes`, `getSourceData`, `getSourceItems`, `getSourceMaxNumAnimals`, `getSourceName`, `getTargetActionText`, `getTargetData`, `getTargetItems`, `getTargetMaxNumAnimals`, `getTargetName`, `init`, `initItems`, `initSourceItems`, `initTargetItems`, `isa`, `new`, `onAnimalBuyError`, `onAnimalsChanged`, `reset`, `setActionTypeCallback`, `setAnimalsChangedCallback`, `setCurrentHusbandry`, `setErrorCallback`, `setSourceActionFinishedCallback`, `setTargetActionFinishedCallback`, `superClass`

### AnimalScreenDealer (41 members)
`applySource`, `applyTarget`, `class`, `copy`, `getApplySourceConfirmationText`, `getApplyTargetConfirmationText`, `getMaxNumAnimals`, `getSourceActionText`, `getSourceAnimalTypes`, `getSourceData`, `getSourceItems`, `getSourceMaxNumAnimals`, `getSourceName`, `getSourcePrice`, `getTargetActionText`, `getTargetData`, `getTargetItems`, `getTargetMaxNumAnimals`, `getTargetName`, `getTargetPrice`, `init`, `initItems`, `initSourceItems`, `initTargetItems`, `isa`, `new`, `onAnimalBought`, `onAnimalBuyError`, `onAnimalSold`, `onAnimalsChanged`, `reset`, `setActionTypeCallback`, `setAnimalsChangedCallback`, `setCurrentHusbandry`, `setErrorCallback`, `setSourceActionFinishedCallback`, `setTargetActionFinishedCallback`, `superClass`

### AnimalScreenDealerFarm (41 members)
`applySource`, `applyTarget`, `class`, `copy`, `getApplySourceConfirmationText`, `getApplyTargetConfirmationText`, `getMaxNumAnimals`, `getSourceActionText`, `getSourceAnimalTypes`, `getSourceData`, `getSourceItems`, `getSourceMaxNumAnimals`, `getSourceName`, `getSourcePrice`, `getTargetActionText`, `getTargetData`, `getTargetItems`, `getTargetMaxNumAnimals`, `getTargetName`, `getTargetPrice`, `init`, `initItems`, `initSourceItems`, `initTargetItems`, `isa`, `new`, `onAnimalBought`, `onAnimalBuyError`, `onAnimalSold`, `onAnimalsChanged`, `reset`, `setActionTypeCallback`, `setAnimalsChangedCallback`, `setCurrentHusbandry`, `setErrorCallback`, `setSourceActionFinishedCallback`, `setTargetActionFinishedCallback`, `superClass`

### AnimalScreenDealerTrailer (41 members)
`applySource`, `applyTarget`, `class`, `copy`, `getApplySourceConfirmationText`, `getApplyTargetConfirmationText`, `getMaxNumAnimals`, `getSourceActionText`, `getSourceAnimalTypes`, `getSourceData`, `getSourceItems`, `getSourceMaxNumAnimals`, `getSourceName`, `getSourcePrice`, `getTargetActionText`, `getTargetData`, `getTargetItems`, `getTargetMaxNumAnimals`, `getTargetName`, `getTargetPrice`, `init`, `initItems`, `initSourceItems`, `initTargetItems`, `isa`, `new`, `onAnimalBought`, `onAnimalBuyError`, `onAnimalSold`, `onAnimalsChanged`, `reset`, `setActionTypeCallback`, `setAnimalsChangedCallback`, `setCurrentHusbandry`, `setErrorCallback`, `setSourceActionFinishedCallback`, `setTargetActionFinishedCallback`, `superClass`

### AnimalScreenTrailer (41 members)
`applySource`, `applyTarget`, `class`, `copy`, `getApplySourceConfirmationText`, `getApplyTargetConfirmationText`, `getMaxNumAnimals`, `getSourceActionText`, `getSourceAnimalTypes`, `getSourceData`, `getSourceItems`, `getSourceMaxNumAnimals`, `getSourceName`, `getSourcePrice`, `getTargetActionText`, `getTargetData`, `getTargetItems`, `getTargetMaxNumAnimals`, `getTargetName`, `getTargetPrice`, `init`, `initItems`, `initSourceItems`, `initTargetItems`, `isa`, `new`, `onAnimalBuyError`, `onAnimalLoadedToTrailer`, `onAnimalMovedToSpawnPlace`, `onAnimalsChanged`, `reset`, `setActionTypeCallback`, `setAnimalsChangedCallback`, `setCurrentHusbandry`, `setErrorCallback`, `setSourceActionFinishedCallback`, `setTargetActionFinishedCallback`, `superClass`

### AnimalScreenTrailerFarm (41 members)
`applySource`, `applyTarget`, `class`, `copy`, `getApplySourceConfirmationText`, `getApplyTargetConfirmationText`, `getMaxNumAnimals`, `getSourceActionText`, `getSourceAnimalTypes`, `getSourceData`, `getSourceItems`, `getSourceMaxNumAnimals`, `getSourceName`, `getSourcePrice`, `getTargetActionText`, `getTargetData`, `getTargetItems`, `getTargetMaxNumAnimals`, `getTargetName`, `getTargetPrice`, `init`, `initItems`, `initSourceItems`, `initTargetItems`, `isa`, `new`, `onAnimalBuyError`, `onAnimalMovedToFarm`, `onAnimalMovedToTrailer`, `onAnimalsChanged`, `reset`, `setActionTypeCallback`, `setAnimalsChangedCallback`, `setCurrentHusbandry`, `setErrorCallback`, `setSourceActionFinishedCallback`, `setTargetActionFinishedCallback`, `superClass`

### AnimalSellEvent (19 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `validate`, `writeStream`

### AnimalSoundSource (1 members)
`registerXMLPaths`

### AnimalSubType (23 members)
—

### AnimalSystem (32 members)
`class`, `copy`, `createClusterFromSubTypeIndex`, `delete`, `getAnimalBuyPrice`, `getAnimalTransportFee`, `getClusterClassBySubTypeIndex`, `getSubTypeByFillTypeIndex`, `getSubTypeByIndex`, `getSubTypeByName`, `getSubTypeIndexByFillTypeIndex`, `getSubTypeIndexByName`, `getTypeByIndex`, `getTypeByName`, `getTypeIndexByName`, `getTypeIndexBySubTypeIndex`, `getTypes`, `getVisualAnimalIndexByAge`, `getVisualByAge`, `isa`, `loadAnimCurve`, `loadAnimalConfig`, `loadAnimals`, `loadMapData`, `loadSubType`, `loadSubTypes`, `loadVisualData`, `new`, `superClass`, `validateAnimalType`, `validateVisual`

### AnimalTradingDialog (157 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onBuy`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickNumAnimals`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onSell`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setAnimalIndex`, `setButtonTexts`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setGetPriceFunc`, `setHandleFocus`, `setHighlighted`, `setId`, `setInfoIcon`, `setInputContextCallback`, `setIsBuying`, `setIsCloseAllowed`, `setIsHorse`, `setMaxAnimals`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSelectionState`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePrice`, `verifyConfiguration`

### AnimalType (5 members)
—

### AnimalUnloadEvent (24 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `onLoadedRideable`, `readStream`, `run`, `superClass`, `validate`, `writeStream`

### AnimalWorkerTaskGrooming (4 members)
`register`

### AnimalWorkerTaskRiding (4 members)
`register`

### AnimalWorkerTaskSystem (24 members)
`class`, `copy`, `delete`, `getIsScheduleValid`, `getIsTaskValid`, `getNumTasks`, `getTaskByIndex`, `getTaskByName`, `getTaskIndex`, `getTaskIsAvailable`, `getTaskIsDaily`, `getTaskNumPendingAnimals`, `getTaskNumTotalAnimals`, `getTaskTitle`, `getTasks`, `isa`, `new`, `performTask`, `registerTask`, `superClass`

### AnimalWorkerTaskUtil (4 members)
`applyToClusters`, `getClusterFlag`, `getHasSubTypeField`, `getNumAnimals`

### AnimatedObjectEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### Animation (20 members)
`addDuplicate`, `calculateTurnOffFadeTime`, `class`, `copy`, `delete`, `getAllowUpdate`, `isDuplicate`, `isRunning`, `isa`, `new`, `reset`, `setFillType`, `setUpdateDistance`, `start`, `stop`, `superClass`, `update`, `updateDuplicate`, `updateDuplicates`

### AnimationCache (13 members)
`class`, `copy`, `delete`, `getNode`, `isLoaded`, `isa`, `load`, `new`, `onAnimationFileLoaded`, `superClass`

### AnimationManager (24 members)
`areAnimationsRunning`, `class`, `copy`, `deleteAnimations`, `getAnimationClass`, `initDataStructures`, `isa`, `load`, `loadAnimations`, `loadMapData`, `new`, `registerAnimationClass`, `registerAnimationNodesXMLPaths`, `resetAnimation`, `resetAnimations`, `setFillType`, `setPrevShaderParameter`, `startAnimation`, `startAnimations`, `stopAnimation`, `stopAnimations`, `superClass`, `unloadMapData`, `update`

### AreaType (18 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### Assert (26 members)
`areEqual`, `areNotEqual`, `areRoughlyEqual`, `assert`, `entityExists`, `fail`, `greaterThan`, `greaterThanOrEqualTo`, `hasKey`, `hasNoKey`, `isBetween`, `isClass`, `isFalse`, `isInteger`, `isNil`, `isNilOrClass`, `isNilOrType`, `isNotNil`, `isStringNotNilOrEmpty`, `isTrue`, `isType`, `lessThan`, `lessThanOrEqualTo`, `throwsError`

### AsyncAwaiter (11 members)
`addDependencies`, `addDependency`, `cancel`, `class`, `copy`, `getDependenciesCount`, `isa`, `new`, `onDependencyAvailable`, `reset`, `superClass`

### AsyncResult (3 members)
—

### AsyncTaskManager (15 members)
`addSubtask`, `addTask`, `class`, `copy`, `flushAllTasks`, `hasTasks`, `initDataStructures`, `isa`, `new`, `runLambda`, `runTopTask`, `setAllowedTimePerFrame`, `superClass`, `update`

### AtmosphereQuality (6 members)
—

### AttacherJointsCompControl (14 members)
`addDependentComponentJointData`, `addToPhysics`, `initSpecialization`, `loadAttacherJointFromXML`, `onPreLoad`, `onStateChange`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `setDependentComponentJointBaseFactors`, `updateDebugValues`, `updateDependentComponentJointValues`

### AudioGroup (14 members)
`addGroup`, `getAudioGroupIndexByName`, `getAudioGroupNameByIndex`, `getIsValidAudioGroup`, `getNextId`, `loadGroups`

### AudioSourcePriority (5 members)
—

### AutoLoadParams (4 members)
—

### AutoSaveManager (28 members)
`class`, `consoleCommandAutoSave`, `consoleCommandAutoSaveInterval`, `copy`, `getIndexFromInterval`, `getInterval`, `getIntervalFromIndex`, `getIntervalOptions`, `getIsActive`, `getIsAutoSaveAllowed`, `initDataStructures`, `isa`, `load`, `loadFinished`, `loadMapData`, `new`, `onMissionStarted`, `onOpenIngameMenu`, `onSavegameLoaded`, `resetTime`, `runAutoSaveIfPending`, `setInterval`, `setIsActive`, `superClass`, `unloadMapData`, `update`

### AutomaticArmControlForwarder (38 members)
`actionEvent`, `calculateMovingToolTargetMove`, `doTreeArmAlignment`, `drawDebugCircleRange`, `getAutomaticAlignmentAvailableTargetTree`, `getAutomaticAlignmentCurrentTarget`, `getAutomaticAlignmentTargetTree`, `getBestTreeToAutoAlign`, `getIsAutoTreeAlignmentAllowed`, `getIsAutomaticAlignmentActive`, `getIsAutomaticAlignmentFinished`, `initSpecialization`, `movingToolXAlignment`, `onAutoLoadForwaderMountedTree`, `onDelete`, `onLoad`, `onPostLoad`, `onReadUpdateStream`, `onRegisterActionEvents`, `onTreeAutoTriggerCallback`, `onUpdate`, `onWriteUpdateStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `resetAutomaticAlignment`, `setTreeArmAlignmentInput`, `updateActionEvents`

### AutomaticArmControlHarvester (43 members)
`actionControllerEvent`, `actionEvent`, `calculateMovingToolTargetMove`, `doTreeArmAlignment`, `drawDebugCircleRange`, `getAutoAlignHasValidTree`, `getAutoAlignTreeMarkerState`, `getAutomaticAlignmentCurrentTarget`, `getAutomaticAlignmentInvalidTreeReason`, `getBestTreeToAutoAlign`, `getIsAutoTreeAlignmentAllowed`, `getIsAutomaticAlignmentActive`, `getSupportsAutoTreeAlignment`, `getTreeAutomaticOverwrites`, `initSpecialization`, `onDelete`, `onLoad`, `onPostLoad`, `onReadUpdateStream`, `onRegisterActionEvents`, `onRootVehicleChanged`, `onTreeAutoOverlapCallback`, `onUpdate`, `onWriteUpdateStream`, `prepareAlignment`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `setTreeArmAlignmentInput`, `updateActionEvents`

### Axis (3 members)
—

### BaleCounter (21 members)
`actionEventResetCounter`, `doBaleCounterReset`, `dropBale`, `externalActionEventRegister`, `externalActionEventUpdate`, `initSpecialization`, `onDelete`, `onDraw`, `onLoad`, `onReadStream`, `onRegisterActionEvents`, `onRegisterDashboardValueTypes`, `onRegisterExternalActionEvents`, `onWriteStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `saveToXMLFile`

### BaleMission (150 members)
`addBale`, `addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setFruitType`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### BaleWrapMission (148 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### BalerSetBaleTimeEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### BalerStationary (6 members)
`onDelete`, `onDraw`, `onLoad`, `prerequisitesPresent`, `registerEventListeners`

### Barrier (9 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `triggerCallback`, `update`

### BaseMission (113 members)
`addDrawable`, `addExtraPrintText`, `addGameNotification`, `addHelpAxis`, `addHelpButtonText`, `addHelpTrigger`, `addItemToList`, `addLeasedItem`, `addNodeObject`, `addNonUpdateable`, `addOwnedItem`, `addPauseListeners`, `addTriggerMarker`, `addUpdateable`, `canStartMission`, `canUnpauseGame`, `class`, `consoleCommandRender360Screenshot`, `consoleCommandSetShaderParameter`, `copy`, `createHUD`, `delete`, `dlcProblemOnQuitOk`, `doPauseGame`, `doUnpauseGame`, `draw`, `fadeScreen`, `findDynamicObjects`, `finishLoadingTask`, `getCanShowHelpTriggers`, `getHasDrawable`, `getHasUpdateable`, `getInteractiveVehicleInRange`, `getIsClient`, `getIsServer`, `getIsTrailerInTipRange`, `getNodeObject`, `getNumLeasedItems`, `getNumListItems`, `getNumOfItems`, `getNumOwnedItems`, `getPedestrianSystem`, `getResetPlaces`, `getTrafficSystem`, `getTrailerInTipRange`, `initialize`, `isa`, `keyEvent`, `load`, `loadEnvironment`, `loadMap`, `loadMapFinished`, `loadMapSounds`, `loadObjectAtPlace`, `mouseEvent`, `new`, `onAfterMenuClose`, `onBeforeMenuOpen`, `onCreateLoadSpawnPlace`, `onCreateRestrictedZone`, `onCreateStoreSpawnPlace`, `onCreateTriggerMarker`, `onFinishedLoading`, `onGameStateChange`, `onObjectCreated`, `onObjectDeleted`, `onStartMission`, `pauseGame`, `postUpdate`, `preUpdate`, `removeDrawable`, `removeHelpTrigger`, `removeItemFromList`, `removeLeasedItem`, `removeNodeObject`, `removeNonUpdateable`, `removeOwnedItem`, `removePauseListeners`, `removeTriggerMarker`, `removeUpdateable`, `resetGameState`, `setLastInteractionTime`, `setManualPause`, `setMapTargetHotspot`, `setMissionInfo`, `setMoneyUnit`, `setPedestrianSystem`, `setShowFieldInfo`, `setShowHelpTrigger`, `setShowTriggerMarker`, `setTrafficSystem`, `setUseAcre`, `setUseFahrenheit`, `setUseMiles`, `showBlinkingWarning`, `spawnCollisionTestCallback`, `startLoadingTask`, `subscribeGuiOpenCloseMessages`, `subscribeSettingsChangeMessages`, `superClass`, `toggleVehicle`, `tryUnpauseGame`, `update`, `updateHelpTriggerVisibility`

### BaseMissionFinishedLoadingEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### BaseMissionReadyEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### BatchedScreenshotRenderer (3 members)
`delete`, `new`, `render`

### BeaconLightManager (18 members)
`activateBeaconLight`, `class`, `copy`, `deactivateBeaconLight`, `getModeByName`, `getNumOfLights`, `initDataStructures`, `isa`, `load`, `loadDeviceFromXML`, `loadMapData`, `new`, `registerXMLPaths`, `superClass`, `unloadMapData`, `updateBeaconLights`

### BehaviorDataSource (1 members)
`registerXMLPaths`

### Binding (33 members)
`class`, `clone`, `copy`, `copyInputStateFrom`, `createFromXML`, `getComboMask`, `getFrameTriggered`, `getOppositeAxisComponent`, `getOppositeInputComponent`, `hasCollisionWith`, `hasEventCollision`, `isSameSlot`, `isSameSlotWithParams`, `isa`, `makeId`, `new`, `resetInputState`, `saveToXMLFile`, `setActive`, `setComboMask`, `setFrameTriggered`, `setIndex`, `setIsAnalog`, `superClass`, `toString`, `updateData`, `updateInput`

### BoatyardState (20 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getPlaySound`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `update`

### BoatyardStateBuilding (23 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getPlaySound`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerSavegameXMLPaths`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `update`, `updateInfo`, `updateRemainingAmount`

### BoatyardStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### BoatyardStateLaunching (23 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getLaunchingSpeedSoundModifier`, `getPlaySound`, `hourChanged`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `update`, `updateInfo`

### BoatyardStateMoving (21 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getMovingSpeedSoundModifier`, `getPlaySound`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `update`

### BoatyardStateRelease (20 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getPlaySound`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `update`

### BoatyardStateSetup (20 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getPlaySound`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `update`

### BoundaryDetectionTask (8 members)
`class`, `copy`, `finalize`, `getMaxZ`, `isa`, `new`, `superClass`, `update`

### BoundaryDetectionTaskInsideOut (8 members)
`class`, `copy`, `finalize`, `getMaxZ`, `isa`, `new`, `superClass`, `update`

### BoundaryLineGenerationTask (16 members)
`class`, `copy`, `detectInsideBoundaryLines`, `extendContourLine`, `getFurthestPointToLine`, `getNumBoundaryLines`, `getNumLinesByAngle`, `getOptimalBoundaryAngle`, `getSegmentClosestBoundaryOrIslandsIntersection`, `getSegmentsAngleData`, `isa`, `new`, `removeMinOffsetLines`, `resolveBoundaryIntersections`, `superClass`, `update`

### Brand (263 members)
—

### BrandDocGenerator (14 members)
`class`, `collectData`, `copy`, `generate`, `generateItemPage`, `generateOverviewPage`, `getBrandIconURL`, `getOverviewQualifiedName`, `getSpeciesLabel`, `getSummary`, `isa`, `new`, `superClass`

### BrushType (2 members)
—

### Butterfly (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### BuyExistingPlaceableEvent (17 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### BuyHandToolEvent (17 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `onHandToolBoughtCallback`, `readStream`, `run`, `superClass`, `writeStream`

### BuyObjectEvent (17 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### BuyPlaceableEvent (19 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `onPlaceableBoughtCallback`, `readStream`, `run`, `superClass`, `writeStream`

### BuyVehicleEvent (20 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `onVehicleBoughtCallback`, `readStream`, `run`, `superClass`, `writeStream`

### CableCar (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### CameraFlightManager (8 members)
`class`, `copy`, `delete`, `isa`, `load`, `new`, `superClass`, `update`

### CameraManager (15 members)
`addCamera`, `class`, `consoleCommandSetFOV`, `consoleCommandToggleDebug`, `copy`, `delete`, `drawDebug`, `getActiveCamera`, `init`, `isa`, `new`, `removeCamera`, `setActiveCamera`, `setDefaultCamera`, `superClass`

### CameraPath (11 members)
`activate`, `class`, `copy`, `createFromI3D`, `deactivate`, `delete`, `isa`, `new`, `placeCamera`, `superClass`, `update`

### Can (10 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCanPickupTrigger`, `onCreate`, `pickup`, `superClass`, `update`

### CanActivatable (6 members)
`class`, `copy`, `isa`, `new`, `run`, `superClass`

### CaptionUtil (5 members)
`addText`, `getCaption`, `setPartialText`, `updateCaption`

### CareerScreen (177 members)
`addCallback`, `addElement`, `applyProfile`, `calculateTotalPlaytime`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `checkMissingMods`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `deleteCurrentSavegame`, `disableInputForDuration`, `doModCheck`, `downloadDebugSavegame`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCellTypeForItemInSection`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `migrateSavegame`, `mouseEvent`, `move`, `new`, `onAcceptPressed`, `onAcceptUp`, `onActivatePressed`, `onActivateUp`, `onBackAction`, `onCancelSavegameLoading`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onDeleteAction`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onOkSavegameScanFailed`, `onOkZipModsOptional`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPressed`, `onSaveComplete`, `onSaveGameUpdateComplete`, `onSavegameDeleted`, `onSavegamesLoaded`, `onStartAction`, `onYesNoDeleteSavegame`, `onYesNoInstallMissingModsOptional`, `onYesNoNotEnoughSpaceForNewSaveGame`, `onYesNoSavegameCorrupted`, `onYesNoSavegameInvalidUser`, `onYesNoSavegameSelectDevice`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `recreateSavegameList`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeButtonTexts`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsMultiplayer`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSelectedSavegameIndex`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `startCurrentSavegame`, `startGame`, `startSavegame`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtons`, `updateFramePosition`, `updateInsets`, `updateTheme`, `uploadDebugSavegame`, `verifyConfiguration`

### ChainsawCutState (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### ChangeLoanEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ChangeVehicleConfigEvent (19 members)
`class`, `copy`, `delete`, `emptyNew`, `getBoughtConfigurations`, `getChangePrice`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### ChargingPointOfInterest (15 members)
`class`, `copy`, `delete`, `draw`, `finalize`, `getNeedsDrawing`, `isa`, `load`, `loadFromNode`, `new`, `onCreate`, `registerXMLPaths`, `setOwnerFarmId`, `superClass`, `triggerCallback`

### ChatDialog (134 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreateTextInput`, `onEnterPressed`, `onEscPressed`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMenuAxisUpDown`, `onOpen`, `onPageNext`, `onPagePrevious`, `onSendClick`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ChatEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### CheatMoneyEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ChurchClock (8 members)
`class`, `copy`, `delete`, `isa`, `minuteChanged`, `new`, `onCreate`, `superClass`

### Citroen_H (0 members)
—

### ClassIds (20 members)
—

### Client (37 members)
`addObject`, `addObjectToUpdateLoop`, `addPacketSize`, `checkObjectUpdateDebugReadSize`, `class`, `connectionRequestAccepted`, `consoleCommandToggleNetworkShowObjects`, `consoleCommandToggleShowNetworkTraffic`, `consoleCommandToggleShowNetworkTrafficClients`, `copy`, `delete`, `drawConnectionNetworkStats`, `drawDebug`, `drawGraphLabels`, `finishRegisterObject`, `getObject`, `getObjectId`, `getObjectPacketType`, `getPacketTypeName`, `getServerConnection`, `isa`, `new`, `onObjectFinishedAsyncLoading`, `packetReceived`, `registerObject`, `removeObject`, `removeObjectFromUpdateLoop`, `setNetworkListener`, `start`, `startLocal`, `stop`, `superClass`, `unregisterObject`, `update`, `updateActiveObjects`, `updateActiveObjectsTick`, `updatePacketStats`

### ClientStartMissionEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### CloudSettings (9 members)
`class`, `clone`, `copy`, `copyAttributes`, `isa`, `load`, `new`, `save`, `superClass`

### CloudUpdater (22 members)
`addDebugValues`, `class`, `copy`, `createCloudSettingsFromPreset`, `delete`, `getCurrentValues`, `getEnvMapInfo`, `getPreset`, `getPresets`, `isa`, `load`, `loadPresets`, `new`, `savePresets`, `setAlpha`, `setSlowModeEnabled`, `setTargetClouds`, `setTimeScale`, `setWindValues`, `superClass`, `update`, `updateCloudWind`

### Collectible (11 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `isa`, `new`, `onCreate`, `setHotspotVisible`, `superClass`, `triggerCallback`

### CollectibleActivatable (6 members)
`class`, `copy`, `isa`, `new`, `run`, `superClass`

### CollectibleHotspot (40 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### CollectibleStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### CollectibleTarget (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `onPlaceablePreDelete`, `superClass`

### CollectibleTriggerEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### CollectiblesSystem (26 members)
`addCollectible`, `addCollectibleTarget`, `class`, `consoleCommandShowAll`, `copy`, `delete`, `getIsActive`, `getTotalCollectable`, `getTotalCollected`, `isCompleted`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onClientJoined`, `onStateEvent`, `onTriggerCollectible`, `onTriggerEvent`, `removeCollectible`, `removeCollectibleTarget`, `saveToXMLFile`, `setTargetNodeActive`, `superClass`, `updateCollectiblesState`, `updateHotspotState`, `updateTargetState`

### CollisionFlag (43 members)
`checkCollisionMask`, `checkCollisionMaskRec`, `consoleCommandReloadCollisionMaskMapping`, `consoleCommandShowAll`, `consoleCommandToggleVerbose`, `getBit`, `getBitAndName`, `getFlagsFromMask`, `getFlagsStringFromMask`, `getHasGroupFlagSet`, `getHasMaskFlagSet`, `iteratorFlags`, `loadCollisionMaskMapping`, `printMapping`, `setGroupFlag`, `setMaskFlag`

### CollisionMask (7 members)
—

### CollisionPreset (26 members)
`init`

### Colorizer (7 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`

### CombinedEffect (32 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### CompanionAnimalType (3 members)
—

### ConditionFlags (13 members)
`class`, `copy`, `delete`, `drawDebug`, `getMask`, `isa`, `loadFlagFromXML`, `loadFlagsFromXMLFile`, `new`, `registerModifier`, `registerXMLPaths`, `setModifierValue`, `superClass`

### ConditionalAnimation (23 members)
`addParameterDebugValues`, `class`, `copy`, `debugDraw`, `debugDrawParameters`, `debugDrawState`, `delete`, `getParameter`, `getParameterValueText`, `isa`, `load`, `new`, `registerParameter`, `registerXMLPaths`, `setParameter`, `setSpecialParameterIds`, `superClass`, `unload`, `update`

### ConnectToMasterServerScreen (141 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `connectToBack`, `connectToFront`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `goBackCleanup`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMasterServerConnectionFailed`, `onMasterServerConnectionReady`, `onMasterServerList`, `onMasterServerListEnd`, `onMasterServerListStart`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClass`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setPrevScreenClass`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ConnectedAttributes (22 members)
`addType`, `initSpecialization`, `loadExtraDependentParts`, `onFinishAnimation`, `onLoad`, `onLoadFinished`, `onPlayAnimation`, `onUpdate`, `onUpdateAnimation`, `onUpdateEnd`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `updateAttribute`, `updateDebugValues`, `updateExtraDependentParts`

### Connection (40 members)
`class`, `copy`, `dropObjectEventQueue`, `getIsClient`, `getIsLocal`, `getIsServer`, `getIsWindowFull`, `getLatency`, `getObjectSyncState`, `isa`, `new`, `notifyObjectDeleted`, `onPacketLost`, `onPacketSent`, `queueSendEvent`, `readUpdateAck`, `sendEvent`, `sendObjectEventQueue`, `setIsReadyForEvents`, `setIsReadyForObjects`, `superClass`, `updateSendStats`, `writeUpdateAck`

### ConnectionFailedDialog (164 members)
`acceptDialog`, `addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onInvalidKey`, `onOkCallback`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onWrongVersion`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonAction`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `showMasterServerConnectionFailedReason`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ConnectionHoseType (21 members)
—

### ConnectionManager (13 members)
`addListener`, `class`, `copy`, `isa`, `new`, `packetReceived`, `removeListener`, `setDefaultListener`, `shutdown`, `shutdownAll`, `startup`, `startupWithWorkingPort`, `superClass`

### ConnectionPendingDialog (149 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ConnectionRequestAnswerEvent (19 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ConnectionRequestEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ConsoleSimulator (9 members)
`acceptedGameInvite`, `init`

### ConsoleValueToggle (9 members)
`class`, `consoleCommandToggleValue`, `copy`, `delete`, `disableValue`, `enableValue`, `isa`, `new`, `superClass`

### ConstructibleState (23 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsConstructibleState`, `getPlaySound`, `getProgress`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `reset`, `saveToXMLFile`, `superClass`, `update`

### ConstructibleStateBuilding (27 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsConstructibleState`, `getPlaySound`, `getProgress`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerSavegameXMLPaths`, `registerXMLPaths`, `reset`, `saveToXMLFile`, `setMeshProgress`, `superClass`, `update`, `updateInfo`, `updateRemainingAmount`

### ConstructibleStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ConstructibleStateFinalize (23 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsConstructibleState`, `getPlaySound`, `getProgress`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `reset`, `saveToXMLFile`, `superClass`, `update`

### ConstructionBrush (40 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `playSound`, `setActiveSound`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `superClass`, `update`, `verifyAccess`

### ConstructionBrushDestruct (48 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `destroyNodeInPlaceable`, `draw`, `getAllowFenceDeletionInput`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getDeletableFenceSegment`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onPlaceableDestroyed`, `playSound`, `requestFenceDeletion`, `resetColoredNodes`, `resetPlaceableSelection`, `setActiveSound`, `setHoveredDeletableFence`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `superClass`, `update`, `verifyAccess`, `visualizeFenceMouseOver`, `visualizeMouseOver`, `visualizeTreeMouseOver`

### ConstructionBrushFence (56 members)
`acquirePlaceable`, `activate`, `boxOverlapCallback`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `findPlaceable`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getLimitedSnappedCursorPosition`, `getPreviewAngle`, `getPrice`, `getSnappedCursorPosition`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onFenceSegmentCreated`, `onPlaceableCreated`, `playSound`, `releasePlaceable`, `resetErrorOverlays`, `setActiveSound`, `setFilename`, `setInputTextDirty`, `setIsGate`, `setParameters`, `setStoreItem`, `superClass`, `update`, `verifyAccess`, `verifyPreview`

### ConstructionBrushFoliage (42 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getPrice`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onSculptingFinished`, `performBrush`, `playSound`, `setActiveSound`, `setBrushSize`, `setFoliageType`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `superClass`, `toggleBrushShape`, `update`, `verifyAccess`

### ConstructionBrushHusbandry (67 members)
`activate`, `activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `copyState`, `deactivate`, `delete`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getButtonTertiaryText`, `getDisplacementCost`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getPrice`, `getSnappedPosition`, `getSnappedRotation`, `hasPlayerPermission`, `isa`, `loadPlaceable`, `loadedPlaceable`, `new`, `onAxisPrimary`, `onAxisPrimary`, `onAxisSecondary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonSnapping`, `onButtonTertiary`, `onButtonTertiary`, `onCreatedPlaceableFound`, `onCustomizableFenceFinished`, `onCustomizeFenceStart`, `onFinishedCustomFence`, `onPlaceableCreated`, `onTerrainValidationFinished`, `playSound`, `setActiveSound`, `setInputTextDirty`, `setParameters`, `setParameters`, `setPlaceableFilename`, `setStoreItem`, `superClass`, `unloadPlaceable`, `update`, `updateHeightFromInput`, `updatePlaceablePosition`, `validateFence`, `verifyAccess`, `verifyPlacement`

### ConstructionBrushNewFence (78 members)
`acquirePlaceable`, `activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `createNextSegment`, `deactivate`, `delete`, `deleteLastSeqment`, `draw`, `findPlaceable`, `finish`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonFourthText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getCornerAngle`, `getCornerAngleAtPole`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getIsSnappedCornerAngleTooLarge`, `getLimitedSnappedCursorPosition`, `getPrice`, `getRaisedPickPosition`, `getSegmentDirectionAwayFromPole`, `getSnapTargetDirectionAtPole`, `getSnappedCursorPosition`, `getTargetSnapPosition`, `hasPlayerPermission`, `initFence`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onPlaceableCreated`, `onPlaceableDestroyed`, `onServerCreatedFenceCallback`, `playSound`, `releasePlaceable`, `setActiveSound`, `setFenceParentObject`, `setFinishCallback`, `setFinishCheckCallback`, `setInputTextDirty`, `setParameters`, `setSegmentTemplate`, `setSnapStartAndEndPositions`, `setStoreItem`, `setValidateCallback`, `superClass`, `update`, `validateCurrentSegment`, `validateFinishSegment`, `validateSegmentRestrictions`, `verifyAccess`, `verifyPreview`

### ConstructionBrushOrchard (76 members)
`acquirePlaceable`, `activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `createNextSegment`, `deactivate`, `delete`, `deleteLastSeqment`, `draw`, `draw`, `findPlaceable`, `finish`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonFourthText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getCornerAngle`, `getCornerAngleAtPole`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getIsSnappedCornerAngleTooLarge`, `getLimitedSnappedCursorPosition`, `getOrchardBuildPlaceable`, `getOrchardBuildTemplateId`, `getOrchardPanelLength`, `getOrchardPricePerMeter`, `getOrchardRowSpacing`, `getPrice`, `getRaisedPickPosition`, `getSegmentDirectionAwayFromPole`, `getSnapTargetDirectionAtPole`, `getSnappedCursorPosition`, `getTargetSnapPosition`, `hasPlayerPermission`, `initFence`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonSnapping`, `onButtonTertiary`, `onPlaceableCreated`, `onPlaceableDestroyed`, `onServerCreatedFenceCallback`, `playSound`, `releasePlaceable`, `setActiveSound`, `setFenceParentObject`, `setFinishCallback`, `setFinishCheckCallback`, `setInputTextDirty`, `setParameters`, `setSegmentTemplate`, `setSnapStartAndEndPositions`, `setStoreItem`, `setValidateCallback`, `superClass`, `toggleFenceMode`, `update`, `validateCurrentSegment`, `validateFinishSegment`, `validateSegmentRestrictions`, `verifyAccess`, `verifyPreview`

### ConstructionBrushPaint (40 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onSculptingFinished`, `playSound`, `setActiveSound`, `setBrushSize`, `setGroundType`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `superClass`, `toggleBrushShape`, `update`, `verifyAccess`

### ConstructionBrushPlaceable (53 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getDisplacementCost`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getPrice`, `getSnappedPosition`, `getSnappedRotation`, `hasPlayerPermission`, `isa`, `loadPlaceable`, `loadedPlaceable`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onPlaceableCreated`, `onTerrainValidationFinished`, `playSound`, `setActiveSound`, `setInputTextDirty`, `setParameters`, `setPlaceableFilename`, `setStoreItem`, `superClass`, `unloadPlaceable`, `update`, `updateHeightFromInput`, `updatePlaceablePosition`, `verifyAccess`, `verifyPlacement`

### ConstructionBrushRiceField (48 members)
`acquirePlaceable`, `activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `findPlaceable`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getLimitedSnappedCursorPosition`, `getSnappedCursorPosition`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onCursorSphereOverlap`, `onEdgeBoxOverlap`, `onPlaceableCreated`, `playSound`, `releasePlaceable`, `setActiveSound`, `setFilename`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `superClass`, `update`, `verifyAccess`

### ConstructionBrushSculpt (47 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `flatten`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onSculptCallback`, `playSound`, `setActiveSound`, `setBrushSize`, `setBrushStrength`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `shift`, `slope`, `slopeSetTarget`, `smooth`, `superClass`, `toggleBrushShape`, `update`, `verifyAccess`

### ConstructionBrushSelect (38 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onPlaceableDestroyed`, `playSound`, `setActiveSound`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `superClass`, `update`, `verifyAccess`, `visualizeMouseOver`

### ConstructionBrushTree (45 members)
`activate`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getPrice`, `hasPlayerPermission`, `isa`, `loadTree`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonTertiary`, `onTreeLoaded`, `playSound`, `randomlyRotateCursor`, `setActiveSound`, `setInputTextDirty`, `setParameters`, `setStoreItem`, `setTree`, `superClass`, `unloadTree`, `update`, `updateTreePosition`, `verifyAccess`, `verifyPlacement`

### ConstructionBrushTypeManager (13 members)
`addBrushType`, `class`, `copy`, `getBrushTypes`, `getClassObjectByTypeName`, `initBrushTypes`, `initDataStructures`, `isa`, `load`, `loadMapData`, `new`, `superClass`, `unloadMapData`

### ConstructionBrushVineOrchard (63 members)
`acquirePlaceable`, `activate`, `boxOverlapCallback`, `canCancel`, `cancel`, `class`, `copy`, `copyState`, `deactivate`, `delete`, `draw`, `findPlaceable`, `getAxisPrimaryText`, `getAxisSecondaryText`, `getButtonFourthText`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonSnappingText`, `getButtonSnappingText`, `getButtonTertiaryText`, `getIsLineClearOfRiceFields`, `getIsPositionClearOfRiceFields`, `getLimitedSnappedCursorPosition`, `getOrchardBuildPlaceable`, `getOrchardBuildTemplateId`, `getOrchardPanelLength`, `getOrchardPricePerMeter`, `getOrchardRowSpacing`, `getPreviewAngle`, `getPrice`, `getSnappedCursorPosition`, `hasPlayerPermission`, `isa`, `new`, `onAxisPrimary`, `onAxisSecondary`, `onButtonFourth`, `onButtonPrimary`, `onButtonSecondary`, `onButtonSnapping`, `onButtonSnapping`, `onButtonTertiary`, `onFenceSegmentCreated`, `onPlaceableCreated`, `playSound`, `releasePlaceable`, `removePreview`, `resetErrorOverlays`, `setActiveSound`, `setFilename`, `setInputTextDirty`, `setIsGate`, `setParameters`, `setParameters`, `setStoreItem`, `setStoreItem`, `superClass`, `toggleFenceMode`, `update`, `verifyAccess`, `verifyPreview`

### ConstructionSound (9 members)
`class`, `copy`, `delete`, `isa`, `loadSamples`, `new`, `setActiveSound`, `superClass`

### Consumable (35 members)
`addFillUnitFillLevel`, `collectPalletTensionBeltNodes`, `getConsumableIsAvailable`, `getConsumableVariationIndexByFillUnitIndex`, `getCustomFillTriggerSpeedFactor`, `getFillUnitFreeCapacity`, `getShowConsumableEmptyWarning`, `initSpecialization`, `onAddedFillUnitTrigger`, `onDelete`, `onDirtyMaskCleared`, `onDraw`, `onFillUnitFillLevelChanged`, `onFillUnitIsFillingStateChanged`, `onLoad`, `onPostLoad`, `onReadStream`, `onReadUpdateStream`, `onRemovedFillUnitTrigger`, `onUpdate`, `onWriteStream`, `onWriteUpdateStream`, `prerequisitesPresent`, `registerEventListeners`, `registerEvents`, `registerFunctions`, `registerOverwrittenFunctions`, `saveToXMLFile`, `setConsumableSlotVariationIndex`, `updateActivatable`, `updateConsumable`

### ContractingStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ControlsController (62 members)
`areKeyCombinationsBlocked`, `assignBinding`, `assignGamepadBinding`, `assignKeyboardBinding`, `assignMouseBinding`, `beginWaitForInput`, `class`, `copy`, `createDisplayAction`, `deleteBinding`, `discardChanges`, `endWaitForInput`, `getBindingInputDisplayText`, `getDeviceCategoryActionBindings`, `getGamepadAxisDisplayText`, `getGamepadButtonDisplayText`, `getMouseAxisDisplayText`, `isa`, `loadBindings`, `loadDefaultSettings`, `lockInput`, `new`, `onAbortInputGathering`, `onCaptureGamepadInput`, `onCaptureKeyboardInput`, `onCaptureMouseInput`, `onClickInput`, `onDeleteInputBinding`, `saveChanges`, `setInputDoneCallback`, `setMessageCallback`, `superClass`, `validateMouseCombo`

### ConversationActionCancelTour (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionNavigateToNPC (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionResetTriggeredByType (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionStartById (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionStartByType (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionStartFromList (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionStartMissionSelection (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationActionStartSelectedMission (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationDialog (146 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateOptionsBox`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOption`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onSkip`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setDuration`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setNpcName`, `setOptions`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ConversationInputAvailableMissions (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationInputData (9 members)
`class`, `copy`, `delete`, `getData`, `isa`, `new`, `reset`, `setData`, `superClass`

### ConversationInputLeaseVehicles (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationInputSelectedMission (9 members)
`class`, `copy`, `createFromXML`, `isa`, `new`, `registerXMLPaths`, `run`, `superClass`

### ConversationPrerequisiteAllConversationsTriggeredByType (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteAvailableByType (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteConversationWasTriggered (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteFirstContact (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteGameMode (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteIngameDaysPlayed (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteIngameTime (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteManuallyTriggered (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteMap (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteMissionAvailable (10 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `onConversationStart`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteMoney (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteNumContacts (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteNumOwnedAnimals (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteNumOwnedFarmlands (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteNumOwnedVehicles (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteNumTriggered (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteOwnedAllFarmlands (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteRealDate (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteRealTime (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteRetriggerDelayIngameDays (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteRetriggerDelayRealDays (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteRetriggerTypeDelayIngameDays (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConversationPrerequisiteSeasonPeriod (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### ConveyorBeltEffect (46 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsVisible`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `registerEffectXMLPaths`, `registerEffectXMLPaths`, `reset`, `reset`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setEffectTypeInfo`, `setMorphPosition`, `setOffset`, `setScrollUpdate`, `setUpdateDistance`, `start`, `start`, `start`, `stop`, `stop`, `stop`, `superClass`, `transformEffectNode`, `update`

### CraneShovel (20 members)
`actionEvent`, `getCraneShovelStateChangedAllowed`, `getIsDischargeNodeActive`, `getShovelNodeIsActive`, `initSpecialization`, `loadCraneShovelFromXML`, `onFoldStateChanged`, `onLoad`, `onPostLoad`, `onReadStream`, `onRegisterActionEvents`, `onWriteStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `saveToXMLFile`, `setCraneShovelState`, `updateActionEvents`

### CreateGameScreen (153 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `fillCapacity`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDefaultServerName`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getPort`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickAllowCrossPlay`, `onClickAllowOnlyFriends`, `onClickAutoAccept`, `onClickBack`, `onClickBandwidth`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickMultiplayerLanguage`, `onClickNumPlayer`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onCreate`, `onCreateBandwidth`, `onCreateMultiplayerLanguage`, `onCreateNumPlayer`, `onEnter`, `onEnterPressed`, `onEscPressed`, `onFocus`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onIsUnicodeAllowed`, `onLeave`, `onMasterServerConnectionFailed`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMissionInfo`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `showChangeButton`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`, `verifyServerName`

### CreditsScreen (140 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadCredits`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onAchievementsClick`, `onBackAction`, `onCareerClick`, `onChangeMobileSettingsClick`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateTheme`, `verifyConfiguration`

### CultivateMission (162 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `update`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### CultivatorMotionPathEffect (53 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `start`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### CutterMotionPathEffect (55 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setMinMaxWidth`, `setUpdateDistance`, `start`, `start`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### DLSSQuality (7 members)
—

### DPUTexture (1 members)
`new`

### DRSQuality (6 members)
—

### DailySound (8 members)
`class`, `copy`, `dailySoundTimerCallback`, `delete`, `isa`, `new`, `onCreate`, `superClass`

### Daylight (16 members)
`calculateStartEndOfDay`, `calculateSunDeclination`, `calculateTime`, `class`, `copy`, `delete`, `getDaylightTimes`, `getLogicalNightTime`, `getSunHeightAngle`, `isa`, `load`, `loadFromXMLFile`, `new`, `saveToXMLFile`, `setJulianDay`, `superClass`

### DeadwoodMission (127 members)
`addDeleteListener`, `addHotspots`, `addMissionTree`, `addTreeMarker`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `destroyTrees`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsMissionSplitShape`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsShapeCutAllowed`, `getIsWorkAllowed`, `getLocation`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getReimbursement`, `getReward`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `loadMetaDataFromXMLFile`, `new`, `onFinishCallback`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onTreeCallback`, `onTreeShapeCut`, `onVehicleReset`, `prepare`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `readDeadTreesStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeDeleteListener`, `removeHotspot`, `resetObjectIds`, `saveMetaDataToXMLFile`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setOwnerConnection`, `setOwnerFarmId`, `setSpot`, `setStatus`, `setTreeVisibility`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateTick`, `updateTick`, `validate`, `writeDeadTreesStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`

### DeadwoodMissionHotspot (42 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `postUpdate`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRadius`, `setWorldRotation`, `superClass`

### DeadwoodMissionTreeEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### DeadwoodMissionWrongTreeEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### DebugCameraClone (37 members)
`addDeleteListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `consoleCommandSetCameraCloneIndex`, `copy`, `delete`, `draw`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `resetObjectIds`, `setOwnerConnection`, `setOwnerFarmId`, `superClass`, `unregister`, `update`, `updateEnd`, `updateTick`, `writeStream`, `writeUpdateStream`

### DebugDisplacementDialog (145 members)
`addCallback`, `addElement`, `applyProfile`, `applyValues`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickFirmness`, `onClickFirmnessWet`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOverlayLayer`, `onClickShop`, `onClickViscosity`, `onClose`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `selectCurrentValue`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateViscosityWet`, `verifyConfiguration`

### DebugFlag (22 members)
`addToManager`, `class`, `copy`, `create`, `createWithNode`, `draw`, `getShouldBeDrawn`, `isa`, `new`, `renderAtNode`, `renderAtPosition`, `setClipDistance`, `setColor`, `setColorRGBA`, `setIsSolid`, `setIsVisible`, `setText`, `setTextClipDistance`, `setTextColor`, `setTextSize`, `setVisbileWhenGUIOpen`, `superClass`

### DebugMode (7 members)
—

### DebugPhysicsCollisionGroupDialog (162 members)
`acceptDialog`, `addCallback`, `addElement`, `applyChanges`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickApply`, `onClickBack`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onDebugModeChanged`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `openDialog`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `selectAll`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonAction`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unselectAll`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### DebugPyramid (34 members)
`addToManager`, `calculateCornerPositions`, `class`, `copy`, `createFromOverlapBoxParameters`, `createWithNode`, `createWithPosAndDir`, `createWithStartEnd`, `createWithWorldPos`, `createWithWorldPosAndRot`, `delete`, `draw`, `getShouldBeDrawn`, `isa`, `new`, `renderAtNode`, `renderAtNodeWithOffset`, `renderAtPosition`, `renderWithStartAndEndNode`, `setClipDistance`, `setColor`, `setColorRGBA`, `setDrawFaces`, `setIsSolid`, `setIsVisible`, `setSize`, `setText`, `setTextClipDistance`, `setTextColor`, `setTextSize`, `setVisbileWhenGUIOpen`, `superClass`, `update`

### DebugRendering (35 members)
—

### DedicatedServer (17 members)
`class`, `copy`, `delete`, `isa`, `load`, `lowerFramerate`, `new`, `onStartMission`, `raiseFramerate`, `start`, `superClass`, `update`, `updateServerInfo`

### DensityCoordType (2 members)
—

### DensityFilterSupersamplingMode (2 members)
—

### DensityIndexCompareMode (3 members)
—

### DensityMapCircle (15 members)
`applyToModifier`, `class`, `copy`, `createCircle`, `createFromXMLFile`, `getCenter`, `getVerticesAs3DCoordinates`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `updateFromWorldPosition`, `visualize`

### DensityMapFilter (13 members)
`getDensityMapChannelOffset`, `getDensityMapChannels`, `getSupersamplingMode`, `getTypeIndexAndCompareMode`, `getTypeIndexCompareMode`, `getValueCompareParams`, `new`, `resetDensityMapAndChannels`, `setDensityMapChannels`, `setSupersamplingMode`, `setTypeIndexAndCompareMode`, `setTypeIndexCompareMode`, `setValueCompareParams`

### DensityMapHeightManager (64 members)
`addModDensityMapHeightTypes`, `checkTypeMappings`, `class`, `consoleCommandShowPlacementCollisions`, `consoleCommandShowTipCollisions`, `consoleCommandTipAnywhereAdd`, `consoleCommandTipAnywhereAddAll`, `consoleCommandTipAnywhereClear`, `consoleCommandToggleDebug`, `consoleCommandUpdateTipCollisions`, `copy`, `getConvertingFillTypesAreas`, `getDensityMapHeightTypeByFillTypeIndex`, `getDensityMapHeightTypeByFillTypeName`, `getDensityMapHeightTypeByIndex`, `getDensityMapHeightTypeIndexByFillTypeIndex`, `getDensityMapHeightTypeIndexByFillTypeName`, `getDensityMapHeightTypes`, `getFillTypeIndexByDensityHeightMapIndex`, `getFillTypeNameByDensityHeightMapIndex`, `getFillTypeToDensityMapHeightTypes`, `getFixedFillTypesAreas`, `getIsInFreeAccessArea`, `getIsPlacementAreaBlocked`, `getIsValid`, `getMinValidLiterValue`, `getMinValidLiterValuePerSqm`, `getTerrainDetailHeightUpdater`, `initDataStructures`, `initialize`, `isa`, `load`, `loadDefaultTypes`, `loadDensityMapHeightTypeFromXML`, `loadDensityMapHeightTypes`, `loadFromXMLFile`, `loadMapData`, `loadModDensityMapHeightTypes`, `new`, `prepareSaveCollisionMap`, `prepareSavePlacementCollisionMap`, `registerXMLPaths`, `removeConvertingFillTypeAreas`, `removeFixedFillTypesArea`, `saveCollisionMap`, `savePlacementCollisionMap`, `savePreparedCollisionMap`, `savePreparedPlacementCollisionMap`, `saveToXMLFile`, `setCollisionMapAreaDirty`, `setConvertingFillTypeAreas`, `setFixedFillTypesArea`, `sortHeightTypes`, `superClass`, `unloadMapData`, `update`, `updateCollisionMap`

### DensityMapHeightUtil (25 members)
`changeFillTypeAtArea`, `clear`, `clearArea`, `clearCache`, `getAreaPartitions`, `getCanTipToGround`, `getCanTipToGroundAroundLine`, `getCollisionHeightAtWorldPos`, `getDefaultMaxRadius`, `getFillLevelAtArea`, `getFillTypeAtArea`, `getFillTypeAtLine`, `getHeightAtWorldPos`, `getHeightTypeDescAtWorldPos`, `getLineByArea`, `getLineByAreaDimensions`, `getRoundedHeightValue`, `getValueAtArea`, `getVehiclesInRange`, `initTerrain`, `multiModifierAddClearArea`, `removeFromGroundByArea`, `smoothAroundLine`, `tipToGroundAroundLine`

### DensityMapModifier (37 members)
`addPolygonPointDensityMapCoords`, `addPolygonPointUVCoords`, `addPolygonPointWorldCoords`, `clearPolygonPoints`, `executeAdd`, `executeAddWithStats`, `executeGet`, `executeGetArea`, `executeSet`, `executeSetTextured`, `executeSetType`, `executeSetTypeWithStats`, `executeSetWithStats`, `getDensityMapChannelOffset`, `getDensityMapChannels`, `getNewTypeIndex`, `getNewTypeIndexMode`, `getParallelogramDensityMapCoords`, `getParallelogramUVCoords`, `getParallelogramWorldCoords`, `getPolygonClipRegion`, `getPolygonMinMaxZ`, `getPolygonRoundingMode`, `getReturnValueShift`, `new`, `resetDensityMapAndChannels`, `setDefaultParallelogramTextureCoords`, `setDensityMapChannels`, `setNewTypeIndex`, `setNewTypeIndexMode`, `setParallelogramDensityMapCoords`, `setParallelogramTextureCoords`, `setParallelogramUVCoords`, `setParallelogramWorldCoords`, `setPolygonClipRegion`, `setPolygonRoundingMode`, `setReturnValueShift`

### DensityMapMultiModifier (17 members)
`addExecuteAdd`, `addExecuteAddWithStats`, `addExecuteGet`, `addExecuteSet`, `addExecuteSetType`, `addExecuteSetTypeWithStats`, `addExecuteSetWithStats`, `addPolygonPointWorldCoords`, `clearPolygonPoints`, `execute`, `getPolygonClipRegion`, `getPolygonMinMaxZ`, `new`, `reset`, `resetStats`, `setPolygonClipRegion`, `updateParallelogramWorldCoords`

### DensityMapNodePolygon (14 members)
`addNode`, `applyToModifier`, `class`, `copy`, `createFromXMLFile`, `drawDebug`, `getCenter`, `getVerticesAs3DCoordinates`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `saveToXMLFile`, `superClass`

### DensityMapParallelogram (19 members)
`applyToModifier`, `class`, `copy`, `createFromNodes`, `createFromPositionAndSize`, `createFromWorldPositions`, `createFromXMLFile`, `getCenter`, `getVerticesAs3DCoordinates`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `saveToXMLFile`, `superClass`, `updateFromNodes`, `updateFromPositionAndSize`, `updateFromWorldPositions`, `visualize`

### DensityMapPolygon (21 members)
`addPolygonPoint`, `applyToModifier`, `class`, `copy`, `createFromNodes`, `createFromXMLFile`, `getCenter`, `getVerticesAs3DCoordinates`, `getVerticesList`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `saveToXMLFile`, `setPolygonPoint`, `superClass`, `updateFromNodes`, `updateFromPolygon2D`, `updateOrigin`, `updateScale`, `visualize`

### DensityMapSyncer (19 members)
`activateFruitUpdateCallback`, `addCellUpdateListener`, `addConnection`, `addDensityMap`, `class`, `copy`, `delete`, `getCellId`, `getFruitCellIndicesAtWorldPosition`, `isa`, `new`, `onCellUpdate`, `onDensityMapsAdded`, `onPacketLost`, `readUpdateStream`, `removeCellUpdateListener`, `removeConnection`, `superClass`, `writeUpdateStream`

### DensityMapUpdateTask (15 members)
`cancel`, `class`, `copy`, `getIsFinished`, `getName`, `isa`, `loadFromXMLFile`, `new`, `registerXMLPaths`, `saveToXMLFile`, `setArea`, `setFinished`, `setName`, `setNeedsSaving`, `superClass`

### DensityMapUpdateTaskState (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### DensityRoundingMode (6 members)
—

### DensityTypeCompareType (3 members)
—

### DensityValueCompareType (6 members)
—

### DenyAcceptDialog (165 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickAccept`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickDenyAlways`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickRefuse`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setConnection`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### DepthOfFieldManager (20 members)
`applyInfo`, `class`, `consoleCommandFarParams`, `consoleCommandNearParams`, `copy`, `createInfo`, `delete`, `initDataStructures`, `isa`, `load`, `loadMapData`, `new`, `popArea`, `pushArea`, `reset`, `setManipulatedParams`, `superClass`, `unloadMapData`, `updateArea`

### DestroyedMapObjectsEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### DestructibleMapObjectSystem (36 members)
`addDestructibleDamage`, `addGroup`, `class`, `consoleCommandNodeAddDamage`, `consoleCommandNodeAddDamageRaycastCallback`, `consoleCommandToggleDebug`, `copy`, `delete`, `destroyDestructible`, `draw`, `getDestructedChildIndices`, `getDestructibleFromNode`, `getDestructibleRigidBodies`, `getGroupAndIndexForDestructible`, `getGroupRootById`, `isa`, `loadFromSavegameXML`, `new`, `onClientJoined`, `onCreateGroup`, `registerDestructibleDestroyedListener`, `restoreDestructible`, `saveToXMLFile`, `setChildIndexDestroyed`, `setDestructibleDestroyed`, `setDestructiblePhysicsActive`, `setGroupChildIndexDestroyed`, `superClass`, `unregisterDestructibleDestroyedListener`, `update`

### DestructibleRockMission (124 members)
`addDeleteListener`, `addDestructible`, `addHotspot`, `addRockMarkers`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDestructibleIsInMissionArea`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getLocation`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getReimbursement`, `getReward`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `loadMetaDataFromXMLFile`, `new`, `onFinishCallback`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onRockCallback`, `onRockDestroyed`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeDeleteListener`, `removeHotspot`, `resetObjectIds`, `rockMarkerRaycastCallback`, `saveMetaDataToXMLFile`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setOwnerConnection`, `setOwnerFarmId`, `setSpot`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`

### DestructibleRockMissionHotspot (42 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `postUpdate`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRadius`, `setWorldRotation`, `superClass`

### DisasterDestructionState (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### DisconnectReason (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### DisplayActionBinding (7 members)
`class`, `copy`, `isa`, `new`, `setBindingDisplay`, `superClass`, `toString`

### DistantTrain (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### DocumentationGenerator (11 members)
`class`, `collectData`, `copy`, `generate`, `generateItemPage`, `generateOverviewPage`, `getOverviewQualifiedName`, `getSummary`, `isa`, `new`, `superClass`

### DocumentationHTMLUtil (23 members)
`createCard`, `createDataTable`, `createSeasonBoolTable`, `createSeasonTable`, `escapeHTML`, `formatNumber`, `getCSS`, `getHTMLFooter`, `getHTMLHeader`, `getImageRelativeURL`, `getOverviewFilename`, `getRelativePath`, `getSortScript`, `normalizePath`, `resolvePdlcPath`, `sanitizeFilename`, `stripBasePath`, `toNetworkPath`, `writeFile`, `writeSharedCSS`

### DocumentationManager (15 members)
`addGenerator`, `appendOverviewGroup`, `class`, `collectSourceLabels`, `consoleCommandGenerateDocumentation`, `copy`, `countItemsForSource`, `generateMasterOverview`, `getSectionDisplayRank`, `isa`, `new`, `superClass`, `validateRequiredMods`

### DubinsPath (7 members)
`class`, `copy`, `generate`, `isa`, `new`, `superClass`

### ESRBUpdateDialog (160 members)
`acceptDialog`, `addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonAction`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### EconomicDifficulty (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### EconomyManager (50 members)
`addSellingStation`, `class`, `copy`, `dayChanged`, `delete`, `finalizeGreatDemandLoading`, `getBuyPrice`, `getConfigurationChangePrice`, `getCostMultiplier`, `getCostPerLiter`, `getFillTypeHistoricPrice`, `getFillTypeSeasonalFactor`, `getGreatDemandById`, `getHasFillTypeGreatDemand`, `getInitialLeasingPrice`, `getPriceMultiplier`, `getPricePerLiter`, `getSellPrice`, `hourChanged`, `init`, `isa`, `loadFromXMLFile`, `manageGreatDemands`, `minuteChanged`, `new`, `periodChanged`, `removeSellingStation`, `restartGreatDemands`, `saveToXMLFile`, `sendPeriodFillTypeHistory`, `startGreatDemand`, `stopGreatDemand`, `superClass`, `update`, `updateFillTypeHistory`, `updateGreatDemandsPDASpots`, `updateSellingStations`, `vehicleOperatingHourChanged`

### EditFarmDialog (158 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `focusLinkColorButtons`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickColorButton`, `onClickDone`, `onClickEdit`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusColorButton`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onLeaveColorButton`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonTexts`, `setCallback`, `setChangeScreenCallback`, `setColors`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setExistingFarm`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `storeAvailableColors`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### Effect (26 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### EffectManager (29 members)
`addDelayedCommand`, `class`, `copy`, `deleteEffects`, `getEffectClass`, `initDataStructures`, `isa`, `load`, `loadEffect`, `loadFromNode`, `loadMapData`, `new`, `registerEffectClass`, `registerEffectXMLPaths`, `resetEffect`, `resetEffects`, `setDensity`, `setEffectTypeInfo`, `setFillType`, `setFruitType`, `setMinMaxWidth`, `setUpdateDistance`, `startEffect`, `startEffects`, `stopEffect`, `stopEffects`, `superClass`, `unloadMapData`, `update`

### ElkTrigger (9 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `triggerCallback`, `update`

### EnterablePassenger (52 members)
`actionEventCameraSwitch`, `actionEventLeave`, `actionEventSwitchSeat`, `consoleCommandDebugPassengerSeat`, `copyEnterableActiveCameraIndex`, `enablePassengerActiveCamera`, `enterVehiclePassengerSeat`, `getCanUsePassengerSeats`, `getClosestSeatIndex`, `getDeactivateOnLeave`, `getDistanceToNode`, `getExitNode`, `getFirstAvailablePassengerSeat`, `getInteractionHelp`, `getIsEnterable`, `getIsEnteredForInput`, `getIsInUse`, `getIsInteractive`, `getIsPassengerSeatAvailable`, `getIsPassengerSeatIndexAvailable`, `getPassengerSeatIndexByPlayer`, `getPlayerNameBySeatIndex`, `getRequiresPower`, `initSpecialization`, `interact`, `leaveLocalPassengerSeat`, `leavePassengerSeat`, `onDelete`, `onDrawUIInfo`, `onEnterVehicle`, `onLeaveVehicle`, `onLoad`, `onPassengerPlayerStyleChanged`, `onPostUpdate`, `onPreRegisterActionEvents`, `onReadStream`, `onRegisterActionEvents`, `onSetBroken`, `onWriteStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `setPassengerActiveCameraIndex`, `setPassengerSeatCharacter`, `updateActionEvents`, `updatePassengerSeatCharacter`, `vehiclePassengerCharacterLoaded`

### EnumUtil (3 members)
`getKeys`, `getName`, `getNumEntries`

### Environment (54 members)
`class`, `consoleCommandReloadEnvironment`, `consoleCommandSeasonalShaderDebug`, `consoleCommandSetDayTime`, `consoleCommandSetExposureFixedLuminance`, `consoleCommandSetFixedExposureSettings`, `consoleCommandSetFixedVisuals`, `consoleCommandSetSeasonalShader`, `consoleCommandTakeEnvProbes`, `consoleCommandToggleAutoExposure`, `copy`, `delete`, `getDayAndDayTime`, `getDayInPeriodFromDay`, `getDayOfYear`, `getDaysPerSeason`, `getDaysPlayed`, `getDirtColors`, `getEnvironmentTime`, `getIsNodeInPlaceable`, `getJulianDay`, `getMinuteOfDay`, `getMonotonicHour`, `getPeriodAndAlphaIntoPeriod`, `getPeriodFromDay`, `getSeasonAtDay`, `getSeasonShaderValue`, `getVisualSeasonAtDay`, `isa`, `load`, `loadFromXMLFile`, `new`, `onCreateSunLight`, `onCreateWater`, `resetSceneParameters`, `saveToXMLFile`, `setCustomLighting`, `setEnvironmentTime`, `setFixedPeriod`, `setPlannedDaysPerPeriod`, `setSunVisibility`, `superClass`, `update`, `updateJulianDay`, `updateSceneParameters`, `updateTimeValues`

### EnvironmentAreaSystem (28 members)
`class`, `consoleCommandToggleDebugView`, `copy`, `delete`, `draw`, `forestCheckCallback`, `getAreaTypeFromInfoLayerAtWorldPos`, `getAreaWeights`, `getName`, `getWaterDepthAtWorldPositionAsync`, `getWaterTypeFromInfoLayerAtWorldPos`, `getWaterYAtWorldPosition`, `getWaterYAtWorldPositionAsync`, `handleRaycast`, `initTerrain`, `isa`, `loadMapData`, `new`, `onWaterRaycastCallback`, `raycastXZCallback1`, `raycastXZCallback2`, `raycastYCallback`, `setReferenceNode`, `setupCell`, `superClass`, `update`, `updateCell`, `updateWeights`

### EnvironmentAreaWeight (7 members)
`class`, `copy`, `drawDebug`, `isa`, `new`, `reset`, `superClass`

### EnvironmentMaskSystem (24 members)
`class`, `consoleCommandToggleDebugView`, `copy`, `delete`, `drawDebug`, `getViewerSpatialityModifierUpdateFuncFromFlagName`, `getWeatherMaskFromFlagName`, `getWeatherMaskFromFlagNames`, `getWeatherModifierUpdateFuncFromFlagName`, `isa`, `new`, `onLightsProfileChanged`, `onPlayerEntered`, `onPlayerLeft`, `onWeatherChanged`, `registerViewerSpatialityMaskModifier`, `registerWeatherMaskModifier`, `setDayOfYear`, `setDayTime`, `setIsIndoor`, `setIsSunOn`, `superClass`, `update`

### EnvironmentTimeEvent (12 members)
`broadcastEvent`, `class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### Event (9 members)
`class`, `copy`, `delete`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### EventIds (11 members)
`assignEventId`, `assignEventIds`, `assignEventObjectId`, `getEventClassById`, `getEventClassByName`

### ExhaustEffect (27 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setFillType`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### ExternalVehicleControl (13 members)
`initSpecialization`, `onDelete`, `onExternalVehicleControlTriggerCallback`, `onLoadFinished`, `onUpdateTick`, `prerequisitesPresent`, `registerEventListeners`, `registerEvents`, `registerExternalActionEvent`, `registerFunctions`, `registerOverwrittenFunctions`

### ExtraContentSystem (35 members)
`addItem`, `class`, `copy`, `createItemKey`, `delete`, `getChecksumChar`, `getHasLockedItems`, `getIsItemIdUnlocked`, `getIsItemUnlocked`, `getItemByCode`, `getItemByKey`, `getStringHasValidCharacters`, `getUnlockedItems`, `isa`, `loadFromProfile`, `loadFromXML`, `new`, `reset`, `saveToProfile`, `superClass`, `unlockItem`

### FD25_garageWoodRoof (0 members)
—

### FSBaseMission (281 members)
`accumulatePlayedTime`, `addDrawable`, `addExtraPrintText`, `addGameNotification`, `addHelpAxis`, `addHelpButtonText`, `addHelpTrigger`, `addIngameNotification`, `addItemToList`, `addKnownSplitShape`, `addLeasedItem`, `addLiquidManureLoadingStation`, `addManureLoadingStation`, `addMapHotspot`, `addMoney`, `addMoneyChange`, `addNodeObject`, `addNonUpdateable`, `addOwnedItem`, `addPauseListeners`, `addPurchasedMoney`, `addTrainSystem`, `addTriggerMarker`, `addUpdateable`, `banUser`, `broadcastEventToFarm`, `broadcastEventToMasterUser`, `broadcastMissionDynamicInfo`, `broadcastNotifications`, `canPlayerChangeNickname`, `canStartMission`, `canUnpauseGame`, `cancelPlayersSynchronizing`, `checkRecordingDeviceState`, `class`, `consoleActivateCameraPath`, `consoleCommandCheatMoney`, `consoleCommandDisplacementDebug`, `consoleCommandDisplacementReset`, `consoleCommandExportStoreItems`, `consoleCommandRender360Screenshot`, `consoleCommandRunDSDensityMapUtil`, `consoleCommandSaveGame`, `consoleCommandSetShaderParameter`, `consoleCommandTeleport`, `consoleCommandTogglePhysicsStressTest`, `consoleCommandValidateUnloadTriggers`, `consoleStartGreatDemand`, `copy`, `createHUD`, `delete`, `dlcProblemOnQuitOk`, `doPauseGame`, `doUnpauseGame`, `draw`, `fadeScreen`, `farmStats`, `findDynamicObjects`, `finishLoadingTask`, `getAllowsGuiDisplay`, `getCanAcceptPlayers`, `getCanShowHelpTriggers`, `getClientGuiVisibility`, `getClientPosition`, `getDefaultServerName`, `getDoghouse`, `getEffectiveTimeScale`, `getFarmId`, `getFruitPixelsToSqm`, `getHarvestScaleMultiplier`, `getHasDrawable`, `getHasPlayerPermission`, `getHasUpdateable`, `getIngameMap`, `getInteractiveVehicleInRange`, `getIsAutoSaveSupported`, `getIsClient`, `getIsRadioPlaying`, `getIsServer`, `getIsTrailerInTipRange`, `getLastCreatedLicensePlate`, `getMoney`, `getNodeObject`, `getNumLeasedItems`, `getNumListItems`, `getNumOfItems`, `getNumOwnedItems`, `getObjectByUniqueId`, `getPedestrianSystem`, `getPlayerByConnection`, `getResetPlaces`, `getServerUserId`, `getSynchronizingPercentage`, `getTerrainDetailPixelsToSqm`, `getTrafficSystem`, `getTrailerInTipRange`, `initTerrain`, `initialize`, `isa`, `keyEvent`, `kickUser`, `load`, `loadEnvironment`, `loadMap`, `loadMapFinished`, `loadMapSounds`, `loadObjectAtPlace`, `mouseEvent`, `new`, `notifyPlayerFarmChanged`, `onAfterMenuClose`, `onAppResumed`, `onAppSuspended`, `onBeforeMenuOpen`, `onConnectionAccepted`, `onConnectionClosed`, `onConnectionDenyAccept`, `onConnectionFinishedLoading`, `onConnectionOpened`, `onConnectionPacketLost`, `onConnectionPacketSent`, `onConnectionReadUpdateStream`, `onConnectionReady`, `onConnectionRequest`, `onConnectionRequestAccepted`, `onConnectionRequestAcceptedLoad`, `onConnectionRequestAnswer`, `onConnectionRequestAnswerOk`, `onConnectionWriteUpdateStream`, `onConnectionsUpdateTick`, `onCreateLoadSpawnPlace`, `onCreateRestrictedZone`, `onCreateStoreSpawnPlace`, `onCreateTriggerMarker`, `onDayChanged`, `onEndMissionCallback`, `onFinishedClientsWriteUpdateStream`, `onFinishedLoading`, `onFinishedReceivingDynamicData`, `onGameStateChange`, `onGuidedTourFinished`, `onGuidedTourStarted`, `onHourChanged`, `onMasterServerConnectionFailed`, `onMasterServerConnectionReady`, `onMasterUserAdded`, `onMinuteChanged`, `onObjectCreated`, `onObjectDeleted`, `onRadioIsActiveChanged`, `onRadioVehicleOnlyChanged`, `onSaveGameUpdateComplete`, `onShowHelpIconsChanged`, `onShutdownEvent`, `onShutdownEventOk`, `onSoundPlayerChange`, `onSoundPlayerStreamAccess`, `onSplitShapesProgress`, `onStartMission`, `onStreamAccessAllowed`, `onUserAdded`, `onUserRemoved`, `onWindowSizeChanged`, `onYesNoSavegameOverwrite`, `pauseGame`, `pauseRadio`, `playRadio`, `playerOwnsAllFields`, `postUpdate`, `preUpdate`, `registerToLoadOnMapFinished`, `removeAllHelpIcons`, `removeDrawable`, `removeHelpTrigger`, `removeItemFromList`, `removeKnownSplitShape`, `removeLeasedItem`, `removeLiquidManureLoadingStation`, `removeManureLoadingStation`, `removeMapHotspot`, `removeNodeObject`, `removeNonUpdateable`, `removeOwnedItem`, `removePauseListeners`, `removeTrainSystem`, `removeTriggerMarker`, `removeUpdateable`, `resetGameState`, `saveSavegame`, `sendInitialClientState`, `sendNumPlayersToMasterServer`, `sendPlatformSessionIdsToMasterServer`, `setAutoSaveInterval`, `setAutomaticMotorStartEnabled`, `setColorBlindMode`, `setConnectionLostState`, `setDirtInterval`, `setDisasterDestructionState`, `setEconomicDifficulty`, `setFixedSeasonalVisuals`, `setFruitDestructionEnabled`, `setFuelUsage`, `setGrowthMode`, `setHarvestScaleRatio`, `setHelperBuyFertilizer`, `setHelperBuyFuel`, `setHelperBuySeeds`, `setHelperManureSource`, `setHelperSlurrySource`, `setLastCreatedLicensePlate`, `setLastInteractionTime`, `setLimeRequired`, `setLoadingScreen`, `setManualPause`, `setMapTargetHotspot`, `setMissionInfo`, `setMoneyUnit`, `setPedestrianSystem`, `setPlannedDaysPerPeriod`, `setPlayerNickname`, `setPlayerPermission`, `setPlayerPermissions`, `setPlowingRequiredEnabled`, `setRadioActionEventsState`, `setSavegameName`, `setShowFieldInfo`, `setShowHelpTrigger`, `setShowTriggerMarker`, `setSnowEnabled`, `setStonesEnabled`, `setStopAndGoBraking`, `setTimeScale`, `setTimeScaleMultiplier`, `setTrafficEnabled`, `setTrafficSystem`, `setTrailerFillLimit`, `setTrainSystemTabbable`, `setUseAcre`, `setUseFahrenheit`, `setUseMiles`, `setWeedsEnabled`, `showAttachContext`, `showBlinkingWarning`, `showFillDogBowlContext`, `showFuelContext`, `showMoneyChange`, `showPauseDisplay`, `showTipContext`, `spawnCollisionTestCallback`, `startLoadingTask`, `startSaveCurrentGame`, `subscribeGuiOpenCloseMessages`, `subscribeMessages`, `subscribeSettingsChangeMessages`, `superClass`, `teleportVehicle`, `testForGameRating`, `toggleVehicle`, `tryUnpauseGame`, `update`, `updateDedicatedServerXML`, `updateFoundHelpIcons`, `updateHelpTriggerVisibility`, `updateMasterServerInfo`, `updateMaxNumHirables`, `updateMissionDynamicInfo`, `updatePauseInputContext`, `updateSaving`

### FSCareerMissionInfo (30 members)
`applyStartInfo`, `class`, `copy`, `delete`, `getAreSplitShapesValid`, `getEffectiveTimeScale`, `getIsDensityMapValid`, `getIsLoadedFromSavegame`, `getIsNavigationCollisionValid`, `getIsPlacementCollisionValid`, `getIsTerrainLodTextureValid`, `getIsTerrainTextureValid`, `getIsTipCollisionValid`, `getSavegameAutoBackupBasePath`, `getSavegameAutoBackupDirectoryBase`, `getSavegameAutoBackupLatestFilename`, `getSavegameDirectory`, `getStateI18NKey`, `isValidMissionId`, `isa`, `loadDefaults`, `loadFromMission`, `loadFromXML`, `new`, `saveToXMLFile`, `setMapId`, `setSavegameDirectory`, `superClass`

### FacialAnimation (23 members)
`class`, `cleanup`, `copy`, `delete`, `getIsEmotionActive`, `getIsTalking`, `getIsVisible`, `isa`, `linkToModel`, `loadFromStyleAsync`, `new`, `onVisualsLoaded`, `reset`, `setIsVisible`, `setLookAtNode`, `setLookAtWeight`, `start`, `stop`, `superClass`, `update`, `updatePlayer`

### FacialAnimationEmotion (8 members)
—

### Farm (89 members)
`addDeleteListener`, `addPurchasedCoins`, `addUser`, `calculateDailyLoanInterest`, `canBeDestroyed`, `changeBalance`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `demoteUser`, `draw`, `farmPropertyChanged`, `getActiveUsers`, `getBalance`, `getColor`, `getEquity`, `getFarmhouse`, `getIconSliceId`, `getIconUVs`, `getId`, `getIsContractingFor`, `getIsDelayedLoaded`, `getLoan`, `getNextDirtyFlag`, `getNumActivePlayers`, `getNumPlayers`, `getOwnerConnection`, `getOwnerFarmId`, `getSleepCamera`, `getSpawnPoint`, `getUpdatePriority`, `getUserPermissions`, `isUserFarmManager`, `isa`, `loadFromXMLFile`, `merge`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onUserJoinGame`, `onUserQuitGame`, `periodChanged`, `promoteUser`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `removeUser`, `resetObjectIds`, `resetToSingleplayer`, `saveToXMLFile`, `setInitialEconomy`, `setIsContractingFor`, `setOwnerConnection`, `setOwnerFarmId`, `setUserPermission`, `superClass`, `unregister`, `update`, `updateEnd`, `updateLastNickname`, `updateMaxLoan`, `updateTick`, `writeStream`, `writeUpdateStream`

### FarmCreateUpdateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FarmDestroyEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FarmManager (45 members)
`appendFarm`, `class`, `consoleCommandSetFarm`, `copy`, `createFarm`, `delete`, `destroyFarm`, `findNextFarmId`, `getFarmById`, `getFarmByUserId`, `getFarmForUniqueUserId`, `getFarmStatValue`, `getFarms`, `getSleepCamera`, `getSpawnPoint`, `initDataStructures`, `isa`, `load`, `loadDefaults`, `loadFromXMLFile`, `loadMapData`, `mergeFarmlandsForSingleplayer`, `mergeFarmsForSingleplayer`, `mergeObjectsForSingleplayer`, `new`, `onFarmObjectCreated`, `onFarmObjectDeleted`, `playerJoinedGame`, `playerQuitGame`, `removeFarm`, `removeUserFromFarm`, `saveToXMLFile`, `superClass`, `transferMoney`, `unloadMapData`, `update`, `updateFarmStats`, `updateFarms`

### FarmStats (26 members)
`addHeroStat`, `addStatistic`, `addValueToHeroStat`, `archiveFinances`, `changeFinanceStats`, `class`, `copy`, `delete`, `getCompletedMissions`, `getCompletedMissionsSession`, `getSessionValue`, `getStatisticData`, `getTotalValue`, `isa`, `loadFromXMLFile`, `merge`, `new`, `saveToXMLFile`, `superClass`, `update`, `updateJobAchievements`, `updateMissionDone`, `updateStats`, `updateTreeTypesCut`

### FarmlandHotspot (44 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getFarmland`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setDisabled`, `setFarmland`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`, `updateColors`

### FarmlandInitialStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FarmlandStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FarmsInitialStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FeedingRobot (71 members)
`addDeleteListener`, `addFillLevelFromTool`, `addSpline`, `addSplineDelta`, `addSplineWaitingPoint`, `addStateChangedListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createFoodMixture`, `delete`, `draw`, `finalizePlacement`, `finishSplines`, `getFeedingFactor`, `getFillLevel`, `getFreeCapacity`, `getIsDelayedLoaded`, `getIsDriving`, `getIsFillTypeAllowed`, `getIsNodeUsed`, `getIsToolTypeAllowed`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getState`, `getUpdatePriority`, `isa`, `load`, `loadFromXMLFile`, `new`, `onGhostAdd`, `onGhostRemove`, `onI3DFileLoaded`, `onMissionStarted`, `onPlayerTrigger`, `onRobotTrigger`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `registerSavegameXMLPaths`, `removeDeleteListener`, `removeFillLevel`, `resetObjectIds`, `resetRobot`, `saveToXMLFile`, `setFillScale`, `setIsDriving`, `setMixingAnimationActive`, `setOwnerConnection`, `setOwnerFarmId`, `setSplineTime`, `setState`, `setUnloadingSpotActive`, `start`, `superClass`, `unregister`, `update`, `updateEnd`, `updateInfo`, `updateSplineTimes`, `updateTick`, `updateUnloadingSpot`, `writeStream`, `writeUpdateStream`

### FeedingRobotState (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateDriving (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FeedingRobotStateFilling (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateFinished (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateLoading (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStatePaused (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateReset (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateStarting (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FeedingRobotStateWait (12 members)
`activate`, `class`, `copy`, `deactivate`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FellerBuncher (40 members)
`actionEventCutTree`, `actionEventReleaseTrees`, `cutTree`, `doMountProcess`, `fellerBuncherSplitShapeCallback`, `getAutoAlignHasValidTree`, `getCanToggleTurnedOn`, `getFellerBuncherCanCutSplitShape`, `getIsFellerBuncherReadyForCut`, `getNumLoadedTrees`, `getSpecValueMaxTreeSize`, `getSupportsAutoTreeAlignment`, `initSpecialization`, `loadSpecValueMaxTreeSize`, `mountTreeInRange`, `onDelete`, `onFellerBuncherTreeShapeCut`, `onFellerBuncherTreeShapeMounted`, `onFellerBuncherTreesChanged`, `onFinishAnimation`, `onLoad`, `onReadStream`, `onReadUpdateStream`, `onRegisterActionEvents`, `onTurnedOff`, `onTurnedOn`, `onUpdateTick`, `onWriteStream`, `onWriteUpdateStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerLoweringActionEvent`, `registerOverwrittenFunctions`, `releaseMainArmTree`, `releaseMountedTrees`, `releaseNextTreeSlot`, `setFellerBuncherGrabState`, `updateActionEvents`

### Ferrari488_GTB_Fs25 (0 members)
—

### Ferry (68 members)
`addDeleteListener`, `addDynamicMountedObject`, `addSplineTimeDelta`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `getCanActivateDriving`, `getIsAllowedToDrive`, `getIsDelayedLoaded`, `getIsNodeSupported`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getSplineTime`, `getSplineTimeDeltaPerMs`, `getState`, `getUpdatePriority`, `getWorldPosition`, `getWorldRotation`, `isa`, `load`, `loadFromXMLFile`, `mountObjects`, `new`, `onActivationTriggerCallback`, `onBarrierTriggerCallback`, `onCreate`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onObjectCallback`, `onStartFailed`, `onStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `removeDynamicMountedObject`, `resetObjectIds`, `saveToXMLFile`, `setOwnerConnection`, `setOwnerFarmId`, `setState`, `start`, `startMotor`, `stopMotor`, `superClass`, `unmountObjects`, `unregister`, `update`, `updateEnd`, `updatePosition`, `updateTick`, `writeStream`, `writeUpdateStream`

### FerryHotspot (43 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getBeVisited`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getName`, `getRenderLast`, `getSortingValue`, `getTeleportWorldPosition`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### FerryState (13 members)
`activate`, `class`, `copy`, `deactivate`, `getCanFinishState`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FerryStateArriveDock (13 members)
`activate`, `class`, `copy`, `deactivate`, `getCanFinishState`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FerryStateDriving (13 members)
`activate`, `class`, `copy`, `deactivate`, `getCanFinishState`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FerryStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FerryStateLeaveDock (13 members)
`activate`, `class`, `copy`, `deactivate`, `getCanFinishState`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FerryStateWaiting (14 members)
`activate`, `class`, `copy`, `deactivate`, `finish`, `getCanFinishState`, `isDone`, `isa`, `load`, `new`, `raiseActive`, `registerXMLPaths`, `superClass`, `update`

### FertilizeMission (158 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `update`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### FertilizerMotionPathEffect (53 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `start`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### FidelityFxSR30Quality (6 members)
—

### FidelityFxSRQuality (6 members)
—

### FieldChopperType (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `getValueByType`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### FieldCourse (17 members)
`addSegments`, `class`, `copy`, `draw`, `findClosestField`, `generateByFieldPosition`, `generateUICourseByFieldPosition`, `isa`, `loadFromXML`, `new`, `readStream`, `registerXMLPaths`, `saveToXML`, `superClass`, `updateFieldCourseSettings`, `writeStream`

### FieldCourseBoundary (35 members)
`adjustSegmentByHitPoints`, `class`, `copy`, `createByBoundaryLine`, `cut`, `draw`, `extend`, `extendBoundaryLine`, `generateBoundaryLine`, `generateDebugLines`, `generateSegmentsByBoundaryLine`, `getBoundaryOffsetPosition`, `getIsBoundaryLineInverted`, `getLineSegmentIntersections`, `getMaxSegmentAngle`, `getOffsetBoundaryBySegmentParts`, `getOffsetBoundaryLine`, `getSegmentAngle`, `isColliding`, `isInsideOf`, `isValid`, `isa`, `new`, `regenerateSegments`, `removeCoincidentPositions`, `removeCollidingSegments`, `resolveSelfIntersections`, `segmentApplySideOffset`, `segmentCollisionOffset`, `segmentCollisionOverlapCallback`, `splitBoundary`, `splitBoundarySegment`, `splitBoundarySegments`, `superClass`

### FieldCourseDetectionState (21 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### FieldCourseField (32 members)
`class`, `continueIslandDetection`, `copy`, `detectAtPosition`, `draw`, `finishTask`, `generateAtPosition`, `generateBoundingBoxFromBoundary`, `getBoundingBox`, `getIsPointInsideBoundary`, `getIsWaitingForAsyncResult`, `isa`, `islandDetection`, `loadFromXML`, `new`, `readStream`, `registerXMLPaths`, `reset`, `saveToXML`, `setIgnoreCollisions`, `setIgnoreIslands`, `setProtectedBoundary`, `superClass`, `thightCornerExtension`, `update`, `writeStream`

### FieldCourseGenerationState (21 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### FieldCourseIterator (7 members)
`class`, `copy`, `isa`, `new`, `onFinish`, `superClass`, `update`

### FieldCourseManager (21 members)
`addFieldCourseToGenerate`, `addUpdateable`, `class`, `copy`, `generateFieldCourseAtWorldPos`, `getFrameBudget`, `initDataStructures`, `isa`, `load`, `loadMapData`, `new`, `readTerrainDetailPixel`, `removeUpdateable`, `roundToTerrainDetailPixel`, `setActiveSteeringFieldCourse`, `superClass`, `unloadMapData`, `update`, `writeTerrainDetailPixel`

### FieldCourseSegmentGenerator (21 members)
`class`, `copy`, `doHeadlandReverseSegmentExtension`, `doVineyardDetection`, `extendSegmentToBoundary`, `finish`, `generate`, `generateNextHeadland`, `getHasFinished`, `getIsWaitingForAsyncResult`, `getOrchardSegments`, `isa`, `new`, `setFieldData`, `setHeadlandSettings`, `setIsUICourse`, `setStartPosition`, `superClass`, `update`, `updateState`

### FieldCourseSettings (19 members)
`applyAttributes`, `clone`, `draw`, `generate`, `getProtectedBoundarySize`, `init`, `isIdentical`, `loadFromXML`, `new`, `print`, `readStream`, `registerXMLPaths`, `reset`, `resetDynamicSettings`, `saveToXML`, `writeStream`

### FieldCourseUtil (29 members)
`douglasPeucker`, `extendSegment`, `extendSegmentPositions`, `extendSegmentToBoundary`, `extendSegmentUntilOverlap`, `getAreBoundariesColliding`, `getAreParallelSegmentsNextToEachOther`, `getClosestExtendedPositionAndDirectionOnSegment`, `getClosestPositionAndDirectionOnBoundary`, `getClosestPositionOnBoundary`, `getDistanceToBoundary`, `getDistanceToSegment`, `getIsPointInsideBoundary`, `getIsSegmentInsideBoundary`, `getLineSegmentsIntersection`, `getPositionSegmentOverlap`, `getSegmentBoundaryIntersection`, `getSegmentClosestBoundaryCircleIntersection`, `getSegmentClosestBoundaryIntersection`, `getSegmentLength`, `getSegmentNumBoundaryIntersections`, `langSimplification`, `pointAveragePositions`, `removeShortSegments`, `segmentApplySideOffset`, `semiConvexSimplification`, `shrinkSegmentUntilOverlap`, `vector2Dot`, `visvalingamWhyattSimplification`

### FieldCourseVisual (19 members)
`class`, `copy`, `delete`, `getMaxVisualLineLength`, `getVisualSegment`, `isa`, `new`, `onColorBlindModeChanged`, `onVisualsLoaded`, `releaseVisualSegment`, `setActiveSteeringFieldCourse`, `superClass`, `update`, `updateTiles`

### FieldCourseVisualTile (15 members)
`addSegment`, `class`, `copy`, `debugDraw`, `fillAdditionalTileSegment`, `fillTile`, `fillTileBySegment`, `init`, `isa`, `new`, `reset`, `resetAdditionalSegments`, `setSegmentData`, `superClass`

### FieldCropsQuery (8 members)
`addProhibitedCropType`, `addProhibitedDensityMapValue`, `addProhibitedGroundValue`, `addRequiredCropType`, `addRequiredDensityMapValue`, `addRequiredGroundValue`, `getParallelogram`, `new`

### FieldCropsUpdaterConstructor (4 members)
`addCropType`, `finalize`, `new`, `setGroundTerrainDetail`

### FieldDensityMap (10 members)
—

### FieldGetInfoTask (23 members)
`cancel`, `class`, `copy`, `enqueue`, `getField`, `getIsFinished`, `getName`, `isa`, `loadFromXMLFile`, `new`, `onFinish`, `registerXMLPaths`, `saveToXMLFile`, `setArea`, `setCallback`, `setField`, `setFinished`, `setFruitTypes`, `setName`, `setNeedsSaving`, `start`, `superClass`, `update`

### FieldGroundSystem (39 members)
`addDensityMapSyncer`, `class`, `copy`, `delete`, `getChopperTypeValue`, `getDensityMapData`, `getDensityMaps`, `getDisplacementCustomFlagData`, `getDisplacementData`, `getDisplacementResetValue`, `getFieldGroundTypeByValue`, `getFieldGroundTyreTrackColor`, `getFieldGroundValue`, `getFieldGroundValueByName`, `getFieldSprayTypeByValue`, `getFieldSprayValue`, `getFieldSprayValueByName`, `getFieldTypeByValue`, `getFieldTypeValue`, `getFieldTypeValueByName`, `getGroundAngleMaxValue`, `getGroundAngleStep`, `getMaxValue`, `getSize`, `getSowableRange`, `getSowingRange`, `getValueAtWorldPos`, `initDataStructures`, `initTerrain`, `isa`, `loadChopperIdFromXML`, `loadDensityMapFromXML`, `loadFieldTypeIdFromXML`, `loadGroundIdFromXML`, `loadGroundTypes`, `loadMapData`, `loadSprayIdFromXML`, `new`, `superClass`

### FieldGroundType (31 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `getTypeByValue`, `getValueByName`, `getValueByType`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### FieldSprayType (20 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `getTypeByValue`, `getValueByName`, `getValueByType`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### FieldStateDialog (180 members)
`addCallback`, `addElement`, `applyFieldCourse`, `applyFullField`, `applyProfile`, `applySettings`, `applyStateValuesToTask`, `buildOppositeHarvestStateValues`, `buildSegmentStripPolygon`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `enqueueSegmentTask`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getGroundTypeForGrowthState`, `getHandleFocus`, `getHarvestReadyGrowthState`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSelectedFields`, `getSelectedFruitTypeDesc`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickApply`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickFruitType`, `onClickGrowthStates`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickQuickCultivated`, `onClickQuickHarvestReady`, `onClickQuickHarvested`, `onClickShop`, `onClickUseFieldCourse`, `onClose`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setBuyField`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFertilizerState`, `setFieldCourseElementsDisabled`, `setFieldId`, `setFocused`, `setFruitName`, `setGroundLayer`, `setGroundType`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setLimeState`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPlowingState`, `setPosition`, `setRemoveFoliage`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setStubbleState`, `setTarget`, `setVisible`, `setWeedState`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateGrowthStates`, `verifyConfiguration`

### FieldType (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `getTypeByValue`, `getValueByName`, `getValueByType`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### FieldUpdateTask (45 members)
`addFilter`, `cancel`, `class`, `clearCultivatedFruit`, `clearDecoFoliage`, `clearHeight`, `clearTireTracks`, `copy`, `enqueue`, `getField`, `getIsFinished`, `getName`, `isa`, `loadFromXMLFile`, `new`, `prepare`, `prepareClearCultivatedFruit`, `prepareClearDecoFoliage`, `registerXMLPaths`, `resetDisplacement`, `saveToXMLFile`, `setArea`, `setField`, `setFieldGroundValue`, `setFieldType`, `setFinished`, `setFruit`, `setGroundAngle`, `setGroundType`, `setLimeLevel`, `setName`, `setNeedsSaving`, `setPerlinFilter`, `setPlowLevel`, `setRollerLevel`, `setSprayLevel`, `setSprayType`, `setStoneLevel`, `setStubbleShredLevel`, `setValue`, `setWaterLevel`, `setWeedState`, `start`, `superClass`, `update`

### FieldUtil (1 members)
`onCreate`

### FileAccess (2 members)
—

### Files (7 members)
`class`, `copy`, `fileCallbackFunction`, `getFilesRecursive`, `isa`, `new`, `superClass`

### FillLevelListener (38 members)
`addDeleteListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `fillLevelsChanged`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `load`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `resetObjectIds`, `setOwnerConnection`, `setOwnerFarmId`, `setSource`, `superClass`, `unregister`, `update`, `updateEnd`, `updateTick`, `writeStream`, `writeUpdateStream`

### FillType (178 members)
—

### FillTypeCategory (0 members)
—

### FillTypeDocGenerator (11 members)
`class`, `collectData`, `copy`, `generate`, `generateItemPage`, `generateOverviewPage`, `getOverviewQualifiedName`, `getSummary`, `isa`, `new`, `superClass`

### FinanceStats (12 members)
`class`, `copy`, `isa`, `loadFromXMLFile`, `merge`, `new`, `saveToXMLFile`, `superClass`

### FinanceStatsEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FindDeletedObjects (10 members)
`add`, `find`, `init`, `run`, `update`

### FindNodeDelete (3 members)
`addNode`, `init`

### FindOverlayLeaks (4 members)
`init`, `printUndeletedOverlays`

### FindPlaceTask (12 members)
`class`, `copy`, `getNextPosition`, `getPlaceFulfillsSizeRequirements`, `isa`, `new`, `nextPlace`, `overlapBoxCallbackFuncFindPlace`, `runStep`, `superClass`

### FogSettings (12 members)
`class`, `clone`, `copy`, `createFromTemplate`, `disableGroundFog`, `isa`, `loadFromXMLFile`, `loadTemplate`, `new`, `saveToXMLFile`, `superClass`, `validate`

### FogStateEvent (14 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FogUpdater (13 members)
`addDebugValues`, `class`, `consoleCommandWeatherSetFog`, `copy`, `delete`, `getIsFogPossible`, `isa`, `loadFromXMLFile`, `new`, `saveToXMLFile`, `setTargetFog`, `superClass`, `update`

### FoldableSteps (36 members)
`actionEventFold`, `actionEventFoldNeg`, `actionEventFoldPos`, `externalActionEventFoldNegRegister`, `externalActionEventFoldNegUpdate`, `externalActionEventFoldPosRegister`, `externalActionEventFoldPosUpdate`, `externalActionEventFoldRegister`, `externalActionEventFoldUpdate`, `getAllowHudInfoTrigger`, `getBrakeForce`, `getCanBeTurnedOn`, `getFillUnitSupportsToolType`, `getIsDynamicLockPositionActive`, `getRequiresPower`, `getTurnedOnNotAllowedWarning`, `initSpecialization`, `loadDynamicLockPositionFromXML`, `onDraw`, `onLoad`, `onPostLoad`, `onReadStream`, `onRegisterActionEvents`, `onRegisterExternalActionEvents`, `onUpdateTick`, `onWriteStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `saveToXMLFile`, `setFoldableStepsFoldState`, `updateActionEvents`, `updateFoldStateChangeAllowed`

### FoliageBendingSystem (10 members)
`class`, `copy`, `createRectangle`, `delete`, `destroyObject`, `isa`, `new`, `setTerrainTransformGroup`, `superClass`

### FoliageSystem (26 members)
`addDensityMapSyncer`, `addModFoliageType`, `apply`, `applyAreas`, `applyDecoFoliage`, `applyServerModFoliageTypes`, `class`, `copy`, `delete`, `getDecoFoliages`, `getDensityMapData`, `getFoliagePaint`, `getFoliagePaintByName`, `getIsDecoLayerDefined`, `initTerrain`, `isa`, `loadMapData`, `loadModFoliageType`, `loadModFoliageTypeData`, `loadModFoliageTypes`, `new`, `saveToXMLFile`, `streamReadModFoliageTypes`, `streamWriteModFoliageTypes`, `superClass`, `unloadMapData`

### FoliageTransformGroupConstructor (50 members)
`allocateTypeIndex`, `createLayer`, `createLodForShape`, `createMultiLayer`, `createShapeForState`, `createStateForLayer`, `getAtlasOffsetForLod`, `getAtlasSizeForLod`, `getBlocksPerUnitForState`, `getCellSize`, `getDecalLayer`, `getDensityChannelsForLayer`, `getDensityMapInfo`, `getDistanceMapForState`, `getGraphicsCellScale`, `getHeightAndVarianceForState`, `getMaxNumStatesForLayer`, `getNameForLayer`, `getNameForState`, `getNumLayers`, `getNumLodsForShape`, `getNumShapesForState`, `getNumStatesForLayer`, `getObjectMask`, `getPositionVarianceForState`, `getShapeForLod`, `getShapeSourceForLayer`, `getTexCoordsForLod`, `getTypeIndexForLayer`, `getViewDistanceForLod`, `getWidthAndVarianceForState`, `loadFruitTypeFromXml`, `new`, `setAtlasOffsetForLod`, `setAtlasSizeForLod`, `setBlocksPerUnitForState`, `setCellSize`, `setDecalLayer`, `setDensityChannelsForLayer`, `setDistanceMapForState`, `setGraphicsCellScale`, `setHeightAndVarianceForState`, `setNameForState`, `setObjectMask`, `setPositionVarianceForState`, `setShapeForLod`, `setShapeSourceForLayer`, `setTexCoordsForLod`, `setViewDistanceForLod`, `setWidthAndVarianceForState`

### FoliageXmlUtil (1 members)
`printFoliageCtor`

### FollowerSound (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### FootballFieldGoalEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FootballFieldResetBallEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FootballFieldResetEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### FootballShootEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### FrameInterpolationMode (4 members)
—

### FruitExtraObjects (15 members)
`getFruitExtraObjectTypeData`, `initSpecialization`, `loadFruitExtraObjectFromXML`, `onDynamicMountTypeChanged`, `onPostDetach`, `onPostLoad`, `onPreAttach`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `saveToXMLFile`, `updateFruitExtraObjects`

### FruitType (27 members)
—

### FruitTypeCategory (12 members)
—

### FruitTypeConverter (3 members)
—

### FruitTypeDocGenerator (15 members)
`appendToolStateRow`, `class`, `collectData`, `collectSeasonalData`, `copy`, `createWeederHoeOverviewTable`, `createWeederHoeTable`, `generate`, `generateItemPage`, `generateOverviewPage`, `getOverviewQualifiedName`, `getSummary`, `isa`, `new`, `superClass`

### Fs25_Edm_PeugeotBoxer2024 (0 members)
—

### Fs25_Edm_Peugeot_408_2024 (0 members)
—

### Fs25_Edm_Porsche_992_GT3_RS (0 members)
—

### Fs_25_KronePack (0 members)
—

### FullscreenMode (4 members)
—

### GameLoadingCancelSimulator (2 members)
`init`

### GamePauseEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `sendEvent`, `superClass`, `writeStream`

### GamePauseRequestEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### GameRateDialog (150 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getValueForElement`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onStarClick`, `onStarFocus`, `onStarHighlight`, `onStarHighlightRemove`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setStars`, `setTarget`, `setText`, `setUpdateCallback`, `setValue`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### GameSettings (20 members)
`class`, `copy`, `getTableValue`, `getValue`, `isa`, `loadFromXML`, `new`, `registerXMLPaths`, `save`, `saveToXMLFile`, `setDefault`, `setLastPlayerStyle`, `setTableValue`, `setTableValueFromXML`, `setValue`, `setXMLValue`, `superClass`

### GameState (9 members)
—

### GameStateManager (8 members)
`class`, `copy`, `getGameState`, `getGameStateIndexByName`, `isa`, `new`, `setGameState`, `superClass`

### GameStats (27 members)
`class`, `consoleCommandUpdateGameStats`, `copy`, `delete`, `init`, `isa`, `new`, `onUserAdded`, `onUserRemoved`, `processStep`, `setDirty`, `superClass`, `update`, `updateStatsFarmlands`, `updateStatsFields`, `updateStatsFinished`, `updateStatsInfo`, `updateStatsPlayers`, `updateStatsVehicleStep`, `updateStatsVehiclesInit`

### GamepadCategories (11 members)
—

### GamepadHelper (11 members)
`getAxisName`, `getAxisXMLString`, `getButtonAndAxisNames`, `getButtonName`, `getButtonNames`, `getButtonsXMLString`, `getDeviceString`, `getDeviceXMLInt`, `getGamepadInputCombinedName`, `getInputDisplayText`, `getLocalizedGamepadName`

### GamepadSigninScreen (131 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYesNoSigninAccept`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `signIn`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### GameplayHintManager (11 members)
`class`, `copy`, `getIsLoaded`, `getRandomGameplayHint`, `initDataStructures`, `isa`, `load`, `loadMapData`, `new`, `superClass`, `unloadMapData`

### GetAdminAnswerEvent (15 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### GetAdminEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### GetBansEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### GoalDialogShown (10 members)
`activate`, `class`, `copy`, `createFromXML`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalIntroductionHelpShown (10 members)
`activate`, `class`, `copy`, `createFromXML`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalNPCConversationFinished (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalNPCInRange (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalPlayerInTrigger (14 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `onPlayerCallback`, `registerXMLPaths`, `superClass`, `update`, `updateTarget`

### GoalProgress (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleAttachedTo (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleDetached (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleFillLevel (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleInAttachRange (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleInFillTrigger (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleInRange (12 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `onVehicleCallback`, `registerXMLPaths`, `superClass`

### GoalVehicleInTipTrigger (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleInTrigger (12 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `onVehicleCallback`, `registerXMLPaths`, `superClass`

### GoalVehicleIsAIActive (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleIsControlled (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleIsLowered (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleIsSeedTypeSelected (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleIsTurnedOn (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehicleIsUnfolded (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GoalVehiclePipeState (11 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `isAchieved`, `isa`, `new`, `registerXMLPaths`, `superClass`

### GrainTankEffect (36 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setOffset`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `transformEffectNode`, `update`

### Graph (18 members)
`addValue`, `class`, `copy`, `delete`, `draw`, `drawBar`, `drawLine`, `isa`, `new`, `setBackgroundColor`, `setColor`, `setHorizontalLine`, `setValue`, `setVerticalLine`, `setXPosition`, `superClass`

### GreatDemandSpecs (7 members)
`class`, `copy`, `getIsDateEarlier`, `isa`, `new`, `setUpRandomDemand`, `superClass`

### GreatDemandsEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### GroundTypeManager (14 members)
`class`, `copy`, `getTerrainLayerByType`, `getTerrainTitleByType`, `initDataStructures`, `initTerrain`, `isa`, `load`, `loadGroundTypeMappings`, `loadGroundTypes`, `loadMapData`, `new`, `superClass`, `unloadMapData`

### GrowthMode (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### GrowthSystem (34 members)
`class`, `consoleCommandGrowNow`, `copy`, `delete`, `getGrowthMode`, `getIsGrowingInProgress`, `getMaxUpdateTime`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onEngineGrowthFinished`, `onEngineStepFinished`, `onPeriodChanged`, `onSleepChanged`, `onTerrainLoad`, `onWeedGrowthChanged`, `performScriptBasedGrowth`, `resetGrowthMask`, `saveState`, `saveToXMLFile`, `setFruitLayer`, `setGrowthEnabled`, `setGrowthMask`, `setGrowthMode`, `setIgnoreDensityChanges`, `setIsGamePaused`, `setMonthEngineState`, `startEngineGrowth`, `superClass`, `triggerGrowth`, `update`

### GuidedTour (23 members)
`cancel`, `class`, `cleanup`, `copy`, `delete`, `draw`, `finish`, `getCanAbort`, `getNPCSpot`, `getPassedStepsInfo`, `isa`, `load`, `loadFromXMLFile`, `loadSteps`, `new`, `registerSavegameXMLPaths`, `saveToXMLFile`, `setShowProgress`, `start`, `startStep`, `superClass`, `update`

### GuidedTourHelp (9 members)
`init`, `registerHelpBalance`, `registerHelpCalendar`, `registerHelpFillLevels`, `registerHelpMiniMap`, `registerHelpProgress`, `registerHelpTime`, `registerHelpVehicleSelection`, `registerHelpWeather`

### GuidedTourStep (18 members)
`checkIfDone`, `class`, `copy`, `delete`, `draw`, `finish`, `getInfo`, `getProgressByIndex`, `isa`, `load`, `loadFromXMLFile`, `new`, `registerSavegameXMLPaths`, `registerXMLPaths`, `saveToXMLFile`, `start`, `superClass`, `update`

### GuidedTourUtil (4 members)
`createFromXML`, `loadActionsFromXMLFile`, `loadGoalsFromXMLFile`, `loadProgressesFromXMLFile`

### HTMLUtil (4 members)
`decodeFromHTML`, `encodeToHTML`

### HUD (84 members)
`addChatMessage`, `addExtraPrintText`, `addHelpExtension`, `addInfoExtension`, `addMapHotspot`, `addMoneyChange`, `addSideNotification`, `addSideNotificationProgressBar`, `addTopNotification`, `class`, `consoleCommandToggleCoordinates`, `consoleCommandToggleUIScale`, `consoleCommandToggleVisibility`, `copy`, `createDisplayComponents`, `delete`, `drawBaseHUD`, `drawBlinkingWarning`, `drawCommunicationDisplay`, `drawControlledEntityHUD`, `drawFading`, `drawGamePaused`, `drawInGameMessageAndIcon`, `drawInputHelp`, `drawOverlayAtPosition`, `drawOverlayAtPositionWithDimensions`, `drawPOIInfo`, `drawSideNotification`, `drawTopNotification`, `drawVehicleName`, `fadeScreen`, `getIngameMap`, `getIsFading`, `getIsVisible`, `hideTopNotification`, `isInGameMessageVisible`, `isa`, `loadIngameMap`, `markSideNotificationProgressBarForDrawing`, `mouseEvent`, `new`, `onPauseGameChange`, `onUIScaleChanged`, `postUpdateMap`, `registerInput`, `removeInfoExtension`, `removeMapHotspot`, `removeSideNotificationProgressBar`, `scrollChatMessages`, `setChatDisplayVisible`, `setChatMessagesReference`, `setControlledVehicle`, `setInfoVisible`, `setIngameMapSize`, `setInputHelpVisible`, `setIsControllingPlayer`, `setIsSaving`, `setIsVisible`, `setMissionInfo`, `setMoneyUnit`, `setPlayer`, `setScale`, `showAchievementMessage`, `showAttachContext`, `showBlinkingWarning`, `showFillDogBowlContext`, `showFuelContext`, `showInGameMessage`, `showMoneyChange`, `showTipContext`, `showVehicleName`, `superClass`, `update`, `updateBlinkingWarning`, `updateMap`, `updateMessage`, `updateVehicleName`

### HUDDisplay (18 members)
`class`, `copy`, `delete`, `draw`, `getPosition`, `getVisible`, `isa`, `new`, `scalePixelToScreenHeight`, `scalePixelToScreenVector`, `scalePixelToScreenWidth`, `scalePixelValuesToScreenVector`, `setPosition`, `setScale`, `setVisible`, `storeScaledValues`, `superClass`, `update`

### HUDInfoTrigger (12 members)
`getAllowHudInfoTrigger`, `getIsPlayerInHudInfoTrigger`, `initSpecialization`, `onDelete`, `onHudInfoTriggerCallback`, `onLoad`, `onUpdate`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`

### HUDRoundedBarElement (45 members)
`addChild`, `class`, `copy`, `createComponents`, `delete`, `draw`, `getAlpha`, `getColor`, `getDimension`, `getHeight`, `getPosition`, `getRotationPivot`, `getScale`, `getVisible`, `getWidth`, `isa`, `new`, `normalizeUVPivot`, `removeChild`, `resetDimensions`, `scalePixelToScreenHeight`, `scalePixelToScreenVector`, `scalePixelToScreenWidth`, `scalePixelValuesToScreenVector`, `setAlignment`, `setAlpha`, `setBarAlpha`, `setBarColor`, `setColor`, `setDimension`, `setImage`, `setPosition`, `setRotation`, `setRotationPivot`, `setScale`, `setSliceId`, `setUVs`, `setValue`, `setVisible`, `superClass`, `update`, `updateComponents`

### HandToolLoadingState (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### HarvestMission (154 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `fillSold`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMaxCutLiters`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getSellingStationWithHighestPrice`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `initializeModifier`, `isAvailableForField`, `isAvailableForSellingStation`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onDeleteSellingStation`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setSellingStation`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `tryToResolveSellingStation`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### HarvestMissionHotspot (42 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `postUpdate`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRadius`, `setWorldRotation`, `superClass`

### HelpLineActivatable (8 members)
`class`, `copy`, `getDistance`, `getIsActivatable`, `isa`, `new`, `run`, `superClass`

### HelpLineManager (28 members)
`addModCategory`, `class`, `convertText`, `copy`, `getCategories`, `getCategory`, `getContextBasedHelp`, `getCustomEnvironmentNames`, `getIsContextBasedHelpAvailable`, `initDataStructures`, `isa`, `load`, `loadCategory`, `loadFromXML`, `loadMapData`, `loadPage`, `new`, `onIconLoaded`, `onIconTrigger`, `openContextBasedHelp`, `registerCategoryXMLPaths`, `registerHelplineXMLPaths`, `superClass`, `unloadMapData`

### HerbicideMission (158 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `update`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### HighPressureWasher (8 members)
`initSpecialization`, `onDelete`, `onHandToolStoredInHolder`, `onHandToolTakenFromHolder`, `onLoad`, `prerequisitesPresent`, `registerEventListeners`

### HoeMission (159 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `update`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### HumanModelLoadingState (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### HusbandryAreaType (1 members)
—

### HusbandrySystem (25 members)
`addClusterHusbandry`, `addLivestockTrailer`, `addManureHeap`, `addPlaceable`, `addRideable`, `class`, `copy`, `delete`, `getCanAddRideable`, `getClusterHusbandryById`, `getFirstAvailableHusbandry`, `getHusbandryInRideableRange`, `getLimitReached`, `getNumOfFreeAnimalSlots`, `getNumRideablesPerFarm`, `getPlaceablesByFarm`, `isa`, `new`, `removeClusterHusbandry`, `removeLivestockTrailer`, `removeManureHeap`, `removePlaceable`, `removeRideable`, `superClass`

### I18N (60 members)
`addModI18N`, `class`, `consoleCommandVerifyAll`, `convertText`, `copy`, `delete`, `formatArea`, `formatCurrentTime`, `formatDayInPeriod`, `formatDistance`, `formatFluid`, `formatMass`, `formatMinutes`, `formatMoney`, `formatNumDay`, `formatNumMonth`, `formatNumber`, `formatPeriod`, `formatTemperature`, `formatVolume`, `getArea`, `getAreaUnit`, `getCurrency`, `getCurrencyFactor`, `getCurrencySymbol`, `getCurrentDate`, `getDistance`, `getDistanceUnit`, `getFluid`, `getMeasuringUnit`, `getPower`, `getSpeed`, `getSpeedMeasuringUnit`, `getTemperature`, `getTemperatureUnit`, `getText`, `getVolume`, `getVolumeUnit`, `hasText`, `insertTextParams`, `isa`, `load`, `loadEntriesFromXML`, `loadFromXMLFile`, `loadUsedKeysFromXML`, `mergePlatformText`, `new`, `registerXMLPaths`, `saveUsedKeysToXML`, `setMoneyUnit`, `setText`, `setUseAcre`, `setUseFahrenheit`, `setUseMiles`, `superClass`, `verifyLocaFiles`

### I3DUtil (37 members)
`checkChildIndex`, `checkForChildCollisions`, `getChildByName`, `getHasShaderParameterRec`, `getIsLinkedToNode`, `getIsSpline`, `getIsTransformGroup`, `getNodeNameAndIndexPath`, `getNodePath`, `getNodePathIndices`, `getNodesByShaderParam`, `getNodesByShaderParameters`, `getRelativeNodePathIndices`, `getShaderParameterRec`, `getSupportsLOD`, `hasNamedChildren`, `indexToObject`, `iterateRecursively`, `iterateShaderParameterNodesRecursively`, `iterateShaderParametersNodesRecursively`, `iteratorChildren`, `iteratorChildrenReverse`, `loadI3DComponents`, `loadI3DMapping`, `printChildren`, `registerI3dMappingXMLPaths`, `setDirection`, `setHideByIndexRec`, `setMaterialSlotShaderParameterRec`, `setNumberShaderByValue`, `setShaderParameter`, `setShaderParameterRec`, `setShapeBonesRec`, `setShapeCastShadowmapRec`, `setWorldDirection`, `traverseToRoot`, `wakeUpObject`

### IAPSimulator (6 members)
`addPendingPurchase`, `handleNextPurchase`, `init`

### IAProduct (13 members)
`class`, `copy`, `getDisplayItem`, `getHasBeenBought`, `getId`, `getImageFilename`, `getPriceText`, `getTitle`, `isa`, `loadFromXMLFile`, `new`, `onProductBought`, `superClass`

### IAProductCoins (13 members)
`class`, `copy`, `getDisplayItem`, `getHasBeenBought`, `getId`, `getImageFilename`, `getPriceText`, `getTitle`, `isa`, `loadFromXMLFile`, `new`, `onProductBought`, `superClass`

### IAProductStoreItem (18 members)
`class`, `copy`, `getDisplayItem`, `getHasBeenBought`, `getId`, `getImageFilename`, `getIsStoreItemOfProduct`, `getPriceText`, `getTitle`, `isa`, `loadFromXMLFile`, `new`, `onProductBought`, `onProductBoughtFinished`, `onVehicleBuyEvent`, `superClass`

### IKChain (4 members)
`debugDraw`, `new`, `setJointTransformGroup`, `solve`

### IKUtil (17 members)
`debugDrawChain`, `debugDrawChains`, `deleteIKChain`, `getIKChainByTarget`, `loadIKChain`, `loadIKChainTargets`, `loadRotationNodes`, `registerIKChainTargetsXMLPaths`, `registerIKChainXMLPaths`, `setIKChainActive`, `setIKChainDirty`, `setIKChainInactive`, `setIKChainPose`, `setRotationNodes`, `setTarget`, `updateIKChain`, `updateIKChains`

### IgnitionLockManager (20 members)
`class`, `consoleCommandToggleDebug`, `copy`, `drawDebug`, `getIsAvailable`, `getState`, `initDataStructures`, `initializeState`, `isa`, `load`, `loadMapData`, `new`, `reset`, `setState`, `superClass`, `tryToAddDevice`, `unloadMapData`, `update`

### IgnitionLockState (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### ImeSimulator (10 members)
`cancel`, `close`, `init`

### InAppPurchase (7 members)
—

### InAppPurchaseController (24 members)
`checkPendingPurchasesChanged`, `class`, `copy`, `getHasAnyPendingPurchases`, `getHasPendingPurchase`, `getHasPurchasesToRestore`, `getIsAvailable`, `getProductById`, `getProducts`, `isa`, `load`, `loadProductsFromXML`, `new`, `onPendingPurchasesChanged`, `onPurchaseEnd`, `onPurchasesRestored`, `purchase`, `restorePurchases`, `setMission`, `setPendingPurchaseCallback`, `superClass`, `tryPerformPendingPurchase`, `update`

### InAppPurchasePurchaseState (2 members)
—

### InAppPurchaseResponse (7 members)
—

### InGameMenuCalendarFrame (155 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getWindDirectionIconProfileByAngle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `meterPerSecondToBeaufort`, `mouseEvent`, `move`, `new`, `onClose`, `onDayChanged`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onHourChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onTemperatureUnitChanged`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `rebuildTable`, `register`, `reloadFocusHandling`, `reloadWeatherData`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setColorBlindMode`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPeriodTitles`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateLegend`, `updatePagingButtons`, `updateTodayBar`, `updateTodayView`, `verifyConfiguration`

### InGameMenuContractsFrame (167 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSelectedContract`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onButtonAccept`, `onButtonCancel`, `onButtonDismiss`, `onButtonLease`, `onCancelDialog`, `onChangeSubCategory`, `onClose`, `onContractsChanged`, `onDrawPostIngameMapHotspots`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onMissionCanceled`, `onMissionDeleted`, `onMissionDismissed`, `onMissionStart`, `onMissionStarted`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonsForState`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInGameMap`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `sortList`, `startContract`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonsForPermissions`, `updateDetailContents`, `updateFarmersBox`, `updateFramePosition`, `updateList`, `updateMarqueeAnimation`, `updatePagingButtons`, `updateProgressBar`, `verifyConfiguration`

### InGameMenuHelpFrame (145 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getPage`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onSelectorChanged`, `openPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateContents`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### InGameMenuHintFrame (137 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateContents`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### InGameMenuMainFrame (146 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClickAnimals`, `onClickCalendar`, `onClickHelp`, `onClickHints`, `onClickPrices`, `onClickProduction`, `onClickSettings`, `onClickStatistics`, `onClickTour`, `onClickVehicles`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### InGameMenuMapFrame (270 members)
`addCallback`, `addElement`, `addFieldInfoKeyValue`, `addFieldInfoWarning`, `addStatusMessage`, `applyProfile`, `assignItemColors`, `canReceiveFocus`, `cancelJob`, `changeScreen`, `class`, `clearFieldInfoBox`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `createJob`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `executePickingCallback`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `generateFarmlandOverlay`, `generateJobTypes`, `generateOverviewOverlay`, `getAspectScale`, `getBorders`, `getCanCancelJob`, `getCanCreateJob`, `getCanGoBack`, `getCanGoTo`, `getCanSkipJobTask`, `getCanStartJob`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasChangeableFilterList`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsPicking`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `initializeContextActions`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFilters`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onAIJobRemoved`, `onAIJobStarted`, `onAIJobStopped`, `onAITaskSkipped`, `onAIVehicleStateChanged`, `onClickBack`, `onClickBuy`, `onClickDeselectAll`, `onClickEnterVehicle`, `onClickHotspot`, `onClickList`, `onClickManage`, `onClickMap`, `onClickMapOverviewSelector`, `onClickMultiTextOptionParameter`, `onClickPositionParameter`, `onClickPositionRotationParameter`, `onClickResetVehicle`, `onClickSell`, `onClickSellVehicle`, `onClickTagPlace`, `onClickVisitPlace`, `onClose`, `onCreateJob`, `onDrawPostIngameMap`, `onDrawPostIngameMapHotspots`, `onFarmlandOverlayFinished`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onJobTypeChanged`, `onListSelectionChanged`, `onLoadMapFinished`, `onMenuMapAction1`, `onMoneyChange`, `onNextPage`, `onOpen`, `onOverviewOverlayFinished`, `onPageChanged`, `onPageNext`, `onPagePrevious`, `onPauseChanged`, `onPreviousPage`, `onSkipJobTask`, `onSoilSettingChanged`, `onStartCancelJob`, `onStartGoToJob`, `onStartedJob`, `onSwitchVehicle`, `onVehicleEntered`, `onVehicleLeft`, `onVehicleReset`, `onVehiclesChanged`, `onYesNoBuyFarmland`, `onYesNoBuyOrSellPlaceable`, `onYesNoReset`, `onYesNoSellFarmland`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `refreshContextInput`, `register`, `registerInput`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resetUIDeadzones`, `resolveSizeString`, `saveFilters`, `selectFirstHotspot`, `setAIInputContext`, `setAIVehicle`, `setAbsolutePosition`, `setActiveJobTypeSelection`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setClient`, `setColorBlindMode`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setHotspotModeActive`, `setId`, `setInGameMap`, `setInputContextCallback`, `setJobMenuVisible`, `setMapInputContext`, `setMapSelectionItem`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerFarm`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTargetPointHotspotPosition`, `setTerrainSize`, `setTitle`, `setVisible`, `setupMapOverview`, `shouldFocusChange`, `showActionMessage`, `showMapHotspot`, `skipCurrentTask`, `startGoToJob`, `startJob`, `startPickPosition`, `startPickPositionAndRotation`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `toggleMapInput`, `touchEvent`, `tryStartGoToJob`, `tryStartJob`, `unlinkElement`, `unregisterInput`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateContextInputBarVisibility`, `updateFieldInfoBox`, `updateFramePosition`, `updateInputGlyphs`, `updateMapSelectionFilterNavigation`, `updatePagingButtons`, `updateParameterValueTexts`, `updateStatusMessages`, `updateWarnings`, `validateParameters`, `verifyConfiguration`

### InGameMenuMapUtil (9 members)
`getContextBoxPositionAndOrientation`, `getFieldInfoBoxOrientation`, `getHotspotVehicle`, `hideContextBox`, `showContextBox`, `showPlayerContextBox`, `updateContextBoxPosition`, `updateFieldInfoBoxPosition`

### InGameMenuMultiplayerFrame (205 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFarm`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `deleteFarm`, `disableInputForDuration`, `doJoinFarm`, `doLeaveFarm`, `draw`, `editFarm`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCellTypeForItemInSection`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getListFarmIndex`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSortedFarmList`, `getSortedUsers`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `joinFarm`, `keyEvent`, `leaveFarm`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onAdminLoginSuccess`, `onAdminPassword`, `onButtonAdminLogin`, `onButtonBlock`, `onButtonBlockFromServer`, `onButtonInviteFriends`, `onButtonKick`, `onButtonMute`, `onButtonReport`, `onButtonShowProfile`, `onButtonUnBan`, `onButtonUnBanRemote`, `onClickContractor`, `onClickFarms`, `onClickPermission`, `onClickPromote`, `onClickRemoveFromFarm`, `onClickTransferButton`, `onClickUsers`, `onClose`, `onContractingStateChanged`, `onDeleteFarmYesNo`, `onDoubleClickFarm`, `onFarmCreated`, `onFarmMoneyChanged`, `onFarmPasswordEntered`, `onFarmsChanged`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onMasterUserAdded`, `onNextPage`, `onOpen`, `onPageChanged`, `onPeerVolumeChanged`, `onPermissionChanged`, `onPlayerFarmChanged`, `onPlayerSetFarmAnswer`, `onPreviousPage`, `onUserAdded`, `onUserRemoved`, `onYesNoKick`, `onYesNoPromoteToFarmManager`, `onYesNoRemoveFromFarm`, `onYesNoToggleContractorState`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFarms`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setCurrentUserId`, `setDisabled`, `setFarmBalance`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayer`, `setPlayerFarm`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setUsers`, `setVisible`, `setupUserListFocusContext`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `transferMoney`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateDisplay`, `updateElements`, `updateFramePosition`, `updateMenuButtons`, `updatePagingButtons`, `updateSubCategoryPages`, `verifyConfiguration`

### InGameMenuProductionFrame (160 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCellTypeForItemInSection`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getProductionPoints`, `getRootElement`, `getSelectedProduction`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onButtonActivate`, `onButtonHotspot`, `onButtonToggleOutputMode`, `onButtonVisit`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerFarm`, `setPosition`, `setSelected`, `setSelectedProductionPoint`, `setSize`, `setSoundSuppressed`, `setStatusBarValue`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unloadMapData`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateMenuButtons`, `updatePagingButtons`, `updateProductionLists`, `verifyConfiguration`

### InGameMenuSaveFrame (146 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onButtonControls`, `onButtonFocused`, `onButtonGameSettings`, `onButtonHelp`, `onButtonQuit`, `onButtonSaveGame`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMenuAccept`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHasMasterRights`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateMenuButtons`, `updatePagingButtons`, `verifyConfiguration`

### InGameMenuSettingsFrame (329 members)
`addCallback`, `addElement`, `applyGraphicSettings`, `applyProfile`, `assignAutoSaveTexts`, `assignDeviceTableData`, `assignDirtTexts`, `assignDynamicTexts`, `assignEconomicDifficultyTexts`, `assignServerSettings`, `assignStaticTexts`, `assignTimeScaleTexts`, `bindControls`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `initializeButtons`, `initializeGameSettings`, `initializeGeneralSettings`, `initializeGraphicSettings`, `initializeSubCategoryPages`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `notifyInputGatheringFinished`, `onApplyDeadzoneChanges`, `onApplyGraphicSettings`, `onAxisLeftRight`, `onAxisUpDown`, `onButtonUnBan`, `onButtonUnBanRemote`, `onClick`, `onClickAtmosphereQuality`, `onClickAutoSaveInterval`, `onClickAutomaticMotorStart`, `onClickBinaryOption`, `onClickBrightness`, `onClickCloudShadowsQuality`, `onClickControls`, `onClickDRSTargetFPS`, `onClickDeadzoneSettings`, `onClickDefaults`, `onClickDirt`, `onClickDisasterDestructionState`, `onClickEconomicDifficulty`, `onClickFixedSeasonalVisuals`, `onClickFoliageDrawDistance`, `onClickFoliageLODDistance`, `onClickFoliageShadows`, `onClickFovY`, `onClickFovYPlayerFirstPerson`, `onClickFovYPlayerThirdPerson`, `onClickFrameGeneration`, `onClickFrameLimit`, `onClickFruitDestruction`, `onClickFuelUsage`, `onClickFullscreenMode`, `onClickGameSettings`, `onClickGeneralSettings`, `onClickGraphicSettingss`, `onClickGrowthMode`, `onClickHelperRefillFertilizer`, `onClickHelperRefillFuel`, `onClickHelperRefillManure`, `onClickHelperRefillSeed`, `onClickHelperRefillSlurry`, `onClickLODDistance`, `onClickLightsProfile`, `onClickLimeRequired`, `onClickLockedIcon`, `onClickMaxMirrors`, `onClickMaxTireTracks`, `onClickMultiOption`, `onClickNativeHelp`, `onClickNextRow`, `onClickNextSubCategory`, `onClickObjectDrawDistance`, `onClickPPAA`, `onClickPauseGame`, `onClickPerformanceClass`, `onClickPlannedDaysPerPeriod`, `onClickPlowingRequired`, `onClickPrevRow`, `onClickPreviousSubCategory`, `onClickRealBeaconLights`, `onClickRealBeaconLightsConsole`, `onClickResolution`, `onClickResolutionScale`, `onClickResolutionScale3d`, `onClickSSAOQuality`, `onClickScalingMode`, `onClickScalingModeQuality`, `onClickServerAllowOnlyFriends`, `onClickServerAutoAccept`, `onClickServerNumPlayers`, `onClickServerSettings`, `onClickShaderQuality`, `onClickShadingRateQuality`, `onClickShadowDistanceQuality`, `onClickShadowMapFiltering`, `onClickShadowMaxLights`, `onClickShadowQuality`, `onClickSharpness`, `onClickSnowEnabled`, `onClickSoftShadows`, `onClickStonesEnabled`, `onClickStopAndGoBraking`, `onClickTerrainLODDistance`, `onClickTerrainQuality`, `onClickTextureResolution`, `onClickTimeScale`, `onClickTraffic`, `onClickTrailerFillLimit`, `onClickUIScale`, `onClickVSync`, `onClickVolumeMeshTessellation`, `onClickWeedsEnabled`, `onClose`, `onControllerChanged`, `onCreateBrightness`, `onCreateDRSTargetFPS`, `onCreateFoliageDrawDistance`, `onCreateFoliageLODDistance`, `onCreateFovY`, `onCreateFovYPlayerFirstPerson`, `onCreateFovYPlayerThirdPerson`, `onCreateFrameGenerationTooltip`, `onCreateFrameLimit`, `onCreateLODDistance`, `onCreateLightsProfile`, `onCreateMaxMirrors`, `onCreateMaxTireTracks`, `onCreateNumPlayer`, `onCreateObjectDrawDistance`, `onCreatePPAAToolTip`, `onCreatePerformanceClass`, `onCreateResolutionScale`, `onCreateResolutionScale3d`, `onCreateSSAOQuality`, `onCreateScalingMode`, `onCreateScalingModeQuality`, `onCreateShaderQuality`, `onCreateShadingRateQuality`, `onCreateShadowDistanceQuality`, `onCreateShadowMapFiltering`, `onCreateShadowMaxLights`, `onCreateShadowQuality`, `onCreateSharpness`, `onCreateSoftShadows`, `onCreateTerrainLODDistance`, `onCreateTerrainQuality`, `onCreateTextureResolution`, `onCreateUIScale`, `onCreateVolumeMeshTessellation`, `onEnterOrEscPressedServerPassword`, `onEnterPressedSavegameName`, `onEnterPressedServerName`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFocusLockedIcon`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onInputClicked`, `onMenuAcceptUp`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onSwitchDevice`, `onYesNoSaveControls`, `onYesNoSaveGraphicSettings`, `onYesNoSaveServerSettings`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `revertChanges`, `saveControlChanges`, `saveServerChanges`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setControlsMessage`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHasMasterRights`, `setHighlighted`, `setId`, `setInputContextCallback`, `setManureTriggers`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setMissionInfo`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `setupControlsView`, `shouldFocusChange`, `showInputPrompt`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAlternatingElements`, `updateAnchorDeltas`, `updateButtons`, `updateController`, `updateDeadzoneView`, `updateFramePosition`, `updateGameSettings`, `updateGamepadInputStates`, `updateGeneralSettings`, `updateGraphicSettings`, `updateHeader`, `updateListHeaderNames`, `updatePagingButtons`, `updatePauseButtonState`, `updateSavegameName`, `updateSubCategoryPages`, `verifyConfiguration`

### InGameMenuTourFrame (139 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onAbortTourAnswer`, `onButtonCancel`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateContents`, `updateFramePosition`, `updateMenuButtons`, `updatePagingButtons`, `verifyConfiguration`

### IndexedSearch (16 members)
`addDocument`, `build`, `cancel`, `class`, `cleanSpecialCharacters`, `clear`, `copy`, `indexDocument`, `isa`, `new`, `reset`, `search`, `sendCallback`, `superClass`, `tokenize`, `update`

### IndoorMask (21 members)
`class`, `consoleCommandToggleMask`, `copy`, `delete`, `drawDebug`, `getDensityMapData`, `getFilter`, `getIsIndoorAtWorldPosition`, `hasMask`, `isa`, `loadMapData`, `new`, `onTerrainLoad`, `setParallelogramUVCoords`, `setStateByArea`, `superClass`

### InfoLayer (22 members)
`class`, `convertWorldToLocalPosition`, `copy`, `create`, `delete`, `getId`, `getValueAtParallelogram`, `getValueAtPos`, `getValueAtWorldParallelogram`, `getValueAtWorldPos`, `isa`, `load`, `loadFromMemory`, `loadFromXML`, `new`, `newFromMap`, `readStream`, `saveToFile`, `setValueAtArea`, `setValueAtWorldParallelogram`, `superClass`, `writeStream`

### IngameMapLayout (34 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `setHasUnreadMessages`, `setMapExtensionSettings`, `setPlayerPosition`, `setPlayerVelocity`, `setWorldSize`, `storeScaledValues`, `superClass`

### IngameMapLayoutCircle (37 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `drawNorthArrow`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `rotateWithMap`, `setHasUnreadMessages`, `setMapExtensionSettings`, `setPlayerPosition`, `setPlayerVelocity`, `setWorldSize`, `storeScaledValues`, `superClass`, `updateScreenValues`

### IngameMapLayoutFullscreen (37 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `setHasUnreadMessages`, `setMapCenter`, `setMapExtensionSettings`, `setMapWidth`, `setMapZoom`, `setPlayerPosition`, `setPlayerVelocity`, `setWorldSize`, `storeScaledValues`, `superClass`

### IngameMapLayoutNone (34 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `setHasUnreadMessages`, `setMapExtensionSettings`, `setPlayerPosition`, `setPlayerVelocity`, `setWorldSize`, `storeScaledValues`, `superClass`

### IngameMapLayoutPartialscreen (41 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `setCenterToWorldPosition`, `setHasUnreadMessages`, `setMapAlpha`, `setMapCenter`, `setMapExtensionSettings`, `setMapZoom`, `setMapZoomByWidthAndHeight`, `setPlayerPosition`, `setPlayerVelocity`, `setPreviewPosition`, `setPreviewSize`, `setWorldSize`, `storeScaledValues`, `superClass`

### IngameMapLayoutSquare (35 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `setHasUnreadMessages`, `setMapExtensionSettings`, `setPlayerPosition`, `setPlayerVelocity`, `setWorldSize`, `storeScaledValues`, `superClass`, `updateScreenValues`

### IngameMapLayoutSquareLarge (34 members)
`activate`, `class`, `copy`, `createComponents`, `deactivate`, `delete`, `drawAfter`, `drawBefore`, `drawCoordinates`, `drawLatency`, `getBlinkPlayerArrow`, `getHeight`, `getIconZoom`, `getMapAlpha`, `getMapObjectPosition`, `getMapPivot`, `getMapPosition`, `getMapRotation`, `getMapSize`, `getPosition`, `getShowSmallIconVariation`, `getShowsToggleAction`, `getShowsToggleActionText`, `getWidth`, `isa`, `new`, `postUpdate`, `setHasUnreadMessages`, `setMapExtensionSettings`, `setPlayerPosition`, `setPlayerVelocity`, `setWorldSize`, `storeScaledValues`, `superClass`

### IngameMapState (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### Input (358 members)
`addButtonDefine`, `addFullAxisDefine`, `addHalfAxisDefine`, `addKeyDefine`, `addMouseButtonDefine`, `isHalfAxis`, `isKeyPressed`, `isMouseButtonPressed`, `updateFrameEnd`, `updateKeyState`, `updateMouseButtonState`

### InputAction (328 members)
`addBinding`, `class`, `clearBindings`, `clone`, `copy`, `createFromXML`, `disableBinding`, `enableBinding`, `getActiveBindings`, `getBindingAtSlot`, `getBindings`, `getIgnoreComboMask`, `getIsSupportedOnCurrentPlatform`, `getNumActiveBindings`, `isFullAxis`, `isa`, `new`, `removeBinding`, `resetActiveBindings`, `setPrimaryKeyboardBinding`, `superClass`, `toString`

### InputDevice (26 members)
`class`, `copy`, `getDeadzone`, `getDeviceIdPrefix`, `getIsDeviceSupported`, `getIsForceFeedbackSupported`, `getPrefixedDeviceId`, `getSensitivity`, `isController`, `isa`, `loadCategoryFromXML`, `loadIdFromXML`, `loadNameFromXML`, `loadSettingsFromXML`, `new`, `saveSettingsToXML`, `setDeadzone`, `setForceFeedback`, `setSensitivity`, `superClass`, `toString`, `updateForceFeedbackState`

### InputDisplayManager (66 members)
`addComboSymbols`, `addContextBindings`, `addRegularSymbols`, `class`, `consoleCommandShowInputControllerSymbols`, `copy`, `createButtonOverlay`, `debugRenderControllerSymbols`, `delete`, `draw`, `getActionBindingsForContext`, `getComboHelpElements`, `getControllerSymbolOverlays`, `getEventHelpElementForAction`, `getEventHelpElements`, `getFirstBindingAxisAndDeviceForActionName`, `getGamepadInputActionOverlay`, `getGamepadInputSymbolName`, `getKeyboardBindings`, `getKeyboardInputActionKey`, `getKeyboardKeyOverlay`, `getMouseInputSymbolName`, `getOrOverlay`, `getPlusOverlay`, `getPrefix`, `isa`, `load`, `loadAxisIcons`, `loadControllerSymbolsAndOverlays`, `loadModAxisIcons`, `makeHelpElement`, `makeHelpElementForBinding`, `new`, `onActionBindingsChanged`, `onActionEventsChanged`, `requireSymbolAccumulation`, `resolveAccumulatedSymbolPermutations`, `resolveModifierSymbols`, `resolveUnmodifiedSymbols`, `setDevGamepadLabelMapping`, `sortEventHelpElements`, `sortEventHelpElementsGamepad`, `storeComboHelpElements`, `storeEventHelpElements`, `superClass`

### InputEvent (14 members)
`class`, `copy`, `frameReset`, `getIgnoreComboMask`, `getTriggerCode`, `initializeDisplayText`, `isa`, `makeId`, `new`, `notifyInput`, `setIgnoreComboMask`, `superClass`, `toString`

### InputHelpElement (9 members)
`class`, `copy`, `getActionNames`, `isa`, `new`, `superClass`

### InterpolationTime (11 members)
`class`, `copy`, `getAlpha`, `isInterpolating`, `isa`, `new`, `reset`, `startNewPhase`, `startNewPhaseNetwork`, `superClass`, `update`

### InterpolatorAngle (10 members)
`clampValue`, `class`, `copy`, `getInterpolatedValue`, `isa`, `new`, `setAngle`, `setMinMax`, `setTargetAngle`, `superClass`

### InterpolatorPosition (8 members)
`class`, `copy`, `getInterpolatedValues`, `isa`, `new`, `setPosition`, `setTargetPosition`, `superClass`

### InterpolatorQuaternion (8 members)
`class`, `copy`, `getInterpolatedValues`, `isa`, `new`, `setQuaternion`, `setTargetQuaternion`, `superClass`

### InterpolatorSplineTime (9 members)
`clampValue`, `class`, `copy`, `getInterpolatedValue`, `isa`, `new`, `setTargetValue`, `setValue`, `superClass`

### InterpolatorValue (10 members)
`clampValue`, `class`, `copy`, `getInterpolatedValue`, `isa`, `new`, `setMinMax`, `setTargetValue`, `setValue`, `superClass`

### IntersectMode (3 members)
—

### IntroductionHelpHUDUtil (33 members)
`delete`, `drawHelp`, `drawMessage`, `drawSkipMessage`, `init`, `setScale`

### IntroductionHelpSystem (31 members)
`class`, `copy`, `delete`, `draw`, `getCanShowHelp`, `getIsActive`, `getIsHelpVisible`, `getShownHints`, `hideAll`, `hideHelp`, `isa`, `loadHelpElementsFromXML`, `loadShownElements`, `new`, `onAppSuspended`, `onContinueNext`, `onContinueNextTouch`, `onMenuOpen`, `registerHelp`, `registerHint`, `resetElement`, `resetHelpSystem`, `resetHelpSystemWithDraw`, `revertInputContext`, `saveShownElements`, `setIsActive`, `showHelp`, `showHint`, `superClass`, `update`

### ItemSystem (21 members)
`addItem`, `class`, `consoleCommandItemRemoveAll`, `copy`, `delete`, `deleteAll`, `getItemByUniqueId`, `handleItemLoadResult`, `isa`, `loadItemFromSavegameFinished`, `loadItemFromXML`, `loadItems`, `loadItemsFromSavegameFinished`, `loadItemsFromXML`, `new`, `removeItem`, `save`, `saveToXML`, `superClass`

### JoinGameScreen (173 members)
`addCallback`, `addElement`, `applyProfile`, `buildSortFunc`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `filterServer`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSelectedServer`, `getServers`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isSelectedServerValid`, `isa`, `keyEvent`, `loadFilterSettings`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickAllowCrossPlay`, `onClickBack`, `onClickCancel`, `onClickCapacity`, `onClickHeader`, `onClickLanguage`, `onClickMap`, `onClickMaxNumPlayers`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickModsDlcs`, `onClickOk`, `onClickOpenBlocklist`, `onClickPassword`, `onClickShop`, `onClickSort`, `onClose`, `onCreateLanguage`, `onCreateMaxNumPlayers`, `onDoubleClick`, `onFocusActivate`, `onFocusEnter`, `onFocusGameName`, `onFocusHeader`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onInputModeChanged`, `onLeaveGameName`, `onLeaveHeader`, `onListSelectionChanged`, `onMasterServerConnectionFailed`, `onMasterServerConnectionReady`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPasswordEntered`, `onServerInfo`, `onServerInfoDetails`, `onServerInfoDetailsFailed`, `onServerInfoEnd`, `onServerInfoStart`, `onServerNameChanged`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `saveFilterSettings`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `showSortButton`, `startGame`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `triggerRebuildOnFilterChange`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtons`, `updateDisplayedServers`, `updateFramePosition`, `verifyConfiguration`

### JointConstructor (27 members)
`finalize`, `new`, `setActors`, `setAlignAToProjectedZXFromB`, `setAngularDrive`, `setBreakable`, `setEnableCollision`, `setJointLocalAxes`, `setJointLocalNormals`, `setJointLocalPositions`, `setJointLocalRotations`, `setJointTransforms`, `setJointWorldAxes`, `setJointWorldNormals`, `setJointWorldPositions`, `setJointWorldRotations`, `setLinearDrive`, `setRotateOrder`, `setRotationDrag`, `setRotationLimit`, `setRotationLimitForceLimit`, `setRotationLimitSpring`, `setTranslationDrag`, `setTranslationLimit`, `setTranslationLimitForceLimit`, `setTranslationLimitSpring`, `setZRotationXOffset`

### JointRotateOrder (7 members)
—

### KeyboardHelper (6 members)
`getDisplayKeyName`, `getInputDisplayText`, `getKeyNameTable`, `getKeyNames`, `getKeysXMLString`

### KickBanEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### KickBanNotificationEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### KioskMode (88 members)
`EMPTY_FUNC`, `addRegisteredMaps`, `class`, `closeMainMenu`, `copy`, `delete`, `disposeVideo`, `draw`, `drawEndSlide`, `generateBitmasks`, `getEndSlideOnLoad`, `getProfile`, `getSetting`, `init`, `initProfileSelectorGamepad`, `initializedGUIClasses`, `inj_Farm_setInitialEconomy`, `inj_animalLoadingTrigger_load`, `inj_careerScreen_update`, `inj_careerScreen_updateButtons`, `inj_environment_load`, `inj_fsBaseMission_getIsAutoSaveSupported`, `inj_fsBaseMission_update`, `inj_gui_changeScreen`, `inj_gui_showGui`, `inj_hud_createDisplayComponents`, `inj_inGameMenuMapFrame_updateInputGlyphs`, `inj_inGameMenuMobileSettingsFrame_onFrameOpen`, `inj_inGameMenuSettingsFrame_initializeButtons`, `inj_inGameMenu_makeIsAIEnabledPredicate`, `inj_inGameMenu_makeIsAnimalsEnabledPredicate`, `inj_inGameMenu_makeIsContractsEnabledPredicate`, `inj_inGameMenu_makeIsGarageEnabledPredicate`, `inj_inGameMenu_makeIsHelpEnabledPredicate`, `inj_inGameMenu_makeIsPricesEnabledPredicate`, `inj_inGameMenu_makeIsSettingsEnabledPredicate`, `inj_ingameMap_registerInput`, `inj_inputBinding_loadModActions`, `inj_inputBinding_loadModBindingDefaults`, `inj_loanTrigger_new`, `inj_mainScreen_inputEvent`, `inj_mainScreen_onClose`, `inj_mainScreen_onOpen`, `inj_mainScreen_update`, `inj_mapManager_addMapItem`, `inj_messageCenter_publish`, `inj_mission00_getIsTourSupported`, `inj_mission00_onStartMission`, `inj_modSelectionScreenn_update`, `inj_mpLoadingScreen_onReadyToStart`, `inj_newGameScreen_update`, `inj_playerInputComponent_getCanToggleCamera`, `inj_playerInputComponent_registerGlobalPlayerActionEvents`, `inj_playerSystem_loadFromSavegameXML`, `inj_productionPointActivatable_run`, `inj_railroadCallerActivatable_run`, `inj_shopTrigger_new`, `inj_specializationManager_addSpecialization`, `inj_storeManager_getDefaultStoreItemsFilename`, `inj_vehicleSellingPoint_load`, `isa`, `load`, `loadFromPath`, `loadInputActions`, `loadInputBindings`, `loadProfileConfig`, `new`, `nextVideo`, `onPlaytimeReload`, `onReloadSavegame`, `onResetFiles`, `onStartVideos`, `onToggleLanguage`, `openMainMenu`, `registerGlobalInputActionEvents`, `resetVideoTimer`, `setSavegame`, `setupMainMenu`, `superClass`, `update`, `updateAvailableMaps`

### Ladders (6 members)
`onDelete`, `onLoad`, `prerequisitesPresent`, `registerEventListeners`, `registerXMLPaths`

### Landscaping (26 members)
`addModifiedCircleArea`, `addModifiedSquareArea`, `assignPaintingParameters`, `assignSculptingParameters`, `assignSmoothingParameters`, `class`, `copy`, `delete`, `getCost`, `hasObjectOverlapInModificationArea`, `isModificationAreaOnOwnedLand`, `isModificationAreaPlacementBlocked`, `isa`, `new`, `onSculptingApplied`, `onSculptingValidated`, `sculpt`, `superClass`

### LandscapingSculptEvent (13 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `onSculptingFinished`, `readStream`, `run`, `superClass`, `writeStream`

### LeaseYesNoDialog (163 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setPrices`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### LensFlareQuality (4 members)
—

### LevelerEffect (37 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setFillLevel`, `setLastVehicleSpeed`, `setOffset`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `transformEffectNode`, `update`

### LicensePlateDialog (171 members)
`acceptDialog`, `addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `createKeyboards`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getUnicodeToKeyboardValue`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadMapData`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickChangeColor`, `onClickCursorLeft`, `onClickCursorRight`, `onClickKeyboardButton`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickPlacementOptionChanged`, `onClickShop`, `onClickTypeOptionChanged`, `onClose`, `onCreate`, `onCreatePlacementOption`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPickedColor`, `onRenderLoad`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonAction`, `setButtonTexts`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setLicensePlateData`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unloadMapData`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateColorButton`, `updateCursor`, `updateFocusLinking`, `updateFramePosition`, `updateLicensePlate`, `updateLicensePlateGraphics`, `updatePlacementOptions`, `updateVariations`, `verifyConfiguration`

### LifetimeStats (13 members)
`class`, `copy`, `delete`, `getTotalRuntime`, `isa`, `load`, `new`, `reload`, `save`, `superClass`, `update`

### LiftableAxle (23 members)
`actionEvent`, `getIsSmoothAttachUpdateAllowed`, `getLiftableAxleAttacherJointHeight`, `initSpecialization`, `onFillUnitFillLevelChanged`, `onLoad`, `onPostLoad`, `onPreAttach`, `onPreAttachImplement`, `onPreDetach`, `onPreDetachImplement`, `onReadStream`, `onRegisterActionEvents`, `onWriteStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `saveToXMLFile`, `setLiftableAxleState`, `updateActionEvents`

### LightType (3 members)
—

### Lighting (34 members)
`apply`, `class`, `copy`, `createCurve`, `delete`, `fileInterpolator`, `getColorGradingFileCurve`, `getDaylightFactor`, `getEnvMapBaseFilename`, `getHardcodedFromTime`, `getTimeFromHardcoded`, `isa`, `load`, `loadCurveDataFromXML`, `loadFileCurveDataFromXML`, `new`, `reset`, `setCloudEnvMapInfo`, `setDayTime`, `setDaylightTimes`, `setFixedExposureSettings`, `setSnowHeight`, `setSnowHeightThreshold`, `setSunHeightAngle`, `setVisualSeason`, `superClass`, `update`, `updateAtmosphere`, `updateCurves`, `updateEnvAlbedo`, `updateEnvMap`, `updateExposureSettings`, `updateSunHeight`, `updateSunLocation`

### LightingStatic (34 members)
`apply`, `class`, `copy`, `createCurve`, `delete`, `fileInterpolator`, `getColorGradingFileCurve`, `getDaylightFactor`, `getEnvMapBaseFilename`, `getHardcodedFromTime`, `getTimeFromHardcoded`, `isa`, `load`, `loadCurveDataFromXML`, `loadFileCurveDataFromXML`, `new`, `reset`, `setCloudEnvMapInfo`, `setDayTime`, `setDaylightTimes`, `setFixedExposureSettings`, `setSnowHeight`, `setSnowHeightThreshold`, `setSunHeightAngle`, `setVisualSeason`, `superClass`, `update`, `updateAtmosphere`, `updateCurves`, `updateEnvAlbedo`, `updateEnvMap`, `updateExposureSettings`, `updateSunHeight`, `updateSunLocation`

### Line3D (22 members)
`applyShaderParameters`, `class`, `clearVisualization`, `copy`, `delete`, `getIsLoaded`, `getPolylineSegmentLengths`, `isa`, `new`, `onVisualsLoaded`, `setBoneDirection`, `setLineScale`, `superClass`, `visualizeLine`, `visualizePolyline`

### LoadI3DFailedReason (4 members)
—

### LoadTriggerSetIsLoadingEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `sendEvent`, `superClass`, `writeStream`

### LogGrab (39 members)
`actionEventClawAnimation`, `addNodeObjectMapping`, `getGrabCanMountSplitShape`, `getIsLogGrabClawStateChangeAllowed`, `getMovingToolMoveValue`, `initSpecialization`, `loadLogGrabFromXML`, `logGrabTriggerCallback`, `mountSplitShape`, `onCutTree`, `onDelete`, `onDelimbTree`, `onFoldStateChanged`, `onFoldTimeChanged`, `onLoad`, `onLogGrabMountedTreesChanged`, `onPostLoad`, `onReadStream`, `onRegisterActionEvents`, `onTurnedOff`, `onTurnedOn`, `onUpdateTick`, `onWriteStream`, `prerequisitesPresent`, `registerEventListeners`, `registerEvents`, `registerFunctions`, `registerLogGrabXMLPaths`, `registerOverwrittenFunctions`, `removeNodeObjectMapping`, `saveToXMLFile`, `setComponentJointFrame`, `setLogGrabClawState`, `unmountSplitShape`, `updateActionEvents`, `updateDebugValues`, `updateLogGrabClawState`

### MPLoadingScreen (180 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancelLoading`, `changeScreen`, `class`, `cleanup`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `dlcProblemOnQuitOk`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumPendingObjects`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hitLoadingTarget`, `include`, `initializeLoading`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadGameRelatedData`, `loadProfile`, `loadSavegameAndStart`, `loadWithConnection`, `modSortFunc`, `mouseEvent`, `move`, `new`, `onBackAction`, `onCancelSavegameLoading`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onEnqueuedAllLoadings`, `onFinishedReceivingDynamicData`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMasterServerConnectionFailed`, `onMasterServerConnectionReady`, `onNatPunchFailed`, `onNatPunchSuceeded`, `onOkSavegameCloudConflict`, `onOkSavegameLoadFailed`, `onOpen`, `onPageNext`, `onPagePrevious`, `onReadyToStart`, `onSaveGameLoadingFinished`, `onSavegameLoaded`, `onServerInfoDetails`, `onServerInfoDetailsFailed`, `onWaitingForAccept`, `onWaitingForDynamicData`, `onYesNoSavegameCorrupted`, `openWardrobe`, `playSample`, `raiseCallback`, `register`, `reloadAsNewSavegame`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonState`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setGameplayHint`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMapTitleAndPreview`, `setMissionInfo`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `showFailedToConnectDialog`, `showPortTesting`, `startClient`, `startLocal`, `startServer`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unloadGameRelatedData`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### MSAA (4 members)
—

### ManureHeap (58 members)
`addDeleteListener`, `addFillLevelChangedListeners`, `addLoadingStation`, `addUnloadingStation`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `finalize`, `getCapacity`, `getFillLevel`, `getFillLevels`, `getFreeCapacity`, `getIsDelayedLoaded`, `getIsFillTypeSupported`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getSupportedFillTypes`, `getUpdatePriority`, `isa`, `load`, `loadFromXMLFile`, `new`, `onFillLevelChanged`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onVehicleCallback`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeDeleteListener`, `removeFillLevelChangedListeners`, `removeLoadingStation`, `removeManure`, `removeUnloadingStation`, `resetObjectIds`, `saveToXMLFile`, `setFillLevel`, `setOwnerConnection`, `setOwnerFarmId`, `superClass`, `unregister`, `update`, `updateEnd`, `updateTick`, `updateTotalFillLevel`, `writeStream`, `writeUpdateStream`

### MapHotspot (59 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### MapManager (17 members)
`addMapItem`, `class`, `copy`, `getMapByConfigFilename`, `getMapById`, `getMapDataByIndex`, `getModNameFromMapId`, `getNumOfMaps`, `initDataStructures`, `isa`, `load`, `loadMapData`, `loadMapFromXML`, `new`, `removeMapItem`, `superClass`, `unloadMapData`

### MapObjectDestroyedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### Marker3D (14 members)
`applyEmitColor`, `class`, `clearVisualization`, `copy`, `delete`, `getIsLoaded`, `isa`, `new`, `onVisualsLoaded`, `setScale`, `superClass`, `visualizeMarker`

### MasterServerConnection (31 members)
`class`, `connectToMasterServer`, `connectToMasterServerFront`, `copy`, `disconnectFromMasterServer`, `init`, `isa`, `new`, `onConnectionFailed`, `onConnectionReady`, `onMasterServerList`, `onMasterServerListEnd`, `onMasterServerListStart`, `onServerInfo`, `onServerInfoDetails`, `onServerInfoDetailsFailed`, `onServerInfoEnd`, `onServerInfoStart`, `reconnectToMasterServer`, `setCallbackTarget`, `superClass`

### MasterServerServerDetailsFailedReason (2 members)
—

### MaterialCalibrationSolver (17 members)
`getCurrentSRGB`, `getTargetSRGB`, `isDone`, `iterate`, `new`, `prepare`, `reset`, `setChannels`, `setCustomParameterChannelValueRange`, `setCustomParameterChannels`, `setShape`, `setSpectrumData`, `setValueRangeChannelB`, `setValueRangeChannelG`, `setValueRangeChannelMetalness`, `setValueRangeChannelR`, `setValueRangeChannelSmoothness`

### MaterialType (19 members)
—

### MeadowCreationTask (50 members)
`addFilter`, `cancel`, `class`, `clearCultivatedFruit`, `clearDecoFoliage`, `clearHeight`, `clearTireTracks`, `copy`, `enqueue`, `getField`, `getIsFinished`, `getName`, `getName`, `isa`, `loadFromXMLFile`, `new`, `onTerrainDeformationTaskFinished`, `prepare`, `prepareClearCultivatedFruit`, `prepareClearDecoFoliage`, `registerXMLPaths`, `resetDisplacement`, `saveToXMLFile`, `setArea`, `setDecoFoliage`, `setField`, `setFieldGroundValue`, `setFieldType`, `setFinished`, `setFruit`, `setGroundAngle`, `setGroundType`, `setLimeLevel`, `setName`, `setNeedsSaving`, `setPerlinFilter`, `setPlowLevel`, `setRollerLevel`, `setSprayLevel`, `setSprayType`, `setStoneLevel`, `setStubbleShredLevel`, `setTerrainGroundType`, `setValue`, `setWaterLevel`, `setWeedState`, `start`, `superClass`, `tryFinish`, `update`

### MessageCenter (17 members)
`class`, `consoleCommandDrawMessages`, `consoleCommandPrintActiveSubscribers`, `copy`, `delete`, `drawDebug`, `isa`, `new`, `publish`, `publishDelayed`, `publishDelayedAfterFrames`, `subscribe`, `subscribeOneshot`, `superClass`, `unsubscribe`, `unsubscribeAll`, `update`

### MessageDialog (142 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### MessageIds (14 members)
—

### MessageType (117 members)
`getMessageNameById`

### MilkingRobot (9 members)
`class`, `copy`, `delete`, `finalizePlacement`, `isa`, `load`, `new`, `onI3DFileLoaded`, `superClass`

### Mission00 (305 members)
`accumulatePlayedTime`, `addChatMessage`, `addDrawable`, `addExtraPrintText`, `addGameNotification`, `addHelpAxis`, `addHelpButtonText`, `addHelpTrigger`, `addIngameNotification`, `addItemToList`, `addKnownSplitShape`, `addLeasedItem`, `addLeasedItem`, `addLiquidManureLoadingStation`, `addManureLoadingStation`, `addMapHotspot`, `addMoney`, `addMoneyChange`, `addNodeObject`, `addNonUpdateable`, `addOwnedItem`, `addOwnedItem`, `addPauseListeners`, `addPurchasedMoney`, `addTrainSystem`, `addTriggerMarker`, `addUpdateable`, `banUser`, `broadcastEventToFarm`, `broadcastEventToMasterUser`, `broadcastMissionDynamicInfo`, `broadcastNotifications`, `canPlayerChangeNickname`, `canStartMission`, `canUnpauseGame`, `cancelPlayersSynchronizing`, `checkRecordingDeviceState`, `class`, `consoleActivateCameraPath`, `consoleCommandCheatMoney`, `consoleCommandDisplacementDebug`, `consoleCommandDisplacementReset`, `consoleCommandExportStoreItems`, `consoleCommandRender360Screenshot`, `consoleCommandRunDSDensityMapUtil`, `consoleCommandSaveGame`, `consoleCommandSetShaderParameter`, `consoleCommandTeleport`, `consoleCommandTogglePhysicsStressTest`, `consoleCommandValidateUnloadTriggers`, `consoleStartGreatDemand`, `copy`, `createHUD`, `delete`, `dlcProblemOnQuitOk`, `doPauseGame`, `doUnpauseGame`, `draw`, `fadeScreen`, `farmStats`, `findDynamicObjects`, `finishLoadingTask`, `getAllowsGuiDisplay`, `getCanAcceptPlayers`, `getCanShowHelpTriggers`, `getCanShowHelpTriggers`, `getClientGuiVisibility`, `getClientPosition`, `getDefaultServerName`, `getDoghouse`, `getEffectiveTimeScale`, `getFarmId`, `getFruitPixelsToSqm`, `getHarvestScaleMultiplier`, `getHasDrawable`, `getHasPlayerPermission`, `getHasUpdateable`, `getIngameMap`, `getInteractiveVehicleInRange`, `getIsAutoSaveSupported`, `getIsClient`, `getIsRadioPlaying`, `getIsServer`, `getIsTourSupported`, `getIsTrailerInTipRange`, `getLastCreatedLicensePlate`, `getMoney`, `getNodeObject`, `getNumLeasedItems`, `getNumListItems`, `getNumOfItems`, `getNumOwnedItems`, `getObjectByUniqueId`, `getPedestrianSystem`, `getPlayerByConnection`, `getResetPlaces`, `getServerUserId`, `getSynchronizingPercentage`, `getTerrainDetailPixelsToSqm`, `getTrafficSystem`, `getTrailerInTipRange`, `initTerrain`, `initialize`, `initialize`, `isa`, `keyEvent`, `kickUser`, `load`, `loadAdditionalFiles`, `loadAdditionalFilesFinished`, `loadCompetitiveMultiplayer`, `loadEconomy`, `loadEnvironment`, `loadHandTools`, `loadHotspots`, `loadItems`, `loadItemsFinished`, `loadMap`, `loadMap`, `loadMapFinished`, `loadMapFinished`, `loadMapSounds`, `loadMission00Finished`, `loadObjectAtPlace`, `loadPlaceables`, `loadVehicles`, `mouseEvent`, `mouseEvent`, `new`, `notifyPlayerFarmChanged`, `onAfterMenuClose`, `onAppResumed`, `onAppSuspended`, `onBeforeMenuOpen`, `onConnectionAccepted`, `onConnectionClosed`, `onConnectionDenyAccept`, `onConnectionFinishedLoading`, `onConnectionOpened`, `onConnectionPacketLost`, `onConnectionPacketSent`, `onConnectionReadUpdateStream`, `onConnectionReady`, `onConnectionRequest`, `onConnectionRequestAccepted`, `onConnectionRequestAcceptedLoad`, `onConnectionRequestAnswer`, `onConnectionRequestAnswerOk`, `onConnectionWriteUpdateStream`, `onConnectionsUpdateTick`, `onCreateLoadSpawnPlace`, `onCreateRestrictedZone`, `onCreateStartPoint`, `onCreateStoreSpawnPlace`, `onCreateTriggerMarker`, `onDayChanged`, `onEndMissionCallback`, `onFinishedClientsWriteUpdateStream`, `onFinishedHandTools`, `onFinishedLoading`, `onFinishedLoading`, `onFinishedPlaceables`, `onFinishedReceivingDynamicData`, `onFinishedVehicles`, `onGameStateChange`, `onGuidedTourFinished`, `onGuidedTourStarted`, `onHourChanged`, `onLoadedMapI3DFiles`, `onMasterServerConnectionFailed`, `onMasterServerConnectionReady`, `onMasterUserAdded`, `onMaterialsLoaded`, `onMinuteChanged`, `onModFoliageTypesLoaded`, `onObjectCreated`, `onObjectCreated`, `onObjectDeleted`, `onObjectDeleted`, `onRadioIsActiveChanged`, `onRadioVehicleOnlyChanged`, `onSaveGameUpdateComplete`, `onShowHelpIconsChanged`, `onShutdownEvent`, `onShutdownEventOk`, `onSoundPlayerChange`, `onSoundPlayerStreamAccess`, `onSplitShapesProgress`, `onStartMission`, `onStreamAccessAllowed`, `onUserAdded`, `onUserRemoved`, `onWindowSizeChanged`, `onYesNoSavegameOverwrite`, `pauseGame`, `pauseRadio`, `playRadio`, `playerOwnsAllFields`, `postUpdate`, `postUpdate`, `preUpdate`, `registerToLoadOnMapFinished`, `removeAllHelpIcons`, `removeDrawable`, `removeHelpTrigger`, `removeItemFromList`, `removeKnownSplitShape`, `removeLeasedItem`, `removeLeasedItem`, `removeLiquidManureLoadingStation`, `removeManureLoadingStation`, `removeMapHotspot`, `removeNodeObject`, `removeNonUpdateable`, `removeOwnedItem`, `removeOwnedItem`, `removePauseListeners`, `removeTrainSystem`, `removeTriggerMarker`, `removeUpdateable`, `resetGameState`, `saveSavegame`, `scrollChatMessages`, `sendInitialClientState`, `sendNumPlayersToMasterServer`, `sendPlatformSessionIdsToMasterServer`, `setAutoSaveInterval`, `setAutomaticMotorStartEnabled`, `setColorBlindMode`, `setConnectionLostState`, `setDirtInterval`, `setDisasterDestructionState`, `setEconomicDifficulty`, `setFixedSeasonalVisuals`, `setFruitDestructionEnabled`, `setFuelUsage`, `setGrowthMode`, `setHarvestScaleRatio`, `setHelperBuyFertilizer`, `setHelperBuyFuel`, `setHelperBuySeeds`, `setHelperManureSource`, `setHelperSlurrySource`, `setLastCreatedLicensePlate`, `setLastInteractionTime`, `setLimeRequired`, `setLoadingScreen`, `setManualPause`, `setMapTargetHotspot`, `setMapTargetHotspot`, `setMissionInfo`, `setMoneyUnit`, `setMoneyUnit`, `setPedestrianSystem`, `setPlannedDaysPerPeriod`, `setPlayerNickname`, `setPlayerPermission`, `setPlayerPermissions`, `setPlowingRequiredEnabled`, `setRadioActionEventsState`, `setSavegameName`, `setShowFieldInfo`, `setShowHelpTrigger`, `setShowTriggerMarker`, `setSnowEnabled`, `setStonesEnabled`, `setStopAndGoBraking`, `setTimeScale`, `setTimeScaleMultiplier`, `setTrafficEnabled`, `setTrafficSystem`, `setTrailerFillLimit`, `setTrainSystemTabbable`, `setUseAcre`, `setUseFahrenheit`, `setUseMiles`, `setWeedsEnabled`, `showAttachContext`, `showBlinkingWarning`, `showFillDogBowlContext`, `showFuelContext`, `showMoneyChange`, `showPauseDisplay`, `showTipContext`, `spawnCollisionTestCallback`, `startLoadingTask`, `startSaveCurrentGame`, `subscribeGuiOpenCloseMessages`, `subscribeMessages`, `subscribeSettingsChangeMessages`, `superClass`, `teleportVehicle`, `testForGameRating`, `toggleVehicle`, `tryUnpauseGame`, `update`, `updateDedicatedServerXML`, `updateFoundHelpIcons`, `updateHelpTriggerVisibility`, `updateMasterServerInfo`, `updateMaxNumHirables`, `updateMissionDynamicInfo`, `updatePauseInputContext`, `updateSaving`

### MissionCancelEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### MissionDismissEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### MissionDynamicInfoEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### MissionFinishState (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### MissionFinishedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### MissionHotspot (40 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### MissionInfo (7 members)
`class`, `copy`, `isValidMissionId`, `isa`, `loadDefaults`, `new`, `superClass`

### MissionPhysicsObject (88 members)
`addChildenToNodeObject`, `addDeleteListener`, `addMountStateChangeListener`, `addToPhysics`, `addToPhysics`, `additionalMountingMassRaycastCallback`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createNode`, `delete`, `draw`, `dynamicMountTriggerCallback`, `getAdditionalMountingDistance`, `getAdditionalMountingMass`, `getAllowsAutoDelete`, `getAllowsAutoDelete`, `getDefaultRigidBodyType`, `getDynamicMountObject`, `getIsDelayedLoaded`, `getIsMounted`, `getMeshNodes`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getSupportsMountDynamic`, `getSupportsTensionBelts`, `getTensionBeltNodeId`, `getUpdatePriority`, `getUpdatePriority`, `getUpdatePriority`, `isa`, `load`, `loadFromMemory`, `loadOnCreate`, `mount`, `mountDynamic`, `mountKinematic`, `new`, `onDynamicMountJointBreak`, `onGhostAdd`, `onGhostAdd`, `onGhostRemove`, `onGhostRemove`, `onMissionStarted`, `onPhysicObjectWakeUpCallback`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `readUpdateStream`, `register`, `removeChildrenFromNodeObject`, `removeDeleteListener`, `removeFromPhysics`, `removeFromPhysics`, `removeMountStateChangeListener`, `resetObjectIds`, `setDynamicMountType`, `setLocalPositionQuaternion`, `setMountableObjectAttributes`, `setNodeId`, `setOwnerConnection`, `setOwnerFarmId`, `setWorldPositionQuaternion`, `setWorldPositionQuaternion`, `superClass`, `testScope`, `testScope`, `unmount`, `unmountDynamic`, `unmountKinematic`, `unregister`, `update`, `update`, `updateDynamicMountJointForceLimit`, `updateEnd`, `updateMove`, `updateTick`, `updateTick`, `updateTick`, `wakeUp`, `writeStream`, `writeUpdateStream`, `writeUpdateStream`

### MissionStartEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### MissionStartState (20 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### MissionStartedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### MissionStatus (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### MobileSimulator (15 members)
`init`, `toggleNotch`

### ModCategoryInfo (10 members)
`class`, `copy`, `getNumMods`, `isa`, `new`, `setNumAvailableUpdates`, `setNumConflictedItems`, `setNumNewItems`, `superClass`, `updateInfo`

### ModHubCategoriesFrame (172 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onActivateCategory`, `onActivateItem`, `onButtonDetails`, `onButtonSearch`, `onButtonShowToggle`, `onClickBest`, `onClickCategories`, `onClickLatest`, `onClickMostDownloaded`, `onClickRecommended`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reload`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setBetaToggleTextCallback`, `setCallback`, `setCategories`, `setCategory`, `setCategoryId`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setItemClickCallback`, `setItemSelectCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setModInfo`, `setModItems`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSearchCallback`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setToggleBetaCallback`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateList`, `updateListSizeLimit`, `updatePagingButtons`, `updateSubCategoryPages`, `verifyConfiguration`

### ModHubController (52 members)
`class`, `copy`, `delete`, `endModification`, `generateSearchScore`, `getCategories`, `getCategory`, `getCategoryData`, `getCategoryTypes`, `getDependentMods`, `getFreeModSpaceKb`, `getModInfo`, `getModsByCategory`, `getPostFix`, `getTotalFilesizeKb`, `getTotalModSpaceKb`, `getUsedModSpaceKb`, `getVisibleCategories`, `getVote`, `install`, `installOrUpdateMods`, `isCategorySearchable`, `isContestEnabled`, `isa`, `load`, `loadCategoriesFromXML`, `loadCategory`, `new`, `reload`, `reset`, `searchInCategory`, `searchMods`, `setAddedToDownloadCallback`, `setDependentModInstallFailedCallback`, `setDiscSpaceChangedCallback`, `setModInstallFailedCallback`, `setShowAllMods`, `setUninstallFailedCallback`, `setUninstalledCallback`, `setVotedCallback`, `startModification`, `superClass`, `uninstall`, `update`, `updateRecommendationSystem`, `updateTotalModSpace`, `userProfileChanged`, `vote`

### ModHubDetailsFrame (158 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `installCurrentMod`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onAddedToDownload`, `onButtonBuy`, `onButtonDownload`, `onButtonInstall`, `onButtonScreenshots`, `onButtonUninstall`, `onButtonUpdate`, `onButtonVote`, `onClose`, `onDependentModInstallFailed`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onModInstallFailed`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onStoreFailedOk`, `onUninstallFailed`, `onUninstalled`, `onVote`, `onVoted`, `openShop`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setImage`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setModInfo`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `uninstallYesNo`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### ModHubDownloadDialog (149 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateActiveDownloads`, `updateAnchorDeltas`, `updateDownloadCell`, `updateFramePosition`, `verifyConfiguration`

### ModHubExtraContentFrame (148 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onButtonUnlock`, `onClickLeft`, `onClickRight`, `onClose`, `onEShopOpen`, `onExtraContentKeyEntered`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reload`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateList`, `updatePagingButtons`, `verifyConfiguration`

### ModHubItemsFrame (165 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getHasUpdatableMod`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onActivateItem`, `onButtonDeleteAllMods`, `onButtonDetails`, `onButtonSearch`, `onButtonShowToggle`, `onButtonUpdateAll`, `onClickLeft`, `onClickRight`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onYesNoDeleteAllMods`, `onYesNoUpdateAll`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reload`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setBetaToggleTextCallback`, `setCallback`, `setCategory`, `setCategoryId`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setItemClickCallback`, `setItemSelectCallback`, `setListSizeLimit`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setModInfo`, `setModItems`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSearchCallback`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setToggleBetaCallback`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateList`, `updatePagingButtons`, `verifyConfiguration`

### ModHubLoadingFrame (136 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### ModHubScreen (210 members)
`addCallback`, `addElement`, `addPage`, `addPageTab`, `applyProfile`, `assignMenuButtonInfo`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonActions`, `clone`, `clone`, `consoleCommandUninstallAll`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exitMenu`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBetaToggleText`, `getBorders`, `getBreadcrumbs`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDetailMode`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getPageButtonInfo`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getStack`, `getTopFrame`, `goToPage`, `include`, `initializePages`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isAtRoot`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `makeClickItemCallback`, `makeIsContestEnabledPredicate`, `makeIsLoadingEnabledPredicate`, `makeIsModHubEnabledPredicate`, `makeIsModHubItemsEnabledPredicate`, `makeIsTestingEnabledPredicate`, `makeSelfCallback`, `mouseEvent`, `move`, `new`, `onBackAction`, `onButtonBack`, `onButtonBack`, `onClickActivate`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickCancel`, `onClickCategory`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickPageSelection`, `onClickShop`, `onClose`, `onDetailClosed`, `onDetailOpened`, `onDownloadButton`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMenuActionClick`, `onMenuOpened`, `onOpen`, `onPageChange`, `onPageClicked`, `onPageClicked`, `onPageNext`, `onPageNext`, `onPagePrevious`, `onPagePrevious`, `onPageUpdate`, `onSearchButton`, `onSearchFinished`, `onSelectItem`, `onTabMenuScroll`, `onTabMenuSelectionChanged`, `onToggleBeta`, `openDownloads`, `openWithModId`, `playSample`, `popDetail`, `popToRoot`, `populateCellForItemInSection`, `pushDetail`, `raiseCallback`, `rebuildTabList`, `register`, `registerPage`, `reloadFocusHandling`, `removeElement`, `removePage`, `replaceDetail`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsLoading`, `setNextScreenClickSoundMuted`, `setPageDisabled`, `setPageEnabled`, `setPageSelectorTitles`, `setPageTabEnabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `setupMenuButtonInfo`, `setupPages`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unregisterPage`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonsPanel`, `updateDiscSpace`, `updateDownloadStates`, `updateFramePosition`, `updateModDownloadState`, `updateModhubUpdateIcon`, `updatePages`, `updatePagingVisibility`, `updateTabDisplay`, `verifyConfiguration`

### ModHubScreenshotDialog (141 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setModInfo`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateSelectors`, `verifyConfiguration`

### ModInfo (38 members)
`class`, `copy`, `getAuthor`, `getCanBeUpdatedDirectly`, `getDLCLink`, `getDLCSteamLink`, `getDescription`, `getDownloadedBytes`, `getFilename`, `getFilesize`, `getHasConflict`, `getHash`, `getIconFilename`, `getId`, `getIsDLC`, `getIsDownload`, `getIsDownloading`, `getIsExternal`, `getIsFailed`, `getIsFeatured`, `getIsIconLocal`, `getIsInstalled`, `getIsNew`, `getIsTesting`, `getIsTop`, `getIsUpdate`, `getName`, `getNumConflicts`, `getNumNew`, `getNumUpdates`, `getPriceString`, `getRatingScore`, `getScreenshot`, `getScreenshots`, `getVersionString`, `isa`, `new`, `superClass`

### ModManager (26 members)
`addMod`, `class`, `copy`, `getActiveMods`, `getAreAllModsAvailable`, `getHasSelectableMod`, `getHasSelectableValidMod`, `getIsModAvailable`, `getModByFileHash`, `getModByIndex`, `getModByName`, `getModByTitle`, `getModIconByName`, `getMods`, `getMultiplayerMods`, `getNumOfMods`, `getNumOfValidMods`, `initDataStructures`, `isModMap`, `isa`, `load`, `loadMapData`, `new`, `removeMod`, `superClass`, `unloadMapData`

### ModSelectionScreen (161 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `filter`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCanSelectAll`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsModSelected`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSectionAndIndexForItem`, `getSelectedMod`, `getSoundSuppressed`, `getTitleForSectionHeader`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `installOrUpdateMods`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isModActivated`, `isa`, `keyEvent`, `loadAvailableMods`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onDoubleClick`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onOpen`, `onPageNext`, `onPagePrevious`, `onSearch`, `onSearchFinished`, `performSelectAll`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `selectCurrentMod`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setItemState`, `setMissionInfo`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `shouldShowModInList`, `showMods`, `superClass`, `toString`, `toggleAllAction`, `toggleCrossplay`, `toggleCustomInputContext`, `toggleFrameSide`, `toggleModAction`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateSelectButton`, `verifyConfiguration`, `verifyDependencies`

### MoneyChangeEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### MoneyType (45 members)
`getMoneyTypeById`, `getMoneyTypeByName`, `register`, `registerWithId`, `reset`

### MorphPositionEffect (32 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setOffset`, `setScrollUpdate`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### MotionPathEffect (43 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### MotorState (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### MouseHelper (4 members)
`getButtonName`, `getButtonNames`, `getButtonsXMLString`, `getInputDisplayText`

### MowMission (158 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `update`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### MultiplayerAvailability (4 members)
—

### MultiplayerScreen (141 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initJoinGameScreen`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickChangeName`, `onClickCreateGame`, `onClickJoinGame`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOpenBlocklist`, `onClickShop`, `onClose`, `onClose`, `onContinue`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateOnlinePresenceName`, `verifyConfiguration`

### NATType (4 members)
—

### NPC (109 members)
`addDeleteListener`, `addHotspots`, `cancelConversation`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `debugDrawAnimation`, `delete`, `dialogCallback`, `draw`, `finishConversation`, `getBeVisited`, `getCanInteract`, `getConversationByFilename`, `getConversationById`, `getConversationByIndex`, `getConversationNumTriggered`, `getCurrentConversation`, `getFacingDirection`, `getFarmData`, `getImageFilename`, `getInputData`, `getInteractingPlayer`, `getIsActive`, `getIsDelayedLoaded`, `getIsFirstContact`, `getIsInConversation`, `getIsInFacialAnimationConversation`, `getIsPhoneConversation`, `getIsPlayerInRange`, `getMapHotspot`, `getName`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPosition`, `getPositionOffset`, `getRandomConversation`, `getRandomConversationFromList`, `getRandomConversationFromUniqueIds`, `getSpot`, `getTeleportWorldPosition`, `getTeleportWorldRotation`, `getTitle`, `getUpdatePriority`, `getWasConversationTriggered`, `isa`, `load`, `loadCharacterFinished`, `loadFromSavegameXMLFile`, `new`, `onCanceledConversation`, `onConversationShowItem`, `onConversationStarted`, `onFailedToStartConversation`, `onFinishedConversation`, `onForceCancelConversation`, `onGhostAdd`, `onGhostRemove`, `onI3DFileLoaded`, `onInteractionCallback`, `onMissionStarted`, `onUserRemoved`, `processAnswer`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `removeHotspot`, `requestConversation`, `resetConversation`, `resetConversationNumTriggeredByType`, `resetObjectIds`, `saveToSavegameXMLFile`, `setDistanceToCamera`, `setFollowUpConversation`, `setInputData`, `setNextConversation`, `setOwnerConnection`, `setOwnerFarmId`, `setSpot`, `showConversationItem`, `startConversation`, `startFacialAnimation`, `stopFacialAnimation`, `superClass`, `unregister`, `update`, `updateEnd`, `updatePosition`, `updateTick`, `updateVisibility`, `validate`, `writeStream`, `writeUpdateStream`

### NPCActivatable (8 members)
`class`, `copy`, `getDistance`, `getIsActivatable`, `isa`, `new`, `run`, `superClass`

### NPCAnimationType (13 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### NPCConversation (33 members)
`class`, `compare`, `copy`, `delete`, `getCanBeCanceled`, `getConversationItemById`, `getConversationItemByIndex`, `getHasUserData`, `getIndex`, `getIsAvailable`, `getNPC`, `getProbability`, `getType`, `getUniqueId`, `getWeight`, `init`, `isa`, `load`, `loadConversationItems`, `loadFromSavegameXMLFile`, `loadPrerequisites`, `loadTexts`, `new`, `registerSavegameXMLPaths`, `reset`, `saveToSavegameXMLFile`, `setIndex`, `start`, `superClass`, `unloadTexts`, `updateUserData`, `validate`

### NPCConversationAnswerEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationCancelEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationFailedState (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### NPCConversationFinishedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationGuidedTour (32 members)
`class`, `compare`, `copy`, `delete`, `getCanBeCanceled`, `getConversationItemById`, `getConversationItemByIndex`, `getHasUserData`, `getIndex`, `getIsAvailable`, `getNPC`, `getProbability`, `getType`, `getUniqueId`, `getWeight`, `init`, `isa`, `load`, `loadConversationItems`, `loadFromSavegameXMLFile`, `loadPrerequisites`, `loadTexts`, `new`, `registerSavegameXMLPaths`, `reset`, `saveToSavegameXMLFile`, `setIndex`, `start`, `superClass`, `unloadTexts`, `updateUserData`, `validate`

### NPCConversationItem (22 members)
`activate`, `activateOption`, `class`, `copy`, `delete`, `getId`, `getIndex`, `getIsActive`, `getNextId`, `getOptionByIndex`, `getOptions`, `getText`, `init`, `isa`, `loadFromXML`, `new`, `registerXMLPaths`, `reset`, `setIndex`, `superClass`, `validate`, `validateXML`

### NPCConversationItemShowEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationRequestEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationStartEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationStartFailedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### NPCConversationType (39 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### NPCHotspot (45 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getBeVisited`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getImageFilename`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getNPC`, `getName`, `getRenderLast`, `getSortingValue`, `getTeleportWorldPosition`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### NPCManager (38 members)
`addSpot`, `class`, `consoleCommandAnimationDebug`, `consoleCommandAnimationReload`, `consoleCommandSetNextConversation`, `consoleCommandValidate`, `copy`, `getAllConverationActionClasses`, `getAllConverationInputClasses`, `getAllConverationOptionPrerequisiteClasses`, `getAllConverationPrerequisiteClasses`, `getAvailableSpot`, `getNPCByIndex`, `getNPCByName`, `getRandomIndex`, `getRandomNPC`, `getSpotByUniqueId`, `initDataStructures`, `isa`, `load`, `loadDefaultTypes`, `loadFromSavegameXMLFile`, `loadMapData`, `loadNPC`, `new`, `onMissionStarted`, `registerConversationActionClass`, `registerConversationInputClass`, `registerConversationOptionPrerequisiteClass`, `registerConversationPrerequisiteClass`, `removeSpot`, `saveToXMLFile`, `superClass`, `unloadMapData`, `update`

### NPCSpot (20 members)
`activate`, `class`, `copy`, `create`, `createFromNode`, `deactivate`, `delete`, `getIsAvailable`, `getPosition`, `getRotation`, `getUniqueId`, `isa`, `loadFromSavegameXMLFile`, `loadFromXMLFile`, `new`, `onCreate`, `registerSavegameXMLPaths`, `registerXMLPaths`, `saveToSavegameXMLFile`, `superClass`

### NPCText (16 members)
`class`, `copy`, `delete`, `getAudioFilename`, `getEmotionFilename`, `getPlainText`, `init`, `isa`, `load`, `new`, `reset`, `superClass`

### NPCUtil (7 members)
`cleanEmotionalText`, `createConversationFromXML`, `createFromXML`, `createTextFromPath`, `loadActionsFromXMLFile`, `loadInputsFromXMLFile`, `loadOptionPrerequisitesFromXMLFile`

### NetflixSigninScreen (130 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### Network (11 members)
—

### NetworkNode (48 members)
`addObject`, `addObjectToUpdateLoop`, `addPacketSize`, `checkObjectUpdateDebugReadSize`, `class`, `consoleCommandToggleNetworkShowObjects`, `consoleCommandToggleShowNetworkTraffic`, `consoleCommandToggleShowNetworkTrafficClients`, `copy`, `delete`, `drawConnectionNetworkStats`, `drawDebug`, `drawGraphLabels`, `getObject`, `getObjectId`, `getObjectPacketType`, `getPacketTypeName`, `isa`, `new`, `packetReceived`, `registerObject`, `removeObject`, `removeObjectFromUpdateLoop`, `setNetworkListener`, `superClass`, `unregisterObject`, `update`, `updateActiveObjects`, `updateActiveObjectsTick`, `updatePacketStats`

### NetworkUtil (25 members)
`convertFromNetworkFilename`, `convertToNetworkFilename`, `createWorldPositionCompressionParams`, `getIsWorldPositionInCompressionRange`, `getObject`, `getObjectId`, `packBits`, `readBit`, `readBits`, `readCompressedAngle`, `readCompressedColor`, `readCompressedPercentages`, `readCompressedRange`, `readCompressedWorldPosition`, `readNodeObject`, `readNodeObjectId`, `simWriteCompressedWorldPosition`, `writeBit`, `writeCompressedAngle`, `writeCompressedColor`, `writeCompressedPercentages`, `writeCompressedRange`, `writeCompressedWorldPosition`, `writeNodeObject`, `writeNodeObjectId`

### NewGameScreen (134 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMap`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickPreset`, `onClickShop`, `onClickStartWithFarm`, `onClose`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `selectMapByNameAndFile`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateStartWithTour`, `verifyConfiguration`

### NightGlower (9 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `onWeatherChanged`, `superClass`, `update`

### NightIllumination (2 members)
`onCreate`

### Nightlight (1 members)
`onCreate`

### Nightlight2 (1 members)
`onCreate`

### NodeCache (11 members)
`addTemplate`, `class`, `copy`, `delete`, `drawDebug`, `empty`, `getNodeInstance`, `isa`, `new`, `returnNodeToCache`, `superClass`

### NormalMapFormat (4 members)
—

### Object (37 members)
`addDeleteListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `resetObjectIds`, `setOwnerConnection`, `setOwnerFarmId`, `superClass`, `unregister`, `update`, `updateEnd`, `updateTick`, `writeStream`, `writeUpdateStream`

### ObjectFarmChangeEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ObjectIds (11 members)
`assignObjectClassId`, `assignObjectClassIds`, `assignObjectClassObjectId`, `getObjectClassById`, `getObjectClassByName`

### ObjectMask (13 members)
`getBitAndName`, `getFlagsFromMask`, `init`, `iteratorFlags`

### ObjectSpawner (8 members)
`class`, `copy`, `delete`, `getObjectFromCache`, `isa`, `new`, `superClass`, `update`

### ObjectStorageDialog (164 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickAmount`, `onClickBack`, `onClickCancel`, `onClickItems`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setObjectInfos`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ObstacleType (14 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### OilPump (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### OnCreateLoadedObjectEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### OnCreateObjectSystem (13 members)
`add`, `class`, `copy`, `delete`, `get`, `getNumObjects`, `isa`, `load`, `new`, `remove`, `save`, `superClass`

### OptionDialog (162 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setOptions`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### OptionPrerequisiteMissionAvailable (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### OptionPrerequisiteMissionPermission (9 members)
`class`, `copy`, `createFromXML`, `getIsValid`, `isa`, `new`, `registerXMLPaths`, `superClass`

### OrchardBoundaryEditor (55 members)
`activate`, `adoptFieldBoundary`, `cancel`, `cancelFieldBoundaryDetection`, `class`, `clearVisualization`, `copy`, `deactivate`, `delete`, `getBoundaryCursorPosition`, `getBoundaryLine`, `getBuildLimitWarning`, `getButtonPrimaryText`, `getButtonSecondaryText`, `getButtonTertiaryText`, `getCanCancel`, `getCanImportFieldBoundary`, `getIsBoundaryClearOfRiceFields`, `getIsBoundaryLineOnOwnedLand`, `getIsBuilding`, `getIsBusy`, `getIsCursorClearOfRiceFields`, `getIsCursorOnOwnedLand`, `getIsNearFirstPoint`, `getIsNearLastPoint`, `isa`, `new`, `onBuildFinished`, `onButtonPrimary`, `onButtonSecondary`, `onButtonTertiary`, `onFieldBoundaryDetected`, `onPreviewClosed`, `openPreview`, `resetBoundary`, `setCanImportBoundary`, `startBuild`, `startFieldBoundaryDetection`, `superClass`, `update`, `updateBoundaryDetection`, `updateBoundaryVisualization`, `updateInactive`

### OrchardBrushDialog (177 members)
`addCallback`, `addElement`, `applyProfile`, `assignCustomOptions`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `captureDefaultWorkDirection`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createCourseField`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `drawCustomOptionPreviewLines`, `drawLineOnMap`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `flipWorkDirectionSense`, `getAspectScale`, `getBlurArea`, `getBorders`, `getBoundaryAreaHa`, `getBoundaryBoundingBox`, `getBuildLimitWarning`, `getCenter`, `getClipArea`, `getCustomOptionsPrice`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsCoursePending`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getPlantingRowCount`, `getResolvedAutomaticWorkDirection`, `getRootElement`, `getSoundSuppressed`, `getTotalBuildableLength`, `getWorkDirectionIndex`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBuild`, `onClickCancel`, `onClickCustomOption`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickResetDirection`, `onClickShop`, `onClickWorkDirection`, `onClose`, `onCreate`, `onDrawPostIngameMapHotspots`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `setWorkDirectionValue`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateBuildStatus`, `updateFieldCourse`, `updateFramePosition`, `updateMapState`, `updateOptionStates`, `updateWorkDirectionArrow`, `verifyConfiguration`

### OrchardBuildClient (17 members)
`class`, `clearSession`, `copy`, `delete`, `getIsBuilding`, `getStatusWarning`, `isa`, `new`, `onBuildFinished`, `onBuildProgress`, `onCancelClicked`, `startBuild`, `superClass`, `update`

### OrchardBuildManager (12 members)
`addRequest`, `cancelRequest`, `class`, `copy`, `delete`, `getHasRequestForConnection`, `isa`, `new`, `rejectRequest`, `startNextRequest`, `superClass`, `update`

### OrchardBuildProgressDialog (140 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `finish`, `fireCancel`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setProgress`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `start`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateBar`, `updateFramePosition`, `verifyConfiguration`

### OrchardBuildRequest (51 members)
`addSegmentToBatch`, `beginExtraContentBuild`, `buildLegacyLine`, `buildLine`, `cancel`, `class`, `copy`, `dropAreaTask`, `finish`, `finishAreaPreparation`, `flushSegmentBatch`, `getAreaPolygon`, `getExtraContent`, `getHasFinished`, `getIsAreaClearOfRiceFields`, `getIsBoundaryOwned`, `getIsBoundaryValid`, `getIsLegacyFencePlaceable`, `getIsSegmentCovered`, `getIsSegmentCoveredForConnection`, `getLegacyPricePerMeter`, `isa`, `loadExtraPlaceable`, `lockPlaceable`, `new`, `onExtraPlaceableLoaded`, `sendProgress`, `setGroundCoverFruit`, `start`, `startAreaPreparation`, `startExtraContentPhase`, `superClass`, `update`, `updateAreaPreparation`, `updateExtraContent`, `updateExtraContentPending`, `updateExtraContentWaiting`, `updateProgress`, `updateRows`, `validateFence`, `validateLegacyFence`

### PalletFiller (43 members)
`actionEventBuyPallets`, `actionEventLowerPlatformLoad`, `actionEventLowerPlatformUnload`, `buyPalletFillerPallets`, `getCanAIImplementContinueWork`, `getCanBuyPalletFillerPallets`, `getCanChangePalletFillerState`, `getCanToggleDischargeToGround`, `getCanToggleDischargeToObject`, `getFillLevelInformation`, `getHasObjectMounted`, `getIsFoldAllowed`, `getPalletFillerFillStep`, `getPalletFillerMovementDirection`, `initSpecialization`, `loadPalletFillerPallet`, `onCreatePalletFinished`, `onDelete`, `onFinishAnimation`, `onFoldTimeChanged`, `onLoad`, `onLoadFinished`, `onObjectDeleted`, `onReadStream`, `onReadUpdateStream`, `onRegisterActionEvents`, `onUpdate`, `onUpdateTick`, `onWriteStream`, `onWriteUpdateStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `removeFromPhysics`, `saveToXMLFile`, `setPalletFillerDeflectorState`, `setPalletFillerState`, `unloadPalletFillerPallet`, `updateActionEventTexts`, `updatePalletFillerDeflectorState`, `verifyCombine`

### PalletFillerState (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### PalletShopDialog (164 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickItems`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickQuantity`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonDisabled`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setItems`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePrices`, `verifyConfiguration`

### PalletUnloadTriggerEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ParticleEffect (31 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setColor`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setFillType`, `setMinMaxWidth`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### ParticleType (43 members)
—

### PasswordDialog (177 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onEnterPressed`, `onEscPressed`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setButtonTexts`, `setCallback`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonVisibility`, `updateFramePosition`, `verifyConfiguration`

### PedestrianSystem (20 members)
`class`, `consoleCommandPedestrianSystemDebug`, `consoleCommandPedestrianSystemReload`, `consoleCommandPedestrianSystemToggle`, `copy`, `createFromXmlAndNode`, `delete`, `draw`, `isGroupPossible`, `isa`, `load`, `loadCharacterFinished`, `new`, `onCreate`, `onIndoorStateChanged`, `setEnabled`, `superClass`, `update`, `updateMask`

### PerlinNoiseFilter (3 members)
`getValueCompareParams`, `new`, `setValueCompareParams`

### PhysicsDebugDrawMode (16 members)
—

### PipeEffect (37 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setOffset`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `transformEffectNode`, `update`

### PlaceableDestructibleDestructedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### PlaceableDestructibleRepairEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### PlaceableDocGenerator (11 members)
`class`, `collectData`, `copy`, `generate`, `generateItemPage`, `generateOverviewPage`, `getOverviewQualifiedName`, `getSummary`, `isa`, `new`, `superClass`

### PlaceableDoghouseFoodBowlStateEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `sendEvent`, `superClass`, `writeStream`

### PlaceableHotspot (54 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `createIcon`, `delete`, `getBeVisited`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getName`, `getPlaceable`, `getRenderLast`, `getSortingValue`, `getTeleportWorldPosition`, `getTypeByName`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setName`, `setOwnerFarmId`, `setPersistent`, `setPlaceable`, `setPlaceableType`, `setScale`, `setSelected`, `setTeleportWorldPosition`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### PlaceableHusbandryAnimalWorkerPerformAnswerEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### PlaceableHusbandryAnimalWorkerPerformEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### PlaceableHusbandryAnimalWorkerStateEvent (13 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newClientToServer`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### PlaceableInfoDialog (141 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickRename`, `onClickSell`, `onClickShop`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPlaceableDestroyed`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaceable`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### PlaceableLoadingState (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### PlaceablePalletBuyEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### PlaceablePropertyState (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### PlaceableUtil (2 members)
`loadPlaceable`, `loadPlaceableFinished`

### PlaceableVehicleBuyingStationEvent (17 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### Placeholders (1 members)
`onCreate`

### PlacementManager (11 members)
`class`, `consoleCommandTogglePlacementDebug`, `copy`, `delete`, `getPlaceAsync`, `isa`, `new`, `superClass`, `update`

### PlacementUtil (13 members)
`collisionTestCallback`, `createRestrictedZone`, `getPlace`, `isInsidePlacementPlaces`, `isInsideRestrictedZone`, `loadPlaceFromNode`, `loadPlaceFromXML`, `markPlaceUsed`, `registerXMLPaths`, `unmarkPlaceUsed`

### Platform (107 members)
`applyAndroid`, `applyConsole`, `applyDefault`, `applyIOS`, `applyMSStore`, `applyMobile`, `applyNetflix`, `applyPlaystation`, `applySteam`, `applySwitch`, `applySwitch2`, `applyXbox`, `init`, `verifyMultiplayerAvailabilityInMenu`

### PlatformId (9 members)
—

### PlatformNodeRemover (5 members)
`onCreate`, `removeNodes`, `reset`

### PlatformPrivilegeUtil (7 members)
`checkModDownload`, `checkModDownloadUpdateCallback`, `checkModUse`, `checkModUseUpdateCallback`, `checkMultiplayer`, `checkMultiplayerUpdateCallback`, `getCanInvitePlayer`

### PlayerGraphicsState (9 members)
`class`, `copy`, `drawDebug`, `isa`, `new`, `setDefault`, `superClass`, `updateLocal`, `updateRemote`

### PlayerHUDUpdater (22 members)
`class`, `convertFarmToName`, `copy`, `delete`, `fieldAddFarmland`, `fieldAddField`, `fieldAddFieldActions`, `fieldAddWeed`, `isa`, `new`, `onDeleteObject`, `onFieldDataUpdateFinished`, `setCurrentRaycastTarget`, `showAnimalInfo`, `showBaleInfo`, `showFieldInfo`, `showPalletInfo`, `showSplitShapeInfo`, `showVehicleInfo`, `superClass`, `update`, `updateRaycastObject`

### PlayerHotspot (44 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getPlayer`, `getRenderLast`, `getSortingValue`, `getVehicle`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setPlayer`, `setScale`, `setSelected`, `setVehicle`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### PlayerStateDriving (29 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfValidEntryState`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `getCurrentCameraNode`, `getCurrentFacingDirection`, `getCurrentRootNode`, `getCurrentVehicle`, `getIsInVehicle`, `getPosition`, `getSpeed`, `getYaw`, `isa`, `loadDebugInfoFromXMLFile`, `new`, `onEnterVehicle`, `onStateEntered`, `onStateExited`, `registerXMLPaths`, `superClass`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`, `updateWhileInConversation`

### PlayerStatePassenger (30 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfValidEntryState`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `getCurrentCameraNode`, `getCurrentFacingDirection`, `getCurrentRootNode`, `getCurrentVehicle`, `getIsInVehicle`, `getPosition`, `getSpeed`, `getYaw`, `isa`, `loadDebugInfoFromXMLFile`, `new`, `onEnterVehicle`, `onEnterVehicleAsPassenger`, `onStateEntered`, `onStateExited`, `registerXMLPaths`, `superClass`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`, `updateWhileInConversation`

### PlayerStateRollercoaster (31 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfValidEntryState`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `getCurrentCameraNode`, `getCurrentFacingDirection`, `getCurrentRootNode`, `getCurrentVehicle`, `getIsInRollercoaster`, `getIsInVehicle`, `getPosition`, `getSpeed`, `getYaw`, `isa`, `loadDebugInfoFromXMLFile`, `new`, `onEnterRollercoaster`, `onEnterVehicle`, `onStateEntered`, `onStateExited`, `registerXMLPaths`, `superClass`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`, `updateWhileInConversation`

### PlayerStyleItem (13 members)
`applyColorToHair`, `applyColorToNode`, `class`, `cloneAndEnable`, `clonePart`, `copy`, `isa`, `loadFromConfigurationXMLFile`, `new`, `newEmpty`, `registerXMLPaths`, `superClass`

### PlayerStylePreset (10 members)
`applyToStyle`, `class`, `copy`, `createFromStyle`, `getDoesStyleUse`, `isa`, `loadFromXMLNode`, `new`, `registerXMLPaths`, `superClass`

### PlowMotionPathEffect (53 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `start`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### PointList2D (15 members)
`add`, `get`, `getAreBoundariesColliding`, `getClosestPositionAndDirectionOnBoundary`, `getClosestPositionOnBoundary`, `getDistanceToBoundary`, `getIsPointInsideBoundary`, `getIsSegmentInsideBoundary`, `getNumPoints`, `getSegmentBoundaryIntersection`, `getSegmentClosestBoundaryIntersection`, `getSegmentNumBoundaryIntersections`, `length`, `new`, `set`

### Polygon2D (31 members)
`addNode`, `addNodes`, `addPos`, `class`, `copy`, `getArea`, `getBoundingBox`, `getConvexHull`, `getCurveOrientation`, `getEdge`, `getIsCircleInside`, `getIsCircleIntersecting`, `getIsLineSegmentIntersecting`, `getIsPosInside`, `getLastVertex`, `getNumEdges`, `getNumVertices`, `getOffsetPolygon`, `getVertex`, `getVertices`, `getVerticesAs3DCoordinates`, `isa`, `iteratorEdges`, `iteratorVertices`, `new`, `removeVertex`, `renderEdges`, `renderFace`, `setVertices`, `setVerticesFromXYZ`, `superClass`

### PostProcessAntiAliasing (7 members)
—

### PresenceModes (6 members)
—

### PricingDynamics (28 members)
`addCurve`, `class`, `copy`, `evaluate`, `evaluateCurve`, `evaluateForTrend`, `getBaseCurveTrend`, `getRandomValue`, `isa`, `loadCurveFromXMLFile`, `loadFromXMLFile`, `new`, `registerSavegameCurveXMLPaths`, `registerSavegameXMLPaths`, `saveCurveToXMLFile`, `saveToXMLFile`, `startFirstCycle`, `startNewCycle`, `superClass`, `update`, `updateCurve`

### PricingHistoryEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### PricingHistoryInitialEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### Profiler (33 members)
`delete`, `finish`, `init`, `setIsReady`, `setMapRootNode`, `startProfiler`, `update`

### Progress (10 members)
`activate`, `class`, `copy`, `deactivate`, `getProgress`, `isa`, `new`, `registerXMLPaths`, `superClass`, `update`

### ProgressFieldFruit (12 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `getProgress`, `isa`, `new`, `registerXMLPaths`, `superClass`, `update`

### ProgressFieldGround (12 members)
`activate`, `class`, `copy`, `createFromXML`, `deactivate`, `getProgress`, `isa`, `new`, `registerXMLPaths`, `superClass`, `update`

### PushHandTool (32 members)
`actionEventToggleDriveMode`, `customVehicleCharacterLoaded`, `deleteVehicleCharacter`, `driveModeVehicleCharacterLoaded`, `getAllowCharacterVisibilityUpdate`, `getIsFoldAllowed`, `getRaycastPosition`, `initSpecialization`, `onCameraChanged`, `onDelete`, `onEnterVehicle`, `onLoad`, `onPostLoad`, `onReadStream`, `onReadUpdateStream`, `onRegisterActionEvents`, `onUpdate`, `onVehicleCharacterChanged`, `onWriteStream`, `onWriteUpdateStream`, `playerRaycastCallback`, `postAnimationUpdate`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `saveToXMLFile`, `setActiveCameraIndex`, `setPushHandToolDriveMode`, `setVehicleCharacter`

### RailroadCaller (11 members)
`callRailroad`, `class`, `copy`, `delete`, `isa`, `loadFromXML`, `new`, `railroadCallerTriggerCallback`, `registerXMLPaths`, `setSplineTimeByPosition`, `superClass`

### RailroadCallerActivatable (11 members)
`activate`, `class`, `copy`, `deactivate`, `draw`, `getDistance`, `getIsActivatable`, `isa`, `new`, `run`, `superClass`

### RailroadCrossing (26 members)
`class`, `copy`, `debugSetDebugNodeState`, `delete`, `findBlockingPositions`, `findPedestrianSystemBlockingPositions`, `findTrafficSystemBlockingPositions`, `findVehicleNavigationMapBlockingPositions`, `finishOpenGates`, `isa`, `loadFromXML`, `new`, `onSplinePositionTimeUpdate`, `registerXMLPaths`, `setBlockingPositionsState`, `setSplineTimeByPosition`, `startClosingGates`, `startOpeningGates`, `superClass`, `update`, `updateGates`

### RailroadVehicle (243 members)
`actionEventToggleSelection`, `actionEventToggleSelectionReverse`, `activate`, `addActionEvent`, `addAsyncTask`, `addChildVehicles`, `addDeleteListener`, `addPoweredActionEvent`, `addSubselection`, `addToPhysics`, `addVehicleToAIImplementList`, `calculateDailyUpkeep`, `calculateSellPrice`, `class`, `clearActionEventsTable`, `clearDirtyFlags`, `clearDirtyMask`, `clearDirtyMask`, `clearSubselections`, `copy`, `createComponentJoint`, `createLoadingTask`, `createMapHotspot`, `dayChanged`, `deactivate`, `delete`, `delete`, `deleteMapHotspot`, `doCheckSpeedLimit`, `doCollisionMaskCheck`, `draw`, `draw`, `drawUIInfo`, `findRootVehicle`, `finishLoadingTask`, `getActionControllerDirection`, `getActiveFarm`, `getAdditionalComponentMass`, `getAdditionalSchemaText`, `getAreControlledActionsAccessible`, `getAreControlledActionsAllowed`, `getAreControlledActionsAvailable`, `getAvailableComponentMass`, `getBlockSelection`, `getBrand`, `getCanBeAddedToSales`, `getCanBeMounted`, `getCanBePickedUp`, `getCanBeReset`, `getCanBeSelected`, `getCanBeSold`, `getCanToggleSelectable`, `getChildVehicleHash`, `getChildVehicles`, `getComponentMass`, `getControlledActionIcons`, `getDailyUpkeep`, `getDeactivateOnLeave`, `getDefaultMass`, `getDistanceToNode`, `getFillLevelInformation`, `getFullName`, `getHasObjectMounted`, `getImageFilename`, `getInteractionHelp`, `getIsAIActive`, `getIsActive`, `getIsActiveForInput`, `getIsActiveForSound`, `getIsAutomaticShiftingAllowed`, `getIsBeingDeleted`, `getIsDelayedLoaded`, `getIsInShowroom`, `getIsInUse`, `getIsInteractive`, `getIsLowered`, `getIsMapHotspotVisible`, `getIsNodeActive`, `getIsOnField`, `getIsOperating`, `getIsPowered`, `getIsReadyForAutomatedTrainTravel`, `getIsSelected`, `getIsSynchronized`, `getIsVehicleNode`, `getLastSpeed`, `getLimitedVehicleYPosition`, `getMapHotspot`, `getMapHotspotPosition`, `getMapHotspotRotation`, `getMaxComponentMassReached`, `getName`, `getNeedsSaving`, `getNextDirtyFlag`, `getOperatingTime`, `getOverallCenterOfMass`, `getOwnerConnection`, `getOwnerFarmId`, `getParentComponent`, `getPrice`, `getPropertyState`, `getRawSpeedLimit`, `getReloadXML`, `getRepaintPrice`, `getRepairPrice`, `getRequiresPower`, `getResetDialogTexts`, `getResetPlaces`, `getRootVehicle`, `getSelectedObject`, `getSelectedVehicle`, `getSellPrice`, `getShowInVehiclesOverview`, `getSpecConfigValuesWeight`, `getSpecValueAdditionalWeight`, `getSpecValueAge`, `getSpecValueCombinations`, `getSpecValueDailyUpkeep`, `getSpecValueOperatingTime`, `getSpecValueSlots`, `getSpecValueSpeedLimit`, `getSpecValueWeight`, `getSpecValueWorkingWidth`, `getSpecValueWorkingWidthConfig`, `getSpeedLimit`, `getTotalMass`, `getUniqueId`, `getUpdatePriority`, `getUpdatePriority`, `getUppercaseName`, `getUseTurnedOnSchema`, `getVehicleDamage`, `getVehicleWorldDirection`, `getVehicleWorldXRot`, `getWorkLoad`, `hasInputConflictWithSelection`, `i3dFileLoaded`, `init`, `interact`, `isa`, `load`, `loadCallback`, `loadComponentFromXML`, `loadComponentJointFromXML`, `loadFinished`, `loadObjectChangeValuesFromXML`, `loadSchemaOverlay`, `loadSpecValueAdditionalWeight`, `loadSpecValueCombinations`, `loadSpecValueSpeedLimit`, `loadSpecValueWeight`, `loadSpecValueWorkingWidth`, `loadSpecValueWorkingWidthConfig`, `loadSubSharedI3DFile`, `new`, `onFinishedLoading`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onVehicleWakeUpCallback`, `onWaterRaycastCallback`, `periodChanged`, `playControlledActions`, `postInit`, `postReadStream`, `postWriteStream`, `prefixSchemaOverlayName`, `raiseActive`, `raiseDirtyFlags`, `raiseStateChange`, `readStream`, `readStream`, `readUpdateStream`, `readUpdateStream`, `register`, `register`, `registerActionEvents`, `registerComponentXMLPaths`, `registerEvents`, `registerFunctions`, `registerInteractionFlag`, `registerSelectableObjects`, `registers`, `removeActionEvent`, `removeActionEvents`, `removeDeleteListener`, `removeFromPhysics`, `requestActionEventUpdate`, `reset`, `resetObjectIds`, `resetPositionToTerrainHeight`, `saveStatsToXMLFile`, `saveToXMLFile`, `selectVehicle`, `setAbsolutePosition`, `setBroken`, `setComponentJointFrame`, `setComponentJointRotLimit`, `setComponentJointTransLimit`, `setConfigurations`, `setDefaultComponentPosition`, `setFilename`, `setLoadCallback`, `setLoadingState`, `setLoadingStep`, `setMassDirty`, `setObjectChangeValues`, `setOperatingTime`, `setOwnerConnection`, `setOwnerFarmId`, `setOwnerFarmId`, `setRelativePosition`, `setSelectedObject`, `setSelectedVehicle`, `setTrainSystem`, `setType`, `setUniqueId`, `setVisibility`, `setWorldPosition`, `setWorldPositionQuaternion`, `showInfo`, `superClass`, `unregister`, `unselectVehicle`, `update`, `updateActionEvents`, `updateEnd`, `updateEnd`, `updateMapHotspot`, `updateMass`, `updateSelectableObjects`, `updateTick`, `updateTick`, `updateVehicleChain`, `updateVehicleSpeed`, `updateWaterInfo`, `wakeUp`, `writeStream`, `writeStream`, `writeUpdateStream`, `writeUpdateStream`

### RainSettings (9 members)
`class`, `clone`, `copy`, `copyAttributes`, `isa`, `load`, `new`, `save`, `superClass`

### RainSimWeatherType (4 members)
—

### RainUpdater (27 members)
`addDebugValues`, `class`, `copy`, `createRainSettingsFromPreset`, `delete`, `getHailFallScale`, `getPreset`, `getPresets`, `getRainFallScale`, `getSnowFallScale`, `isa`, `load`, `loadPresets`, `new`, `onRainI3DLoaded`, `reset`, `savePresets`, `setAlpha`, `setCombinedSpawnVelocity`, `setShallowWaterSimulation`, `setTargetRain`, `setValues`, `setVisible`, `setWindValues`, `superClass`, `update`

### RandomSound (11 members)
`class`, `copy`, `delete`, `getRandomTime`, `isa`, `new`, `onCreate`, `randomSoundTimerCallback`, `superClass`

### RaycastUtil (7 members)
`boxOverlapCallback`, `getCameraPickingRay`, `raycastBox`, `raycastClosest`, `raycastClosestCallback`, `raycastSphere`, `sphereOverlapCallback`

### ReedsSheppPath (11 members)
`class`, `copy`, `generate`, `inverse`, `inverseDirection`, `inverseSteering`, `isa`, `new`, `superClass`

### RefillDialog (165 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onBuyYesNo`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickFillAmount`, `onClickFillTypes`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonDisabled`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setFreeCapacities`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFillAmounts`, `updateFramePosition`, `verifyConfiguration`

### RemoteProfiler (8 members)
`message`, `zoneBegin`, `zoneBeginN`, `zoneBeginNS`, `zoneBeginS`, `zoneEnd`, `zoneName`, `zoneText`

### RemovePlayerFromFarmEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### RenderText (8 members)
—

### ReportUserReason (5 members)
—

### RequestMoneyChangeEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### ResetVehicleEvent (16 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### RestartManager (13 members)
`handleRestart`, `init`, `restartDisplayNotOk`, `restartDisplayOk`, `restartDisplayTimeUpdate`, `setStartScreen`

### Reverb (5 members)
—

### ReverbSystem (14 members)
`class`, `consoleCommandReloadSettings`, `consoleCommandToggleDebugView`, `copy`, `delete`, `drawDebug`, `getName`, `isa`, `loadMapData`, `loadSettings`, `new`, `sortTypes`, `superClass`, `update`

### RiceFieldDialog (159 members)
`acceptDialog`, `addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickEmpty`, `onClickFill`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onRiceFieldStatusResult`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonAction`, `setButtonDisabled`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### RiceFieldUpdateTask (19 members)
`cancel`, `class`, `copy`, `enqueue`, `getIsFinished`, `getName`, `isa`, `loadFromXMLFile`, `new`, `performPerlinNoiseDestruction`, `registerXMLPaths`, `saveToXMLFile`, `setArea`, `setFinished`, `setName`, `setNeedsSaving`, `start`, `superClass`, `update`

### RidgeFormer (17 members)
`doCheckSpeedLimit`, `getDirtMultiplier`, `getWearMultiplier`, `initSpecialization`, `onDeactivate`, `onDelete`, `onEndWorkAreaProcessing`, `onLoad`, `onStartWorkAreaProcessing`, `prerequisitesPresent`, `processRidgeFormerArea`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`

### RigidBodyType (4 members)
—

### RingBuffer (11 members)
`add`, `calculateIndex`, `class`, `copy`, `getAbsolutelyIndexed`, `getAverage`, `getLocallyIndexed`, `incrementIndex`, `isa`, `new`, `superClass`

### RollercoasterHotspot (56 members)
`addRenderStateChangedListener`, `changeToRollercoaster`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `createIcon`, `delete`, `getBeVisited`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getDimension`, `getHeight`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getName`, `getPlaceable`, `getRenderLast`, `getSortingValue`, `getTeleportWorldPosition`, `getTypeByName`, `getWidth`, `getWidth`, `getWorldPosition`, `getWorldPosition`, `getWorldRotation`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setName`, `setOwnerFarmId`, `setPersistent`, `setPlaceable`, `setPlaceableType`, `setScale`, `setSelected`, `setTeleportWorldPosition`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### RollercoasterStateRideWaiting (25 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `draw`, `getIsConstructibleState`, `getPlaySound`, `getProgress`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `reset`, `saveToXMLFile`, `superClass`, `update`, `updateInfo`

### RollercoasterStateRiding (25 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsConstructibleState`, `getPlaySound`, `getProgress`, `init`, `isDone`, `isa`, `load`, `loadFromXMLFile`, `new`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `raiseActive`, `registerXMLPaths`, `reset`, `saveToXMLFile`, `superClass`, `update`, `updateInfo`

### RollingGateAnimation (10 members)
`class`, `copy`, `getClosestSplineTime`, `getSplineTime`, `isa`, `load`, `new`, `registerXMLPaths`, `setState`, `superClass`

### RotationAnimation (24 members)
`addDuplicate`, `calculateTurnOffFadeTime`, `class`, `copy`, `delete`, `getAllowUpdate`, `isDuplicate`, `isRunning`, `isa`, `load`, `new`, `registerAnimationClassXMLPaths`, `reset`, `setFillType`, `setUpdateDistance`, `start`, `stop`, `superClass`, `update`, `updateDuplicate`, `updateDuplicates`

### RotationAnimationSpikes (30 members)
`addDuplicate`, `calculateTurnOffFadeTime`, `class`, `copy`, `delete`, `drawDebug`, `drawDebugCircleRange`, `getAllowUpdate`, `isDuplicate`, `isDuplicate`, `isRunning`, `isRunning`, `isa`, `load`, `new`, `registerAnimationClassXMLPaths`, `reset`, `reset`, `setFillType`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `update`, `updateDuplicate`, `updateDuplicate`, `updateDuplicates`, `updateSpikes`

### RotationAnimationSpikesGravity (27 members)
`addDuplicate`, `calculateTurnOffFadeTime`, `class`, `copy`, `delete`, `getAllowUpdate`, `isDuplicate`, `isDuplicate`, `isRunning`, `isa`, `load`, `new`, `registerAnimationClassXMLPaths`, `reset`, `reset`, `setFillType`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `update`, `updateDuplicate`, `updateDuplicate`, `updateDuplicates`, `updateSpikes`

### SHTelemetry (0 members)
—

### SaveEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SaveGameResolvePolicy (3 members)
—

### Savegame (15 members)
—

### SavegameConflictDialog (160 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSavegameFromMetadata`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickKeepBoth`, `onClickKeepLocal`, `onClickKeepRemote`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setCloudSavegame`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFinishedCallback`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setLocalSavegame`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSavegame`, `setSavegameId`, `setSelected`, `setShowKeepBoth`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### SavegameController (79 members)
`addSaveTask`, `assignBackupDeleteFlags`, `backupSavegame`, `backupSortFunction`, `cancelSavegameUpdate`, `class`, `copy`, `createBackup`, `deleteSavegame`, `downloadDebugSavegame`, `executeResolveConflict`, `executeSaveTask`, `getCanDeleteGame`, `getCanStartGame`, `getIsSavegameConflicted`, `getIsSaving`, `getIsWaitingForSavegameInfo`, `getMaxNumberOfSavegames`, `getNumValidSavegames`, `getNumberOfSavegames`, `getSavegame`, `getSavingErrorCode`, `isStorageDeviceUnavailable`, `isa`, `loadSavegames`, `locateBackups`, `migrateSavegame`, `new`, `onCloudError`, `onDebugSavegameDownloadProgress`, `onDebugSavegameUploadProgress`, `onResolveConflictComplete`, `onSaveComplete`, `onSaveGameUpdateComplete`, `onSaveGameUpdateCompleteCloudError`, `onSaveStartComplete`, `onSaveTaskComplete`, `onSavegameDeleted`, `onSavegameMigrationComplete`, `onYesNoConflictKeepRemote`, `resetStorageDeviceSelection`, `resolveConflict`, `returnToSavegameSelection`, `saveSavegame`, `savegameConflictResolveKeepBothFailed`, `superClass`, `tryToResolveConflict`, `updateSavegames`, `uploadDebugSavegame`

### SavegameMigrationDialog (162 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### SavegameMigrationProgressDialog (141 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setProgress`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### SavegameSettingsEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `sendEvent`, `superClass`, `writeStream`

### SavegameUploadDialog (177 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onEnterPressed`, `onEscPressed`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setButtonTexts`, `setCallback`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonVisibility`, `updateFramePosition`, `verifyConfiguration`

### SavegameUploadProgressDialog (141 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setProgress`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ScreenSpaceReflectionsQuality (5 members)
—

### ScreenSpaceShadowsQuality (3 members)
—

### ScriptMesh (11 members)
`finalizeShape`, `new`, `setTriangles`, `setVertexBlendIndices`, `setVertexBlendWeights`, `setVertexColors`, `setVertexGeneric`, `setVertexNormals`, `setVertexPositions`, `setVertexTangents`, `setVertexUVs`

### ScrollingAnimation (24 members)
`addDuplicate`, `calculateTurnOffFadeTime`, `class`, `copy`, `delete`, `getAllowUpdate`, `isDuplicate`, `isRunning`, `isa`, `load`, `new`, `registerAnimationClassXMLPaths`, `reset`, `setFillType`, `setUpdateDistance`, `start`, `stop`, `superClass`, `update`, `updateDuplicate`, `updateDuplicates`

### Season (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### SeasonPeriod (25 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `getSeason`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### SellHandToolEvent (16 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### SellItemDialog (160 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setItem`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### SellPlaceableEvent (16 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### SellVehicleEvent (16 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newServerToClient`, `readStream`, `run`, `superClass`, `writeStream`

### Server (52 members)
`addObject`, `addObjectToUpdateLoop`, `addPacketSize`, `broadcastEvent`, `checkObjectUpdateDebugReadSize`, `class`, `closeConnection`, `consoleCommandToggleNetworkDebug`, `consoleCommandToggleNetworkShowObjects`, `consoleCommandToggleShowNetworkTraffic`, `consoleCommandToggleShowNetworkTrafficClients`, `copy`, `delete`, `drawConnectionNetworkStats`, `drawDebug`, `drawGraphLabels`, `finishRegisterObject`, `getClientClipDistCoeff`, `getClientGuiVisibility`, `getClientPosition`, `getObject`, `getObjectId`, `getObjectPacketType`, `getPacketTypeName`, `hasGhostObject`, `init`, `isa`, `new`, `packetReceived`, `prioCmp`, `registerObject`, `registerObjectInStream`, `removeObject`, `removeObjectFromUpdateLoop`, `removeStreamFromClients`, `sendEventIds`, `sendObjectClassIds`, `sendObjects`, `setClientClipDistCoeff`, `setClientGuiVisibility`, `setClientPosition`, `setCurrentReliableWriteStreamConnection`, `setNetworkListener`, `start`, `startLocal`, `stop`, `superClass`, `unregisterObject`, `update`, `updateActiveObjects`, `updateActiveObjectsTick`, `updatePacketStats`

### ServerDetailScreen (144 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCanStartGame`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getDownloadableModsInfo`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBlockOrShowInfo`, `onClickCancel`, `onClickDownload`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onCreateList`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPasswordEntered`, `packModInfo`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setServerInfo`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unpackModInfo`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateStartButton`, `verifyConfiguration`

### SetSplitShapesEvent (15 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `newAck`, `newReceiving`, `processReadData`, `readStream`, `run`, `superClass`, `writeStream`

### SettingsAdvancedFrame (210 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onApplySettings`, `onClick`, `onClickAtmosphereQuality`, `onClickCloudShadowsQuality`, `onClickDRSTargetFPS`, `onClickFoliageDrawDistance`, `onClickFoliageLODDistance`, `onClickFoliageShadows`, `onClickFovY`, `onClickFovYPlayerFirstPerson`, `onClickFovYPlayerThirdPerson`, `onClickFrameGeneration`, `onClickLODDistance`, `onClickLightsProfile`, `onClickLockedIcon`, `onClickMSAA`, `onClickMaxMirrors`, `onClickMaxTireTracks`, `onClickObjectDrawDistance`, `onClickPPAA`, `onClickPerformanceClass`, `onClickRealBeaconLights`, `onClickResolutionScale3d`, `onClickSSAOQuality`, `onClickScalingMode`, `onClickScalingModeQuality`, `onClickShaderQuality`, `onClickShadingRateQuality`, `onClickShadowDistanceQuality`, `onClickShadowMapFiltering`, `onClickShadowMaxLights`, `onClickShadowQuality`, `onClickSharpness`, `onClickSoftShadows`, `onClickTerrainLODDistance`, `onClickTerrainQuality`, `onClickTextureResolution`, `onClickVolumeMeshTessellation`, `onClose`, `onCreateDRSTargetFPS`, `onCreateFoliageDrawDistance`, `onCreateFoliageLODDistance`, `onCreateFovY`, `onCreateFovYPlayerFirstPerson`, `onCreateFovYPlayerThirdPerson`, `onCreateFrameGenerationTooltip`, `onCreateLODDistance`, `onCreateLightsProfile`, `onCreateMaxMirrors`, `onCreateMaxTireTracks`, `onCreateObjectDrawDistance`, `onCreatePPAAToolTip`, `onCreatePerformanceClass`, `onCreateResolutionScale3d`, `onCreateSSAOQuality`, `onCreateScalingMode`, `onCreateScalingModeQuality`, `onCreateShaderQuality`, `onCreateShadingRateQuality`, `onCreateShadowDistanceQuality`, `onCreateShadowMapFiltering`, `onCreateShadowMaxLights`, `onCreateShadowQuality`, `onCreateSharpness`, `onCreateSoftShadows`, `onCreateTerrainLODDistance`, `onCreateTerrainQuality`, `onCreateTextureResolution`, `onCreateVolumeMeshTessellation`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFocusLockedIcon`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAlternatingSettingsBackgrounds`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `updatePerformanceClass`, `updateValues`, `verifyConfiguration`

### SettingsConsoleFrame (166 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onApplySettings`, `onClickBrightness`, `onClickFovy`, `onClickFovyPlayerFirstPerson`, `onClickFovyPlayerThirdPerson`, `onClickInvertYLook`, `onClickLanguage`, `onClickMasterVolume`, `onClickMusicVolume`, `onClickPerformanceMode`, `onClickRealBeaconLights`, `onClickUIScale`, `onClickVolumeCharacter`, `onClickVolumeEnvironment`, `onClickVolumeGUI`, `onClickVolumeNoFocus`, `onClickVolumeRadio`, `onClickVolumeVehicle`, `onClose`, `onCreateBrightness`, `onCreateFovy`, `onCreateFovyPlayerFirstPerson`, `onCreateFovyPlayerThirdPerson`, `onCreateLanguage`, `onCreateUIScale`, `onCreateVolume`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHDRCalibration`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onUserProfileChanged`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setOpenHDRSettingsCallback`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateHDRFocus`, `updatePagingButtons`, `updateValues`, `verifyConfiguration`

### SettingsControlsFrame (163 members)
`addCallback`, `addElement`, `applyProfile`, `assignDeviceTableData`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `notifyInputGatheringFinished`, `onClickDefaults`, `onClickNextRow`, `onClickPrevRow`, `onClose`, `onControllerChanged`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onInputClicked`, `onMenuAcceptUp`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onYesNoSaveControls`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `revertChanges`, `saveChanges`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setControlsMessage`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `showInputPrompt`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateListHeaderNames`, `updateMenuButtons`, `updatePagingButtons`, `verifyConfiguration`

### SettingsDeviceFrame (142 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onApplySettings`, `onAxisLeftRight`, `onAxisUpDown`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onSwitchDevice`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateController`, `updateFramePosition`, `updateGamepadInputStates`, `updatePagingButtons`, `updateView`, `verifyConfiguration`

### SettingsDisplayFrame (163 members)
`addCallback`, `addElement`, `applyProfile`, `applySettings`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onApplySettings`, `onClickAdvancedButton`, `onClickBrightness`, `onClickFrameLimit`, `onClickFullscreenMode`, `onClickHDREnabled`, `onClickLockedIcon`, `onClickPerformanceClass`, `onClickResolution`, `onClickResolutionScale`, `onClickUIScale`, `onClickVSync`, `onClose`, `onCreateBrightness`, `onCreateFrameLimit`, `onCreateFullscreenMode`, `onCreatePerformanceClass`, `onCreateResolution`, `onCreateResolutionScale`, `onCreateUIScale`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFocusLockedIcon`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHDRCalibration`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setOpenAdvancedSettingsCallback`, `setOpenHDRSettingsCallback`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `updatePerformanceClass`, `updateValues`, `verifyConfiguration`

### SettingsGeneralFrame (165 members)
`addCallback`, `addElement`, `applyDefaultSettingsValues`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onApplySettings`, `onClickCharacterEnvironment`, `onClickForceFeedback`, `onClickInputHelpMode`, `onClickInvertYLook`, `onClickIsGamepadEnabled`, `onClickIsHeadTrackingEnabled`, `onClickLanguage`, `onClickMPLanguage`, `onClickMasterVolume`, `onClickMusicVolume`, `onClickRecordingVolume`, `onClickVoiceMode`, `onClickVoiceVolume`, `onClickVolumeCharacter`, `onClickVolumeEnvironment`, `onClickVolumeGUI`, `onClickVolumeNoFocus`, `onClickVolumeRadio`, `onClickVolumeVehicle`, `onClose`, `onCreateForceFeedback`, `onCreateInputHelpMode`, `onCreateLanguage`, `onCreateMPLanguage`, `onCreateRecordingVolume`, `onCreateVoiceMode`, `onCreateVolume`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### SettingsHDRFrame (151 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `hdrPlaneChanged`, `hdrPlaneLoaded`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadHDRPlane`, `loadProfile`, `mouseEvent`, `move`, `new`, `onApplySettings`, `onClickHDRContrast`, `onClickHDRPeakBrightness`, `onClickHDRSceneChange`, `onClickOverlayBrightness`, `onClose`, `onCreateHDRContrast`, `onCreateHDRPeakBrightness`, `onCreateOverlayBrightness`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `onResetSettings`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `updateValues`, `verifyConfiguration`

### SettingsScreen (205 members)
`addCallback`, `addElement`, `addPage`, `addPageTab`, `applyProfile`, `assignMenuButtonInfo`, `callButtonsWithAction`, `canManageDisplaySettings`, `canManageInputBindings`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonActions`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exitMenu`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getBreadcrumbs`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDetailMode`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getPageButtonInfo`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getStack`, `getTopFrame`, `goToPage`, `hasExtendedSettings`, `hasSimplifiedSettings`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isAtRoot`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `makeCanManageInputDevices`, `makeSelfCallback`, `mouseEvent`, `move`, `new`, `onBackAction`, `onButtonBack`, `onButtonBack`, `onClickActivate`, `onClickActivate`, `onClickAdvancedSettings`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickCancel`, `onClickHDRSettings`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickPageSelection`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onDetailClosed`, `onDetailOpened`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMenuActionClick`, `onMenuOpened`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageChange`, `onPageChange`, `onPageClicked`, `onPageClicked`, `onPageNext`, `onPagePrevious`, `onPageUpdate`, `onSaveChangesBackCallback`, `onTabMenuScroll`, `onTabMenuSelectionChanged`, `playSample`, `popDetail`, `popToRoot`, `populateCellForItemInSection`, `pushDetail`, `raiseCallback`, `rebuildTabList`, `register`, `registerPage`, `reloadFocusHandling`, `removeElement`, `removePage`, `replaceDetail`, `reset`, `reset`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPageDisabled`, `setPageEnabled`, `setPageSelectorTitles`, `setPageTabEnabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `setupMenuButtonInfo`, `setupPages`, `shouldFocusChange`, `showDisplaySettings`, `showGeneralSettings`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unregisterPage`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonsPanel`, `updateFramePosition`, `updatePages`, `updatePagingVisibility`, `updateTabDisplay`, `verifyConfiguration`

### Shader (6 members)
—

### ShaderPlaneEffect (34 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setOffset`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### ShakeAnimation (24 members)
`addDuplicate`, `calculateTurnOffFadeTime`, `class`, `copy`, `delete`, `getAllowUpdate`, `isDuplicate`, `isRunning`, `isa`, `load`, `new`, `registerAnimationClassXMLPaths`, `reset`, `setFillType`, `setUpdateDistance`, `start`, `stop`, `superClass`, `update`, `updateDuplicate`, `updateDuplicates`

### ShallowWaterObstacles (11 members)
`getShallowWaterParameters`, `initSpecialization`, `loadObstacleNodeFromXML`, `onDelete`, `onLoadFinished`, `onPostLoad`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`

### ShallowWaterSimulation (35 members)
`addAreaGeometry`, `addObstacle`, `addWaterPlane`, `class`, `consoleCommandDebugToggle`, `consoleCommandFoamParamSet`, `consoleCommandPMLSet`, `consoleCommandPaint`, `consoleCommandParamSet`, `consoleCommandReset`, `consoleCommandSetExtraDepth`, `consoleCommandSizeSet`, `copy`, `delete`, `drawDebug`, `enableWaterPlaneDebugMode`, `isa`, `load`, `new`, `onTerrainLoad`, `paintCircle`, `paintRectangle`, `removeAreaGeometry`, `removeObstacle`, `removeWaterPlane`, `reset`, `setShallowWaterSimInPrecipitation`, `superClass`, `update`, `updateParameters`

### Ship (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### ShipMover (41 members)
`addDeleteListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `getIsDelayedLoaded`, `getIsShipCrossingPoint`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `load`, `loadFromXMLFile`, `new`, `onCreate`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `resetObjectIds`, `saveToXMLFile`, `setOwnerConnection`, `setOwnerFarmId`, `superClass`, `unregister`, `update`, `updateEnd`, `updatePosition`, `updateTick`, `writeStream`, `writeUpdateStream`

### ShipStatic (41 members)
`addDeleteListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `load`, `loadFromXMLFile`, `new`, `onCreate`, `onGhostAdd`, `onGhostRemove`, `onHourChanged`, `onMissionStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `resetObjectIds`, `saveToXMLFile`, `setOwnerConnection`, `setOwnerFarmId`, `setVisibility`, `superClass`, `unregister`, `update`, `updateEnd`, `updateTick`, `writeStream`, `writeUpdateStream`

### ShopConfigScreen (239 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `consoleCommandUIToggle`, `copy`, `copyAttributes`, `copyAttributes`, `createCamera`, `createFadeAnimations`, `createFromExistingGui`, `createInputGlyphs`, `createWorkshop`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `deletePreviewVehicles`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `fadeScreen`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getConfigurationCostsAndChanges`, `getDefaultConfigIndexByName`, `getDefaultConfigurationColorIndex`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOrCreateConfigItem`, `getOrCreateLargeConfigItem`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `limitXRotation`, `loadCurrentConfiguration`, `loadFromXML`, `loadMapData`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onCallback`, `onCameraLeftRight`, `onCameraUpDown`, `onCameraZoom`, `onChangeLicensePlate`, `onClickActivate`, `onClickBack`, `onClickBuy`, `onClickCancel`, `onClickConfigAction`, `onClickLease`, `onClickLicensePlate`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onFinishedLoading`, `onFocusActivate`, `onFocusConfigurationOption`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onLeaveConfigurationOption`, `onLicensePlateBoxLoaded`, `onMoneyChange`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPickColor`, `onRenderLoad`, `onSlotUsageChanged`, `onStoreItemsReloaded`, `onVehicleBought`, `onVehiclesLoaded`, `onWorkshopLoaded`, `onYesNoBuy`, `onYesNoLease`, `playSample`, `processAttributeData`, `processStoreItemBaleLoaderBaleSize`, `processStoreItemBaleWrapperBaleSize`, `processStoreItemBalerBaleSize`, `processStoreItemCapacity`, `processStoreItemColorOption`, `processStoreItemConfigurationOption`, `processStoreItemConfigurationSet`, `processStoreItemConfigurations`, `processStoreItemFuelCapacity`, `processStoreItemPowerNeeded`, `processStoreItemPowerOutput`, `processStoreItemSubConfigurationOption`, `processStoreItemUpkeep`, `processStoreItemWeight`, `processStoreItemWoodHarvesterMaxTreeSize`, `processStoreItemWorkingSpeed`, `processStoreItemWorkingWidth`, `raiseCallback`, `register`, `registerCustomSpecValues`, `registerInputActions`, `reloadFocusHandling`, `removeElement`, `reset`, `resetCamera`, `resolveSizeString`, `selectFirstConfig`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setCallbacks`, `setChangeScreenCallback`, `setConfigPrice`, `setCurrentMission`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setRequestExitCallback`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setStoreItem`, `setTarget`, `setVisible`, `setWorkshopWorldPosition`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `toggleHUDVisible`, `touchEvent`, `unlinkElement`, `unloadMapData`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateBalanceText`, `updateButtons`, `updateCamera`, `updateConfigOptionElement`, `updateConfigOptionsData`, `updateConfigOptionsDisplay`, `updateConfigSetOptionElement`, `updateConfigurationButton`, `updateData`, `updateDisplay`, `updateFramePosition`, `updateInput`, `updateInputContext`, `updateInputGlyphs`, `updateLicensePlate`, `updateLicensePlateGraphics`, `updatePriceData`, `updateSubConfigOptionElement`, `verifyConfiguration`

### ShopController (96 members)
`addBrandForDisplay`, `addCategoryForDisplay`, `brandSortFunction`, `buy`, `buyHandTool`, `buyObject`, `buyVehicle`, `canBeBought`, `categorySortFunction`, `class`, `copy`, `delete`, `displayItemSortFunction`, `filterOwnedItemsByFarmId`, `finalizeBuy`, `getBrandCategories`, `getBrandNames`, `getBrands`, `getCoinItems`, `getDLCCategories`, `getDLCCategoryTypes`, `getItemsByBrand`, `getItemsByCategory`, `getItemsByCategoryOwnedOrLeased`, `getItemsByDLC`, `getItemsByPack`, `getItemsByStoreItems`, `getItemsFromCombinations`, `getItemsWithFilenames`, `getLeasedCategories`, `getLeasedFarmItems`, `getLeasedItems`, `getObjectCategories`, `getOwnedCategories`, `getOwnedFarmItems`, `getOwnedItems`, `getPlaceableCategories`, `getSaleItems`, `getShopCategories`, `getShopDLCCategories`, `getStorePackTypes`, `getStorePacks`, `getToolCategories`, `getVehicleCategories`, `isa`, `load`, `makeDisplayItem`, `new`, `onBoughtCallback`, `onHandToolBought`, `onHandToolBuyEvent`, `onHandToolBuyFailed`, `onHandToolSellEvent`, `onHandToolSellFailed`, `onHandToolSold`, `onObjectBought`, `onObjectBuyEvent`, `onObjectBuyFailed`, `onPlaceableSellEvent`, `onPlaceableSellFailed`, `onPlaceableSold`, `onSellCallback`, `onSellItem`, `onSoldCallback`, `onVehicleBought`, `onVehicleBuyEvent`, `onVehicleBuyFailed`, `onVehicleSellEvent`, `onVehicleSellFailed`, `onVehicleSold`, `onYesNoBuyHandtool`, `onYesNoBuyObject`, `reset`, `sell`, `sellHandTool`, `sellPlaceableWarningInfoClickOk`, `sellVehicle`, `setClient`, `setConfigurations`, `setCurrentMission`, `setLeasedFarmItems`, `setOwnedFarmItems`, `setPlayerFarm`, `setSaleItemBoughtCallback`, `setSwitchToConfigurationCallback`, `setUpdateAllItemsCallback`, `setUpdateShopItemsCallback`, `superClass`, `update`, `updateDisplayItems`

### ShopDisplayItem (9 members)
`class`, `copy`, `getSellPrice`, `getSortId`, `hasCombinationInfo`, `isa`, `new`, `superClass`

### ShopMenu (258 members)
`addCallback`, `addElement`, `addPage`, `addPageTab`, `applyProfile`, `assignMenuButtonInfo`, `buyItem`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonActions`, `clone`, `clone`, `closeConfigScreen`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exitMenu`, `exitMenuFromConfig`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getBreadcrumbs`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDetailMode`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getPageButtonInfo`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getStack`, `getTopFrame`, `goToPage`, `include`, `initializePages`, `initializeScreen`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isAtRoot`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `makeClickBuyItemCallback`, `makeClickSellItemCallback`, `makeIsDLCPageEnabledPredicate`, `makeIsDLCVehiclesPageEnabledPredicate`, `makeIsShopBrandsEnabledPredicate`, `makeIsShopCombinationsEnabledPredicate`, `makeIsShopGarageEnabledPredicate`, `makeIsShopItemsEnabledPredicate`, `makeIsShopLeasedEnabledPredicate`, `makeIsShopObjectsEnabledPredicate`, `makeIsShopOthersEnabledPredicate`, `makeIsShopPacksEnabledPredicate`, `makeIsShopToolsEnabledPredicate`, `makeIsShopUsedEnabledPredicate`, `makeIsShopVehiclesEnabledPredicate`, `makeSelfCallback`, `mouseEvent`, `move`, `new`, `onBackAction`, `onButtonAcceptItem`, `onButtonBack`, `onButtonBack`, `onButtonCombinations`, `onButtonConstruction`, `onButtonInfo`, `onButtonSearch`, `onButtonSelect`, `onButtonShop`, `onButtonToggleHotspot`, `onClickActivate`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBrand`, `onClickCancel`, `onClickCancel`, `onClickDLCCategory`, `onClickDLCs`, `onClickItemCategory`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickMenuExtra2`, `onClickOk`, `onClickOk`, `onClickPack`, `onClickPageSelection`, `onClickShop`, `onClose`, `onDetailClosed`, `onDetailOpened`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onLoadMapFinished`, `onMenuActionClick`, `onMenuOpened`, `onMissionLoaded`, `onMoneyChange`, `onOpen`, `onPageChange`, `onPageChange`, `onPageClicked`, `onPageClicked`, `onPageNext`, `onPagePrevious`, `onPageUpdate`, `onSearchTextEntered`, `onSelectCategory`, `onSelectItemBuyDetail`, `onSelectItemSellDetail`, `onSlotUsageChanged`, `onStoreItemsReloaded`, `onTabMenuScroll`, `onTabMenuSelectionChanged`, `onVehicleRepairRepaintEvent`, `onVehicleSaleChanged`, `onYesNoBuy`, `openSeachDialog`, `playSample`, `popDetail`, `popToRoot`, `populateCellForItemInSection`, `purchaseInAppProduct`, `pushDetail`, `raiseCallback`, `rebuildTabList`, `register`, `registerPage`, `reloadFocusHandling`, `removeElement`, `removePage`, `replaceDetail`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setClient`, `setConfigurations`, `setCurrentMission`, `setCurrentUserId`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsGamePaused`, `setNextScreenClickSoundMuted`, `setPageDisabled`, `setPageEnabled`, `setPageSelectorTitles`, `setPageTabEnabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerFarm`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setServer`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `setupMenuButtonInfo`, `setupMenuPages`, `shouldFocusChange`, `showBrands`, `showCategories`, `showCoinShop`, `showConfigurationScreen`, `showDLCVehicles`, `showDLCs`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `unregisterPage`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonsPanel`, `updateCurrentDisplayItems`, `updateFramePosition`, `updateGarageButtonInfo`, `updatePages`, `updatePagingVisibility`, `updateTabDisplay`, `verifyConfiguration`, `viewVehicle`

### ShopOthersFrame (145 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onButtonFocused`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onMenuAccept`, `onNextPage`, `onOpen`, `onOpenAnimalDealer`, `onOpenConstructionScreen`, `onOpenFarmlandScreen`, `onOpenVehicleOverview`, `onOpenWardrobeScreen`, `onPageChanged`, `onPreviousPage`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateMenuButtons`, `updatePagingButtons`, `verifyConfiguration`

### ShutdownEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SiloDialog (164 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickFillTypes`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonDisabled`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFillLevels`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### SimpleHusbandry (13 members)
`addAnimals`, `class`, `copy`, `delete`, `isa`, `load`, `new`, `onCreate`, `onIndoorStateChanged`, `onPlaceablePreDelete`, `superClass`, `update`

### SkyBoxUpdater (13 members)
`addDebugValues`, `class`, `copy`, `delete`, `isa`, `load`, `new`, `setPartScale`, `setRainScale`, `skyNodeLoaded`, `superClass`, `update`

### SleepDialog (161 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClickTargetTime`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updateOptions`, `verifyConfiguration`

### SleepManager (35 members)
`class`, `copy`, `draw`, `getCanSleep`, `getFallbackCamera`, `getIsSleeping`, `getSleepCamera`, `initDataStructures`, `isa`, `load`, `loadMapData`, `new`, `onSleepNotAllowed`, `onSleepRequest`, `onSleepRequestDenied`, `onSleepRequestPending`, `onSleepRequestTimeout`, `onSleepRequestYesNo`, `onSleepResponse`, `onUserRemoved`, `resetRequest`, `showDialog`, `sleepDialogYesNo`, `startSleep`, `startSleepRequest`, `stopSleep`, `superClass`, `unloadMapData`, `update`

### SleepNotAllowedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SleepRequestDeniedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SleepRequestEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SleepRequestPendingEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SleepRequestTimeoutEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SleepResponseEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SlideDoorTrigger (9 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `triggerCallback`, `update`

### SlotSystem (27 members)
`addLimitedObject`, `class`, `copy`, `delete`, `getAreSlotsVisible`, `getCanAddLimitedObjects`, `getCanConnect`, `getIsCountableObject`, `getStoreItemSlotUsage`, `hasEnoughSlots`, `isa`, `loadMapData`, `new`, `removeLimitedObject`, `saveToXMLFile`, `setSlotLimit`, `superClass`, `updateSlotLimit`, `updateSlotUsage`

### SlotSystemUpdateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SlurrySideToSideEffect (35 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setOffset`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `transformEffectNode`, `update`

### SmartAttach (13 members)
`doSmartAttach`, `getCanBeSmartAttached`, `initSpecialization`, `onDelete`, `onLoad`, `onPreAttach`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `smartAttachCallback`

### SnowPlowMotionPathEffect (56 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setFillLevel`, `setLastVehicleSpeed`, `setUpdateDistance`, `start`, `start`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### SnowSystem (38 members)
`applySnow`, `class`, `consoleCommandAddSnow`, `consoleCommandResetSnow`, `consoleCommandSalt`, `consoleCommandSetSnow`, `consoleCommandSetSnowShader`, `copy`, `delete`, `getHeight`, `getMaxUpdateTime`, `getSnowHeightAtArea`, `getSnowShaderValue`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onApplicationFinished`, `onHeightChanged`, `onSleepChanged`, `onTerrainLoad`, `removeAll`, `removeSnow`, `removeSnowUnderObjects`, `saltArea`, `saveState`, `saveToXMLFile`, `setSnowHeight`, `setSnowHeightAtArea`, `startApplication`, `superClass`, `update`, `updateSnowShader`

### SoundModifierType (23 members)
—

### SoundPlayer (26 members)
`addEventListener`, `changeChannel`, `class`, `copy`, `delete`, `getChannelName`, `getIsPlaying`, `getItemName`, `initializeSoundPlayer`, `isa`, `loadReplacements`, `new`, `nextChannel`, `nextItem`, `onChange`, `pause`, `play`, `previousChannel`, `previousItem`, `removeEventListener`, `setStreamAccessAllowed`, `setStreamingAccessOwner`, `startChannel`, `superClass`, `update`, `updateMetaData`

### SpecializationLoadStep (8 members)
—

### SplineFollower (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### SprayCanEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### SprayType (7 members)
—

### StandaloneMotor (20 members)
`getAllowsStandaloneMotorRunning`, `getIsDashboardGroupActive`, `getIsOperating`, `getMotorIgnitionState`, `getNeedsStandaloneMotorRunning`, `getStandaloneMotorLoad`, `getStandaloneMotorTargetRpm`, `initSpecialization`, `loadDashboardGroupFromXML`, `onDelete`, `onLoad`, `onRegisterDashboardValueTypes`, `onUpdateTick`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `updateDebugValues`, `updateStandaloneMotorTemperature`

### StartMissionInfo (6 members)
`class`, `copy`, `isa`, `new`, `reset`, `superClass`

### StartParams (5 members)
`getIsSet`, `getValue`, `init`, `printAll`, `setValue`

### StartSleepStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### StartupScreen (141 members)
`addCallback`, `addElement`, `addStartupPicture`, `addStartupVideo`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancelCurrentEvent`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onPictureElementCreated`, `onStartupEnd`, `onStartupEndEvent`, `onVideoElementCreated`, `playSample`, `playVideo`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldAddEvent`, `shouldFocusChange`, `showNextEvent`, `showPicture`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### StaticLightCompoundLightType (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### StaticLightCompoundUVSlot (28 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### SteeringFieldCourse (21 members)
`class`, `copy`, `draw`, `getClosestPositionSegment`, `getIsPointInsideBoundary`, `getSteeringTarget`, `isa`, `loadFromXML`, `new`, `readSegmentStatesFromStream`, `readStream`, `registerXMLPaths`, `resetCurrentSegment`, `saveToXML`, `setCurrentSegmentIndex`, `superClass`, `updateVehicleData`, `writeSegmentStatesToStream`, `writeStream`

### StoneSystem (26 members)
`addDensityMapSyncer`, `class`, `consoleCommandAddDelta`, `consoleCommandSetState`, `consoleCommandToggleDebug`, `copy`, `delete`, `getColors`, `getDensityMapData`, `getGrowthMapping`, `getLitersPerSqm`, `getMapHasStones`, `getMaskValue`, `getMinMaxValues`, `getPickedValue`, `getStoneLevelAtWorldPos`, `getStoneStateAtWorldPos`, `getTitle`, `getWearMultiplierByType`, `initTerrain`, `isa`, `loadMapData`, `loadStones`, `new`, `superClass`

### StopSleepStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### StorageSystem (36 members)
`addLoadingStation`, `addPalletBuyingStation`, `addStorage`, `addStorageToLoadingStation`, `addStorageToLoadingStations`, `addStorageToUnloadingStation`, `addStorageToUnloadingStations`, `addUnloadingStation`, `class`, `consoleCommandToggleDebug`, `copy`, `delete`, `getExtendableLoadingStationsInRange`, `getExtendableUnloadingStationsInRange`, `getIsLoadingStationAvailable`, `getIsStationCompatible`, `getIsUnloadingStationAvailable`, `getLoadingStations`, `getPalletBuyingStations`, `getPlaceableLoadingStation`, `getPlaceableLoadingStationIndex`, `getPlaceableUnloadingStation`, `getPlaceableUnloadingStationIndex`, `getStorageExtensionsInRange`, `getStorages`, `getUnloadingStations`, `hasStorage`, `isa`, `new`, `removeLoadingStation`, `removePalletBuyingStation`, `removeStorage`, `removeStorageFromLoadingStations`, `removeStorageFromUnloadingStations`, `removeUnloadingStation`, `superClass`

### Store (11 members)
—

### StoreSpecies (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### SystemConsoleCommands (24 members)
`changeLanguage`, `cleanI3DCache`, `delete`, `drawGuiHelper`, `drawRawInput`, `init`, `listCustomEnvMaps`, `registerCustomEnvMap`, `reloadCurrentDialog`, `reloadCurrentGui`, `renderColorAndDepthScreenShot`, `resetHelpSystem`, `resetHelpSystemWithDraw`, `setCustomEnvMap`, `setDebugRenderingMode`, `setFidelityFxSR`, `setHighQuality`, `setTextureStreamingBudget`, `showSafeFrame`, `softRestart`, `suspendApp`, `toggleUiDebug`, `toggleUiFocusDebug`, `updateDownloadFinished`

### TEXTURE_FILTERING (7 members)
—

### TedderMission (156 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### TemperatureUpdater (11 members)
`class`, `copy`, `delete`, `getCurrentValues`, `getTemperatureAtTime`, `isa`, `new`, `setDayLength`, `setTargetValues`, `superClass`, `update`

### TensionBeltGeometryConstructor (12 members)
`addAttachment`, `addIntersectionPoint`, `addShape`, `finalize`, `new`, `setFixedPoints`, `setGeometryBias`, `setLinkNode`, `setMaterial`, `setMaxEdgeLength`, `setUVscale`, `setWidth`

### TerrainDeformation (38 members)
`addArea`, `addPolygonalArea`, `addSoftCircleBrush`, `addSoftSquareBrush`, `apply`, `cancel`, `class`, `clearAreas`, `copy`, `delete`, `enableAdditiveDeformationMode`, `enableAreaBasedDeformationMode`, `enableDeformationMode`, `enablePaintingMode`, `enableSetDeformationMode`, `enableSmoothingMode`, `getBlockedAreaMapSize`, `isa`, `new`, `setAdditiveHeightChangeAmount`, `setBlockedAreaMap`, `setBlockedAreaMaxDisplacement`, `setDynamicObjectCollisionMask`, `setDynamicObjectMaxDisplacement`, `setHeightTarget`, `setOutsideAreaBrush`, `setOutsideAreaConstraints`, `superClass`

### TerrainDeformationQueue (11 members)
`cancelAllJobs`, `cancelJob`, `class`, `copy`, `isa`, `new`, `onJobComplete`, `queueJob`, `superClass`, `tryRunJob`, `update`

### TerrainDeformationSyncer (18 members)
`addCellUpdateListener`, `class`, `consoleCommandToggleDebug`, `copy`, `delete`, `draw`, `getCellId`, `getCellIndicesAtWorldPosition`, `getCellIndicesById`, `isa`, `new`, `onCellUpdate`, `readUpdateStream`, `removeCellUpdateListener`, `superClass`, `writeUpdateStream`

### TerrainDetailDistanceConstructor (3 members)
`addTexture`, `finalize`, `new`

### TerrainLoadFlags (10 members)
—

### TextInputDialog (155 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onCreate`, `onCreate`, `onEnterPressed`, `onEscPressed`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtonVisibility`, `updateFramePosition`, `verifyConfiguration`

### TextureArrayConstructor (3 members)
`addLayerFilename`, `finalize`, `new`

### TextureFormat (3 members)
—

### TimedVisibility (8 members)
`class`, `copy`, `delete`, `hourChanged`, `isa`, `new`, `onCreate`, `superClass`

### TipEffect (27 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getIsFullyVisible`, `getIsVisible`, `getValue`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### TireTrackSystem (19 members)
`addTrackPoint`, `class`, `consoleCommandRemoveAllTireTracks`, `consoleCommandTireTrackDebug`, `copy`, `createTrack`, `cutTrack`, `delete`, `destroyTrack`, `eraseParallelogram`, `erasePolygon`, `isa`, `load`, `new`, `onCreateTireTrackSystem`, `superClass`

### ToneMappingDialog (144 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `consoleCommandToneMapping`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickBlackClip`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClickShoulder`, `onClickSlope`, `onClickToe`, `onClickWhiteClip`, `onClose`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### ToolType (5 members)
—

### TouchHandler (39 members)
`addDebugPoint`, `class`, `copy`, `draw`, `getAreaDimensions`, `isa`, `new`, `onPinchDownEvent`, `onPinchUpEvent`, `onPinchUpdateEvent`, `onTouchEvent`, `raiseCallback`, `raiseGestureEvent`, `registerGestureListener`, `registerTouchArea`, `registerTouchAreaOverlay`, `removeAllTouchAreas`, `removeGestureListener`, `removeTouchArea`, `resetPendingTouchAreaInput`, `revertCustomContext`, `setAreaPosition`, `setAreaPressedSizeGain`, `setCustomContext`, `setTouchAreaVisibility`, `superClass`, `update`, `updateAreaPosition`, `updateDimensions`

### TourHotspot (40 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### TrafficLight (47 members)
`addBlockingPosition`, `addDeleteListener`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `drawDebug`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `loadFromXML`, `new`, `onAISystemLoaded`, `onCreate`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onPedestrianSystemLoaded`, `onTrafficSystemLoaded`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `resetObjectIds`, `setMovementBlocker`, `setMovementState`, `setOwnerConnection`, `setOwnerFarmId`, `setPhase`, `superClass`, `unregister`, `update`, `updateEnd`, `updateTick`, `writeStream`, `writeUpdateStream`

### TrafficSystem (54 members)
`addDeleteListener`, `buildDebugConfiguredVehicleNames`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `consoleCommandToggleDebugRendering`, `consoleCommandTrafficSystemDebugLights`, `consoleCommandTrafficSystemReload`, `consoleCommandValidate`, `copy`, `delete`, `draw`, `drawDebug`, `drawDebugNotSpawnedVehicles`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `load`, `new`, `onCreate`, `onDaylightChanged`, `onGhostAdd`, `onGhostRemove`, `onIndoorStateChanged`, `onMissionStarted`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `register`, `removeDeleteListener`, `reset`, `resetObjectIds`, `setEnabled`, `setNightTimeRange`, `setOwnerConnection`, `setOwnerFarmId`, `superClass`, `unregister`, `update`, `updateEnd`, `updateNightTimeRange`, `updateTick`, `validateParkingPositions`, `validateSplines`, `writeStream`, `writeUpdateStream`

### TransferMoneyDialog (143 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickLeft`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickRight`, `onClickShop`, `onClose`, `onClose`, `onCreateScroller`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setTargetFarm`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAmount`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### TransferMoneyEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TransportMission (133 members)
`addDeleteListener`, `calculateReimbursement`, `calculateReward`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `collisionTestCallback`, `copy`, `createHotspot`, `createHotspots`, `createObject`, `delete`, `destroyHotspots`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDetails`, `getDropoffTrigger`, `getExtraProgressText`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getLocation`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPickupTrigger`, `getReimbursement`, `getReward`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getTriggerInfo`, `getTriggerTitle`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `hasHotspots`, `hasLeasableVehicles`, `init`, `isSpawnSpaceAvailable`, `isTimedOut`, `isTriggerEmpty`, `isa`, `loadFromXMLFile`, `loadMapData`, `loadObjects`, `new`, `objectEnteredTrigger`, `objectLeftTrigger`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeDeleteListener`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setOwnerConnection`, `setOwnerFarmId`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateTick`, `updateTick`, `updateTriggerVisibility`, `validate`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### TrapezoidDecomposition (29 members)
`assignMergeGroups`, `class`, `copy`, `draw`, `generateBoundaryByGroupId`, `generateGroups`, `generateTrapezoids`, `generateVerticalLines`, `getCanTrapezoidsBeMerged`, `getClosestIntersectionWithBoundary`, `getGroups`, `getIsNeighbouringLine`, `getLongestLineByGroupId`, `getSizeByGroupId`, `getTrapezoidSize`, `isa`, `mergeGroups`, `mergeGroupsByCost`, `mergeGroupsBySize`, `mergeGroupsByWorkDirection`, `new`, `superClass`, `update`, `updateGroups`

### TrashBag (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `onPeriodChanged`, `superClass`

### TreeGrowEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TreeMarkerEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TreeMarkerSystem (22 members)
`addTreeMarker`, `addTreeMarkerByWorldDirection`, `addTreeMarkerCameraBased`, `class`, `copy`, `delete`, `getNumOfTreeMarkerTypes`, `getTreeMarkerTypeByIndex`, `getTreeMarkerTypeByName`, `initTerrain`, `isa`, `loadFromSavegameXML`, `loadMapData`, `loadTreeMarkerTypes`, `new`, `onClientJoined`, `registerTreeMarkerType`, `saveToXMLFile`, `superClass`, `unloadMapData`

### TreePlantEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TreeRemoveEvent (14 members)
`class`, `copy`, `delete`, `emptyNew`, `getIsTreeRemovable`, `getPrice`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TreeTransportMission (129 members)
`addDeleteListener`, `addHotspots`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `canSpawnTrees`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createTree`, `delete`, `deleteTrees`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getDescription`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsMissionSplitShape`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsShapeCutAllowed`, `getIsWorkAllowed`, `getLocation`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getReimbursement`, `getReward`, `getSellPointWithHighestPrice`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `loadMetaDataFromXMLFile`, `new`, `onDeleteSellingStation`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onMissionTreeCut`, `onSavegameLoaded`, `onSpawnedVehicle`, `onSpotCollision`, `onTreeShapeCut`, `onTriggerProcessedWood`, `onVehicleReset`, `prepare`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeDeleteListener`, `removeHotspot`, `resetObjectIds`, `saveMetaDataToXMLFile`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setOwnerConnection`, `setOwnerFarmId`, `setSellingStation`, `setSpot`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `started`, `superClass`, `tryGenerateMission`, `tryToResolveSellingStation`, `unloadMapData`, `unregister`, `update`, `updateEnd`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`

### TreeTransportMissionHotspot (42 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `postUpdate`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRadius`, `setWorldRotation`, `superClass`

### TreeTransportMissionTree (52 members)
`addChildenToNodeObject`, `addDeleteListener`, `addToPhysics`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `delete`, `draw`, `getAllowsAutoDelete`, `getDefaultRigidBodyType`, `getIsDelayedLoaded`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getUpdatePriority`, `isa`, `loadOnCreate`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onPhysicObjectWakeUpCallback`, `raiseActive`, `raiseDirtyFlags`, `readStream`, `readUpdateStream`, `readUpdateStream`, `register`, `removeChildrenFromNodeObject`, `removeDeleteListener`, `removeFromPhysics`, `resetObjectIds`, `setLocalPositionQuaternion`, `setNodeId`, `setOwnerConnection`, `setOwnerFarmId`, `setWorldPositionQuaternion`, `superClass`, `testScope`, `unregister`, `update`, `updateEnd`, `updateMove`, `updateTick`, `updateTick`, `wakeUp`, `writeStream`, `writeUpdateStream`, `writeUpdateStream`

### TreeTransportMissionTreeCutEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TreeTransportMissionWrongSellingStationEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TwisterDestructionNotificationEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TwisterHotspot (40 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### TwisterStartEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TwisterStopEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### TypedMotionPathEffect (51 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`, `update`

### UnBanDialog (144 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `closeAndCallback`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClickUnblock`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onPageNext`, `onPagePrevious`, `onServerBansUpdated`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadData`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setUseLocalList`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateButtons`, `updateFramePosition`, `verifyConfiguration`

### UnbanEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### UpdateSplitShapesEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### UploadState (3 members)
—

### User (48 members)
`block`, `class`, `copy`, `getAllowTextCommunication`, `getAllowVoiceCommunication`, `getConnectedTime`, `getConnection`, `getFinanceUpdateSendTime`, `getFinancesVersionCounter`, `getId`, `getIsBlocked`, `getIsBlockedBy`, `getIsMasterUser`, `getLanguageIndex`, `getNickname`, `getPlatformId`, `getPlatformSessionId`, `getPlatformUserId`, `getState`, `getUniqueUserId`, `getVoiceMuted`, `getVoiceVolume`, `isa`, `new`, `readStream`, `report`, `setConnectedTime`, `setConnection`, `setFinanceUpdateSendTime`, `setFinancesVersionCounter`, `setId`, `setIsBlockedBy`, `setIsMasterUser`, `setLanguageIndex`, `setNickname`, `setPlatformId`, `setPlatformSessionId`, `setPlatformUserId`, `setState`, `setUniqueUserId`, `setVoiceMuted`, `setVoiceVolume`, `streamReadUserId`, `streamWriteUserId`, `superClass`, `unblock`, `updateSentUserBlockedState`, `writeStream`

### UserAttributeType (6 members)
—

### UserBlockEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `sendEvent`, `superClass`, `writeStream`

### UserDataEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### UserEvent (12 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### UserManager (31 members)
`addMasterUser`, `addMasterUserByConnection`, `addUser`, `class`, `copy`, `delete`, `getAllPlatformSessionIds`, `getIsConnectionMasterUser`, `getIsUserIdMasterUser`, `getMasterUsers`, `getNextUserId`, `getNumberOfMasterUsers`, `getNumberOfUsers`, `getUniqueUserIdByConnection`, `getUniqueUserIdByUserId`, `getUserByConnection`, `getUserByNickname`, `getUserByUniqueId`, `getUserByUserId`, `getUserIdByConnection`, `getUserNameByConnection`, `getUsers`, `isa`, `new`, `removeMasterUser`, `removeUser`, `removeUserByConnection`, `removeUserById`, `setUserBlockDataDirty`, `superClass`, `update`

### ValarPowerMode (3 members)
—

### ValarQuality (5 members)
—

### ValueBuffer (8 members)
`add`, `class`, `copy`, `get`, `getAverage`, `isa`, `new`, `superClass`

### ValueDelay (7 members)
`add`, `class`, `copy`, `isa`, `new`, `reset`, `superClass`

### VariableMotionPathEffect (61 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `start`, `start`, `stop`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### VehicleConfigurationDataAdditionalMass (2 members)
`onLoad`, `registerXMLPaths`

### VehicleDebug (61 members)
`consoleCommandAnalyze`, `consoleCommandAttacherJointConnections`, `consoleCommandAutomaticMotorStart`, `consoleCommandCameraReset`, `consoleCommandCastShadow`, `consoleCommandCylinderedUpdate`, `consoleCommandDebugMaterial`, `consoleCommandDecalLayer`, `consoleCommandExportScenegraph`, `consoleCommandMergeGroupDebug`, `consoleCommandToolConnections`, `consoleCommandVehicleDebug`, `consoleCommandWetnessDebug`, `consoleCommandWheelDisplacement`, `consoleCommandWheelEffectsDebug`, `debugActionCallback`, `delete`, `drawAnimationDebug`, `drawAxleInfoRendering`, `drawBaseDebugRendering`, `drawDebug`, `drawDebugAIRendering`, `drawDebugAttacherJoints`, `drawDebugAttributeRendering`, `drawDebugRendering`, `drawDebugValues`, `drawDifferentialInfoRendering`, `drawMotorAccelerationGraph`, `drawMotorGraphs`, `drawMotorLoadGraph`, `drawMotorRPMGraph`, `drawSoundDebugValues`, `drawTransmissionDebug`, `drawTuningDebug`, `drawWheelInfoRendering`, `drawWheelSlipGraphs`, `moveLowerRotation`, `moveUpperRotation`, `registerActionEvents`, `setState`, `updateDebug`, `updateTuningDebugRendering`

### VehicleDocGenerator (14 members)
`class`, `collectData`, `copy`, `createRichDataTable`, `extractWeightKg`, `generate`, `generateItemPage`, `generateOverviewPage`, `getItemFilename`, `getOverviewQualifiedName`, `getSummary`, `isa`, `new`, `superClass`

### VehicleHotspot (48 members)
`addRenderStateChangedListener`, `checkOverlapCircle`, `checkOverlapRectangle`, `class`, `copy`, `delete`, `getCanBeAccessed`, `getCanBlink`, `getCategory`, `getClickArea`, `getClickCircle`, `getColor`, `getDimension`, `getHeight`, `getIsPersistent`, `getIsVisible`, `getLastScreenPosition`, `getLastScreenPositionCenter`, `getRenderLast`, `getSortingValue`, `getTypeByName`, `getVehicle`, `getWidth`, `getWorldPosition`, `getWorldRotation`, `hasMouseOverlap`, `isa`, `new`, `onRenderStateChanged`, `removeRenderStateChangedListener`, `render`, `setBlinking`, `setColor`, `setLastRenderInfo`, `setOwnerFarmId`, `setPersistent`, `setScale`, `setSelected`, `setVehicle`, `setVehicleType`, `setVisible`, `setWorldPosition`, `setWorldRotation`, `superClass`

### VehicleLoadingState (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### VehiclePropertyState (17 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### VehicleRemoveEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### VehicleSaleAddEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### VehicleSaleRemoveEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### VehicleSaleSystem (31 members)
`addSale`, `class`, `consoleCommandRefresh`, `copy`, `delete`, `generateInitialSales`, `generateRandomVehicle`, `getFreeId`, `getItems`, `getSaleById`, `isa`, `loadFromXMLFile`, `new`, `onHourChanged`, `onVehicleBought`, `onVehicleWillSell`, `removeSale`, `removeSaleWithId`, `saveToXMLFile`, `sendAllToClient`, `superClass`

### VehicleSchemaOverlayData (7 members)
`addAttacherJoint`, `class`, `copy`, `isa`, `new`, `superClass`

### VehicleShopBase (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### VehicleShopDialog (165 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `cancel`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickBack`, `onClickCancel`, `onClickItems`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickQuantity`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onClose`, `onCreate`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onNo`, `onOpen`, `onPageNext`, `onPagePrevious`, `onYes`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resizeDialog`, `resolveSizeString`, `sendCallback`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonDisabled`, `setButtonSounds`, `setButtonTexts`, `setCallback`, `setCallback`, `setChangeScreenCallback`, `setDescription`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setItems`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTarget`, `setText`, `setTitle`, `setUpdateCallback`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePrices`, `verifyConfiguration`

### VehicleStateChange (24 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### VendingMachine (10 members)
`class`, `copy`, `delete`, `isa`, `new`, `onActivate`, `onCreate`, `superClass`, `triggerCallback`, `update`

### VineDetector (17 members)
`cancelVineDetection`, `clearCurrentVinePlaceable`, `finishedVineDetection`, `getCanStartVineDetection`, `getCurrentVineHitDistance`, `getCurrentVineHitPosition`, `getFirstVineHitPosition`, `getIsValidVinePlaceable`, `handleVinePlaceable`, `initSpecialization`, `onLoad`, `onUpdate`, `prerequisitesPresent`, `raycastCallbackVineDetection`, `registerEventListeners`, `registerFunctions`

### VineSystem (63 members)
`addCellNodeMapping`, `addElement`, `addSyncerCellListeners`, `class`, `clearCellNodeMapping`, `clearNodeDirty`, `consoleCommandPrintCellMapping`, `consoleCommandSetGrowthState`, `consoleCommandToggleDMUpdateDebug`, `consoleCommandToggleDebug`, `consoleCommandUpdateVisuals`, `copy`, `createSpiralOffsets`, `delete`, `drainBucket`, `draw`, `getCellKey`, `getClosestFencePartOfPlaceable`, `getClosestFencePartOfSegment`, `getDensityMapSyncerCellIndexRange`, `getDominantGrowthState`, `getFencePartClosestToPosition`, `getGrowthStateNames`, `getIsNodeMappedFromPole`, `getIsNodeOnFarmland`, `getNodeAreaDistance`, `getNumRegisteredSiblings`, `getPlaceable`, `getRegisteredNodeClosestToPosition`, `getSyncerCellSizeInMeters`, `getVineAreaCenter`, `initTerrain`, `isa`, `markNodeDirty`, `new`, `onDensityMapSyncerUpdate`, `onFinishedGrowthPeriod`, `packCellKey`, `removeElement`, `removeSyncerCellListeners`, `renderAreaDebugCells`, `renderDebugCell`, `renderListenerDebugCells`, `renderNodeDebugInfo`, `superClass`, `update`, `updateNearestDirtyNodes`, `updateRemainingDirtyNodes`

### VoiceChatConnectionStatus (3 members)
—

### VoiceChatRecordingMode (5 members)
—

### VoiceChatUtil (16 members)
`getHasRecordingDevice`, `getInputMode`, `getInputSensitivity`, `getInputVolume`, `getIsSpeakerActive`, `getIsVoiceRestricted`, `getOutputVolume`, `getUserVolume`, `setInputMode`, `setInputSensitivity`, `setInputVolume`, `setIsPushToTalkPressed`, `setOutputVolume`, `setUserVolume`, `showVoiceRestrictedPopup`

### VolumetricFogQuality (7 members)
—

### Volvo_FH16_Pack (0 members)
—

### VoteDialog (155 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `close`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBlurArea`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getValueForElement`, `hide`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickShop`, `onClose`, `onClose`, `onClose`, `onCreate`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onOpen`, `onOpen`, `onOpen`, `onPageNext`, `onPagePrevious`, `onStarClick`, `onStarFocus`, `onStarHighlight`, `onStarHighlightRemove`, `playSample`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resizeDialog`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDialogType`, `setDisableOpenSound`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setIsCloseAllowed`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSize`, `setSoundSuppressed`, `setStars`, `setTarget`, `setText`, `setUpdateCallback`, `setValue`, `setVisible`, `shouldFocusChange`, `show`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `verifyConfiguration`

### WardrobeCharactersFrame (146 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadPlayers`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClickChangeName`, `onClickSelect`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListSelectionChanged`, `onNextPage`, `onNicknameChanged`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resetList`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerStyle`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### WardrobeColorsFrame (146 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClickBack`, `onClickSelect`, `onClose`, `onDoubleClickSelect`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListHighlightChanged`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setConfigAndItem`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerStyle`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `verifyConfiguration`

### WardrobeItemsFrame (150 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSelectedItem`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClickSelect`, `onClickSelectColor`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListHighlightChanged`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resetList`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setItemToIndex`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerStyle`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `updateSelectionButton`, `verifyConfiguration`

### WardrobeOutfitsFrame (152 members)
`addCallback`, `addElement`, `applyProfile`, `canReceiveFocus`, `changeScreen`, `class`, `clearMenuButtonInfoDirty`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getCurrentPage`, `getCurrentlySelectedPresetIndex`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getHasCustomMenuButtons`, `getHasNextPage`, `getHasPreviousPage`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getMainElementPosition`, `getMainElementSize`, `getMenuButtonInfo`, `getNumberOfItemsInSection`, `getNumberOfSections`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getPresetFromItem`, `getPresetHasColors`, `getRootElement`, `getSelectedPreset`, `getSoundSuppressed`, `getTabbingMenuVisible`, `getTitle`, `getTitleForSectionHeader`, `include`, `initialize`, `inputEvent`, `inputReleaseEvent`, `isChildOf`, `isInputDisabled`, `isMenuButtonInfoDirty`, `isTabbingMenuVisibleDirty`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onClickSelect`, `onClickSelectColor`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onFrameClose`, `onFrameOpen`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onListHighlightChanged`, `onListSelectionChanged`, `onNextPage`, `onOpen`, `onPageChanged`, `onPreviousPage`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `requestClose`, `reset`, `resetList`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setCallback`, `setChangeScreenCallback`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setMenuButtonInfo`, `setMenuButtonInfoDirty`, `setNumberOfPages`, `setPagingButtonsDirty`, `setPagingButtonsDisabled`, `setPivot`, `setPlaySampleCallback`, `setPlayerStyle`, `setPosition`, `setSelected`, `setSize`, `setSoundSuppressed`, `setTabbingMenuVisible`, `setTarget`, `setTitle`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateFramePosition`, `updatePagingButtons`, `updateSelectionButton`, `verifyConfiguration`

### WaterLog (11 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### WaterType (14 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### Watermill (8 members)
`class`, `copy`, `delete`, `isa`, `new`, `onCreate`, `superClass`, `update`

### Weather (68 members)
`addStartWeather`, `addWeatherForecast`, `class`, `consoleCommandWeatherAdd`, `consoleCommandWeatherReloadData`, `consoleCommandWeatherSet`, `consoleCommandWeatherSetClouds`, `consoleCommandWeatherSetDebugWind`, `consoleCommandWeatherToggleDebug`, `consoleCommandWeatherToggleRandomWindWaving`, `consoleCommandWeatherTwisterSpawn`, `copy`, `createRandomWeatherInstance`, `delete`, `draw`, `fillWeatherForecast`, `getCloudEnvMapInfo`, `getCurrentMinMaxTemperatures`, `getCurrentTemperature`, `getCurrentTemperatureTrend`, `getCurrentWeatherType`, `getForecast`, `getForecastInstanceVariation`, `getGroundWetness`, `getHailFallScale`, `getIsHailing`, `getIsRaining`, `getIsReady`, `getIsSnowing`, `getNextWeatherType`, `getRainFallScale`, `getRandomWeatherObjectVariation`, `getSnowFallScale`, `getTimeSinceLastRain`, `getTimeUntilRain`, `getWeatherObjectByIndex`, `getWeatherObjectBySeasonAndType`, `getWeatherTypeAtTime`, `init`, `isa`, `load`, `loadFromXMLFile`, `loadWeatherObjects`, `new`, `onDayChanged`, `onGameStateChanged`, `onPeriodLengthChanged`, `onTimeScaleChanged`, `onWeatherChanged`, `randomizeFog`, `rebuild`, `saveToXMLFile`, `sendInitialState`, `setInitialState`, `setIsRainAllowed`, `superClass`, `update`, `updateAvailableWeatherObjects`

### WeatherAddObjectEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### WeatherForecast (16 members)
`class`, `copy`, `dataForTime`, `delete`, `getCurrentWeather`, `getDailyForecast`, `getHourlyForecast`, `getTemperatureAtTimeForCurve`, `isa`, `load`, `new`, `superClass`

### WeatherInstance (12 members)
`class`, `copy`, `createInstance`, `isa`, `loadFromXMLFile`, `new`, `readStream`, `saveToXMLFile`, `superClass`, `writeStream`

### WeatherObject (15 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsAvailable`, `getMinDuration`, `getRandomVariationIndex`, `getVariationByIndex`, `isa`, `load`, `loadVariation`, `new`, `superClass`, `update`

### WeatherObjectHail (18 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsAvailable`, `getMinDuration`, `getRandomVariationIndex`, `getVariationByIndex`, `initInstanceData`, `isa`, `load`, `loadInstanceDataFromXMLFile`, `loadVariation`, `new`, `saveInstanceDataToXMLFile`, `superClass`, `update`

### WeatherObjectTwister (18 members)
`activate`, `class`, `copy`, `deactivate`, `delete`, `getIsAvailable`, `getMinDuration`, `getRandomVariationIndex`, `getVariationByIndex`, `initInstanceData`, `isa`, `load`, `loadInstanceDataFromXMLFile`, `loadVariation`, `new`, `saveInstanceDataToXMLFile`, `superClass`, `update`

### WeatherStateEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### WeatherType (20 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### WeedMission (159 members)
`addDeleteListener`, `addHotspots`, `addToMissionMap`, `calculateReimbursement`, `calculateStealingCost`, `canRun`, `class`, `clearDirtyFlags`, `clearDirtyMask`, `copy`, `createMapHotspot`, `createModifier`, `delete`, `delete`, `delete`, `dismiss`, `dismiss`, `draw`, `failedToLoadFromXMLFile`, `farmDestroyed`, `finish`, `finish`, `finishField`, `finishedPreparing`, `getActualReward`, `getActualStealingCosts`, `getActualVehicleCosts`, `getCompletion`, `getCompletion`, `getDescription`, `getDetails`, `getDetails`, `getExtraProgressText`, `getFarmlandId`, `getField`, `getFieldCompletion`, `getFieldFinishTask`, `getFieldPreparingTask`, `getFinishedDetails`, `getInfo`, `getIsDelayedLoaded`, `getIsFinished`, `getIsInProgress`, `getIsPrepared`, `getIsPrepared`, `getIsReadyToStart`, `getIsRunning`, `getIsWorkAllowed`, `getIsWorkAllowed`, `getLocation`, `getLocation`, `getMapHotspots`, `getMapHotspots`, `getMinutesLeft`, `getMissionTypeName`, `getNPC`, `getNPC`, `getNextDirtyFlag`, `getOwnerConnection`, `getOwnerFarmId`, `getPartitionCompletion`, `getReimbursement`, `getReward`, `getReward`, `getRewardPerHa`, `getStealingCosts`, `getTitle`, `getTotalReward`, `getUniqueId`, `getUpdatePriority`, `getVariant`, `getVehicleCosts`, `getVehicleGroup`, `getVehicleGroupFromIdentifier`, `getVehicleSize`, `getVehicleSize`, `getVehicleVariant`, `getWasRunning`, `getWasStarted`, `getWorldPosition`, `getWorldPosition`, `hasLeasableVehicles`, `init`, `init`, `initializeModifier`, `isAvailableForField`, `isSpawnSpaceAvailable`, `isTimedOut`, `isa`, `loadFromXMLFile`, `loadMapData`, `new`, `onGhostAdd`, `onGhostRemove`, `onMissionStarted`, `onSavegameLoaded`, `onSpawnedVehicle`, `onVehicleReset`, `prepare`, `prepare`, `prepareField`, `raiseActive`, `raiseDirtyFlags`, `reactivate`, `reactivate`, `readStream`, `readStream`, `readStream`, `readStreamMissionStartedInfo`, `readUpdateStream`, `readUpdateStream`, `register`, `registerMetaXMLPaths`, `registerSavegameXMLPaths`, `registerXMLPaths`, `removeAccess`, `removeAccess`, `removeDeleteListener`, `removeFromMissionMap`, `removeHotspot`, `resetObjectIds`, `saveToXMLFile`, `setDefaultEndDate`, `setEndDate`, `setEndDateByOffset`, `setField`, `setOwnerConnection`, `setOwnerFarmId`, `setPartitionRegion`, `setStatus`, `setUniqueId`, `spawnVehicle`, `spawnVehicles`, `start`, `start`, `started`, `started`, `superClass`, `tryGenerateMission`, `unloadMapData`, `unregister`, `update`, `update`, `update`, `updateEnd`, `updateFieldPercentageDone`, `updateMissionMap`, `updateTick`, `updateTick`, `validate`, `writeStream`, `writeStream`, `writeStream`, `writeStreamMissionStartedInfo`, `writeUpdateStream`, `writeUpdateStream`

### WeedSystem (39 members)
`addDensityMapSyncer`, `addPolygonDelta`, `class`, `consoleCommandAddDelta`, `consoleCommandSetState`, `copy`, `delete`, `getBlockingStateData`, `getCanBeHoed`, `getCanBeWeeded`, `getColors`, `getDenseStartState`, `getDensityMapData`, `getFactors`, `getFieldInfoStates`, `getGrowthMapping`, `getHerbicideReplacements`, `getHoedState`, `getInfoLayer`, `getInfoLayerData`, `getMapHasWeed`, `getMaxValue`, `getMulcherReplacements`, `getSparseStartState`, `getTitle`, `getWeedFactorAtWorldPos`, `getWeedStateAtWorldPos`, `getWeededState`, `getWeederReplacements`, `initTerrain`, `isa`, `loadInfoLayer`, `loadMapData`, `loadReplacements`, `loadWeed`, `new`, `setPolygonState`, `superClass`

### WheelContactType (16 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### WildlifeAlligatorState (15 members)
`getAll`, `getAllNames`, `getAllOrdered`, `getAllOrderedByName`, `getByName`, `getName`, `getNumBits`, `loadFromXMLFile`, `readStream`, `registerXMLPath`, `saveToXMLFile`, `writeStream`

### WildlifeAnimal (11 members)
`calculateDistanceFrom`, `class`, `copy`, `delete`, `despawn`, `drawDebug`, `isa`, `new`, `spawnAt`, `superClass`, `update`

### WildlifeAnimalFlyBy (12 members)
`calculateDistanceFrom`, `class`, `copy`, `delete`, `despawn`, `drawDebug`, `isa`, `new`, `setFlyDirection`, `spawnAt`, `superClass`, `update`

### WildlifeFleeState (30 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfShouldFlee`, `calculateIfValidEntryState`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `fleeFromPlayer`, `fleeInDirection`, `fleeToDespawn`, `isa`, `loadAttributesTable`, `loadDebugInfoFromXMLFile`, `new`, `onInstanceDespawned`, `onInstanceSpawned`, `onMovementTargetReached`, `onStateEntered`, `onStateExited`, `onTargetCallback`, `registerXMLPaths`, `replenishPatience`, `superClass`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`

### WildlifeFollowState (26 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfValidEntryState`, `canSetFollowTarget`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `isa`, `loadAttributesTable`, `loadDebugInfoFromXMLFile`, `new`, `onInstanceDespawned`, `onInstanceSpawned`, `onMovementTargetReached`, `onStateEntered`, `onStateExited`, `registerXMLPaths`, `resetMovementState`, `superClass`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`

### WildlifeHotspot (12 members)
`calculateRandomSpawnPositionForSpecies`, `calculateRandomTargetInRadius`, `class`, `copy`, `isa`, `new`, `spawnAt`, `superClass`, `trySpawnInstances`

### WildlifeIdleState (23 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfValidEntryState`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `isa`, `loadAttributesTable`, `loadDebugInfoFromXMLFile`, `new`, `onStateEntered`, `onStateExited`, `registerXMLPaths`, `superClass`, `toggleCurrentAnimation`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`

### WildlifeInstance (14 members)
`class`, `copy`, `delete`, `despawn`, `drawDebug`, `getNumAnimals`, `getSecondsSinceSpawn`, `isa`, `new`, `randomiseDespawnTime`, `setSpawnTimestampToNow`, `spawnAt`, `superClass`, `update`

### WildlifeInstanceAlligator (63 members)
`applyPose`, `applyTextureVariant`, `calculateDistanceFrom`, `class`, `copy`, `createFoliageBending`, `createShallowWaterObstacle`, `delete`, `despawn`, `destroyFoliageBending`, `destroyShallowWaterObstacle`, `drawDebug`, `getCanStartFleeing`, `getHasCoveredWalkDistance`, `getNumAnimals`, `getPoseTarget`, `getSecondsSinceSpawn`, `getShallowWaterParameters`, `getSwimSpeed`, `getTerrainPlane`, `getWaterProbeDistance`, `initIdleVariant`, `isa`, `loadConditionalAnimation`, `moveForward`, `new`, `onAssetLoaded`, `onWaterRaycastCallback`, `randomiseDespawnTime`, `releaseAsset`, `resetIdleSoundTimer`, `setIsWaterAhead`, `setSpawnNode`, `setSpawnTimestampToNow`, `setTextureVariant`, `spawnAt`, `startFleeing`, `startSwimming`, `stopFleeing`, `superClass`, `update`, `updateAnimationParameters`, `updateFacing`, `updateIdleSound`, `updateResting`, `updateSwimming`, `updateWalking`, `updateWaterCheck`

### WildlifeInstanceCompanion (16 members)
`calculateDistanceFrom`, `class`, `copy`, `delete`, `despawn`, `drawDebug`, `getNumAnimals`, `getSecondsSinceSpawn`, `isa`, `new`, `randomiseDespawnTime`, `setNumAnimals`, `setSpawnTimestampToNow`, `spawnAt`, `superClass`, `update`

### WildlifeInstanceFlyByGroup (18 members)
`calculateDistanceFrom`, `class`, `copy`, `delete`, `despawn`, `drawDebug`, `getNumAnimals`, `getSecondsSinceSpawn`, `isa`, `new`, `randomiseDespawnTime`, `setFlyDirection`, `setGroupRadius`, `setNumAnimals`, `setSpawnTimestampToNow`, `spawnAt`, `superClass`, `update`

### WildlifeInstanceGraphics (18 members)
`class`, `copy`, `delete`, `getHasAnimation`, `isa`, `load`, `loadAttributesTable`, `new`, `onI3DLoadingFinished`, `registerXMLPaths`, `setAnimation`, `setAnimationOffset`, `superClass`, `transitionToAnimation`, `update`

### WildlifeInstanceMover (39 members)
`adjustRayHitForWater`, `calculateCurrentPosition`, `calculateInterpolatedDesiredYLevel`, `cancelTarget`, `checkFlapDuration`, `checkIfTargetPositionValid`, `checkIfTargetReached`, `class`, `copy`, `debugDraw`, `flyOrMoveToTarget`, `flyToTarget`, `getIsMoving`, `initialiseMovement`, `isa`, `loadAttributesTable`, `moveToTarget`, `new`, `randomiseCurrentSpeed`, `randomiseDesiredHeight`, `recalculateGroundReference`, `registerXMLPaths`, `superClass`, `tryRecalculateGroundReferenceAsync`, `update`, `updateAnimations`, `updateNodeTransform`, `updateVerticalAnimations`

### WildlifeInstanceSounds (12 members)
`class`, `copy`, `delete`, `deleteAttributesTable`, `deleteCurrentSample`, `isa`, `loadAttributesTable`, `new`, `onInstanceSpawned`, `playSound`, `registerXMLPaths`, `superClass`

### WildlifeManager (21 members)
`addGroup`, `addSpawnGroup`, `class`, `consoleCommandSpawnSpecies`, `consoleCommandToggleDebugDraw`, `copy`, `drawDebug`, `getSpawnNodes`, `initialise`, `isa`, `loadMapData`, `loadSpecies`, `new`, `onCreateSpawnGroup`, `registerModWildlifeFile`, `registerXMLPaths`, `superClass`, `trySpawnWildlife`, `unloadMapData`, `update`

### WildlifeSpecies (27 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesAlligator (46 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getClosestFreeSpawnNode`, `getCosts`, `getFreeSpawnNodeInRange`, `getInstanceConstructor`, `getIsSpawnNodeFree`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `loadShallowWaterObstacle`, `loadTextureVariants`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `spawnInstance`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesBoar (29 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `debugSpawn`, `defaultHarvestableCheck`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `loadFromXML`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `spawnInstances`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesCompanion (25 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `spawnInstances`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesCrow (30 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `delete`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `loadFromXML`, `new`, `onSpawnYCallback`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `spawn`, `spawnInstances`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesDeer (28 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `debugSpawn`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `loadFromXML`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `spawnInstances`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesFlyBy (25 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `spawnInstances`, `superClass`, `trySpawnAt`, `update`

### WildlifeSpeciesSimple (24 members)
`class`, `copy`, `createInstance`, `debugSpawn`, `delete`, `despawn`, `drawDebug`, `finishSpawning`, `formatRange`, `getCanDespawnInstance`, `getCanSpawnInstance`, `getCosts`, `getInstanceConstructor`, `getNumInstances`, `initialise`, `isa`, `loadFromXML`, `new`, `removeInstance`, `resetSpawnTimer`, `runForestCheck`, `superClass`, `trySpawnAt`, `update`

### WildlifeStateMachine (26 members)
`callStateFunction`, `changeState`, `class`, `copy`, `createStateIndexNameMapping`, `delete`, `determineState`, `getCurrentStateIndex`, `getCurrentStateName`, `getHasMappings`, `getIndexOfState`, `getIsPassive`, `getNameOfState`, `getStateByIndex`, `implementStateInterface`, `initialiseStateNames`, `initialiseStateTransitions`, `isa`, `new`, `onInstanceDespawned`, `onInstanceSpawned`, `onMovementTargetReached`, `resolveCurrentState`, `setIsPassive`, `superClass`, `update`

### WildlifeUtil (3 members)
`calculateRandomSpawnPosition`, `createFromXMLFilename`, `getNumOfTrees`

### WildlifeWanderState (31 members)
`addTransition`, `caclulateDebugScreenBounds`, `calculateIfShouldBeForced`, `calculateIfValidEntryState`, `canStartWandering`, `class`, `copy`, `createTransitions`, `debugDraw`, `debugDrawTransitions`, `hasFinishedWandering`, `initialiseToSpecies`, `isa`, `loadAttributesTable`, `loadDebugInfoFromXMLFile`, `new`, `onInstanceDespawned`, `onInstanceSpawned`, `onMovementTargetReached`, `onStateEntered`, `onStateExited`, `onTargetCallback`, `randomlySetTarget`, `registerXMLPaths`, `superClass`, `trySwitchToValidTransition`, `updateAsCurrent`, `updateAsInactive`

### Winch (47 members)
`actionEventControl`, `actionEventDetach`, `addToPhysics`, `attachTreeToWinch`, `detachTreeFromWinch`, `getCanAttachWinchTree`, `getConsumingLoad`, `getDoConsumePtoPower`, `getIsPowerTakeOffActive`, `getIsWinchAttachModeActive`, `getIsWinchTreeAttachAllowed`, `getSpecValueMaxMass`, `getWinchRopeSpeedFactor`, `initSpecialization`, `loadExtraDependentParts`, `loadSpecValueMaxMass`, `loadWinchRopeFromXML`, `onAttachTreeInputEvent`, `onDelete`, `onLoad`, `onLoadFinished`, `onPlayerPreTeleport`, `onPostUpdate`, `onReadStream`, `onReadUpdateStream`, `onRegisterActionEvents`, `onWinchPlayerTriggerCallback`, `onWinchTreeRaycastCallback`, `onWinchTreeShapeCut`, `onWinchTreeShapeMounted`, `onWriteStream`, `onWriteUpdateStream`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `removeFromPhysics`, `saveToXMLFile`, `setWinchControlInput`, `setWinchTreeAttachMode`, `showWinchTreeMountFailedWarning`, `updateActionEvents`, `updateExtraDependentParts`

### WindObject (9 members)
`class`, `copy`, `delete`, `getValues`, `isa`, `load`, `new`, `superClass`

### WindUpdater (13 members)
`addWindChangedListener`, `class`, `copy`, `delete`, `getCurrentValues`, `isa`, `new`, `removeWindChangedListener`, `setSharedShaderParameterValues`, `setTargetValues`, `superClass`, `update`

### Windmill (9 members)
`class`, `copy`, `isa`, `new`, `onCreate`, `setWindValues`, `superClass`, `update`

### WindrowerEffect (40 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getCurrentTestAreaWidth`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsVisible`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadFromNode`, `new`, `registerEffectXMLPaths`, `reset`, `reset`, `reset`, `setColor`, `setDelays`, `setDistance`, `setEffectTypeInfo`, `setEffectTypeInfo`, `setOffset`, `setScrollUpdate`, `setUpdateDistance`, `start`, `stop`, `superClass`, `transformEffectNode`, `update`

### WindrowerMotionPathEffect (54 members)
`addDeleteListener`, `addStartRestriction`, `canStart`, `class`, `copy`, `delete`, `delete`, `effectI3DFileLoaded`, `getAllowUpdate`, `getEffectMatchingString`, `getEffectMatchingString`, `getIsEffectMaterialMatching`, `getIsEffectMaterialMatching`, `getIsEffectMeshMatching`, `getIsEffectMeshMatching`, `getIsEffectSpecificDataMatching`, `getIsFullyVisible`, `getIsFullyVisible`, `getIsSharedEffectMatching`, `getIsSharedEffectMatching`, `getIsVisible`, `getIsVisible`, `getValue`, `isRunning`, `isRunning`, `isa`, `load`, `loadEffectAttributes`, `loadEffectDefinitionFromXML`, `loadEffectMaterialFromXML`, `loadEffectMeshFromXML`, `loadEffectSpecificDataFromXML`, `loadFromNode`, `loadSharedMotionPathEffect`, `loadSharedMotionPathEffect`, `new`, `registerEffectDefinitionXMLPaths`, `registerEffectMaterialXMLPaths`, `registerEffectMeshXMLPaths`, `registerEffectSpecificDataXMLPaths`, `registerEffectXMLPaths`, `reset`, `setDensity`, `setDistance`, `setEffectTypeInfo`, `setUpdateDistance`, `setWorkAreaIndex`, `start`, `start`, `stop`, `superClass`, `transformEffectNode`, `transformEffectNode`, `update`

### WoodContainer (17 members)
`addFillUnitFillLevel`, `getInfoBoxTitle`, `getIsWoodContainerFillingAllowed`, `getPalletUnloadTriggerExtraSellPrice`, `getSplitShapeInfo`, `initSpecialization`, `onDelete`, `onFillUnitFillLevelChanged`, `onLoad`, `onWoodContainerTriggerCallback`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerXMLPaths`, `saveToXMLFile`

### WoodUnloadTriggerEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### WorkAreaType (25 members)
—

### WorkshopScreen (155 members)
`addCallback`, `addElement`, `applyProfile`, `callButtonsWithAction`, `canReceiveFocus`, `canReceiveFocus`, `changeScreen`, `class`, `clone`, `clone`, `copy`, `copyAttributes`, `copyAttributes`, `createFromExistingGui`, `cutFrameBordersHorizontal`, `cutFrameBordersVertical`, `delete`, `delete`, `disableInputForDuration`, `draw`, `exposeControlsAsFields`, `extractIndexAndNameFromID`, `fadeIn`, `fadeOut`, `findDescendantsRec`, `findFirstFocusable`, `findLastFocusable`, `fixThinLines`, `getAspectScale`, `getBorders`, `getCenter`, `getClipArea`, `getDescendantById`, `getDescendantByName`, `getDescendants`, `getFirstDescendant`, `getFocusTarget`, `getHandleFocus`, `getIsActive`, `getIsActiveNonRec`, `getIsDisabled`, `getIsFocused`, `getIsHighlighted`, `getIsOpen`, `getIsSelected`, `getIsVisible`, `getIsVisibleNonRec`, `getNumberOfItemsInSection`, `getOriginalBorders`, `getOverlayState`, `getParentBorders`, `getParentOriginalBorders`, `getRootElement`, `getSoundSuppressed`, `include`, `initializeScreen`, `inputEvent`, `inputEvent`, `inputReleaseEvent`, `inputReleaseEvent`, `invalidateScreen`, `isChildOf`, `isInputDisabled`, `isa`, `keyEvent`, `loadFromXML`, `loadProfile`, `mouseEvent`, `move`, `new`, `onBackAction`, `onClickActivate`, `onClickBack`, `onClickCancel`, `onClickConfigure`, `onClickMenu`, `onClickMenuExtra1`, `onClickMenuExtra2`, `onClickOk`, `onClickRepaint`, `onClickRepair`, `onClickSell`, `onClickShop`, `onClose`, `onFocusActivate`, `onFocusEnter`, `onFocusLeave`, `onGuiSetupFinished`, `onHighlight`, `onHighlightRemove`, `onInfoDialogCallback`, `onListSelectionChanged`, `onOpen`, `onPageNext`, `onPagePrevious`, `onVehicleChanged`, `onVehicleRepaintEvent`, `onVehicleRepairEvent`, `onVehicleSellEvent`, `onVehicleSellFailed`, `onVehicleSold`, `onYesNoRepaintDialog`, `onYesNoRepairDialog`, `playSample`, `populateCellForItemInSection`, `raiseCallback`, `register`, `reloadFocusHandling`, `removeElement`, `reset`, `resolveSizeString`, `setAbsolutePosition`, `setAlpha`, `setAnchor`, `setAnchors`, `setButtonText`, `setCallback`, `setChangeScreenCallback`, `setConfigurations`, `setDisabled`, `setFocused`, `setHandleFocus`, `setHighlighted`, `setId`, `setInputContextCallback`, `setNextScreenClickSoundMuted`, `setPivot`, `setPlaySampleCallback`, `setPosition`, `setReturnScreenClass`, `setSelected`, `setSellingPoint`, `setSize`, `setSoundSuppressed`, `setStatusBarValue`, `setTarget`, `setVehicle`, `setVehicleDetails`, `setVehicles`, `setVisible`, `shouldFocusChange`, `superClass`, `toString`, `toggleCustomInputContext`, `toggleFrameSide`, `touchEvent`, `unlinkElement`, `update`, `updateAbsolutePosition`, `updateAnchorDeltas`, `updateBalanceText`, `updateFramePosition`, `updateVehicles`, `verifyConfiguration`

### WrongRockDestroyedEvent (11 members)
`class`, `copy`, `delete`, `emptyNew`, `isa`, `new`, `readStream`, `run`, `superClass`, `writeStream`

### XMLFile (57 members)
`addComment`, `class`, `copy`, `copyTree`, `create`, `delete`, `getAngle`, `getAsString`, `getBool`, `getElementName`, `getFilename`, `getFloat`, `getHandle`, `getI18NValue`, `getInt`, `getLineNumber`, `getNode`, `getNumOfChildren`, `getNumOfElements`, `getRadiansVector`, `getRootName`, `getRotation`, `getScale`, `getString`, `getStringList`, `getTranslation`, `getUInt`, `getValue`, `getValueType`, `getVector`, `hasProperty`, `initInheritance`, `isa`, `iterate`, `iterateRecursively`, `iterator`, `iteratorChildren`, `iterator_reverse`, `load`, `loadIfExists`, `new`, `removeProperty`, `save`, `saveTo`, `setBool`, `setFloat`, `setInt`, `setRotation`, `setSortedTable`, `setString`, `setTable`, `setTranslation`, `setUInt`, `setValue`, `setVector`, `superClass`, `wrap`

### XMLManager (21 members)
`addCreateSchemaFunction`, `addEarlyCreateSchemaFunction`, `addEarlyInitSchemaFunction`, `addFile`, `addInitSchemaFunction`, `addSchema`, `class`, `consoleCommandGenerateSchemas`, `copy`, `createSchemas`, `earlyCreateSchemas`, `earlyInitSchemas`, `getFileByHandle`, `initSchemas`, `isa`, `new`, `removeFile`, `superClass`, `unloadMapData`

### XMLSchema (24 members)
`addDelayedRegistrationFunc`, `addDelayedRegistrationPath`, `addSubSchema`, `class`, `copy`, `escapeXML`, `generateHTML`, `generateSchema`, `isa`, `new`, `register`, `registerAutoCompletionDataSource`, `registerInheritancePaths`, `replaceRootName`, `resetXMLSharedRegistration`, `setRootNodeName`, `setSubSchemaIdentifier`, `setXMLSharedRegistration`, `setXMLSpecializationType`, `shareDelayedRegistrationFuncs`, `superClass`, `updateSubSchemas`

### XMLUtil (9 members)
`checkDeprecatedUserAttribute`, `checkDeprecatedXMLElements`, `getValueFromXMLFileOrUserAttribute`, `getXMLFloatWithDefault`, `getXMLI18NValue`, `getXMLIntWithDefault`, `getXMLOverwrittenValue`, `getXMLStringWithDefault`, `loadDataFromMapXML`

### XMLValueType (59 members)
`getVectorFromXML`, `getXMLAngle`, `getXMLColor`, `getXMLDayTime`, `getXMLFilename`, `getXMLLocalization`, `getXMLNode`, `getXMLNodes`, `getXMLStringList`, `getXMLTime`, `getXMLVector2`, `getXMLVector2Angle`, `getXMLVector3`, `getXMLVector3Angle`, `getXMLVector4`, `getXMLVectorN`, `getXMLVehicleMaterial`, `register`, `registerBaseType`, `setXMLAngle`, `setXMLColor`, `setXMLDayTime`, `setXMLNode`, `setXMLNodes`, `setXMLStringList`, `setXMLTime`, `setXMLVector2`, `setXMLVector2Angle`, `setXMLVector3`, `setXMLVector3Angle`, `setXMLVector4`, `setXMLVectorN`, `setXMLVectorTrans`, `setXMLVehicleMaterial`

### XeSSQuality (7 members)
—

### YarderCarriage (45 members)
`attachTreeToCarriage`, `createJoint`, `detachTreeFromCarriage`, `getAttachedTreeMass`, `getCarriageDimensions`, `getCarriagePullRopeTargetNode`, `getCarriagePushRopeTargetNode`, `getDirtMultiplier`, `getIsCarriageTreeAttachAllowed`, `getIsTreeInMountRange`, `getMaxNumAttachedTrees`, `getNumAttachedTrees`, `getWearMultiplier`, `initSpecialization`, `loadAttachedTreesFromXML`, `onAttachTreeAction`, `onCarriageTreeRaycastCallback`, `onDelete`, `onDetachTreeAction`, `onLoad`, `onLoadFinished`, `onPostUpdate`, `onReadStream`, `onReadUpdateStream`, `onWriteStream`, `onWriteUpdateStream`, `onYarderCarriageTreeShapeCut`, `onYarderCarriageTreeShapeMounted`, `onYarderCarriageUpdateEnd`, `prerequisitesPresent`, `registerEventListeners`, `registerFunctions`, `registerOverwrittenFunctions`, `registerSavegameXMLPaths`, `resolveLoadedAttachedTrees`, `saveAttachedTreesToXML`, `setCarriageLiftInput`, `setYarderTowerVehicle`, `showCarriageTreeMountFailedWarning`, `updateCarriageInRange`, `updateRopeAlignmentNodes`, `updateTreeAttachRopes`

### YarderTower (83 members)
`addToPhysics`, `doRopePlacementValidation`, `getAllowsLowering`, `getConsumingLoad`, `getDirtMultiplier`, `getDoConsumePtoPower`, `getIsFoldAllowed`, `getIsPlayerInYarderControlRange`, `getIsPlayerInYarderRange`, `getIsPowerTakeOffActive`, `getIsSetupModeChangeAllowed`, `getIsTreeShapeUsedForYarderSetup`, `getIsVehicleControlAllowed`, `getSpecValueMaxLength`, `getSpecValueMaxMass`, `getTreeAtPosition`, `getUsageCausesDamage`, `getWearMultiplier`, `getYarderCarriageLastSpeed`, `getYarderIsSetUp`, `getYarderMainRopeLength`, `getYarderStatusInfo`, `initSpecialization`, `isDetachAllowed`, `loadSpecValueMaxLength`, `loadSpecValueMaxMass`, `onCarriageVehicleDeleted`, `onCreateCarriageFinished`, `onDelete`, `onHookI3DLoaded`, `onLoad`, `onLoadEnd`, `onMainRopePlacementValidated`, `onPostAttach`, `onPreDelete`, `onReadStream`, `onReadUpdateStream`, `onRopeI3DLoaded`, `onSupportRopeTreeOverlapCallback`, `onUpdate`, `onWriteStream`, `onWriteUpdateStream`, `onYarderCarriageAttach`, `onYarderCarriageDetach`, `onYarderCarriageTreeAttached`, `onYarderControlTriggerCallback`, `onYarderMainTreeRaycastCallback`, `onYarderSupportTerrainRaycastCallback`, `onYarderTowerPlayerDeleted`, `onYarderTreeRaycastCallback`, `prerequisitesPresent`, `registerEventListeners`, `registerEvents`, `registerFunctions`, `registerOverwrittenFunctions`, `registerRopeXMLPaths`, `removeFromPhysics`, `saveToXMLFile`, `setYarderCarriageFollowMode`, `setYarderCarriageLiftInput`, `setYarderCarriageMoveInput`, `setYarderRopeState`, `setYarderSetupModeState`, `setYarderTargetActive`, `setupSupportRopes`, `updateYarderRope`, `updateYarderRopeLengthNodes`

### _G (0 members)
—

### bit32 (15 members)
`arshift`, `band`, `bnot`, `bor`, `btest`, `bxor`, `byteswap`, `countlz`, `countrz`, `extract`, `lrotate`, `lshift`, `replace`, `rrotate`, `rshift`

### g_achievementManager (13 members)
—

### g_adsSystem (2 members)
—

### g_animCache (3 members)
—

### g_animalScreen (111 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_animationManager (5 members)
—

### g_asyncTaskManager (4 members)
—

### g_autoSaveManager (6 members)
—

### g_availableLanguageNamesTable (0 members)
—

### g_availableLanguagesTable (0 members)
—

### g_baleManager (4 members)
—

### g_beaconLightManager (3 members)
—

### g_brandManager (5 members)
—

### g_cameraManager (5 members)
—

### g_careerScreen (95 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_client (32 members)
—

### g_colorBgUVs (0 members)
—

### g_configurationManager (3 members)
`addConfigurationType`, `getConfigurationDescByName`

### g_connectToMasterServerScreen (53 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_connectionFailedDialog (70 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_connectionHoseManager (8 members)
—

### g_connectionManager (3 members)
—

### g_constructionBrushTypeManager (3 members)
—

### g_constructionScreen (94 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_consumableManager (8 members)
—

### g_createGameScreen (85 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_currentMission (165 members)
—

### g_debugManager (12 members)
—

### g_densityMapHeightManager (15 members)
—

### g_depthOfFieldManager (3 members)
—

### g_dlcModNameHasPrefix (6 members)
—

### g_dlcsDirectories (0 members)
—

### g_documentationManager (1 members)
—

### g_effectManager (5 members)
—

### g_extraContentSystem (2 members)
—

### g_farmManager (4 members)
—

### g_farmlandManager (8 members)
—

### g_fieldCourseManager (4 members)
—

### g_fieldManager (12 members)
—

### g_fillTypeManager (18 members)
—

### g_fruitTypeManager (21 members)
—

### g_gameSettings (93 members)
—

### g_gameStateManager (1 members)
—

### g_gameplayHintManager (3 members)
—

### g_globalMods (0 members)
—

### g_groundTypeManager (4 members)
—

### g_gui (21 members)
`changeScreenClosure`, `playSampleClosure`, `toggleCustomInputContextClosure`

### g_guidedTourManager (8 members)
—

### g_handToolSpecializationManager (5 members)
—

### g_handToolTypeManager (6 members)
—

### g_helpLineManager (10 members)
—

### g_helperManager (6 members)
—

### g_i18n (12 members)
—

### g_i3DManager (0 members)
—

### g_ignitionLockManager (3 members)
—

### g_inAppPurchaseController (8 members)
—

### g_inGameMenu (519 members)
`changeScreenCallback`, `clickBackCallback`, `frameClosePageNextCallback`, `frameClosePagePreviousCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_inputBinding (65 members)
`eventChangeCallback`

### g_inputDisplayManager (17 members)
—

### g_joinGameScreen (94 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_lastCheckDlcPaths (0 members)
—

### g_licensePlateManager (17 members)
—

### g_lifetimeStats (5 members)
—

### g_mainScreen (104 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_mapManager (3 members)
—

### g_masterServerConnection (3 members)
—

### g_materialManager (11 members)
—

### g_messageCenter (2 members)
—

### g_missionManager (15 members)
—

### g_modDescSchema (12 members)
—

### g_modEventListeners (0 members)
—

### g_modHubController (12 members)
—

### g_modHubScreen (145 members)
`changeScreenCallback`, `clickBackCallback`, `clickNextCallback`, `clickPrevCallback`, `frameClosePageNextCallback`, `frameClosePagePreviousCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_modIsLoaded (2 members)
—

### g_modManager (8 members)
—

### g_modNameToDirectory (73 members)
—

### g_modSelectionScreen (83 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_motionPathEffectManager (6 members)
—

### g_mpLoadingScreen (96 members)
`changeScreenCallback`, `hasIncluded`, `loadFunction`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_multiplayerScreen (65 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_newGameScreen (74 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_noteManager (5 members)
—

### g_npcManager (12 members)
—

### g_outdatedMods (23 members)
—

### g_overlayManager (1 members)
—

### g_particleSystemManager (4 members)
—

### g_placeableConfigurationManager (7 members)
—

### g_placeableSpecializationManager (5 members)
—

### g_placeableTypeManager (6 members)
—

### g_playerSystem (7 members)
—

### g_postAnimationUpdateCallbacks (0 members)
—

### g_savegameController (10 members)
`onDeleteCallback`, `onSaveCompleteCallback`, `onUpdateCompleteCallback`

### g_server (30 members)
—

### g_serverDetailScreen (69 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_settingsModel (101 members)
`defaultReaderFunction`, `defaultWriterFunction`

### g_settingsScreen (197 members)
`changeScreenCallback`, `clickBackCallback`, `clickNextCallback`, `clickPrevCallback`, `frameClosePageNextCallback`, `frameClosePagePreviousCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_shopConfigScreen (133 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `requestExitCallback`, `toggleCustomInputContextCallback`

### g_shopController (20 members)
—

### g_shopMenu (145 members)
`changeScreenCallback`, `clickBackCallback`, `frameClosePageNextCallback`, `frameClosePagePreviousCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_sleepManager (16 members)
—

### g_soundManager (16 members)
—

### g_soundMixer (6 members)
—

### g_soundPlayer (13 members)
—

### g_specializationManager (5 members)
—

### g_splitShapeManager (4 members)
—

### g_splitTypeManager (0 members)
—

### g_sprayTypeManager (8 members)
—

### g_startMissionInfo (9 members)
—

### g_startupScreen (49 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`, `videoElementCallback`

### g_storeManager (21 members)
—

### g_tensionBeltManager (1 members)
—

### g_terrainDeformationQueue (3 members)
—

### g_toolTypeManager (3 members)
—

### g_treePlantManager (12 members)
—

### g_updateables (0 members)
—

### g_vehicleConfigurationManager (7 members)
—

### g_vehicleMaterialManager (4 members)
—

### g_vehicleTypeManager (6 members)
—

### g_wardrobeScreen (109 members)
`changeScreenCallback`, `clickBackCallback`, `frameClosePageNextCallback`, `frameClosePagePreviousCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_wheelManager (6 members)
—

### g_wildlifeManager (10 members)
—

### g_workAreaTypeManager (4 members)
—

### g_workshopScreen (65 members)
`changeScreenCallback`, `hasIncluded`, `playSampleCallback`, `toggleCustomInputContextCallback`

### g_xmlManager (6 members)
—

### io (9 members)
`class`, `close`, `copy`, `flush`, `isa`, `new`, `open`, `superClass`, `write`

### math (35 members)
`abs`, `acos`, `asin`, `atan`, `atan2`, `ceil`, `clamp`, `cos`, `cosh`, `deg`, `exp`, `floor`, `fmod`, `frexp`, `ldexp`, `log`, `log10`, `map`, `max`, `min`, `modf`, `noise`, `pow`, `rad`, `random`, `randomseed`, `round`, `sign`, `sin`, `sinh`, `sqrt`, `tan`, `tanh`

### modOnCreate (0 members)
—

### pdlc_daimlerTruckPack (0 members)
—

### pdlc_extraContentNewHollandCR11 (0 members)
—

### pdlc_highlandsFishingPack (0 members)
—

### pdlc_macDonPack (0 members)
—

### pdlc_nexatPack (0 members)
—

### pdlc_plainsAndPrairiesPack (0 members)
—

### string (28 members)
`byte`, `char`, `contains`, `endsWith`, `find`, `findLast`, `format`, `getRadians`, `getVector`, `gmatch`, `gsub`, `isNilOrWhitespace`, `len`, `lower`, `ltrim`, `match`, `namedFormat`, `pack`, `packsize`, `rep`, `reverse`, `rtrim`, `split`, `startsWith`, `sub`, `trim`, `unpack`, `upper`

### table (40 members)
`addElement`, `clear`, `clone`, `concat`, `concatKeys`, `copyIndex`, `create`, `equalLists`, `equalSets`, `filter`, `find`, `foreach`, `foreachi`, `freeze`, `getListUnion`, `getRandomElement`, `getSetIntersection`, `getSetSubtraction`, `getSetUnion`, `getTableUnion`, `getn`, `getndebug`, `hasElement`, `hasSetIntersection`, `ifilter`, `insert`, `isList`, `isProperSubset`, `isSubset`, `isfrozen`, `maxn`, `move`, `pack`, `remove`, `removeElement`, `size`, `sort`, `toList`, `toSet`, `unpack`

### vector (15 members)
`abs`, `angle`, `ceil`, `clamp`, `create`, `cross`, `dot`, `floor`, `magnitude`, `max`, `min`, `normalize`, `sign`

## Global functions missing from the sources and from scriptBinding.xml

`AIFieldCourseTurnData`, `Class`, `Enum`, `InitClientOnce`, `InitEventClass`, `InitObjectClass`, `InitStaticEventClass`, `InitStaticObjectClass`, `OnInGameMenuMenu`, `OnLoadingScreen`, `acceptedGameCreate`, `acceptedGameInvite`, `acceptedGameInvitePerformConnect`, `addAnimalArea`, `addConsoleCommand`, `addContactReport`, `addDensityMapHeightAtWorldLine`, `addDensityMapHeightAtWorldPos`, `addDensityMapHeightOcclusionArea`, `addDensityMapSyncerConnection`, `addDensityMapSyncerDensityMap`, `addFeedingPlace`, `addGlobalUpdateable`, `addHusbandryAnimal`, `addJointBreakReport`, `addLowResCollisionHandlerLOD`, `addMilkingPlace`, `addModEventListener`, `addNotificationFilter`, `addPedestrian`, `addPedestrianGroup`, `addPedestrianIdleAnimation`, `addPedestrianSound`, `addPedestrianWalkAnimation`, `addPhysicsRope`, `addPostAnimationCallback`, `addReplacedCustomShader`, `addRoadsToVehicleNavigationMap`, `addSampleEffect`, `addSplitShapeConnection`, `addSplitShapesShaderParameterOverwrite`, `addTerrainDeformationArea`, `addTerrainDeformationPolygonalArea`, `addTerrainDeformationWorldspaceSoftBrush`, `addTerrainUpdateConnection`, `addTimer`, `addTrafficSystemPlayer`, `addVehicleNavigationPhysicsObstacle`, `addVehicleNavigationWorldBlockingRegion`, `addWakeUpReport`, `adsAddOcclusionRegion`, `adsClearOcclusionRegionGroup`, `adsGetIsOcclusionRegionGroupActive`, `adsGetOcclusionRegion`, `adsSetIsOcclusionRegionGroupActive`, `ambientSoundsAddSample`, `ambientSoundsAddSampleVariation`, `ambientSoundsGetIsPositionTagPlaying`, `ambientSoundsRemoveAllSamples`, `ambientSoundsSampleSetFadeInOutTime`, `ambientSoundsSampleSetIndoorVolumeFactor`, `ambientSoundsSampleSetMinMaxDelay`, `ambientSoundsSampleSetMinMaxLength`, `ambientSoundsSampleSetMinMaxLoops`, `ambientSoundsSampleSetMinMaxOffset`, `ambientSoundsSampleSetMinMaxPitch`, `ambientSoundsSampleSetMinMaxVolume`, `ambientSoundsSetEnabled`, `ambientSoundsSetIsIndoor`, `ambientSoundsSetPositionTag`, `ambientSoundsSetTimeAndDay`, `ambientSoundsUpdate`, `applyCropsGrowth`, `applyDensityMapHeightUpdate`, `applyDensityMapUpdater`, `applyTerrainDeformation`, `areAchievementsAvailable`, `areStatsAvailable`, `assert`, `assertWithCallstack`, `assignIdleAnimationToPedestrian`, `assignPedestrianToPedestrianGroup`, `assignSoundToPedestrianGroup`, `assignWalkAnimationToPedestrian`, `audioFileExists`, `autoLoadByURI`, `autoStartLocalSavegame`, `beginVehicleNavigationDebugLogging`, `beginVehicleNavigationPlannerRecording`, `buildAbsolutePath`, `buildNavPath`, `buildRelativePath`, `calculateFovY`, `cancelAllStreamedI3DFiles`, `cancelDensityMapVisualizationOverlay`, `cancelTerrainDeformation`, `catmullRomInterpolator1`, `catmullRomInterpolator3`, `centerHeadTracking`, `checkFacialAnimAudioFile`, `checkFacialAnimScript`, `checkForNewDlcs`, `checkInsets`, `cleanUp`, `cleanUpRenderingResources`, `clearTerrainDeformationAreas`, `closeIntervalTimer`, `collectgarbage`, `companionDebugDraw`, `computeMultiViewportSilhouetteMask`, `connectToServer`, `consoleCommandListCommands`, `consoleCommandSearchCommands`, `controlVehicle`, `copyFile`, `createAnimalCompanionManager`, `createAnimalHusbandry`, `createBitVectorMap`, `createDensityMapHeightUpdater`, `createDensityMapSyncer`, `createDensityMapUpdater`, `createDensityMapVisualizationOverlay`, `createFacialAnimPlayer`, `createFile`, `createFolder`, `createFoliageBendingSystem`, `createLowResCollisionHandler`, `createMaterialTextureFromFile`, `createModDescSchema`, `createNavPath`, `createOverlayTextureFromFile`, `createPedestrianSystem`, `createRenderOverlay`, `createSoundPlayer`, `createStream`, `createTerrainDeformation`, `createTerrainLayerTexture`, `createTextureBuffer`, `createTrafficSystem`, `createVehicleNavigationAgent`, `createVehicleNavigationMap`, `createVideoOverlay`, `createWebImageOverlay`, `debugDrawVehicleCollision`, `deleteDrawingOverlays`, `deleteFile`, `deleteFolder`, `deleteSplitShape`, `destroyLowResCollisionHandler`, `doExit`, `doRestart`, `downloadSavegame`, `draw`, `drawDashedLine`, `drawDebugPolygon`, `drawDebugPolygonVector`, `drawDebugTriangle`, `drawDebugTriangleVector`, `drawFilledRect`, `drawFilledRectRound`, `drawLine2D`, `drawOutlineCircle2D`, `drawOutlineRect`, `drawPoint`, `drawTouchButton`, `dumpVehicleNavigationAgent`, `enableAreaBasedTerrainDeformationMode`, `enableDevelopmentControls`, `enableTerrainDeformationHeightAdditiveMode`, `enableTerrainDeformationHeightSetMode`, `enableTerrainDeformationHeightSmoothingMode`, `enableTerrainDeformationMode`, `enableTerrainDeformationPaintingMode`, `enableVehicleNavigationAgentDebugRendering`, `enableVehicleNavigationMapDebugRendering`, `endFrameRepeatMode`, `endVehicleNavigationDebugLogging`, `endVehicleNavigationPlannerRecording`, `enterCpuBoostMode`, `error`, `executeConsoleCommand`, `executeSettingsChange`, `exportScenegraphToGraphviz`, `exportScenegraphToGraphvizRec`, `extraUpdatePhysics`, `fileExists`, `fileWrite`, `filterText`, `findAndRemoveSplitShapeAttachments`, `findPedestrianSystemBlockingPositionInformation`, `findSplitShape`, `findTrafficSystemBlockingPositionInformation`, `findVehicleNavigationMapBlockingPositionInformation`, `finishWriteSplitShapesServerEvents`, `finishedUserProfileSync`, `flushPhysicsCaches`, `flushWebCache`, `folderExists`, `forceEndFrameRepeatMode`, `gcinfo`, `generateDensityMapVisualizationOverlay`, `get3dResolutionScaling`, `get4kAvailable`, `getAIHelperCollisionBoxInfo`, `getAchievement`, `getAllowFoliageShadows`, `getAllowTextCommunication`, `getAllowTextCommunicationWithUser`, `getAllowVoiceCommunication`, `getAllowVoiceCommunicationWithUser`, `getAnimalCompanionNeedNetworkUpdate`, `getAnimalFromCollisionNode`, `getAnimalPosition`, `getAnimalRootNode`, `getAnimalRotation`, `getAnimalShaderParameter`, `getAppBasePath`, `getAtmosphereCornetteShankAsymmetryFactor`, `getAtmosphereMieScale`, `getAtmosphereQuality`, `getAtmosphereQualityName`, `getAudioOutputLevelIntegratedLufs`, `getAudioOutputLevelMomentaryLufs`, `getAudioOutputLevelMomentaryMaxLufs`, `getAudioOutputLevelRmsDbfs`, `getAutoPerformanceClass`, `getBitVectorMapNumChannels`, `getBitVectorMapParallelogram`, `getBitVectorMapPoint`, `getBitVectorMapSize`, `getBlockedUser`, `getBloomMagnitude`, `getBloomMaskThreshold`, `getBloomQuality`, `getBrightness`, `getBrightnessNits`, `getCCTGroundObject`, `getCameraTrackingSensitivity`, `getCloudDensityScaling`, `getCloudShadowsQuality`, `getCloudShadowsTransmittanceBoost`, `getCompanionClosestDistance`, `getCompanionNodes`, `getCorrectTextSize`, `getCropsGrowthNextState`, `getCropsGrowthStateTime`, `getCrossPlayAvailability`, `getCullOverride`, `getDLSSFrameInterpolation`, `getDLSSQuality`, `getDLSSQualityName`, `getDRSQuality`, `getDRSQualityName`, `getDRSTargetFPS`, `getDate`, `getDateAt`, `getDateDiffSeconds`, `getDebugRenderingMode`, `getDefaultSSAOQuality`, `getDensityMapCollisionHeightAtWorldPos`, `getDensityMapFilename`, `getDensityMapHeightFirstChannel`, `getDensityMapHeightNumChannels`, `getDensityMapHeightTypeAtWorldLine`, `getDensityMapHeightTypeAtWorldPos`, `getDensityMapMaxHeight`, `getDeviceTypeFromPlatformId`, `getDiscretePerformanceSetting`, `getDisplacementViewDistanceCoeff`, `getDlcPath`, `getDoFBlurArea`, `getDoFblendWeights`, `getDoFparams`, `getDofQuality`, `getEmitterSurfaceSize`, `getEngineRevision`, `getExposureRange`, `getEyeAdaptionSpeed`, `getFacialAnimCurrentEmotions`, `getFacialAnimEmotionName`, `getFacialAnimScript`, `getFidelityFxSR30FrameInterpolation`, `getFidelityFxSR30Quality`, `getFidelityFxSR30QualityName`, `getFidelityFxSRQuality`, `getFidelityFxSRQualityName`, `getFidelityFxSuperResolutionVersion`, `getFileIdHasSplitShapes`, `getFileMD5`, `getFiles`, `getFoliageGraphicsCellSize`, `getFoliageLODDistanceCoeff`, `getFoliageViewDistanceCoeff`, `getFrameInterpolationModeName`, `getFullscreenMode`, `getGPUDriverVersion`, `getGPUName`, `getGPUVendor`, `getGameBasePath`, `getGameRevisionExtraText`, `getGamepadAxisPhysicalName`, `getGamepadButtonPhysicalName`, `getGamepadCategory`, `getGamepadDeadzone`, `getGamepadDefaultDeadzone`, `getGamepadEnabled`, `getGamepadId`, `getGamepadMappedUnknownAxis`, `getGamepadMappedUnknownButton`, `getGamepadProductId`, `getGamepadVendorId`, `getGamepadVersionId`, `getGamepadVibrationEnabled`, `getGravityDirection`, `getGroundFogGlobalCoverage`, `getGroundFogGroundLevelDensity`, `getGroundFogHeight`, `getGroundFogMinimumValleyDepth`, `getGroundFogTerrainEntityId`, `getGroundFogVolumeNoiseWind`, `getGroundFogWind`, `getHDRGamma`, `getHasGamepadAxis`, `getHasGamepadAxisForceFeedback`, `getHasGamepadButton`, `getHasShadowFocusBox`, `getHasWindowFocus`, `getHaveAchievementsChanged`, `getHdrAvailable`, `getHdrMaxNits`, `getHdrMaxNitsAvailable`, `getHeadTrackingRotation`, `getHeadTrackingTranslation`, `getHeadTrackingType`, `getHeightFogGroundLevelDensity`, `getHeightFogHeight`, `getHmdYaw`, `getInfoLayerFromTerrain`, `getIsBadUserReputation`, `getIsDRSAvailable`, `getIsDensityMapVisualizationOverlayReady`, `getIsGPUDriverOutdated`, `getIsGamepadMappingReliable`, `getIsInCameraFrustum`, `getIsKeyboardAvailable`, `getIsLanguageEnabled`, `getIsOccluderMesh`, `getIsPerformanceModeActive`, `getIsPhysicsUpdateIndexSimulated`, `getIsRenderedInViewports`, `getIsSleeping`, `getIsSoundPlayerChannelStreamed`, `getIsSplitShapeConnectionWithinLimits`, `getIsSplitShapeSplit`, `getIsTerrainDecal`, `getIsUpdateDownloadFinished`, `getIsUserBlocked`, `getIsUserSignedIn`, `getKeyName`, `getLODDistanceCoeff`, `getLanguage`, `getLanguageCode`, `getLanguageName`, `getLanguageNativeName`, `getLateReverbGainPreset`, `getLensFlareHorizontalModifiers`, `getLensFlareIntensitySaturation`, `getLensFlarePositionJitterAndCheckerboard`, `getLensFlareQuality`, `getLensFlareQualityName`, `getLensFlareRotationSpeed`, `getLensFlareSize`, `getLensFlareThreshold`, `getLightColor`, `getLoadNamedInterpolatorCurve`, `getMD5`, `getMSAA`, `getMSAAName`, `getMaxNumLocalVolumetricLightSources`, `getMaxNumShadowLights`, `getMaxNumSoftShadowSpotLights`, `getModCategoryName`, `getModDependency`, `getModDownloadAvailability`, `getModDownloadPath`, `getModFreeSpaceKb`, `getModId`, `getModIdByFilename`, `getModInstallPath`, `getModMetaAttributeBool`, `getModMetaAttributeInt`, `getModMetaAttributeString`, `getModNumDependencies`, `getModUseAvailability`, `getModUsedSpaceKb`, `getMoonBrightnessScale`, `getMoonSizeScale`, `getMouseButtonName`, `getMultiplayerAvailability`, `getNATType`, `getNavMeshDistanceToWall`, `getNavMeshSurfaceArea`, `getNavPathDirection`, `getNavPathHasValidSlope`, `getNavPathIsValid`, `getNavPathLength`, `getNavPathNumOfWaypoints`, `getNavPathOrientation`, `getNavPathPosition`, `getNavPathWaypoint`, `getNeoMode`, `getNetworkError`, `getNodeClassNamesString`, `getNodeFullPath`, `getNormalizedScreenValues`, `getNotification`, `getNumDlcPaths`, `getNumModCategories`, `getNumOfBeaconLights`, `getNumOfBlockedUsers`, `getNumOfContactReports`, `getNumOfLanguages`, `getNumOfMods`, `getNumOfNotifications`, `getNumOfProcessors`, `getNumOfScreenModes`, `getNumOfSplitShapes`, `getNumOfWakeUpReports`, `getNumSoundPlayerChannels`, `getNumSoundPlayerItems`, `getOSVersionName`, `getOverlayBrightnessNits`, `getPerformanceClass`, `getPerlinNoise2D`, `getPhysicsDebugDrawCollisionFilterGroup`, `getPhysicsDebugDrawEnabled`, `getPhysicsDebugDrawMode`, `getPhysicsDebugDrawNoDepthMode`, `getPhysicsDt`, `getPhysicsDtNonInterpolated`, `getPhysicsDtUnclamped`, `getPhysicsRopeLength`, `getPhysicsUpdateIndex`, `getPlatformId`, `getPlatformIdsAreCompatible`, `getPostProcessAntiAliasing`, `getPostProcessAntiAliasingName`, `getProcessorFrequency`, `getProcessorName`, `getProfile3dResolutionScaling`, `getProfileUiResolutionScaling`, `getReferenceInfo`, `getReflectionMapRatio`, `getRemainingShadersToWarmup`, `getRenderDriver`, `getResolutionScaling`, `getReverbDecayPreset`, `getReverbGainPreset`, `getReverbReferenceFrequenciesPreset`, `getReverbReflectionPreset`, `getSSAOIntensity`, `getSSAOQuality`, `getSafeFrameDefaultInsets`, `getSafeFrameInsets`, `getSaveableSplitShapeId`, `getScreenAspectRatio`, `getScreenHdrOutput`, `getScreenMode`, `getScreenModeInfo`, `getScreenSpaceReflectionsQuality`, `getScreenSpaceReflectionsQualityName`, `getScreenSpaceShadowsParameters`, `getScreenSpaceShadowsQuality`, `getScreenSpaceShadowsQualityName`, `getShaderQuality`, `getShaderTimeSec`, `getShadingRateQuality`, `getShadowDistanceQuality`, `getShadowFilterQuality`, `getShadowMapFilterSize`, `getShadowMapSize`, `getShadowQuality`, `getShapeCastShadowmap`, `getShapeDecalLayer`, `getShapeFromSaveableSplitShapeId`, `getShapeReceiveShadowmap`, `getSharedI3DFilesData`, `getSharedShaderParameter`, `getSharpness`, `getSoundPlayerChannelName`, `getSoundPlayerItemName`, `getSplinePointAtDistanceToWorldPoint`, `getSplinePointAtDistanceToWorldPointVector`, `getSplitShapeOrientedBoundingBox`, `getSplitShapePlaneExtents`, `getSplitShapeStats`, `getSpotShadowAtlasSlotFactor`, `getSpotShadowDistanceFrequencyFactor`, `getSpotShadowFullResolutionPercentage`, `getSpotShadowMinimumConeAnglePercentage`, `getSpotShadowReducedConeAngleFactor`, `getStartMode`, `getStatsAtWorldPos`, `getSunBrightnessScale`, `getSunSizeScale`, `getSupportsAtmosphereQuality`, `getSupportsDLSSFrameInterpolation`, `getSupportsDLSSQuality`, `getSupportsDRSQuality`, `getSupportsFidelityFxFrameInterpolation`, `getSupportsFidelityFxSR30Quality`, `getSupportsFidelityFxSRQuality`, `getSupportsLensFlareQuality`, `getSupportsMSAA`, `getSupportsPerformanceMode`, `getSupportsPostProcessAntiAliasing`, `getSupportsScreenSpaceReflectionsQuality`, `getSupportsScreenSpaceShadowsQuality`, `getSupportsTextureFiltering`, `getSupportsValarQuality`, `getSupportsVolumetricFogQuality`, `getSupportsXeSSFrameInterpolation`, `getSupportsXeSSQuality`, `getSystemLanguage`, `getTerrainDataPlaneEntityId`, `getTerrainDataPlaneType`, `getTerrainDataPlaneViewDistance`, `getTerrainDeformationBlockedAreaMapSize`, `getTerrainDisplacementUploadInProgress`, `getTerrainHeightMapFilename`, `getTerrainInfoLayerDensityMapEntity`, `getTerrainInfoLayerFileName`, `getTerrainInfoLayerIsUsedAtRuntime`, `getTerrainInfoLayerIsVertexBased`, `getTerrainInfoLayerLayerGroupFirstChannel`, `getTerrainInfoLayerLayerGroupMaxDefaultFill`, `getTerrainInfoLayerLayerGroupName`, `getTerrainInfoLayerLayerGroupNumChannels`, `getTerrainInfoLayerLayerGroupNumOfOptions`, `getTerrainInfoLayerLayerGroupOptionName`, `getTerrainInfoLayerLayerGroupOptionValue`, `getTerrainInfoLayerName`, `getTerrainInfoLayerNumOfLayerGroups`, `getTerrainLODDistanceCoeff`, `getTerrainLayerAtWorldPos`, `getTerrainLayerName`, `getTerrainLayerNumOfSubLayers`, `getTerrainLayerSubLayer`, `getTerrainLayerXmlAttribute`, `getTerrainLodBlendDistances`, `getTerrainLodBlendDynamicDistances`, `getTerrainLodNormalMapFilename`, `getTerrainLodTypeMapFilename`, `getTerrainNumOfDataPlanes`, `getTerrainNumOfInfoLayers`, `getTerrainNumOfLayers`, `getTerrainNumOfOverlayLayers`, `getTerrainOccludersCacheFilename`, `getTerrainOverlayLayerName`, `getTerrainOverlayLayerXmlAttribute`, `getTerrainQuality`, `getText3DHeight`, `getText3DLength`, `getText3DLineLength`, `getTextureFiltering`, `getTextureFilteringName`, `getTextureResolution`, `getTime`, `getTimeSec`, `getToneMappingCurveBlackClip`, `getToneMappingCurveShoulder`, `getToneMappingCurveSlope`, `getToneMappingCurveToe`, `getToneMappingCurveWhiteClip`, `getTotalSystemMemory`, `getTrafficSystemNightTimeRange`, `getTyreTracksSegmentsCoeff`, `getUiResolutionScaling`, `getUniqueUserId`, `getUserId`, `getUserName`, `getUserProfileAppPath`, `getValarQuality`, `getValarQualityName`, `getVehicleCollisionDistance`, `getVehicleNavigationAgentNextCurvature`, `getVehicleNavigationMapCostAtWorldPos`, `getVideoOverlayCurrentTime`, `getViewDistanceCoeff`, `getVolumeMeshTessellationCoeff`, `getVolumetricFogQuality`, `getVolumetricFogQualityName`, `getVsync`, `getXMLRootName`, `getXeSSFrameInterpolation`, `getXeSSQuality`, `getXeSSQualityName`, `getfenv`, `getmetatable`, `hasNativeAchievementGUI`, `haveModsChanged`, `hideAnimal`, `hideNetflixButton`, `imeAbort`, `imeGetCursorPos`, `imeGetLastString`, `imeIsComplete`, `imeIsOpen`, `imeIsSupported`, `imeOpen`, `inAppFinishPendingPurchase`, `inAppFinishPurchase`, `inAppGetNumPendingPurchases`, `inAppGetPendingPurchaseProductId`, `inAppGetProductDescription`, `inAppGetProductPrice`, `inAppGetProductPurchaseState`, `inAppHasRestorePurchases`, `inAppInit`, `inAppIsLoaded`, `inAppRestorePurchases`, `inAppStartPurchase`, `init`, `initAchievements`, `initDensityMapHeightTypeProperties`, `initPlatform`, `initTesting`, `installMod`, `installModByHash`, `ipairs`, `ipairs_randomStart`, `ipairs_reverse`, `is4kVideoMode`, `isAbsolutePath`, `isAnimalVisible`, `isCompanionReady`, `isESRBDiscVersion`, `isFacialAnimIdle`, `isFacialAnimSilent`, `isGameFullyInstalled`, `isGamepadSigninPending`, `isHeadTrackingAvailable`, `isHusbandryReady`, `isModUpdateRunning`, `isSoundPlayerLoaded`, `isSoundPlayerPlaying`, `isUsingHmd`, `isVideoOverlayPlaying`, `isVideoOverlayReadyToPlay`, `iteratePointList2D`, `iteratePointList2DLines`, `keyEvent`, `leaveCpuBoostMode`, `linearInterpolator1`, `linearInterpolator2`, `linearInterpolator3`, `linearInterpolator4`, `linearInterpolatorN`, `linearInterpolatorTransRot`, `linearInterpolatorTransRotScale`, `load`, `loadAllMods`, `loadBitVectorMapFromFile`, `loadBitVectorMapNew`, `loadCollisionEffectConfig`, `loadCropsGrowthStateFromFile`, `loadDensityMapHeightUpdaterStateFromFile`, `loadDensityMapUpdaterStateFromFile`, `loadDlcs`, `loadDlcsDirectories`, `loadDlcsFromDirectory`, `loadInternalMods`, `loadInterpolator1Curve`, `loadInterpolator2Curve`, `loadInterpolator3Curve`, `loadInterpolator4Curve`, `loadLanguageSettings`, `loadMod`, `loadModDesc`, `loadMods`, `loadSplitShapesFromFile`, `loadUserSettings`, `loadVehicleNavigationCostMapFromFile`, `loadfile`, `loadstring`, `log`, `makeSplittable`, `masterServerAddAvailableMod`, `masterServerAddAvailableModEnd`, `masterServerAddAvailableModStart`, `masterServerAddDlc`, `masterServerAddDlcEnd`, `masterServerAddDlcStart`, `masterServerDisconnect`, `masterServerGetServerUserInfo`, `masterServerInit`, `masterServerReconnect`, `masterServerRequestFilteredServers`, `masterServerRequestServerDetails`, `masterServerRequestServerDetailsWithPlatformServerId`, `masterServerSetCallbacks`, `masterServerSetServerInfo`, `masterServerSetServerNumPlayers`, `masterServerSetServerPlatformSessionIds`, `modDownloadManagerLoaded`, `modDownloadManagerUpdateSync`, `mouseEvent`, `navMeshMerge`, `navMeshRaycast`, `netCloseConnection`, `netGetAndResetConnectionSendStats`, `netGetBandwidthEstimate`, `netGetConnectionStats`, `netGetDefaultLocalIp`, `netGetHostByAddr`, `netGetTime`, `netSendStream`, `netSetIncomingPassword`, `netSetIsEventProcessingEnabled`, `netSetMaximumIncomingConnections`, `netShutdown`, `netStartup`, `new2DLayer`, `newGetSafeFrameInsets`, `newproxy`, `next`, `nextMessageTypeId`, `notificationsLoaded`, `notifyAppResumed`, `notifyAppSuspended`, `notifyDebugModeChanged`, `notifyWindowGainedFocus`, `notifyWindowLostFocus`, `notifyWindowSizeChanged`, `onBlockedListChanged`, `onDeepLinkingFailed`, `onDensityMapSyncerDensityMapsAdded`, `onFriendListChanged`, `onMultiplayerInviteSaveCompleteCallback`, `onMultiplayerInviteSent`, `onMultiplayerInviteStartSavegame`, `onProfileUiResolutionScalingChanged`, `onRemovedFromInvite`, `onShowDeepLinkingErrorMsg`, `onUserSignedOut`, `onWaitForPendingGameSession`, `openIntervalTimer`, `openMpFriendInvitation`, `openNativeHelpMenu`, `openWebFile`, `pairs`, `pauseSoundPlayer`, `pcall`, `performExit`, `performRestart`, `playSoundPlayer`, `playVideoOverlay`, `postAnimationUpdate`, `postInitMods`, `prepareSaveBitVectorMapToFile`, `prepareSaveDensityMapToFile`, `prepareSaveSplitShapesToFile`, `prepareSaveTerrainHeightMap`, `prepareSaveTerrainLodTypeMap`, `prepareSaveVehicleNavigationCostMapToFile`, `prepareSplitShapesServerWriteUpdateStream`, `printActiveEntities`, `printFullPath`, `printNodeInfo`, `printNodeInfoShort`, `printScenegraph`, `printScenegraphRec`, `printStatsOverlay`, `print_r`, `printf`, `profilerGetCurrentGpuVRAM`, `profilerGetGpuPerformanceRating`, `profilerGpuBenchmarkSample`, `profilerStatsExportAddMetadata`, `profilerStatsExportAddSampleBegin`, `profilerStatsExportAddSampleData`, `profilerStatsExportAddSampleEnd`, `profilerStatsExportFinalize`, `profilerStatsExportInit`, `profilerWriteGpuBenchmarkStats`, `promptUserConfirmScreenMode`, `quaternionInterpolator`, `quaternionInterpolator2`, `rawequal`, `rawget`, `rawlen`, `rawset`, `readAnimalCompanionManagerFromStream`, `readBitVectorMapFromStream`, `readDensityDataFromStream`, `readDensityMapSyncerServerUpdateFromStream`, `readIntervalTimerMs`, `readSplitShapeIdFromStream`, `readSplitShapesClientUpdateFromStream`, `readSplitShapesFromStream`, `readSplitShapesServerEventFromStream`, `readSplitShapesServerUpdateFromStream`, `readTerrainUpdateStream`, `readTrafficSystemFromStream`, `registerGlobalActionEvents`, `registerObjectClassName`, `registerProfileFile`, `reloadDlcsAndMods`, `reloadResource`, `removeAnimalArea`, `removeConsoleCommand`, `removeContactReport`, `removeDensityMapSyncerConnection`, `removeGlobalUpdateable`, `removeHusbandryAnimal`, `removeJoint`, `removeJointBreakReport`, `removeModEventListener`, `removePedestrian`, `removePhysicsRope`, `removePostAnimationCallback`, `removeRoadsFromVehicleNavigationMap`, `removeSampleEffect`, `removeSplitShapeAttachments`, `removeSplitShapeConnection`, `removeSplitShapesShaderParameterOverwrite`, `removeTerrainUpdateConnection`, `removeTimer`, `removeTrafficSystemPlayer`, `removeVehicleNavigationPhysicsObstacle`, `removeVehicleNavigationWorldBlockingRegion`, `removeWakeUpReport`, `render360Screenshot`, `renderEnvProbe`, `renderMultiviewportScreenshot`, `renderScreenshot`, `renderShapeOutline`, `renderText3D`, `replaceUnrenderableCharacters`, `reportAnimalThreat`, `reportUser`, `requestExit`, `requestGamepadSignin`, `requestUserSignin`, `resetAutoExposure`, `resetDensityMapVisualizationOverlay`, `resetFacialAnim`, `resetFacialAnimToBindPose`, `resetModOnCreateFunctions`, `resetMultiplayerChecks`, `resetSplitShapes`, `resetTrafficSystem`, `resolveStreamSplitShapeId`, `restartApplication`, `rotate`, `saveBitVectorMapToFile`, `saveCancelUpdateList`, `saveCropsGrowthStateToFile`, `saveDeleteSavegame`, `saveDensityMapHeightUpdaterStateToFile`, `saveDensityMapToFile`, `saveDensityMapUpdaterStateToFile`, `saveGetHasSpaceForSaveGame`, `saveGetInfo`, `saveGetInfoById`, `saveGetMaxNumOfSaveGames`, `saveGetNumOfSaveGames`, `saveGetUploadState`, `saveHardwareScalability`, `saveHeatmap`, `savePreparedBitVectorMapToFile`, `savePreparedDensityMapToFile`, `savePreparedSplitShapesToFile`, `savePreparedTerrainHeightMap`, `savePreparedTerrainLodTypeMap`, `savePreparedVehicleNavigationCostMapToFile`, `saveReadSavegameCancel`, `saveReadSavegameFinish`, `saveReadSavegameGetProgress`, `saveReadSavegameHasProgress`, `saveReadSavegameStart`, `saveResetStorageDeviceSelection`, `saveResolveConflict`, `saveScreenshot`, `saveSetCloudErrorCallback`, `saveSetFixedSavegame`, `saveSplitShapesToFile`, `saveStartMigrateToPlayfab`, `saveTerrainHeightMap`, `saveTerrainLodNormalMap`, `saveTerrainLodTypeMap`, `saveTerrainOccludersCache`, `saveUpdateList`, `saveUploadSavegameDebugInfo`, `saveVehicleNavigationCostMapToFile`, `saveVehicleNavigationCostMapToFileBlocking`, `saveWriteSavegameFinish`, `saveWriteSavegameStart`, `saveXMLFileTo`, `searchText`, `select`, `set3dResolutionScaling`, `setAchievementProgress`, `setAllowFoliageShadows`, `setAnimalDaytime`, `setAnimalInteressNode`, `setAnimalShaderParameter`, `setAnimalSubType`, `setAnimalTextureTile`, `setAnimalUseOutdoorAudioSetup`, `setApplyCropsGrowthFinishedCallback`, `setApplyCropsGrowthMaxTimePerFrame`, `setAtmosphereCornetteShankAsymmetryFactor`, `setAtmosphereMieScale`, `setAtmosphereQuality`, `setAtmosphereSecondaryLightSource`, `setAudioGroupFrequencyFilter`, `setAudioGroupVolume`, `setBeaconLights`, `setBitVectorMapParallelogram`, `setBitVectorMapParallelogramWithStats`, `setBloomMagnitude`, `setBloomMaskThreshold`, `setBloomQuality`, `setBrightness`, `setBrightnessNits`, `setCCTPairCollision`, `setCCTPosition`, `setCameraTrackingSensitivity`, `setCaption`, `setCirrusCloudCoverage`, `setCloudAllowMeteredConnection`, `setCloudCurlNoiseProperties`, `setCloudDensityScaling`, `setCloudDistanceToCenter`, `setCloudGroundAlbedo`, `setCloudPrecipitation`, `setCloudShadowsQuality`, `setCloudShadowsTransmittanceBoost`, `setCloudType`, `setCloudWind`, `setCollisionEffectEnabled`, `setColorGradingSettings`, `setCompanionAvoidPlayer`, `setCompanionBehaviorDefault`, `setCompanionBehaviorFeed`, `setCompanionBehaviorFetch`, `setCompanionBehaviorFollowEntity`, `setCompanionBehaviorGotoEntity`, `setCompanionBehaviorMoveAllTo`, `setCompanionBehaviorMoveTo`, `setCompanionBehaviorPet`, `setCompanionBehaviorRideVehicle`, `setCompanionCollisionMask`, `setCompanionDaytime`, `setCompanionPaused`, `setCompanionPosition`, `setCompanionTextureTile`, `setCompanionTrigger`, `setCompanionUseOutdoorAudioSetup`, `setCompanionWaterDetectionOffset`, `setCompanionsPhysicsUpdate`, `setCompanionsVisibility`, `setCropsEnableGrowth`, `setCropsGrowthMask`, `setCropsGrowthNextState`, `setCropsGrowthStateTime`, `setCropsIgnoreDensityChanges`, `setCropsMaxNumCellsPerFrame`, `setCropsNumGrowthStates`, `setCullOverride`, `setCurrentMasterVolume`, `setCurrentProcessPriority`, `setDLSSFrameInterpolation`, `setDLSSQuality`, `setDRSQuality`, `setDRSTargetFPS`, `setDebugRenderingDepthScale`, `setDebugRenderingMode`, `setDensityMapHeightCollisionMap`, `setDensityMapHeightTypeProperties`, `setDensityMapHeightUpdateApplyBlockMask`, `setDensityMapHeightUpdateApplyFinishedCallback`, `setDensityMapHeightUpdateApplyMaxTimePerFrame`, `setDensityMapHeightUpdateType`, `setDensityMapSyncerLostPacket`, `setDensityMapUpdaterApplyFinishedCallback`, `setDensityMapUpdaterApplyMaxTimePerFrame`, `setDensityMapUpdaterCycleTime`, `setDensityMapUpdaterDeltaValue`, `setDensityMapUpdaterEnabled`, `setDensityMapUpdaterMask`, `setDensityMapUpdaterMaskFromInfoLayer`, `setDensityMapUpdaterMinMaxValue`, `setDensityMapUpdaterNextValue`, `setDensityMapVisualizationOverlayGrowthStateColor`, `setDensityMapVisualizationOverlayStateBorderColor`, `setDensityMapVisualizationOverlayStateColor`, `setDensityMapVisualizationOverlayTypeColor`, `setDensityMapVisualizationOverlayTypedStateColor`, `setDiscretePerformanceSetting`, `setDisplacementViewDistanceCoeff`, `setDoFBlurArea`, `setDoFblendWeights`, `setDoFparams`, `setDofQuality`, `setEnableBetaMods`, `setEnableHDRScreenshot`, `setEnablePostFx`, `setEnvAlbedoGroundColor`, `setEnvMap`, `setEnvironmentSettings`, `setExposureRange`, `setEyeAdaptionSpeed`, `setFacialAnimBlendVisemeDurationRatio`, `setFacialAnimLookAt`, `setFacialAnimLookAtWeight`, `setFacialAnimMaxBlendDurationMs`, `setFacialAnimMinDurationFullVisemeMs`, `setFacialAnimSchedule`, `setFacialAnimTime`, `setFidelityFxSR30FrameInterpolation`, `setFidelityFxSR30Quality`, `setFidelityFxSRQuality`, `setFileLogName`, `setFileLogPrefixTimestamp`, `setFixedLuminanceForExposure`, `setFoliageLODDistanceCoeff`, `setFoliageShaderParameter`, `setFoliageViewDistanceCoeff`, `setFramerateLimiter`, `setFullscreenMode`, `setGamepadAxisForceFeedback`, `setGamepadDeadzone`, `setGamepadDefaultDeadzone`, `setGamepadDigitalOutput`, `setGamepadEnabled`, `setGamepadVibration`, `setGamepadVibrationEnabled`, `setGlobalCloudCoverage`, `setGroundFogGlobalCoverage`, `setGroundFogGroundLevelDensity`, `setGroundFogHeight`, `setGroundFogMinimumValleyDepth`, `setGroundFogTerrainEntityId`, `setGroundFogVolumeNoiseWind`, `setGroundFogWind`, `setHDRGamma`, `setHasShadowFocusBox`, `setHeightFogGroundLevelDensity`, `setHeightFogMaxHeight`, `setHusbandryPaused`, `setInactiveWindowAudioVolume`, `setInvertStereoRendering`, `setIs3DAudioRenderingEnabled`, `setIs3DGraphicsRenderingEnabled`, `setIsPerformanceModeActive`, `setIsRenderedInViewports`, `setIsTerrainDecal`, `setIsUserBlocked`, `setJointFrame`, `setJointPosition`, `setJointRotationLimit`, `setJointRotationLimitForceLimit`, `setJointRotationLimitSpring`, `setJointTranslationLimit`, `setJointTranslationLimitForceLimit`, `setJointTranslationLimitSpring`, `setLODDistanceCoeff`, `setLanguage`, `setLensFlareHorizontalModifiers`, `setLensFlareIntensitySaturation`, `setLensFlarePositionJitterAndCheckerboard`, `setLensFlareQuality`, `setLensFlareRotationSpeed`, `setLensFlareSize`, `setLensFlareThreshold`, `setLightColor`, `setLocalCloudCoverage`, `setLowResCollisionHandlerHighPrioriyUpdateArea`, `setLowResCollisionHandlerTerrainRootNode`, `setLuaErrorHandler`, `setMSAA`, `setMasterVolume`, `setMaterialAlbedoColor`, `setMaterialCustomMap`, `setMaterialDiffuseMap`, `setMaterialGlossMap`, `setMaterialMetalness`, `setMaterialNormalMap`, `setMaterialSmoothness`, `setMaxNumLocalVolumetricLightSources`, `setMaxNumShadowLights`, `setMaxNumSoftShadowSpotLights`, `setMilkingPlaceDoors`, `setModDownloadManagerRecommenderParams`, `setModInstalled`, `setMoonBrightnessScale`, `setMoonSizeScale`, `setMotorProperties`, `setOutlineColor`, `setOverlayBrightnessNits`, `setPairCollision`, `setPedestrianSystemAimTarget`, `setPedestrianSystemBlockingPositionState`, `setPedestrianSystemDaytime`, `setPedestrianSystemEnabled`, `setPedestrianSystemMask`, `setPedestrianSystemPaused`, `setPedestrianSystemTimeScale`, `setPedestrianSystemTrafficSystem`, `setPedestrianSystemUpdatePlayerObstacle`, `setPedestrianSystemUseOutdoorAudioSetup`, `setPerformanceClass`, `setPhysicsDebugDrawCollisionFilterGroup`, `setPhysicsDebugDrawEnabled`, `setPhysicsDebugDrawMarginVisualizationEnabled`, `setPhysicsDebugDrawMode`, `setPhysicsDebugDrawNoDepthMode`, `setPhysicsRopeAnchor`, `setPhysicsRopeMaxLength`, `setPostProcessAntiAliasing`, `setPresenceMode`, `setProfile3dResolutionScaling`, `setProfileUiResolutionScaling`, `setReflectionMapObjectMasks`, `setReflectionMapRatio`, `setRenderOverlayAspectRatio`, `setRenderOverlayCamera`, `setResolutionScaling`, `setReverbDecayTime`, `setReverbEffect`, `setReverbEffectValues`, `setReverbGain`, `setReverbLateReverbGain`, `setReverbPreset`, `setReverbReflectionsGain`, `setSSAOIntensity`, `setSSAOQuality`, `setSafeFrameInsets`, `setSampleFrequencyFilter`, `setSampleGroup`, `setSampleLoopSynthesisLoadFactor`, `setSampleLoopSynthesisRPM`, `setSampleLoopSynthesisUseStartAlternative`, `setScreenHdrOutput`, `setScreenMode`, `setScreenSpaceReflectionsQuality`, `setScreenSpaceShadowsParameters`, `setScreenSpaceShadowsQuality`, `setShaderQuality`, `setShadingRateQuality`, `setShadowDistanceQuality`, `setShadowFilterQuality`, `setShadowMapFilterSize`, `setShadowMapSize`, `setShadowQuality`, `setSharedShaderParameter`, `setSharpness`, `setShowMouseCursor`, `setSleepingThresholds`, `setSoundPlayerChannel`, `setSoundPlayerItem`, `setSplitShapesFileIdMapping`, `setSplitShapesLoadingFileId`, `setSplitShapesNextFileId`, `setSplitShapesWorldCompressionParams`, `setSpotShadowAtlasSlotFactor`, `setSpotShadowDistanceFrequencyFactor`, `setSpotShadowFullResolutionPercentage`, `setSpotShadowMinimumConeAnglePercentage`, `setSpotShadowReducedConeAngleFactor`, `setStartMode`, `setStereoRendering`, `setStreamLowPriorityI3DFiles`, `setSunBrightnessScale`, `setSunIsPrimary`, `setSunSizeScale`, `setTerrainDeformationBlockedAreaMap`, `setTerrainDeformationBlockedAreaMaxDisplacement`, `setTerrainDeformationDynamicObjectCollisionMask`, `setTerrainDeformationDynamicObjectMaxDisplacement`, `setTerrainDeformationHeightChangeAmount`, `setTerrainDeformationHeightSetTarget`, `setTerrainDeformationOutsideAreaBrush`, `setTerrainDeformationOutsideAreaConstraints`, `setTerrainDeformationTyreTrackSystem`, `setTerrainDisplacementWetness`, `setTerrainFillPlanesToMaterial`, `setTerrainFillPlanesToMaterialCustom`, `setTerrainLODDistanceCoeff`, `setTerrainLayerAtWorldPos`, `setTerrainLayerXmlAttribute`, `setTerrainLoadDirectory`, `setTerrainLodBlendDistances`, `setTerrainLodBlendDynamicDistances`, `setTerrainOverlayLayerXmlAttribute`, `setTerrainQuality`, `setTextRenderOverlay`, `setTextureFiltering`, `setTextureResolution`, `setTextureStreamingDowngradeDelay`, `setTextureStreamingMemoryBudget`, `setTextureStreamingPaused`, `setTextureStreamingTargetTexelToPixelRatio`, `setTimerTime`, `setToneMappingCurveBlackClip`, `setToneMappingCurveShoulder`, `setToneMappingCurveSlope`, `setToneMappingCurveToe`, `setToneMappingCurveWhiteClip`, `setTrafficSystemBlockingPositionState`, `setTrafficSystemCollisionMasks`, `setTrafficSystemDaytime`, `setTrafficSystemEnabled`, `setTrafficSystemNightTimeRange`, `setTrafficSystemParkedCarsEnabled`, `setTrafficSystemPaused`, `setTrafficSystemRenderCollisionGeometry`, `setTrafficSystemUseOutdoorAudioSetup`, `setTrafficSystemVehicleNavigationMap`, `setTyreTracksSegmentsCoeff`, `setUiResolutionScaling`, `setUseKinematicSplitShapes`, `setUserConfirmScreenMode`, `setValarParameters`, `setValarPowerMode`, `setValarQuality`, `setVehicleNavigationAgentTarget`, `setVehicleNavigationMapBlockingPositionState`, `setVehicleNavigationMapTrafficSystem`, `setVehicleNavigationObstaclePairCollision`, `setVehicleNavigationPhysicsObstacleCollisionBox`, `setVehicleNavigationPhysicsObstacleIsPassable`, `setVehicleNavigationWorldBlockingRegionState`, `setVideoOverlayPosition`, `setVideoOverlayVolume`, `setViewDistanceCoeff`, `setVirtualTerrainInfiniteUpdates`, `setVirtualTerrainUpdateEnabled`, `setVolumeMeshTessellationCoeff`, `setVolumetricFogQuality`, `setVsync`, `setWheelShapeAutoHoldBrakeForce`, `setWheelShapeTerrainDisplacement`, `setWheelShapeWidth`, `setWindowFocus`, `setXeSSFrameInterpolation`, `setXeSSQuality`, `setfenv`, `setmetatable`, `showAnimal`, `showGameInstallProgress`, `showNetflixButton`, `showSoundPlayerContentRatingWarning`, `showUserProfile`, `simulateParticleSystems`, `smoothDensityMapHeightAtWorldPos`, `snapVehicleNavigationAgentPositionAndDirection`, `splitShape`, `startDevClient`, `startDevServer`, `startFrameRepeatMode`, `startMenuMusic`, `startUpdatePendingMods`, `startWriteSplitShapesServerEvents`, `statsGet`, `statsGetIndex`, `statsSet`, `stopVideoOverlay`, `storeAreDlcsCorrupted`, `storeBeginUserSignIn`, `storeGetBuyPageState`, `storeGetNumProducts`, `storeGetOnlineState`, `storeGetProductInfo`, `storeGetProductPrice`, `storeHasNativeGUI`, `storeHaveDlcsChanged`, `storeOpenBuyPage`, `storeRequestCloseBuyPage`, `syncProfileFiles`, `takeScreenshot`, `testSplitShape`, `textureFileExists`, `toggleShowFPS`, `toggleStatsOverlay`, `toggleVisibility`, `tonumber`, `tostring`, `touchEvent`, `traceOff`, `traceOn`, `traceSharedI3DFiles`, `traceStreamedI3DFiles`, `translate`, `type`, `typeof`, `uninstallMod`, `unpack`, `unregisterObjectClassName`, `update`, `updateAspectRatio`, `updateFeedingPlace`, `updateLoadingBar`, `updateLoadingBarProgress`, `updateMod`, `updatePlacementCollisionMap`, `updateRenderOverlay`, `updateTerrainCollisionMap`, `updateVehicleNavigationMap`, `updateVideoOverlay`, `userSignout`, `usleep`, `verifyDlcs`, `voiceChatAddConnection`, `voiceChatAddLocalUser`, `voiceChatCleanup`, `voiceChatGetAutoActivationSensitivity`, `voiceChatGetConnectionStatus`, `voiceChatGetHasRecordingDevice`, `voiceChatGetIsRecordingMuted`, `voiceChatGetMasterVolume`, `voiceChatGetRecordingMode`, `voiceChatGetRecordingVolume`, `voiceChatGetUserVolume`, `voiceChatNotifyPacketLost`, `voiceChatNotifyPacketSent`, `voiceChatReadClientUpdateFromStream`, `voiceChatReadServerUpdateFromStream`, `voiceChatSetAutoActivationSensitivity`, `voiceChatSetIsRecordingMuted`, `voiceChatSetMasterVolume`, `voiceChatSetRecordingMode`, `voiceChatSetRecordingVolume`, `voiceChatSetUserPairBlocked`, `voiceChatSetUserVolume`, `voiceChatWriteClientUpdateToStream`, `voiceChatWriteServerUpdateToStream`, `wrapMousePosition`, `writeAnimalCompanionManagerToStream`, `writeBitVectorMapToStream`, `writeDensityDataToStream`, `writeDensityMapSyncerServerUpdateToStream`, `writeSplitShapeIdToStream`, `writeSplitShapesClientUpdateToStream`, `writeSplitShapesServerEventToStream`, `writeSplitShapesServerUpdateToStream`, `writeSplitShapesToStream`, `writeTerrainDeformationBlockedAreas`, `writeTerrainUpdateStream`, `writeTrafficSystemToStream`, `xpcall`
