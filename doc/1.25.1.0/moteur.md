# Engine functions

Signatures from `sdk/debugger/scriptBinding.xml` (incomplete: some functions called by the game or by mods are not listed).

## Animation

- `assignAnimTrackClip(characterSetId: integer, trackId: integer, clipIndex: integer)`
- `clearAnimTrackClip(characterSetId: integer, trackId: integer)`
- `cloneAnimCharacterSet(objectId: integer, targetId: integer)` → `boolean`
- `conditionalAnimationDebugDraw(conditionalAnimationEntityId: integer, x: number, y: number, z: number)`
- `conditionalAnimationRegisterParameter(conditionalAnimationEntityId: integer, parameterId: integer, parameterType: integer, parameterLabel: string)`
- `conditionalAnimationZeroiseTrackTimes(conditionalAnimationEntityId: integer)`
- `createConditionalAnimation()` → `integer`
- `disableAnimTrack(characterSetId: integer, trackId: integer)`
- `enableAnimTrack(characterSetId: integer, trackId: integer)`
- `getAnimCharacterSet(objectId: integer)` → `integer`
- `getAnimClipDuration(characterSetId: integer, index: integer)` → `number`
- `getAnimClipIndex(characterSetId: integer, clipName: string)` → `integer`
- `getAnimClipName(characterSetId: integer, index: integer)` → `string`
- `getAnimNumOfClips(characterSetId: integer)` → `integer`
- `getAnimTrackAssignedClip(characterSetId: integer, trackId: integer)` → `integer`
- `getAnimTrackBlendWeight(characterSetId: integer, trackId: integer)` → `number`
- `getAnimTrackTime(characterSetId: integer, trackId: integer)` → `number`
- `getConditionalAnimationBoolValue(conditionalAnimationEntityId: integer, parameterId: integer)` → `boolean`
- `getConditionalAnimationFloatValue(conditionalAnimationEntityId: integer, parameterId: integer)` → `number`
- `getConditionalAnimationTime(conditionalAnimationEntityId: integer)` → `number`
- `initConditionalAnimation(conditionalAnimationEntityId: integer, charsetNodeId: integer, xmlFilePath: string, baseNodeName: string)`
- `isAnimTrackClipAssigned(characterSetId: integer, trackId: integer)` → `boolean`
- `isAnimTrackEnabled(characterSetId: integer, trackId: integer)` → `boolean`
- `setAnimTrackBlendWeight(characterSetId: integer, trackId: integer, weight: number)`
- `setAnimTrackLoopState(characterSetId: integer, trackId: integer, loopState: boolean)`
- `setAnimTrackSpeedScale(characterSetId: integer, trackId: integer, speedScale: number)`
- `setAnimTrackTime(characterSetId: integer, trackId: integer, time: number, immediateUpdate: boolean?)`
- `setConditionalAnimationBoolValue(conditionalAnimationEntityId: integer, parameterId: integer, value: boolean)` → `boolean`
- `setConditionalAnimationFloatValue(conditionalAnimationEntityId: integer, parameterId: integer, value: number)` → `boolean`
- `setConditionalAnimationSpecificParameterIds(conditionalAnimationEntityId: integer, velocityParmId: integer, angularVelocityParmId: integer)`
- `setConditionalAnimationTime(conditionalAnimationEntityId: integer, time: number)`
- `updateConditionalAnimation(conditionalAnimationEntityId: integer, dt: number)`

## Camera

- `aimCamera(cameraId: integer, x: number, y: number, z: number, distance: number, dt: number, springStrength: number)`
- `createCamera(cameraName: string, fovy: number, nearClip: number, farClip: number)` → `integer`
- `getCamera()` → `integer`
- `getFarClip(cameraId: integer)` → `number`
- `getFovY(cameraId: integer)` → `number`
- `getIsOrthographic(cameraId: integer)` → `boolean`
- `getNearClip(cameraId: integer)` → `number`
- `getOrthographicHeight(cameraId: integer)` → `number`
- `getProjectionOffset(cameraId: integer)` → `number, number`
- `projectToCamera(cameraId: integer, aspectRatio: number, x: number, y: number, z: number)` → `number, number, number`
- `setCamera(cameraId: integer)`
- `setFarClip(cameraId: integer, farClip: number)`
- `setFovY(cameraId: integer, fovY: number)`
- `setIsOrthographic(cameraId: integer, isOrthographic: boolean)`
- `setNearClip(cameraId: integer, nearClip: number)`
- `setOrthographicHeight(cameraId: integer, orthographicHeight: number)`
- `setProjectionOffset(cameraId: integer, x: number, y: number)`
- `transformToViewSpace(cameraId: integer, x: number, y: number, z: number)` → `number, number, number`

## Debug

- `debugDisableSingleStep()`
- `debugEnableSingleStep()`
- `drawDebugArrow(x: number, y: number, z: number, dirX: number, dirY: number, dirZ: number, tangX: number, tangY: number, tangZ: number, r: number, g: number, b: number, solid: boolean?)`
- `drawDebugArrowVector(p: vector, dir: vector, tang: vector, r: number, g: number, b: number, solid: boolean?)`
- `drawDebugLine(x0: number, y0: number, z0: number, r0: number, g0: number, b0: number, x1: number, y1: number, z1: number, r1: number, g1: number, b1: number, solid: boolean?)`
- `drawDebugLineVector(p0: vector, r0: number, g0: number, b0: number, p1: vector, r1: number, g1: number, b1: number, solid: boolean?)`
- `drawDebugPoint(x: number, y: number, z: number, r: number, g: number, b: number, a: number, solid: boolean?)`
- `drawDebugPointVector(point: vector, r: number, g: number, b: number, a: number, solid: boolean?)`
- `drawDebugSetDimmingState(enableDimming: boolean)`
- `printCallstack(message: string?)`
- `startDebugging()`
- `stopDebugging()`

## Entity

- `delete(objectId: integer)`
- `entityExists(objectId: integer)` → `boolean`
- `getHasClassId(objectId: integer, classId: integer)` → `boolean`
- `getName(entityId: integer)` → `string`
- `setName(entityId: integer, entityName: string)`

## Fillplanes

- `createFillPlaneShape(shapeId: integer, shapeName: string, volume: number, deltaMax: number, maxSurfaceAngle: number, maxPhysicalSurfaceAngle: number, maxSurfaceDistanceError: number, maxSubDivEdgeLength: number, syncMaxSubDivEdgeLength: number, createSidePlanes: boolean, retessellateTop: boolean)` → `integer`
- `fillPlaneAdd(fillPlaneShapeId: integer, dTvolume: number, x: number, y: number, z: number, dx1: number, dy1: number, dz1: number, dx2: number, dy2: number, dz2: number)`
- `findPolyline(fillPlaneShapeId: integer, x: number, z: number)` → `integer`
- `getFillPlaneHeightAtLocalPos(fillPlaneShapeId: integer, x: number, z: number)` → `number`
- `readFillPlaneFromStream(fillPlaneShapeId: integer, streamId: integer, totalVolume: number)` → `boolean`
- `setFillPlaneMaxPhysicalSurfaceAngle(fillPlaneShapeId: integer, physicalSurfAngle: number)`
- `setPolylineTranslation(fillPlaneShapeId: integer, polyLineIdx: integer, dx: number, dz: number)`
- `writeFillPlaneToStream(fillPlaneShapeId: integer, streamId: integer)` → `boolean`

## Foliage

- `addFoliageTypeFromXML(terrainNode: integer, foliageDataPlaneId: integer, name: string, xmlFilename: string)` → `integer`
- `createFoliageBendingRectangle(foliageBendingSystemId: integer, minX: number, maxX: number, minZ: number, maxZ: number, yOffset: number, centerTransformid: integer)` → `integer`
- `destroyFoliageBendingObject(foliageBendingSystemId: integer, objectId: integer)`
- `getFoliageBendingRectangleAttributes(foliageBendingSystemId: integer, rectangleId: integer)` → `number, number, number, number, number`
- `setFoliageBendingRectangleAttributes(foliageBendingSystemId: integer, rectangleId: integer, minX: number, maxX: number, minZ: number, maxZ: number, yOffset: number)`
- `setFoliageBendingSystem(terrainId: integer, foliageBendingSystemId: integer)`

## General

- `print(arg1: any?, arg2: any?, arg3: any?, arg4: any?, arg5: any?, arg6: any?, arg7: any?, arg8: any?)`
- `printError(arg1: any?, arg2: any?, arg3: any?, arg4: any?, arg5: any?, arg6: any?, arg7: any?, arg8: any?)`
- `printWarning(arg1: any?, arg2: any?, arg3: any?, arg4: any?, arg5: any?, arg6: any?, arg7: any?, arg8: any?)`
- `source(filename: string, environment: ref?)`

## I3D

- `cancelStreamI3DFile(requestId: integer)`
- `clearEntireSharedI3DFileCache()`
- `getAllSharedI3DFileRequestIds()` → `intArray`
- `getAllStreamI3DFileRequestIds()` → `intArray`
- `getNumOfSharedI3DFiles()` → `integer`
- `getSharedI3DFileProgressInfo(requestId: integer)` → `string, number, string, string, object, object`
- `getSharedI3DFileRefCount(filename: string)` → `integer`
- `getStreamI3DFileProgressInfo(requestId: integer)` → `string, number, string, string, object, object`
- `loadI3DFile(filename: string, addPhysics: boolean?, callOnCreate: boolean?, verbose: boolean?)` → `integer, integer`
- `loadSharedI3DFile(filename: string, addPhysics: boolean?, callOnCreate: boolean?, verbose: boolean?)` → `integer, integer, integer`
- `pinSharedI3DFileInCache(filename: string, verbose: boolean)`
- `releaseSharedI3DFile(requestId: integer, warnIfInvalid: boolean?)`
- `setStreamI3DFileDelay(minDelay: number, maxDelay: number)`
- `setStreamSharedI3DFileDelay(minDelay: number, maxDelay: number, minDelayCached: number, maxDelayCached: number)`
- `streamI3DFile(filename: string, callbackFunctionName: string?, callbackTarget: object?, arguments: object?, addPhysics: boolean?, callOnCreate: boolean?, verbose: boolean?)` → `integer`
- `streamSharedI3DFile(filename: string, callbackFunctionName: string?, callbackTarget: object?, arguments: object?, addPhysics: boolean?, callOnCreate: boolean?, verbose: boolean?)` → `integer`
- `unpinSharedI3DFileInCache(filename: string)`

## Input

- `getGamepadAxisLabel(axisNumber: integer, gamepadIndex: integer)` → `string`
- `getGamepadButtonLabel(buttonNumber: integer, gamepadIndex: integer)` → `string`
- `getGamepadName(gamepadIndex: integer)` → `string`
- `getHasTouchpad()` → `boolean`
- `getInputAxis(axisNumber: integer, gamepadIndex: integer)` → `number`
- `getInputButton(buttonNumber: integer, gamepadIndex: integer)` → `number`
- `getNumOfGamepads()` → `integer`

## Lighting

- `addLightShadowIgnoreShapes(lightId: integer, nodeId: integer)`
- `addMergedShadowIgnoreShapes(lightId: integer, shapeId: integer)`
- `clearLightShadowIgnoreShapes(lightId: integer)`
- `clearMergedShadowIgnoreShapes(lightId: integer)`
- `createLightSource(name: string, lightType: integer, r: number, g: number, b: number, range: number)` → `integer`
- `getLightCastingShadowMap(lightId: integer)` → `boolean, integer`
- `getLightConeAngle(lightId: integer)` → `number`
- `getLightConeAngleFromIESProfile(lightId: integer)` → `number`
- `getLightDropOff(lightId: integer)` → `number`
- `getLightIESProfile(lightId: integer)` → `string`
- `getLightRange(lightId: integer)` → `number`
- `getLightScatteringConeAngle(lightId: integer)` → `number`
- `getLightScatteringDirection(lightId: integer)` → `number, number, number`
- `getLightScatteringIntensity(lightId: integer)` → `number`
- `getLightShadowExtrusionDistance(lightId: integer)` → `number`
- `getLightShadowPriority(lightId: integer)` → `number`
- `getLightSoftShadowDepthBiasFactor(lightId: integer)` → `number`
- `getLightSoftShadowDistance(lightId: integer)` → `number`
- `getLightSoftShadowSize(lightId: integer)` → `number`
- `getLightType(lightId: integer)` → `integer`
- `getLightUseLightScattering(lightId: integer)` → `boolean`
- `getMergedShadowSettingsLight(lightId: integer)` → `integer`
- `hasMergedShadow(lightId: integer)` → `boolean`
- `isMergedShadowActive(lightId: integer)` → `boolean`
- `mergeLightShadows(lightId: integer, lightId2: integer, lightId3: integer, lightId4: integer, lightId5: integer, lightId6: integer, lightId7: integer, lightId8: integer, lightId9: integer, lightId10: integer)`
- `removeLightShadowIgnoreShapes(lightId: integer, nodeId: integer)`
- `removeMergedShadowIgnoreShapes(lightId: integer, shapeId: integer)`
- `setLightConeAngle(lightId: integer, cone: number)`
- `setLightCullingWorldProperties(gridMinX: number, gridMinY: number, gridMinZ: number, gridMaxX: number, gridMaxY: number, gridMaxZ: number, gridSize: integer, clipDistanceThreshold1: number, clipDistanceThreshold2: number)`
- `setLightDropOff(lightId: integer, dropoff: number)`
- `setLightIESProfile(lightId: integer, '*.ies': string)`
- `setLightRange(lightId: integer, range: number)`
- `setLightScatteringColor(lightId: integer, red: number, green: number, blue: number)`
- `setLightScatteringConeAngle(lightId: integer, scattering: number)`
- `setLightScatteringDirection(lightId: integer, dirX: number, dirY: number, dirZ: number)`
- `setLightScatteringIntensity(lightId: integer, scattering: number)`
- `setLightShadowExtrusionDistance(lightId: integer, extrusion: number)`
- `setLightShadowMap(lightId: integer, castShowMap: boolean, depthMapResolution: integer)`
- `setLightShadowPriority(lightId: integer, shadowPriority: number)`
- `setLightSoftShadowDepthBiasFactor(lightId: integer, softShadowDistance: number)`
- `setLightSoftShadowDistance(lightId: integer, softShadowDistance: number)`
- `setLightSoftShadowSize(lightId: integer, softShadowSize: number)`
- `setLightUseLightScattering(lightId: integer, useLightScattering: boolean)`
- `setMergedShadowActive(lightId: integer, shouldEnable: boolean)`
- `setMergedShadowLightSize(lightId: integer, lightSize: number)`
- `setMergedShadowNearPlaneOffset(lightId: integer, nearPlane: number)`
- `setMergedShadowSettings(lightId: integer, depthBias: number?, slopeScaleDepthBias: number?, slopeScaleDepthClamp: number?, shadowMapResolution: integer?)`
- `setMergedShadowSettingsLight(lightId: integer, shadowSettingsLightId: integer)`
- `splitLightShadow(lightId: integer)`

## Math

- `base64Decode(input: string)` → `byteArray`
- `base64Encode(input: byteArray)` → `string`
- `bitAND(value1: integer, value2: integer)` → `integer`
- `bitHighestSet(input: integer)` → `integer`
- `bitNOT(input: integer)` → `integer`
- `bitOR(value1: integer, value2: integer)` → `integer`
- `bitShiftLeft(value1: integer, value2: integer)` → `integer`
- `bitShiftRight(value1: integer, value2: integer)` → `integer`
- `bitXOR(value1: integer, value2: integer)` → `integer`
- `getLevenshteinDistance(value1: string, value2: string)` → `integer`
- `mathEulerRotateVector(x: number, y: number, z: number, x: number, y: number, z: number)` → `number, number, number`
- `mathEulerToQuaternion(x: number, y: number, z: number)` → `number, number, number, number`
- `mathQuaternionRotateVector(qx: number, qy: number, qz: number, qw: number, x: number, y: number, z: number)` → `number, number, number`
- `mathQuaternionToEuler(qx: number, qy: number, qz: number, qw: number)` → `number, number, number`

## NavMesh

- `buildNavMesh(navMeshId: integer, worldNode: integer, cellSize: number, cellHeight: number, agentHeight: number, agentRadius: number, agentMaxClimb: number, agentMaxSlope: number, minRegionSize: number, mergeRegionSize: number, maxEdgeLength: number, maxSimplificationError: number, navMeshBuildMask: integer, terrainDetail: integer, terrainCullInfoLayer: string, terrainCullInfoLayerChannels: integer)` → `boolean`
- `buildNavMeshFromContour(navMeshId: integer, contourWorldPositions: floatArray, terrainNodeId: integer, collisionMask: integer, cellSize: number, cellHeight: number, agentHeight: number, agentRadius: number, agentMaxClimb: number, agentMaxSlope: number, minRegionSize: number, mergeRegionSize: number, maxEdgeLength: number, maxSimplificationError: number)` → `boolean`
- `buildNavMeshFromShapesAndContour(navMeshId: integer, shapesNodeId: integer, shapesMask: integer, contourWorldPositions: floatArray, terrainNodeId: integer, collisionMask: integer, cellSize: number, cellHeight: number, agentHeight: number, agentRadius: number, agentMaxClimb: number, agentMaxSlope: number, minRegionSize: number, mergeRegionSize: number, maxEdgeLength: number, maxSimplificationError: number)` → `boolean`
- `createNavMesh(name: string)` → `integer`

## Network

- `streamAlignReadToByteBoundary(streamId: integer)`
- `streamAlignWriteToByteBoundary(streamId: integer)`
- `streamGetNumOfUnreadBits(streamId: integer)` → `integer`
- `streamGetReadOffset(streamId: integer)` → `integer`
- `streamGetWriteOffset(streamId: integer)` → `integer`
- `streamReadBool(streamId: integer)` → `boolean`
- `streamReadFloat32(streamId: integer)` → `number`
- `streamReadInt16(streamId: integer)` → `integer`
- `streamReadInt32(streamId: integer)` → `integer`
- `streamReadInt8(streamId: integer)` → `integer`
- `streamReadIntN(streamId: integer, numberofBits: integer)` → `integer`
- `streamReadManualTimestamp(streamId: integer)` → `integer`
- `streamReadString(streamId: integer)` → `string`
- `streamReadUInt16(streamId: integer)` → `integer`
- `streamReadUInt32(streamId: integer)` → `integer`
- `streamReadUInt8(streamId: integer)` → `integer`
- `streamReadUIntN(streamId: integer, numberOfBits: integer)` → `integer`
- `streamSetReadOffset(streamId: integer, offset: integer)`
- `streamSetWriteOffset(streamId: integer, offset: integer)`
- `streamWriteBool(streamId: integer, value: boolean)` → `boolean`
- `streamWriteFloat32(streamId: integer, value: number)`
- `streamWriteInt16(streamId: integer, value: integer)`
- `streamWriteInt32(streamId: integer, value: integer)`
- `streamWriteInt8(streamId: integer, value: integer)`
- `streamWriteIntN(streamId: integer, value: integer, numberOfBits: integer)`
- `streamWriteManualTimestamp(streamId: integer, timestamp: integer)`
- `streamWriteStream(streamId: integer, streamSrcId: integer, numBits: integer, useReadStream: boolean)`
- `streamWriteString(streamId: integer, value: string)`
- `streamWriteTimestamp(streamId: integer)`
- `streamWriteUInt16(streamId: integer, value: integer)`
- `streamWriteUInt32(streamId: integer, value: integer)`
- `streamWriteUInt8(streamId: integer, uint8: integer)`
- `streamWriteUIntN(streamId: integer, value: integer, numberofBits: integer)`

## Node

- `calcDistanceFrom(transformOne: integer, transformTwo: integer)` → `number`
- `calcDistanceSquaredFrom(transformOne: integer, transformTwo: integer)` → `number`
- `clone(objectId: integer, groupUnderParent: boolean, callOnCreate: boolean?, addPhysics: boolean?)` → `integer`
- `createTransformGroup(transformName: string)` → `integer`
- `getChild(objectId: integer, childName: string)` → `integer`
- `getChildAt(objectId: integer, index: integer)` → `integer`
- `getChildIndex(objectId: integer)` → `integer`
- `getClipDistance(objectId: integer)` → `number`
- `getClipDistancesWithLOD(objectId: integer)` → `number, number`
- `getEffectiveClipDistancesWithLOD(objectId: integer)` → `number, number`
- `getEffectiveVisibility(transformId: integer)` → `boolean`
- `getIsLockedGroup(transformId: integer)` → `boolean`
- `getIsLODTransformGroup(transformId: integer)` → `boolean`
- `getLODTransformGroup(transformId: integer)` → `integer`
- `getMinClipDistance(objectId: integer)` → `number`
- `getNumOfChildren(objectId: integer)` → `integer`
- `getNumOfUserAttributes(objectId: integer)` → `integer`
- `getObjectMask(objectId: integer)` → `integer`
- `getParent(objectId: integer)` → `integer`
- `getQuaternion(objectId: integer)` → `number, number, number, number`
- `getRootNode()` → `integer`
- `getRotation(transformId: integer)` → `number, number, number`
- `getRotationVector(transformId: integer)` → `vector`
- `getScale(transformId: integer)` → `number, number, number`
- `getScaleVector(transformId: integer)` → `vector`
- `getTranslation(transformId: integer)` → `number, number, number`
- `getTranslationVector(transformId: integer)` → `vector`
- `getUserAttribute(objectId: integer, name: string)` → `any?`
- `getUserAttributeByIndex(objectId: integer, attributeIndex: integer)` → `any?, string, integer`
- `getUserAttributeValueAndType(objectId: integer, name: string)` → `any?, integer`
- `getVisibility(transformId: integer)` → `boolean`
- `getVisibilityConditionDayOfYear(objectId: integer)` → `integer, integer, boolean`
- `getVisibilityConditionEntityState(objectId: integer)` → `boolean`
- `getVisibilityConditionMinuteOfDay(objectId: integer)` → `integer, integer, boolean`
- `getVisibilityConditionRenderInvisible(objectId: integer)` → `boolean, boolean`
- `getVisibilityConditionViewerSpacialityMask(objectId: integer)` → `integer, integer, boolean`
- `getVisibilityConditionVisibleShaderParameter(objectId: integer)` → `number, boolean`
- `getVisibilityConditionWeatherMask(objectId: integer)` → `integer, integer, boolean`
- `getWorldQuaternion(objectId: integer)` → `number, number, number, number`
- `getWorldRotation(transformId: integer)` → `number, number, number`
- `getWorldRotationVector(transformId: integer)` → `vector`
- `getWorldTranslation(transformId: integer)` → `number, number, number`
- `getWorldTranslationVector(transformId: integer)` → `vector`
- `link(parentNodeId: integer, childNodeId: integer, index: integer?)`
- `localDirectionToLocal(transformId: integer, targetTransformId: integer, dx: number, dy: number, dz: number)` → `number, number, number`
- `localDirectionToLocalVector(sourceTransformId: integer, targetTransformId: integer, sourceDirection: vector)` → `vector`
- `localDirectionToWorld(transformId: integer, ldx: number, ldy: number, ldz: number)` → `number, number, number`
- `localDirectionToWorldVector(transformId: integer, localDirection: vector)` → `vector`
- `localRotationToLocal(transformId: integer, targetTransformId: integer, rx: number, ry: number, rz: number)` → `number, number, number`
- `localRotationToLocalVector(sourceTransformId: integer, targetTransformId: integer, sourceRotation: vector)` → `vector`
- `localRotationToWorld(transformId: integer, lrx: number, lry: number, lrz: number)` → `number, number, number`
- `localRotationToWorldVector(transformId: integer, localRotation: vector)` → `vector`
- `localToLocal(transformId: integer, targetTransformId: integer, x: number, y: number, z: number)` → `number, number, number`
- `localToLocalVector(sourceTransformId: integer, targetTransformId: integer, source: vector)` → `vector`
- `localToWorld(transformId: integer, lx: number, ly: number, lz: number)` → `number, number, number`
- `localToWorldVector(transformId: integer, localTranslation: vector)` → `vector`
- `project(wx: number, wy: number, wz: number)` → `number, number, number`
- `removeUserAttribute(objectId: integer, attributeName: string)`
- `rotateAboutLocalAxis(transformId: integer, rotation: number, dx: number, dy: number, dz: number)`
- `rotateAboutLocalAxisVector(transformId: integer, rotation: number, axisDirection: vector)`
- `setClipDistance(objectId: integer, distance: number)`
- `setDirection(transformId: integer, x: number, y: number, z: number, upX: number, upY: number, upZ: number)`
- `setDirectionVector(transformId: integer, direction: vector, up: vector)`
- `setLockedGroup(transformId: integer, locked: boolean)`
- `setMinClipDistance(objectId: integer, minDist: number)`
- `setObjectMask(objectId: integer, mask: integer)`
- `setQuaternion(objectId: integer, x: number, y: number, z: number, w: number)`
- `setRootNode(transformId: integer)`
- `setRotation(objectId: integer, x: number, y: number, z: number)`
- `setRotationVector(transformId: integer, rotation: vector)`
- `setScale(transformId: integer, x: number, y: number, z: number)`
- `setScaleVector(transformId: integer, scale: vector)`
- `setTranslation(transformId: integer, x: number, y: number, z: number)`
- `setTranslationVector(transformId: integer, translation: vector)`
- `setUserAttribute(objectId: integer, name: string, type: integer?, value: any?)`
- `setVisibility(transformId: integer, visibility: boolean)`
- `setVisibilityConditionDayOfYear(objectId: integer, dayOfYearStart: integer, dayOfYearEnd: integer)`
- `setVisibilityConditionMinuteOfDay(objectId: integer, minuteOfDayStart: integer, minuteOfDayEnd: integer)`
- `setVisibilityConditionRenderInvisible(objectId: integer, renderInvisible: boolean)`
- `setVisibilityConditionViewerSpacialityMask(objectId: integer, viewerSpacialityRequiredMask: integer, viewerSpacialityPreventMask: integer)`
- `setVisibilityConditionVisibleShaderParameter(objectId: integer, shaderVisibilityParam: number)`
- `setVisibilityConditionWeatherMask(objectId: integer, weatherRequiredMask: integer, weatherPreventMask: integer)`
- `setWorldDirection(transformId: integer, x: number, y: number, z: number, upX: number, upY: number, upZ: number)`
- `setWorldDirectionVector(transformId: integer, direction: vector, up: vector)`
- `setWorldQuaternion(objectId: integer, x: number, y: number, z: number, w: number)`
- `setWorldRotation(transformId: integer, x: number, y: number, z: number)`
- `setWorldRotationVector(transformId: integer, rotation: vector)`
- `setWorldTranslation(transformId: integer, wx: number, wy: number, wz: number)`
- `setWorldTranslationVector(transformId: integer, translation: vector)`
- `unlink(objectId: integer)`
- `unProject(sx: number, sy: number, sz: number)` → `number, number, number`
- `worldDirectionToLocal(transformId: integer, wdx: number, wdy: number, wdz: number)` → `number, number, number`
- `worldDirectionToLocalVector(transformId: integer, worldDirection: vector)` → `vector`
- `worldRotationToLocal(transformId: integer, wrx: number, wry: number, wrz: number)` → `number, number, number`
- `worldRotationToLocalVector(transformId: integer, worldRotation: vector)` → `vector`
- `worldToLocal(transformId: integer, wx: number, wy: number, wz: number)` → `number, number, number`
- `worldToLocalVector(transformId: integer, world: vector)` → `vector`

## NoteNode

- `createNoteNode(parentId: integer?, text: string?, colorR: number?, colorG: number?, colorB: number?, fixedSize: boolean?)` → `integer`
- `exportNoteNodes(filePath: string)`
- `getNoteNodeText(noteId: integer)` → `string`
- `setNoteNodeColor(noteId: integer, colorR: number, colorG: number, colorB: number)`
- `setNoteNodeFixedSize(noteId: integer, fixedSize: boolean)`
- `setNoteNodeText(noteId: integer, text: string)`

## Overlays

- `clearOverlayArea(x: number, y: number, width: number, height: number, rotation: number, rotCenterX: number, rotCenterY: number)`
- `createImageOverlay(textureFilename: string, deferredActivation: boolean?)` → `integer`
- `createImageOverlayWithTexture(textureId: integer)` → `integer`
- `getIsOverlayReady(overlay: integer)` → `boolean`
- `renderOverlay(overlayId: integer, x: number, y: number, width: number, height: number)`
- `set2DMaskFromOverlay(overlayId: integer, maskAlphaOnly: boolean, x: number, y: number, width: number, height: number)`
- `set2DMaskFromTexture(textureId: integer, maskAlphaOnly: boolean, x: number, y: number, width: number, height: number)`
- `setOverlayColor(overlayId: integer, red: number, green: number, blue: number, alpha: number)`
- `setOverlayCornerColor(overlayId: integer, cornerIndex: integer, red: number, green: number, blue: number, alpha: number)`
- `setOverlayLayer(overlayId: integer, layer: integer)`
- `setOverlayRotation(overlayId: integer, rotation: number, pivotX: number, pivotY: number)`
- `setOverlaySignedDistanceFieldWidth(overlayId: integer, sdfWidth: number)`
- `setOverlayUVs(overlayId: integer, u0: number, v0: number, u1: number, v1: number, u2: number, v2: number, u3: number, v3: number)`

## Particle System

- `addParticleSystemSimulationTime(particleSystemId: integer, dt: number)`
- `getEmitCountScale(particleSystemId: integer)` → `number`
- `getEmitStartTime(particleSystemId: integer)` → `number`
- `getEmitStopTime(particleSystemId: integer)` → `number`
- `getEmitterShape(particleSystemId: integer)` → `integer`
- `getEmitterShapeVelocityScale(particleSystemId: integer)` → `number`
- `getMaxNumOfParticles(particleSystemId: integer)` → `integer`
- `getNumOfParticlesToEmitPerMs(particleSystemId: integer)` → `number`
- `getParticleSystemAverageSpeed(particleSystemId: integer)` → `number, number`
- `getParticleSystemDamping(particleSystemEntityId: integer)` → `number`
- `getParticleSystemLifespan(particleSystemId: integer)` → `number`
- `getParticleSystemNormalSpeed(particleSystemEntityId: integer)` → `number`
- `getParticleSystemSpeed(particleSystemId: integer)` → `number`
- `getParticleSystemSpeedRandom(particleSystemEntityId: integer)` → `number`
- `getParticleSystemSpriteScaleX(particleSystemEntityId: integer)` → `number`
- `getParticleSystemSpriteScaleXGain(particleSystemEntityId: integer)` → `number`
- `getParticleSystemSpriteScaleY(particleSystemEntityId: integer)` → `number`
- `getParticleSystemSpriteScaleYGain(particleSystemEntityId: integer)` → `number`
- `getParticleSystemTangentSpeed(particleSystemEntityId: integer)` → `number`
- `resetEmitStartTimer(particleSystemId: integer, time: number?)`
- `resetEmitStopTimer(particleSystemId: integer, time: number?)`
- `resetNumOfEmittedParticles(particleSystemId: integer)`
- `setEmitCountScale(particleSystemId: integer, countScale: number)`
- `setEmitStartTime(particleSystemId: integer, emitStartTime: number)`
- `setEmitStopTime(particleSystemId: integer, emitStopTime: number)`
- `setEmitterShape(particleSystemId: integer, shapeId: integer)`
- `setEmitterShapeVelocityScale(particleSystemId: integer, shape: number)`
- `setEmittingState(particleSystemId: integer, state: boolean)`
- `setMaxNumOfParticles(particleSystemId: integer, maxNumParticles: integer)`
- `setNumOfParticlesToEmitPerMs(particleSystemId: integer, emittedParticlesPerMs: number)`
- `setParticleShape(particleSystemId: integer, nodeId: integer)`
- `setParticleSystemDamping(particleSystemEntityId: integer, damping: number)`
- `setParticleSystemLifespan(particleSystemId: integer, lifeSpan: number, keepBlendTimes: boolean)`
- `setParticleSystemNormalSpeed(particleSystemEntityId: integer, normalSpeed: number)`
- `setParticleSystemSpeed(particleSystemId: integer, speed: number)`
- `setParticleSystemSpeedRandom(particleSystemEntityId: integer, speedRandom: number)`
- `setParticleSystemSpriteScaleX(particleSystemEntityId: integer, spriteScaleX: number)`
- `setParticleSystemSpriteScaleXGain(particleSystemEntityId: integer, spriteScaleXGain: number)`
- `setParticleSystemSpriteScaleY(particleSystemEntityId: integer, spriteScaleY: number)`
- `setParticleSystemSpriteScaleYGain(particleSystemEntityId: integer, spriteScaleYGain: number)`
- `setParticleSystemTangentSpeed(particleSystemEntityId: integer, tangentSpeed: number)`
- `setParticleSystemTimeScale(particleSystemId: integer, timeScale: number)`

## Physics

- `addDifferential(objectId: integer, diff0Index: integer, diffIndex0IsWheel: boolean, diff1Index: integer, diffIndex1IsWheel: boolean, ratio: number, bias: number)`
- `addForce(transformId: integer, forceX: number, forceY: number, forceZ: number, positionX: number, positionY: number, positionZ: number, isPositionLocal: boolean)`
- `addForceVector(transformId: integer, force: vector, position: vector, isPositionLocal: boolean)`
- `addImpulse(transformId: integer, impulseX: number, impulseY: number, impulseZ: number, positionX: number, positionY: number, positionZ: number, isPositionLocal: boolean)`
- `addImpulseVector(transformId: integer, impulse: vector, position: vector, isPositionLocal: boolean)`
- `addToPhysics(transformId: integer)`
- `addTorque(objectId: integer, x: number, y: number, z: number)`
- `addTorqueImpulse(objectId: integer, x: number, y: number, z: number)`
- `addTorqueImpulseVector(transformId: integer, torque: vector)`
- `addTorqueVector(transformId: integer, torque: vector)`
- `addTrigger(triggerNodeId: integer, callbackFunctionName: string, callbackTarget: object?, reportOnStay: boolean?, callbackFunction: object?)` → `integer`
- `addVehicleLink(transformId: integer, transformId2: integer)`
- `computeWheelShapeTireForces(transformId: integer, wheelShapeIndex: integer, longSlipRatio: number, latSlipAngle: number, tireLoad: number)` → `number, number`
- `createCCT(transformId: integer, radius: number, height: number, stepOffset: number, slopeLimit: number, skinWidth: number, collisionGroup: integer, collisionMask: integer, mass: number)` → `integer`
- `createWheelShape(transformId: integer, positionX: number, positionY: number, positionZ: number, radius: number, suspensionTravel: number, spring: number, damperCompressionLowSpeed: number, damperCompressionHighSpeed: number, damperCompressionLowSpeedThreshold: number, damperRelaxationLowSpeed: number, damperRelaxationHighSpeed: number, damperRelaxationLowSpeedThreshold: number, mass: number, collisionGroup: integer, collisionMask: integer, wheelShapeIndex: integer)` → `integer`
- `createWheelShapeVector(transformId: integer, position: vector, radius: number, suspensionTravel: number, spring: number, damperCompressionLowSpeed: number, damperCompressionHighSpeed: number, damperCompressionLowSpeedThreshold: number, damperRelaxationLowSpeed: number, damperRelaxationHighSpeed: number, damperRelaxationLowSpeedThreshold: number, mass: number, collisionGroup: integer, collisionMask: integer, wheelShapeIndex: integer)` → `integer`
- `getAngularDamping(transformId: integer)` → `number`
- `getAngularVelocity(transformId: integer)` → `number, number, number`
- `getAngularVelocityVector(transformId: integer)` → `vector`
- `getCCTCollisionFlags(characterIndex: integer)` → `boolean, boolean, boolean`
- `getCCTHeight(characterIndex: integer)` → `number`
- `getCenterOfMass(transformId: integer)` → `number, number, number`
- `getCenterOfMassVector(transformId: integer)` → `vector`
- `getCollisionFilter(transformId: integer)` → `integer, integer`
- `getCollisionFilterGroup(transformId: integer)` → `integer`
- `getCollisionFilterMask(transformId: integer)` → `integer`
- `getDensity(transformId: integer)` → `number`
- `getHasCollision(transformId: integer)` → `boolean`
- `getHasTrigger(shapeId: integer)` → `boolean`
- `getIsAddedToPhysics(transformId: integer)` → `boolean`
- `getIsCompound(transformId: integer)` → `boolean`
- `getIsCompoundChild(transformId: integer)` → `boolean`
- `getLinearDamping(transformId: integer)` → `number`
- `getLinearVelocity(transformId: integer)` → `number, number, number`
- `getLinearVelocityVector(transformId: integer)` → `vector`
- `getLocalLinearVelocity(transformId: integer)` → `number, number, number`
- `getLocalLinearVelocityVector(transformId: integer)` → `vector`
- `getMass(transformId: integer)` → `number`
- `getMotorRotationSpeed(transformId: integer)` → `number, number, number`
- `getMotorTorque(transformId: integer)` → `number, number, number`
- `getNumOfTriggers()` → `integer`
- `getRigidBodyAABB(transformId: integer)` → `number, number, number, number, number, number`
- `getRigidBodyAABBVector(transformId: integer)` → `vector, vector`
- `getRigidBodyType(transformId: integer)` → `integer`
- `getVelocityAtLocalPos(transformId: integer, positionX: number, positionY: number, positionZ: number)` → `number, number, number`
- `getVelocityAtLocalPosVector(transformId: integer, position: vector)` → `vector`
- `getVelocityAtWorldPos(transformId: integer, positionX: number, positionY: number, positionZ: number)` → `number, number, number`
- `getVelocityAtWorldPosVector(transformId: integer, position: vector)` → `vector`
- `getVolume(transformId: integer)` → `number`
- `getWheelShapeAxleSpeed(transformId: integer, wheelShapeIndex: integer)` → `number`
- `getWheelShapeContactForce(transformId: integer, wheelShapeIndex: integer)` → `number`
- `getWheelShapeContactNormal(transformId: integer, wheelShapeIndex: integer)` → `number, number, number`
- `getWheelShapeContactNormalVector(transformId: integer, wheelShapeIndex: integer)` → `vector`
- `getWheelShapeContactObject(transformId: integer, wheelShapeIndex: integer)` → `integer, integer`
- `getWheelShapeContactPoint(transformId: integer, wheelShapeIndex: integer)` → `number, number, number, number`
- `getWheelShapeContactPointVector(transformId: integer, wheelShapeIndex: integer)` → `vector, number`
- `getWheelShapePosition(transformId: integer, wheelShapeIndex: integer)` → `number, number, number, number, number`
- `getWheelShapePositionVector(transformId: integer, wheelShapeIndex: integer)` → `vector, number, number`
- `getWheelShapeSlip(transformId: integer, wheelShapeIndex: integer)` → `number, number`
- `JointConstructor:setActors(actor1Id: integer, actor2Id: integer)`
- `JointConstructor:setJointTransforms(jointNode1: integer, jointNode2: integer)`
- `moveCCT(characterIndex: integer, x: number, y: number, z: number, collisionGroup: integer, collisionMask: integer)`
- `overlapBox(x: number, y: number, z: number, rx: number, ry: number, rz: number, ex: number, ey: number, ez: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapBoxAsync(x: number, y: number, z: number, rx: number, ry: number, rz: number, ex: number, ey: number, ez: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapBoxAsyncVector(center: vector, rotation: vector, halfExtents: vector, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapBoxVector(center: vector, rotation: vector, halfExtents: vector, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapConvex(shapeId: integer, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapConvexAsync(shapeId: integer, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapConvexPolyhedron(shapeVertexPositions: floatArray, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapConvexPolyhedronAsync(shapeVertexPositions: floatArray, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapCylinder(x: number, y: number, z: number, radius: number, height: number, axis: integer, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapCylinderAsync(x: number, y: number, z: number, radius: number, height: number, axis: integer, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapCylinderAsyncVector(center: vector, radius: number, height: number, axis: integer, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapCylinderVector(center: vector, radius: number, height: number, axis: integer, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapSphere(x: number, y: number, z: number, radius: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `overlapSphereAsync(x: number, y: number, z: number, radius: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapSphereAsyncVector(center: vector, radius: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)`
- `overlapSphereVector(center: vector, radius: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?, exactTest: boolean?)` → `integer`
- `raycastAll(x: number, y: number, z: number, nx: number, ny: number, nz: number, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)` → `integer`
- `raycastAllAsync(x: number, y: number, z: number, nx: number, ny: number, nz: number, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)`
- `raycastAllAsyncVector(origin: vector, direction: vector, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)`
- `raycastAllVector(origin: vector, direction: vector, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)` → `integer`
- `raycastClosest(x: number, y: number, z: number, nx: number, ny: number, nz: number, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)` → `integer`
- `raycastClosestAsync(x: number, y: number, z: number, nx: number, ny: number, nz: number, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)`
- `raycastClosestAsyncVector(origin: vector, direction: vector, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)`
- `raycastClosestVector(origin: vector, direction: vector, maxDistance: number, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?)` → `integer`
- `removeAllDifferentials(transformId: integer)`
- `removeAllTriggers(triggerNodeId: integer)`
- `removeCCT(characterIndex: integer)`
- `removeFromPhysics(transformId: integer)`
- `removeTrigger(triggerNodeId: integer, callbackId: integer?)`
- `setAngularDamping(transformId: integer, angularDamping: number)`
- `setAngularVelocity(transformId: integer, velocityX: number, velocityY: number, velocityZ: number)`
- `setAngularVelocityVector(transformId: integer, velocity: vector)`
- `setCCTHeight(characterIndex: integer, height: number, collisionGroup: integer, collisionMask: integer)`
- `setCenterOfMass(transformId: integer, x: number, y: number, z: number)`
- `setCenterOfMassVector(transformId: integer, centerOfMass: vector)`
- `setCollisionFilter(transformId: integer, group: integer, mask: integer)`
- `setCollisionFilterGroup(transformId: integer, group: integer)`
- `setCollisionFilterMask(transformId: integer, mask: integer)`
- `setFrictionVelocity(objectId: integer, velocity: number)`
- `setHasCollision(transformId: integer, hasCollision: boolean)`
- `setInertiaScale(transformId: integer, x: number, y: number, z: number)`
- `setInertiaScaleVector(transformId: integer, centerOfMass: vector)`
- `setIsCompound(transformId: integer, isCompound: boolean)`
- `setIsCompoundChild(transformId: integer, isCompoundChild: boolean)`
- `setJointAngularDrive(jointIndex: integer, axis: integer, usePosition: boolean, useVelocity: boolean, spring: number, damping: number, forceLimit: number, targetRotation: number, targetAngularVelocity: number)`
- `setJointDrive(jointIndex: integer, isLinear: boolean, isPosition: boolean, valueX: number, valueY: number, valueZ: number, angle: number)`
- `setJointLinearDrive(jointIndex: integer, axis: integer, usePosition: boolean, useVelocity: boolean, spring: number, damping: number, forceLimit: number, targetPosition: number, targetVelocity: number)`
- `setLinearDamping(transformId: integer, linearDamping: number)`
- `setLinearVelocity(transformId: integer, velocityX: number, velocityY: number, velocityZ: number)`
- `setLinearVelocityVector(transformId: integer, velocity: vector)`
- `setMass(transformId: integer, mass: number)`
- `setRigidBodyType(transformId: integer, type: integer)`
- `setSolverIterationCount(transformId: integer, count: integer)`
- `setTriggerReportStatics(triggerNodeId: integer, reportStatics: boolean)`
- `setWheelShapeDirection(transformId: integer, wheelShapeIndex: integer, dirX: number, dirY: number, dirZ: number, axleX: number, axleY: number, axleZ: number)`
- `setWheelShapeDirectionVector(transformId: integer, wheelShapeIndex: integer, dir: vector, axle: vector)`
- `setWheelShapeForcePoint(transformId: integer, wheelShapeIndex: integer, positionX: number, positionY: number, positionZ: number)`
- `setWheelShapeForcePointVector(transformId: integer, wheelShapeIndex: integer, position: vector)`
- `setWheelShapeProps(transformId: integer, wheelShapeIndex: integer, motorTorque: number, brakeTorque: number, steerAngle: number, rotationDamping: number)`
- `setWheelShapeSteeringCenter(transformId: integer, wheelShapeIndex: integer, positionX: number, positionY: number, positionZ: number)`
- `setWheelShapeSteeringCenterVector(transformId: integer, wheelShapeIndex: integer, position: vector)`
- `setWheelShapeTireFriction(transformId: integer, wheelShapeIndex: integer, maxLongStiffness: number, maxLatStiffness: number, maxLatStiffnessTireLoad: number, frictionMultiplier: number)`
- `simulatePhysics(state: boolean)`
- `simulatePhysicsTimeScale(scale: number)`
- `sweepBoxAsyncVector(center: vector, rotation: vector, halfExtents: vector, direction: vector, maxDistance: number, callbackFunction: object?, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, closestShapeOnly: boolean?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?)`
- `sweepBoxVector(center: vector, rotation: vector, halfExtents: vector, direction: vector, maxDistance: number, callbackFunction: object?, callbackFunctionName: string, callbackTargetObject: object?, collisionMask: integer?, closestShapeOnly: boolean?, includeDynamics: boolean?, includeKinematics: boolean?, includeStatics: boolean?)` → `integer`
- `updateDifferential(transformId: integer, index: integer, ratio: number, bias: number)`

## PointList2D

- `PointList2D:add(index: integer, x: number, z: number)`
- `PointList2D:get(index: integer)` → `number, number`
- `PointList2D:getAreBoundariesColliding(pointList2: PointList2D)` → `boolean`
- `PointList2D:getClosestPositionAndDirectionOnBoundary(x: number, z: number)` → `number, number, number, number`
- `PointList2D:getClosestPositionOnBoundary(x: number, z: number)` → `number, number`
- `PointList2D:getDistanceToBoundary(x: number, z: number)` → `number`
- `PointList2D:getIsPointInsideBoundary(x: number, z: number)` → `boolean`
- `PointList2D:getIsSegmentInsideBoundary(l1x: number, l1z: number, l2x: number, l2z: number)` → `boolean`
- `PointList2D:getNumPoints()` → `integer`
- `PointList2D:getSegmentBoundaryIntersection(l1x: number, l1z: number, l2x: number, l2z: number)` → `boolean, number, number`
- `PointList2D:getSegmentClosestBoundaryIntersection(l1x: number, l1z: number, l2x: number, l2z: number)` → `boolean, number, number, integer`
- `PointList2D:getSegmentNumBoundaryIntersections(l1x: number, l1z: number, l2x: number, l2z: number)` → `integer`
- `PointList2D:length()` → `number`
- `PointList2D:set(index: integer, x: number, z: number)`

## Precipitation

- `setRainActiveDropsMultiplier(precipitationEntity: integer, rain: number)`
- `setRainAmountMultiplier(multiplier: number)`
- `setRainBounceRandomFactor(precipitationEntity: integer, randomfactor: number)`
- `setRainBounceRestitution(precipitationEntity: integer, restitution: number)`
- `setRainCameraVelocityMultiplier(precipitationEntity: integer, multiplier: number)`
- `setRainHeightmapCollisionThreshold(precipitationEntity: integer, tolerance: number)`
- `setRainMaxBounces(precipitationEntity: integer, bounces: integer)`
- `setRainMaxDropsMultiplier(precipitationEntity: integer, max: number)`
- `setRainShallowWaterSimulation(precipitationGeometry: integer, shallowWaterSim: integer)`
- `setRainSpawnBoxParameters(precipitationEntity: integer, spawnHeight: number, boxWidth: number, boxDepth: number)`
- `setRainSpawnVelocity(precipitationEntity: integer, velocityX: number, velocityY: number, velocityZ: number)`
- `setRainTurbulenceParameters(precipitationEntity: integer, turbulence: number, timeScale: number, pulsePeriod: number, frequency: number)`
- `setRainWeatherType(precipitationGeometry: integer, weatherType: integer)`
- `setRainWindForce(precipitationEntity: integer, forceX: number, forceZ: number)`

## Rendering

- `getIsTextureEntityReady(textureEntity: integer)` → `boolean`
- `getMaterialAlbedoColor(materialId: integer)` → `boolean, number, number, number, number`
- `getMaterialCustomMapFilename(materialId: integer, customMapName: string)` → `string`
- `getMaterialCustomMapIsSRGB(materialId: integer, customMapName: string)` → `boolean`
- `getMaterialCustomParameter(materialId: integer, name: string)` → `number, number, number, number`
- `getMaterialCustomShaderFilename(materialId: integer)` → `string`
- `getMaterialCustomShaderVariation(materialId: integer)` → `string`
- `getMaterialDiffuseMapFilename(materialId: integer)` → `string`
- `getMaterialDiffuseMapHasAlpha(materialId: integer)` → `boolean`
- `getMaterialEmissiveMapFilename(materialId: integer)` → `string`
- `getMaterialEmissiveMapHasAlpha(materialId: integer)` → `boolean`
- `getMaterialGlossMapFilename(materialId: integer)` → `string`
- `getMaterialHasRefractionMap(materialId: integer)` → `boolean`
- `getMaterialIsAlphaBlended(materialId: integer)` → `boolean`
- `getMaterialIsAlphaTested(materialId: integer)` → `boolean`
- `getMaterialMetalness(materialId: integer)` → `boolean, number`
- `getMaterialNormalMapFilename(materialId: integer)` → `string`
- `getMaterialNormalMapFormat(materialId: integer)` → `integer`
- `getMaterialReflectionMapScaling(materialId: integer)` → `number`
- `getMaterialSmoothness(materialId: integer)` → `boolean, number`
- `getRainAmountMultiplier()` → `number`
- `getWetness()` → `number`
- `MaterialCalibrationSolver:getCurrentSRGB(angle: integer)` → `floatArray, number`
- `MaterialCalibrationSolver:getTargetSRGB(angle: integer)` → `floatArray`
- `MaterialCalibrationSolver:isDone()` → `boolean`
- `MaterialCalibrationSolver:iterate()` → `integer, integer`
- `MaterialCalibrationSolver:prepare()`
- `MaterialCalibrationSolver:reset()`
- `MaterialCalibrationSolver:setChannels(channelR: boolean, channelG: boolean, channelB: boolean, channelSmoothness: boolean, channelMetalness: boolean)`
- `MaterialCalibrationSolver:setCustomParameterChannels(parameterName: string, channelR: boolean, channelG: boolean, channelB: boolean, channelA: boolean)`
- `MaterialCalibrationSolver:setCustomParameterChannelValueRange(parameterName: string, channelIndex: integer, minValue: number, maxValue: number)`
- `MaterialCalibrationSolver:setShape(shapeId: integer)`
- `MaterialCalibrationSolver:setValueRangeChannelB(minValue: number, maxValue: number)`
- `MaterialCalibrationSolver:setValueRangeChannelG(minValue: number, maxValue: number)`
- `MaterialCalibrationSolver:setValueRangeChannelMetalness(minValue: number, maxValue: number)`
- `MaterialCalibrationSolver:setValueRangeChannelR(minValue: number, maxValue: number)`
- `MaterialCalibrationSolver:setValueRangeChannelSmoothness(minValue: number, maxValue: number)`
- `setFastShadowUpdate(cameraId: integer, fastUpdate: boolean)`
- `setMaterialCustomMapFromFile(materialId: integer, name: string, filename: string, textueWrap: boolean?, isSRGB: boolean?, sharedEdit: boolean?)` → `integer`
- `setMaterialCustomParameter(materialId: integer, name: string, x: number, y: number, z: number, w: number, sharedEdit: boolean?)` → `integer`
- `setMaterialCustomShaderVariation(materialId: integer, shaderVariationName: string, sharedEdit: boolean)` → `integer`
- `setMaterialDiffuseMapFromFile(materialId: integer, filename: string, textueWrap: boolean, isSRGB: boolean, sharedEdit: boolean)` → `integer`
- `setMaterialDynamicArrayOfTextureSize(materialId: integer, name: string, size: integer, sharedEdit: boolean?)` → `integer`
- `setMaterialGlossMapFromFile(materialId: integer, filename: string, textueWrap: boolean, isSRGB: boolean, sharedEdit: boolean)` → `integer`
- `setMaterialNormalMapFromFile(materialId: integer, filename: string, textueWrap: boolean, isSRGB: boolean, sharedEdit: boolean)` → `integer`
- `setShadowFocusBox(shapeId: integer)`
- `setWetness(wetness: number)`

## ShallowWaterSimulation

- `createShallowWaterSimulation(name: string, gridWidth: integer, gridHeight: integer, physicalWidth: number, physicalHeight: number, useHeightDisplacement: boolean?)` → `integer`
- `getShallowWaterSimulationFakeExtraDepth(shallowWaterSimulation: integer)` → `number`
- `getShallowWaterSimulationFoamAccumulationRate(shallowWaterSimulation: integer)` → `number`
- `getShallowWaterSimulationFoamDecayRate(shallowWaterSimulation: integer)` → `number`
- `getShallowWaterSimulationOutputTexture(shallowWaterSimulation: integer)` → `integer`
- `getShallowWaterSimulationOutputVelocityUTexture(shallowWaterSimulation: integer)` → `integer`
- `getShallowWaterSimulationOutputVelocityVTexture(shallowWaterSimulation: integer)` → `integer`
- `setShallowWaterSimulationFakeExtraDepth(shallowWaterSimulation: integer, height: number)`
- `setShallowWaterSimulationFoamAccumulationRate(shallowWaterSimulation: integer, foam: number)`
- `setShallowWaterSimulationFoamDecayRate(shallowWaterSimulation: integer, foam: number)`
- `setShallowWaterSimulationGroundHeightTexture(shallowWaterSimulation: integer, textureId: integer)`
- `setShallowWaterSimulationGroundHeightTextureFromTerrain(shallowWaterSimulation: integer, terrainTransformGroup: integer)`
- `setShallowWaterSimulationParameters(shallowWaterSimulation: integer, deltaTime: number, externalAcceleration: number, velocityDampening: number)`
- `setShallowWaterSimulationPerfectlyMatchedLayerParameters(shallowWaterSimulation: integer, dampeningFactor: number, lambdaUpdateFactor: number, lambdaDecay: number, borderSize: integer, isCubicScaling: boolean, leftBorder: boolean, rightBorder: boolean, bottomBorder: boolean, topBorder: boolean)`
- `setShallowWaterSimulationPhysicalGridSize(shallowWaterSimulation: integer, width: number, height: number)`
- `setShallowWaterSimulationWorldPosition(shallowWaterSimulation: integer, x: number, z: number)` → `number, number`
- `shallowWaterSimulationAddWaterPlaneGeometry(shallowWaterSimulation: integer, waterGeometry: integer)`
- `shallowWaterSimulationPaintCustomObstacle(shallowWaterSimulation: integer, obstacleIndex: integer, x: number, z: number, width: number, height: number, angle: number, velocityX: number, velocityY: number, yPosition: number)`
- `shallowWaterSimulationPaintCustomObstacleEllipse(shallowWaterSimulation: integer, obstacleIndex: integer, x: number, z: number, width: number, height: number, angle: number, velocityX: number, velocityZ: number, yPosition: number)`
- `shallowWaterSimulationPaintDepthCircle(shallowWaterSimulation: integer, x: number, y: number, radius: number, value: number, paintHeight: number?)`
- `shallowWaterSimulationPaintDepthRect(shallowWaterSimulation: integer, x: number, y: number, width: number, height: number, value: number, paintHeight: number?)`
- `shallowWaterSimulationPaintDepthSource(shallowWaterSimulation: integer, sourceIndex: integer, x: number, y: number, width: number, height: number, angle: number, depth: number)`
- `shallowWaterSimulationPaintVelocityCircle(shallowWaterSimulation: integer, x: number, y: number, radius: number, velocityX: number, velocityY: number, paintHeight: number?)`
- `shallowWaterSimulationPaintVelocityRect(shallowWaterSimulation: integer, x: number, y: number, width: number, height: number, velocityX: number, velocityY: number, paintHeight: number?)`
- `shallowWaterSimulationRemoveWaterPlaneGeometry(shallowWaterSimulation: integer, waterGeometry: integer)`
- `shallowWaterSimulationResetSimulation(shallowWaterSimulation: integer)`
- `shallowWaterSimulationSetNumDepthSources(shallowWaterSimulation: integer, numDepthSource: integer)`
- `shallowWaterSimulationTranslateSimulation(shallowWaterSimulation: integer, x: integer, y: integer)`
- `updateShallowWaterSimulation(shallowWaterSimulation: integer, simulatedTime: number)`

## Shape

- `createPlaneShapeFrom2DContour(name: string, contour2DWorldPositions: floatArray, createRigidBody: boolean?)` → `integer`
- `getGeometry(shapeId: integer)` → `integer`
- `getHasShaderParameter(shapeId: integer, parameterName: string, materialIndex: integer?)` → `boolean`
- `getIsNonRenderable(shapeId: integer)` → `boolean`
- `getMaterial(shapeId: integer, materialIndex: integer)` → `integer`
- `getMaterialSlotName(shapeId: integer, materialIndex: integer)` → `string`
- `getNumOfMaterials(shapeId: integer)` → `integer`
- `getNumOfShaderParameters(shapeId: integer, materialIndex: integer?, variationIndex: integer?)` → `integer`
- `getNumOfShapeBones(shapeId: integer)` → `integer`
- `getShaderParameter(shapeId: integer, parameterName: string, materialIndex: integer?)` → `number, number, number, number`
- `getShaderParameterByIndex(shapeId: integer, parameterIndex: integer, materialIndex: integer?, variationIndex: integer?)` → `number, number, number, number`
- `getShaderParameterNameByIndex(shapeId: integer, parameterIndex: integer, materialIndex: integer?, variationIndex: integer?)` → `string`
- `getShapeBone(shapeId: integer, boneIndex: integer)` → `integer`
- `getShapeBoundingSphere(shapeId: integer)` → `number, number, number, number, boolean`
- `getShapeBuildNavMeshMask(shapeId: integer)` → `integer`
- `getShapeGeometryBoundingSphere(shapeId: integer)` → `number, number, number, number`
- `getShapeIsCPUMesh(shapeId: integer)` → `boolean`
- `getShapeIsSkinned(shapeId: integer)` → `boolean, boolean`
- `getShapeWorldBoundingSphere(shapeId: integer)` → `number, number, number, number`
- `getSplitType(shapeId: integer)` → `integer`
- `invalidateShapeBoundingVolume(shapeId: integer)`
- `setDecalCullingWorldProperties(gridMinX: number, gridMinZ: number, gridMaxX: number, gridMaxZ: number, gridSize: integer)`
- `setIsNonRenderable(shapeId: integer, isNonRenderable: boolean)`
- `setMaterial(shapeId: integer, material: integer, materialIndex: integer)`
- `setMaterialSlotName(shapeId: integer, materialIndex: integer, slotName: string)`
- `setReflectionMapScaling(shapeId: integer, scale: number, shared: boolean)`
- `setShaderParameter(shapeId: integer, parameterName: string, x: number?, y: number?, z: number?, w: number?, shared: boolean?, materialIndex: integer?)`
- `setShaderParameterRecursive(transformId: integer, parameterName: string, x: number?, y: number?, z: number?, w: number?, shared: boolean?, materialIndex: integer?)`
- `setShapeBones(shapeId: integer, newRootBoneId: integer, oldRootBoneId: integer, keepBindPoses: boolean?)` → `boolean`
- `setShapeBonesFromShape(shapeId: integer, sourceShapeId: integer)` → `boolean`
- `setShapeBoundingSphere(shapeId: integer, localPosX: number, localPosY: number, localPosZ: number, radius: number)`
- `setShapeBuildNavMeshMask(shapeId: integer, mask: integer)`
- `setShapeCastShadowmap(shapeId: integer, castShadowmap: boolean)`
- `setShapeCullingWorldProperties(gridMinX: number, gridMinY: number, gridMinZ: number, gridMaxX: number, gridMaxY: number, gridMaxZ: number, gridSize: integer, clipDistanceThreshold1: number, clipDistanceThreshold2: number)`
- `setShapeDecalLayer(shapeId: integer, decalLayer: integer)`
- `setShapeGeometryBoundingSphere(shapeId: integer, localPosX: number, localPosY: number, localPosZ: number, radius: number)`
- `setShapeReceiveShadowmap(shapeId: integer, receiveShadowmap: boolean)`

## Sound

- `addAudioSourceSampleElement(audioSource: integer, filename: string, probability: number)`
- `createAudioSource(audioSourceName: string, sampleFilename: string, radius: number, innerRadius: number, volume: number, loops: integer)` → `integer`
- `createLoopSynthesisSample(objectName: string)` → `integer`
- `createSample(objectName: string)` → `integer`
- `createStreamedSample(objectName: string, isBackgroundMusic: boolean)` → `integer`
- `getAudioSourceAutoPlay(audioSource: integer)` → `boolean`
- `getAudioSourceInnerRange(audioSource: integer)` → `number`
- `getAudioSourceMaxRetriggerDelay(audioSource: integer)` → `number`
- `getAudioSourceMinRetriggerDelay(audioSource: integer)` → `number`
- `getAudioSourcePriority(audioSource: integer)` → `integer`
- `getAudioSourceRandomPlayback(audioSource: integer)` → `boolean`
- `getAudioSourceRange(audioSource: integer)` → `number`
- `getAudioSourceSample(audioSource: integer)` → `integer`
- `getAudioSourceSampleElementProbability(audioSource: integer, index: integer)` → `number`
- `getAudioSourceTickInaudible(audioSource: integer)` → `boolean`
- `getCurrentMasterVolume()` → `number`
- `getInactiveWindowAudioVolume()` → `number`
- `getMasterVolume()` → `number`
- `getNumOfAudioSourceSampleElements(audioSource: integer)` → `integer`
- `getSampleDuration(sampleId: integer)` → `number`
- `getSampleLoopSynthesisLoadFactor(sampleId: integer)` → `number`
- `getSampleLoopSynthesisMaxRPM(sampleId: integer)` → `number`
- `getSampleLoopSynthesisMinRPM(sampleId: integer)` → `number`
- `getSampleLoopSynthesisRPM(sampleId: integer, useNormalizedValue: boolean)` → `number`
- `getSampleLoopSynthesisStartDuration(sampleId: integer)` → `number`
- `getSampleLoopSynthesisStopDuration(sampleId: integer)` → `number`
- `getSampleLoopSynthesisTargetLoadFactor(sampleId: integer)` → `number`
- `getSampleLoopSynthesisTargetRPM(sampleId: integer, useNormalizedValue: boolean)` → `number`
- `getSamplePitch(sampleId: integer)` → `number`
- `getSamplePlayOffset(sampleId: integer)` → `number`
- `getSamplePlayTimeLeft(sampleId: integer)` → `number`
- `getSampleVelocity(sampleId: integer)` → `number, number, number`
- `getSampleVolume(sampleId: integer)` → `number`
- `getStreamedSampleVolume(streamedSampleId: integer)` → `number`
- `isSamplePlaying(sampleId: integer)` → `boolean`
- `loadSample(sampleId: integer, sampleFilename: string, is3DSound: boolean)` → `boolean`
- `loadStreamedSample(streamedSampleId: integer, sampleFilename: string)` → `boolean`
- `pauseStreamedSample(streamedSampleId: integer)`
- `playSample(sampleId: integer, loops: integer, volume: number, offset: number, delay: number, playAfterSample: integer)`
- `playStreamedSample(streamedSampleId: integer, repeatCount: integer)`
- `removeAudioSourceSampleElement(audioSource: integer, sampleElementIndex: integer)`
- `resumeStreamedSample(streamedSampleId: integer)`
- `setAudioCullingWorldProperties(gridMinX: number, gridMinY: number, gridMinZ: number, gridMaxX: number, gridMaxY: number, gridMaxZ: number, gridSize: integer, clipDistanceThreshold1: number, clipDistanceThreshold2: number)`
- `setAudioSourceAutoPlay(audioSource: integer, autoPlayEnabled: boolean)`
- `setAudioSourceInnerRange(audioSource: integer, range: number)`
- `setAudioSourceMaxRetriggerDelay(audioSource: integer, maxRetriggerDelay: number)`
- `setAudioSourceMinRetriggerDelay(audioSource: integer, minRetriggerDelay: number)`
- `setAudioSourcePriority(audioSource: integer, priority: integer)`
- `setAudioSourceRandomPlayback(audioSource: integer, randomPlayback: boolean)`
- `setAudioSourceRange(audioSource: integer, range: number)`
- `setAudioSourceSampleElementProbability(audioSource: integer, index: integer, probability: number)`
- `setAudioSourceTickInaudible(audioSource: integer, tickIfInaudible: boolean)`
- `setSamplePitch(sampleId: integer, pitch: number)`
- `setSampleVelocity(sampleId: integer, x: number, y: number, z: number)`
- `setSampleVolume(sampleId: integer, volume: number)`
- `setStreamedSampleGroup(streamedSampleId: integer, group: integer)`
- `setStreamedSampleVolume(streamedSampleId: integer, volume: number)`
- `stopSample(sampleId: integer, delay: number, fadeTime: number)`
- `stopStreamedSample(streamedSampleId: integer)`

## Spline

- `addSplineAttribute(shapeId: integer, attributeName: string)` → `integer`
- `createSplineFromEditPoints(parentId: integer, editPoints: floatArray, makeLinearSpline: boolean?, isClosed: boolean?)` → `integer`
- `getClosestSplinePosition(shapeId: integer, worldX: number, worldY: number, worldZ: number, eps: number)` → `number, number, number, number`
- `getClosestSplinePositionVector(shapeId: integer, world: vector, eps: number)` → `vector, number`
- `getIsSplineClosed(shapeId: integer)` → `boolean`
- `getLocalClosestSplinePosition(shapeId: integer, time: number, timeRange: number, worldX: number, worldY: number, worldZ: number, eps: number)` → `number, number, number, number`
- `getLocalClosestSplinePositionVector(shapeId: integer, time: number, timeRange: number, world: vector, eps: number)` → `vector, number`
- `getNumSplineAttributes(shapeId: integer)` → `integer`
- `getSplineAttribute(shapeId: integer, attributeIndex: integer, t: number)` → `number`
- `getSplineAttributeAtCV(shapeId: integer, attributeIndex: integer, CVIndex: integer)` → `number`
- `getSplineAttributeIndex(shapeId: integer, attributeName: string)` → `integer`
- `getSplineAttributeName(shapeId: integer, attributeIndex: integer)` → `string`
- `getSplineCurvature(shapeId: integer, time: number)` → `number`
- `getSplineCV(shapeId: integer, index: integer)` → `number, number, number`
- `getSplineCVVector(shapeId: integer, index: integer)` → `vector`
- `getSplineDirection(shapeId: integer, time: number)` → `number, number, number`
- `getSplineDirectionVector(shapeId: integer, time: number)` → `vector`
- `getSplineEP(shapeId: integer, index: integer)` → `number, number, number`
- `getSplineEPVector(shapeId: integer, index: integer)` → `vector`
- `getSplineLength(shapeId: integer)` → `number`
- `getSplineNumOfCV(shapeId: integer)` → `integer`
- `getSplineOrientation(shapeId: integer, time: number, upDirX: number, upDirY: number, upDirZ: number)` → `number, number, number`
- `getSplineOrientationVector(shapeId: integer, time: number, upDir: vector)` → `vector`
- `getSplinePosition(shapeId: integer, time: number)` → `number, number, number`
- `getSplinePositionVector(shapeId: integer, time: number)` → `vector`
- `getSplinePositionWithDistance(shapeId: integer, time: number, distance: number, positiveTimeOffset: boolean, eps: number)` → `number, number, number, number`
- `getSplinePositionWithDistanceVector(shapeId: integer, time: number, distance: number, positiveTimeOffset: boolean, eps: number)` → `vector, number`
- `getTimeAtSplineCV(shapeId: integer, index: integer)` → `number`
- `removeSplineAttribute(shapeId: integer, attributeIndex: integer)`
- `setSplineAttributeAtCV(shapeId: integer, attributeIndex: integer, CVIndex: integer, value: number)`
- `setSplineCV(shapeId: integer, index: integer, x: number, y: number, z: number)`
- `setSplineCVVector(shapeId: integer, index: integer, position: vector)`
- `setSplineEP(shapeId: integer, index: integer, x: number, y: number, z: number)`
- `setSplineEPVector(shapeId: integer, index: integer, position: vector)`

## String

- `asciiToUtf8(asciiString: string)` → `string`
- `unicodeToUtf8(unicode: integer)` → `string`
- `utf8Compare(utf8string1: string, utf8string2: string, languageId: integer?)` → `integer`
- `utf8Strlen(utf8string: string)` → `integer`
- `utf8Substr(utf8string: string, startIndex: integer, length: integer?)` → `string`
- `utf8ToLower(utf8string: string)` → `string`
- `utf8ToUnicode(utf8string: string)` → `integer, integer`
- `utf8ToUpper(utf8string: string)` → `string`

## Terrain

- `getTerrainAttributesAtWorldPos(terrainId: integer, x: number, y: number, z: number, xComb: boolean, yComb: boolean, zComb: boolean, wComb: boolean, uComb: boolean)` → `number, number, number, number, number`
- `getTerrainHeightAtWorldPos(terrainId: integer, x: number, y: number, z: number)` → `number`
- `getTerrainHeightmapUnitSize(terrainId: integer)` → `number`
- `getTerrainHeightSyncerCellIndicesAtWorldPosition(terrainId: integer, worldX: number, worldZ: number)` → `integer, integer, boolean`
- `getTerrainNormalAtWorldPos(terrainId: integer, x: number, y: number, z: number)` → `number, number, number`
- `setEnableTerrainHeightSyncerCellChangedCallback(terrainId: integer, cellX: integer, cellZ: integer, enable: boolean?)`
- `setTerrainHeightAtWorldPos(terrainId: integer, x: number, y: number, z: number, height: number)`
- `setTerrainHeightSyncerCellChangedCallback(terrainId: integer, callbackFunctionName: string, numCellsPerSide: integer, target: object?)`

## Terrain Detail

- `addTerrainFillLayer(terrainId: integer, name: string, diffuseTexture: string, normalTexture: string, heightTexture: string, displacementTexture: string, layerUnitSize: number, displacementMaxHeight: number, blendContrast: number, noiseScale: number, fillBlendStart: number, porosityAtZeroRoughness: number, porosityAtFullRoughness: number, firmness: number, viscosity: number, firmnessWet: number)`
- `clearTerrainFillLayers(terrainId: integer)`
- `finalizeTerrainFillLayers(terrainId: integer)`
- `getDataPlaneAssociatedTransformGroup(dataPlaneId: integer)` → `integer`
- `getDensityAtWorldPos(dataPlaneId: integer, x: number, y: number, z: number)` → `integer`
- `getDensityHeightAtWorldPos(fillDataPlaneId: integer, x: number, y: number, z: number)` → `number, number`
- `getDensityMapSize(terrainDataPlane: integer)` → `integer`
- `getDensityMapSyncerCellIndicesAtWorldPosition(densityMapSyncerId: integer, densityMapId: integer, worldX: number, worldZ: number)` → `integer, integer, boolean`
- `getDensityNormalAtWorldPos(fillDataPlaneId: integer, x: number, y: number, z: number)` → `number, number, number`
- `getDensityStatesAtWorldPos(dataPlaneId: integer, x: number, y: number, z: number)` → `integer`
- `getDensityTypeIndexAtWorldPos(dataPlaneId: integer, x: number, y: number, z: number)` → `integer`
- `getFoliageTransformGroupIdByFoliageName(terrainId: integer, detailName: string)` → `integer`
- `getTerrainDataPlaneByName(terrainId: integer, detailName: string)` → `integer, integer`
- `getTerrainDetailByName(terrainId: integer, detailName: string)` → `integer`
- `getTerrainDetailName(dataPlaneId: integer)` → `string`
- `getTerrainDetailNumChannels(dataPlaneId: integer)` → `integer`
- `getTerrainDetailTypeIndex(dataPlaneId: integer)` → `integer`
- `getTerrainSize(terrainId: integer)` → `number`
- `setDensityMapSyncerCellChangedCallback(densityMapSyncerId: integer, densityMapId: integer, callbackFunctionName: string, target: object?)`
- `setEnableDensityMapSyncerCellChangedCallback(densityMapSyncer: integer, densityMapId: integer, cellX: integer, cellZ: integer, enable: boolean?)`
- `setTerrainFillVisualHeight(fillDataPlaneId: integer, fillType: integer, firstFillLevel: integer, firstMappedFillLevel: number, lastFillLevel: integer?, lastMappedFillLevel: number?)`

## Text Rendering

- `getCanRenderUnicode(unicode: integer)` → `boolean`
- `getText3DWidth(fontSize: number, utf8string: string)` → `number`
- `getTextHeight(fontSize: number, utf8string: string)` → `number, integer`
- `getTextLength(fontSize: number, utf8string: string, maxNumLines: integer)` → `integer`
- `getTextLineLength(fontSize: number, utf8string: string, maxWidth: number)` → `integer`
- `getTextWidth(fontSize: number, utf8string: string)` → `number`
- `renderText(x: number, y: number, fontSize: number, string: string)`
- `setTextAlignment(alignment: integer)`
- `setTextBold(isBold: boolean)`
- `setTextClipArea(clipMinX: number, clipMinY: number, clipMaxX: number, clipMaxY: number)`
- `setTextColor(r: number, g: number, b: number, a: number)`
- `setTextDepthTestEnabled(depthCheckEnabled: boolean)`
- `setTextFirstLineIndentation(indentation: number)`
- `setTextLineBounds(startLine: integer, numLines: integer)`
- `setTextLineHeightScale(lineHeightScale: number)`
- `setTextRotation(rotation: number, rotationCenterX: number?, rotationCenterY: number?)`
- `setTextVerticalAlignment(verticalAlignment: integer)`
- `setTextWidthScale(scaleWidth: number)`
- `setTextWrapWidth(wrapWidth: number, allowForcedWrap: boolean?)`

## Tire Track

- `addTrackPoint(tyreTrackSystem: integer, trackId: integer, x: number, y: number, z: number, ux: number, uy: number, uz: number, r: number, g: number, b: number, a: number, bumpiness: number, dTheta: number, terrainOnly: boolean, colorBlendWithTerrain: number)`
- `createTrack(tyreTrackSystem: integer, width: number, atlasIndex: integer)` → `integer`
- `createTyreTrackSystem(rootNode: integer, shape: integer, maxNumTracks: integer, maxNumSegments: integer, atlasSize: integer, terrainNode: integer)` → `integer`
- `cutTrack(tyreTrackSystem: integer, trackId: integer)`
- `destroyTrack(tyreTrackSystem: integer, trackId: integer)`
- `eraseParallelogram(tyreTrackSystem: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)`
- `erasePolygon(tyreTrackSystem: integer, vertexPositions: floatArray)`

## VoiceChat

- `voiceChatRemoveConnection(connectionId: integer)`

## XML

- `addXMLComment(xmlId: integer, xmlPath: string, comment: string)`
- `createXMLFile(objectName: string, filename: string, rootNodeName: string)` → `integer`
- `getXMLAttributeName(xmlId: integer, xmlElementPath: string, index: integer)` → `string`
- `getXMLBool(xmlId: integer, nodePath: string)` → `boolean`
- `getXMLElementName(xmlId: integer, nodePath: string)` → `string`
- `getXMLFilename(xmlId: integer)` → `string`
- `getXMLFloat(xmlId: integer, nodePath: string)` → `number`
- `getXMLInt(xmlId: integer, nodePath: string)` → `integer`
- `getXMLLineNum(xmlId: integer, nodePath: string)` → `integer`
- `getXMLNumOfAttributes(xmlId: integer, xmlElementPath: string)` → `integer`
- `getXMLNumOfChildren(xmlId: integer, xmlElementPath: string)` → `integer`
- `getXMLNumOfElements(xmlId: integer, xmlElementPath: string)` → `integer`
- `getXMLString(xmlId: integer, nodePath: string)` → `string`
- `getXMLUInt(xmlId: integer, nodePath: string)` → `integer`
- `hasXMLProperty(xmlId: integer, nodePath: string)` → `boolean, boolean`
- `loadXMLFile(objectName: string, filename: string)` → `integer`
- `loadXMLFileFromMemory(objectName: string, xmlString: string)` → `integer`
- `removeXMLProperty(xmlId: integer, xmlPath: string)` → `boolean`
- `saveXMLFile(xmlId: integer)` → `boolean`
- `saveXMLFileToMemory(xmlId: integer)` → `string`
- `setXMLBool(xmlId: integer, nodePath: string, value: boolean)`
- `setXMLFloat(xmlId: integer, nodePath: string, value: number)`
- `setXMLInt(xmlId: integer, nodePath: string, value: integer)`
- `setXMLString(xmlId: integer, nodePath: string, value: string)`
- `setXMLUInt(xmlId: integer, nodePath: string, value: integer)`
