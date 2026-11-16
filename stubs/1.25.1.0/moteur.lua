---@meta
-- FS25 1.25.1.0 : engine functions (signatures from scriptBinding.xml)

---@alias entityId integer
---@alias float number

---@param audioSource integer
---@param filename string
---@param probability number
function addAudioSourceSampleElement(audioSource, filename, probability) end

---@param objectId integer
---@param diff0Index integer
---@param diffIndex0IsWheel boolean
---@param diff1Index integer
---@param diffIndex1IsWheel boolean
---@param ratio number
---@param bias number
function addDifferential(objectId, diff0Index, diffIndex0IsWheel, diff1Index, diffIndex1IsWheel, ratio, bias) end

---@param terrainNode integer
---@param foliageDataPlaneId integer
---@param name string
---@param xmlFilename string
---@return integer densityMapTypeId
function addFoliageTypeFromXML(terrainNode, foliageDataPlaneId, name, xmlFilename) end

---@param transformId integer
---@param forceX number
---@param forceY number
---@param forceZ number
---@param positionX number
---@param positionY number
---@param positionZ number
---@param isPositionLocal boolean
function addForce(transformId, forceX, forceY, forceZ, positionX, positionY, positionZ, isPositionLocal) end

---@param transformId integer
---@param force vector
---@param position vector
---@param isPositionLocal boolean
function addForceVector(transformId, force, position, isPositionLocal) end

---@param transformId integer
---@param impulseX number
---@param impulseY number
---@param impulseZ number
---@param positionX number
---@param positionY number
---@param positionZ number
---@param isPositionLocal boolean
function addImpulse(transformId, impulseX, impulseY, impulseZ, positionX, positionY, positionZ, isPositionLocal) end

---@param transformId integer
---@param impulse vector
---@param position vector
---@param isPositionLocal boolean
function addImpulseVector(transformId, impulse, position, isPositionLocal) end

---@param lightId integer
---@param nodeId integer
function addLightShadowIgnoreShapes(lightId, nodeId) end

---@param lightId integer
---@param shapeId integer
function addMergedShadowIgnoreShapes(lightId, shapeId) end

---@param particleSystemId integer
---@param dt number
function addParticleSystemSimulationTime(particleSystemId, dt) end

---@param shapeId integer
---@param attributeName string
---@return integer attributeIndex
function addSplineAttribute(shapeId, attributeName) end

---@param terrainId integer
---@param name string
---@param diffuseTexture string
---@param normalTexture string
---@param heightTexture string
---@param displacementTexture string
---@param layerUnitSize number
---@param displacementMaxHeight number
---@param blendContrast number
---@param noiseScale number
---@param fillBlendStart number
---@param porosityAtZeroRoughness number
---@param porosityAtFullRoughness number
---@param firmness number
---@param viscosity number
---@param firmnessWet number
function addTerrainFillLayer(terrainId, name, diffuseTexture, normalTexture, heightTexture, displacementTexture, layerUnitSize, displacementMaxHeight, blendContrast, noiseScale, fillBlendStart, porosityAtZeroRoughness, porosityAtFullRoughness, firmness, viscosity, firmnessWet) end

---@param transformId integer
function addToPhysics(transformId) end

---@param objectId integer
---@param x number
---@param y number
---@param z number
function addTorque(objectId, x, y, z) end

---@param objectId integer
---@param x number
---@param y number
---@param z number
function addTorqueImpulse(objectId, x, y, z) end

---@param transformId integer
---@param torque vector
function addTorqueImpulseVector(transformId, torque) end

---@param transformId integer
---@param torque vector
function addTorqueVector(transformId, torque) end

---@param tyreTrackSystem integer
---@param trackId integer
---@param x number
---@param y number
---@param z number
---@param ux number
---@param uy number
---@param uz number
---@param r number
---@param g number
---@param b number
---@param a number
---@param bumpiness number
---@param dTheta number
---@param terrainOnly boolean
---@param colorBlendWithTerrain number
function addTrackPoint(tyreTrackSystem, trackId, x, y, z, ux, uy, uz, r, g, b, a, bumpiness, dTheta, terrainOnly, colorBlendWithTerrain) end

---@param triggerNodeId integer
---@param callbackFunctionName string
---@param callbackTarget object?
---@param reportOnStay boolean?
---@param callbackFunction object?
---@return integer callbackId
function addTrigger(triggerNodeId, callbackFunctionName, callbackTarget, reportOnStay, callbackFunction) end

---@param transformId integer
---@param transformId2 integer
function addVehicleLink(transformId, transformId2) end

---@param xmlId integer
---@param xmlPath string
---@param comment string
function addXMLComment(xmlId, xmlPath, comment) end

---@param cameraId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param dt number
---@param springStrength number
function aimCamera(cameraId, x, y, z, distance, dt, springStrength) end

---@param asciiString string
---@return string utf8string
function asciiToUtf8(asciiString) end

---@param characterSetId integer
---@param trackId integer
---@param clipIndex integer
function assignAnimTrackClip(characterSetId, trackId, clipIndex) end

---@param input string
---@return byteArray output
function base64Decode(input) end

---@param input byteArray
---@return string output
function base64Encode(input) end

---@param value1 integer
---@param value2 integer
---@return integer result
function bitAND(value1, value2) end

---@param input integer
---@return integer highestBit
function bitHighestSet(input) end

---@param input integer
---@return integer result
function bitNOT(input) end

---@param value1 integer
---@param value2 integer
---@return integer result
function bitOR(value1, value2) end

---@param value1 integer
---@param value2 integer
---@return integer result
function bitShiftLeft(value1, value2) end

---@param value1 integer
---@param value2 integer
---@return integer result
function bitShiftRight(value1, value2) end

---@param value1 integer
---@param value2 integer
---@return integer result
function bitXOR(value1, value2) end

---@param navMeshId integer
---@param worldNode integer
---@param cellSize number
---@param cellHeight number
---@param agentHeight number
---@param agentRadius number
---@param agentMaxClimb number
---@param agentMaxSlope number
---@param minRegionSize number
---@param mergeRegionSize number
---@param maxEdgeLength number
---@param maxSimplificationError number
---@param navMeshBuildMask integer
---@param terrainDetail integer
---@param terrainCullInfoLayer string
---@param terrainCullInfoLayerChannels integer
---@return boolean success
function buildNavMesh(navMeshId, worldNode, cellSize, cellHeight, agentHeight, agentRadius, agentMaxClimb, agentMaxSlope, minRegionSize, mergeRegionSize, maxEdgeLength, maxSimplificationError, navMeshBuildMask, terrainDetail, terrainCullInfoLayer, terrainCullInfoLayerChannels) end

---@param navMeshId integer
---@param contourWorldPositions floatArray
---@param terrainNodeId integer
---@param collisionMask integer
---@param cellSize number
---@param cellHeight number
---@param agentHeight number
---@param agentRadius number
---@param agentMaxClimb number
---@param agentMaxSlope number
---@param minRegionSize number
---@param mergeRegionSize number
---@param maxEdgeLength number
---@param maxSimplificationError number
---@return boolean success
function buildNavMeshFromContour(navMeshId, contourWorldPositions, terrainNodeId, collisionMask, cellSize, cellHeight, agentHeight, agentRadius, agentMaxClimb, agentMaxSlope, minRegionSize, mergeRegionSize, maxEdgeLength, maxSimplificationError) end

---@param navMeshId integer
---@param shapesNodeId integer
---@param shapesMask integer
---@param contourWorldPositions floatArray
---@param terrainNodeId integer
---@param collisionMask integer
---@param cellSize number
---@param cellHeight number
---@param agentHeight number
---@param agentRadius number
---@param agentMaxClimb number
---@param agentMaxSlope number
---@param minRegionSize number
---@param mergeRegionSize number
---@param maxEdgeLength number
---@param maxSimplificationError number
---@return boolean success
function buildNavMeshFromShapesAndContour(navMeshId, shapesNodeId, shapesMask, contourWorldPositions, terrainNodeId, collisionMask, cellSize, cellHeight, agentHeight, agentRadius, agentMaxClimb, agentMaxSlope, minRegionSize, mergeRegionSize, maxEdgeLength, maxSimplificationError) end

---@param transformOne integer
---@param transformTwo integer
---@return number distance
function calcDistanceFrom(transformOne, transformTwo) end

---@param transformOne integer
---@param transformTwo integer
---@return number squaredDistance
function calcDistanceSquaredFrom(transformOne, transformTwo) end

---@param requestId integer
function cancelStreamI3DFile(requestId) end

---@param characterSetId integer
---@param trackId integer
function clearAnimTrackClip(characterSetId, trackId) end

function clearEntireSharedI3DFileCache() end

---@param lightId integer
function clearLightShadowIgnoreShapes(lightId) end

---@param lightId integer
function clearMergedShadowIgnoreShapes(lightId) end

---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param rotCenterX number
---@param rotCenterY number
function clearOverlayArea(x, y, width, height, rotation, rotCenterX, rotCenterY) end

---@param terrainId integer
function clearTerrainFillLayers(terrainId) end

---@param objectId integer
---@param groupUnderParent boolean
---@param callOnCreate boolean?
---@param addPhysics boolean?
---@return integer cloneId
function clone(objectId, groupUnderParent, callOnCreate, addPhysics) end

---@param objectId integer
---@param targetId integer
---@return boolean success
function cloneAnimCharacterSet(objectId, targetId) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param longSlipRatio number
---@param latSlipAngle number
---@param tireLoad number
---@return number longForce
---@return number latForce
function computeWheelShapeTireForces(transformId, wheelShapeIndex, longSlipRatio, latSlipAngle, tireLoad) end

---@param conditionalAnimationEntityId integer
---@param x number
---@param y number
---@param z number
function conditionalAnimationDebugDraw(conditionalAnimationEntityId, x, y, z) end

---@param conditionalAnimationEntityId integer
---@param parameterId integer
---@param parameterType integer
---@param parameterLabel string
function conditionalAnimationRegisterParameter(conditionalAnimationEntityId, parameterId, parameterType, parameterLabel) end

---@param conditionalAnimationEntityId integer
function conditionalAnimationZeroiseTrackTimes(conditionalAnimationEntityId) end

---@param audioSourceName string
---@param sampleFilename string
---@param radius number
---@param innerRadius number
---@param volume number
---@param loops integer
---@return integer audioSource
function createAudioSource(audioSourceName, sampleFilename, radius, innerRadius, volume, loops) end

---@param cameraName string
---@param fovy number
---@param nearClip number
---@param farClip number
---@return integer cameraId
function createCamera(cameraName, fovy, nearClip, farClip) end

---@param transformId integer
---@param radius number
---@param height number
---@param stepOffset number
---@param slopeLimit number
---@param skinWidth number
---@param collisionGroup integer
---@param collisionMask integer
---@param mass number
---@return integer characterIndex
function createCCT(transformId, radius, height, stepOffset, slopeLimit, skinWidth, collisionGroup, collisionMask, mass) end

---@return integer conditionalAnimationEntityId
function createConditionalAnimation() end

---@param shapeId integer
---@param shapeName string
---@param volume number
---@param deltaMax number
---@param maxSurfaceAngle number
---@param maxPhysicalSurfaceAngle number
---@param maxSurfaceDistanceError number
---@param maxSubDivEdgeLength number
---@param syncMaxSubDivEdgeLength number
---@param createSidePlanes boolean
---@param retessellateTop boolean
---@return integer fillPlaneShapeId
function createFillPlaneShape(shapeId, shapeName, volume, deltaMax, maxSurfaceAngle, maxPhysicalSurfaceAngle, maxSurfaceDistanceError, maxSubDivEdgeLength, syncMaxSubDivEdgeLength, createSidePlanes, retessellateTop) end

---@param foliageBendingSystemId integer
---@param minX number
---@param maxX number
---@param minZ number
---@param maxZ number
---@param yOffset number
---@param centerTransformid integer
---@return integer rectangleId
function createFoliageBendingRectangle(foliageBendingSystemId, minX, maxX, minZ, maxZ, yOffset, centerTransformid) end

---@param textureFilename string
---@param deferredActivation boolean?
---@return integer imageOverlay
function createImageOverlay(textureFilename, deferredActivation) end

---@param textureId integer
---@return integer imageOverlay
function createImageOverlayWithTexture(textureId) end

---@param name string
---@param lightType integer
---@param r number
---@param g number
---@param b number
---@param range number
---@return integer lightEntity
function createLightSource(name, lightType, r, g, b, range) end

---@param objectName string
---@return integer sampleId
function createLoopSynthesisSample(objectName) end

---@param name string
---@return integer navMeshId
function createNavMesh(name) end

---@param parentId integer?
---@param text string?
---@param colorR number?
---@param colorG number?
---@param colorB number?
---@param fixedSize boolean?
---@return integer noteNodeId
function createNoteNode(parentId, text, colorR, colorG, colorB, fixedSize) end

---@param name string
---@param contour2DWorldPositions floatArray
---@param createRigidBody boolean?
---@return integer shape
function createPlaneShapeFrom2DContour(name, contour2DWorldPositions, createRigidBody) end

---@param objectName string
---@return integer sampleId
function createSample(objectName) end

---@param name string
---@param gridWidth integer
---@param gridHeight integer
---@param physicalWidth number
---@param physicalHeight number
---@param useHeightDisplacement boolean?
---@return integer shallowWaterSimulationId
function createShallowWaterSimulation(name, gridWidth, gridHeight, physicalWidth, physicalHeight, useHeightDisplacement) end

---@param parentId integer
---@param editPoints floatArray
---@param makeLinearSpline boolean?
---@param isClosed boolean?
---@return integer objectId
function createSplineFromEditPoints(parentId, editPoints, makeLinearSpline, isClosed) end

---@param objectName string
---@param isBackgroundMusic boolean
---@return integer streamedSampleId
function createStreamedSample(objectName, isBackgroundMusic) end

---@param tyreTrackSystem integer
---@param width number
---@param atlasIndex integer
---@return integer trackid
function createTrack(tyreTrackSystem, width, atlasIndex) end

---@param transformName string
---@return integer transformId
function createTransformGroup(transformName) end

---@param rootNode integer
---@param shape integer
---@param maxNumTracks integer
---@param maxNumSegments integer
---@param atlasSize integer
---@param terrainNode integer
---@return integer tyreTrackSystemEntity
function createTyreTrackSystem(rootNode, shape, maxNumTracks, maxNumSegments, atlasSize, terrainNode) end

---@param transformId integer
---@param positionX number
---@param positionY number
---@param positionZ number
---@param radius number
---@param suspensionTravel number
---@param spring number
---@param damperCompressionLowSpeed number
---@param damperCompressionHighSpeed number
---@param damperCompressionLowSpeedThreshold number
---@param damperRelaxationLowSpeed number
---@param damperRelaxationHighSpeed number
---@param damperRelaxationLowSpeedThreshold number
---@param mass number
---@param collisionGroup integer
---@param collisionMask integer
---@param wheelShapeIndex integer
---@return integer wheelShapeIndex
function createWheelShape(transformId, positionX, positionY, positionZ, radius, suspensionTravel, spring, damperCompressionLowSpeed, damperCompressionHighSpeed, damperCompressionLowSpeedThreshold, damperRelaxationLowSpeed, damperRelaxationHighSpeed, damperRelaxationLowSpeedThreshold, mass, collisionGroup, collisionMask, wheelShapeIndex) end

---@param transformId integer
---@param position vector
---@param radius number
---@param suspensionTravel number
---@param spring number
---@param damperCompressionLowSpeed number
---@param damperCompressionHighSpeed number
---@param damperCompressionLowSpeedThreshold number
---@param damperRelaxationLowSpeed number
---@param damperRelaxationHighSpeed number
---@param damperRelaxationLowSpeedThreshold number
---@param mass number
---@param collisionGroup integer
---@param collisionMask integer
---@param wheelShapeIndex integer
---@return integer wheelShapeIndex
function createWheelShapeVector(transformId, position, radius, suspensionTravel, spring, damperCompressionLowSpeed, damperCompressionHighSpeed, damperCompressionLowSpeedThreshold, damperRelaxationLowSpeed, damperRelaxationHighSpeed, damperRelaxationLowSpeedThreshold, mass, collisionGroup, collisionMask, wheelShapeIndex) end

---@param objectName string
---@param filename string
---@param rootNodeName string
---@return integer xmlId
function createXMLFile(objectName, filename, rootNodeName) end

---@param tyreTrackSystem integer
---@param trackId integer
function cutTrack(tyreTrackSystem, trackId) end

function debugDisableSingleStep() end

function debugEnableSingleStep() end

---@param objectId integer
function delete(objectId) end

---@param foliageBendingSystemId integer
---@param objectId integer
function destroyFoliageBendingObject(foliageBendingSystemId, objectId) end

---@param tyreTrackSystem integer
---@param trackId integer
function destroyTrack(tyreTrackSystem, trackId) end

---@param characterSetId integer
---@param trackId integer
function disableAnimTrack(characterSetId, trackId) end

---@param x number
---@param y number
---@param z number
---@param dirX number
---@param dirY number
---@param dirZ number
---@param tangX number
---@param tangY number
---@param tangZ number
---@param r number
---@param g number
---@param b number
---@param solid boolean?
function drawDebugArrow(x, y, z, dirX, dirY, dirZ, tangX, tangY, tangZ, r, g, b, solid) end

---@param p vector
---@param dir vector
---@param tang vector
---@param r number
---@param g number
---@param b number
---@param solid boolean?
function drawDebugArrowVector(p, dir, tang, r, g, b, solid) end

---@param x0 number
---@param y0 number
---@param z0 number
---@param r0 number
---@param g0 number
---@param b0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param r1 number
---@param g1 number
---@param b1 number
---@param solid boolean?
function drawDebugLine(x0, y0, z0, r0, g0, b0, x1, y1, z1, r1, g1, b1, solid) end

---@param p0 vector
---@param r0 number
---@param g0 number
---@param b0 number
---@param p1 vector
---@param r1 number
---@param g1 number
---@param b1 number
---@param solid boolean?
function drawDebugLineVector(p0, r0, g0, b0, p1, r1, g1, b1, solid) end

---@param x number
---@param y number
---@param z number
---@param r number
---@param g number
---@param b number
---@param a number
---@param solid boolean?
function drawDebugPoint(x, y, z, r, g, b, a, solid) end

---@param point vector
---@param r number
---@param g number
---@param b number
---@param a number
---@param solid boolean?
function drawDebugPointVector(point, r, g, b, a, solid) end

---@param enableDimming boolean
function drawDebugSetDimmingState(enableDimming) end

---@param characterSetId integer
---@param trackId integer
function enableAnimTrack(characterSetId, trackId) end

---@param objectId integer
---@return boolean doesExist
function entityExists(objectId) end

---@param tyreTrackSystem integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function eraseParallelogram(tyreTrackSystem, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param tyreTrackSystem integer
---@param vertexPositions floatArray
function erasePolygon(tyreTrackSystem, vertexPositions) end

---@param filePath string
function exportNoteNodes(filePath) end

---@param fillPlaneShapeId integer
---@param dTvolume number
---@param x number
---@param y number
---@param z number
---@param dx1 number
---@param dy1 number
---@param dz1 number
---@param dx2 number
---@param dy2 number
---@param dz2 number
function fillPlaneAdd(fillPlaneShapeId, dTvolume, x, y, z, dx1, dy1, dz1, dx2, dy2, dz2) end

---@param terrainId integer
function finalizeTerrainFillLayers(terrainId) end

---@param fillPlaneShapeId integer
---@param x number
---@param z number
---@return integer polyLineId
function findPolyline(fillPlaneShapeId, x, z) end

---@return intArray ids
function getAllSharedI3DFileRequestIds() end

---@return intArray ids
function getAllStreamI3DFileRequestIds() end

---@param transformId integer
---@return number angularDamping
function getAngularDamping(transformId) end

---@param transformId integer
---@return number velocityX
---@return number velocityY
---@return number velocityZ
function getAngularVelocity(transformId) end

---@param transformId integer
---@return vector velocity
function getAngularVelocityVector(transformId) end

---@param objectId integer
---@return integer characterSetId
function getAnimCharacterSet(objectId) end

---@param characterSetId integer
---@param index integer
---@return number duration
function getAnimClipDuration(characterSetId, index) end

---@param characterSetId integer
---@param clipName string
---@return integer index
function getAnimClipIndex(characterSetId, clipName) end

---@param characterSetId integer
---@param index integer
---@return string name
function getAnimClipName(characterSetId, index) end

---@param characterSetId integer
---@return integer numClips
function getAnimNumOfClips(characterSetId) end

---@param characterSetId integer
---@param trackId integer
---@return integer clipIndex
function getAnimTrackAssignedClip(characterSetId, trackId) end

---@param characterSetId integer
---@param trackId integer
---@return number weight
function getAnimTrackBlendWeight(characterSetId, trackId) end

---@param characterSetId integer
---@param trackId integer
---@return number time
function getAnimTrackTime(characterSetId, trackId) end

---@param audioSource integer
---@return boolean autoPlayEnabled
function getAudioSourceAutoPlay(audioSource) end

---@param audioSource integer
---@return number range
function getAudioSourceInnerRange(audioSource) end

---@param audioSource integer
---@return number maxRetriggerDelay
function getAudioSourceMaxRetriggerDelay(audioSource) end

---@param audioSource integer
---@return number minRetriggerDelay
function getAudioSourceMinRetriggerDelay(audioSource) end

---@param audioSource integer
---@return integer priority
function getAudioSourcePriority(audioSource) end

---@param audioSource integer
---@return boolean randomPlayback
function getAudioSourceRandomPlayback(audioSource) end

---@param audioSource integer
---@return number range
function getAudioSourceRange(audioSource) end

---@param audioSource integer
---@return integer sampleId
function getAudioSourceSample(audioSource) end

---@param audioSource integer
---@param index integer
---@return number probability
function getAudioSourceSampleElementProbability(audioSource, index) end

---@param audioSource integer
---@return boolean tickIfInaudible
function getAudioSourceTickInaudible(audioSource) end

---@return integer cameraId
function getCamera() end

---@param unicode integer
---@return boolean canRender
function getCanRenderUnicode(unicode) end

---@param characterIndex integer
---@return boolean side
---@return boolean up
---@return boolean down
function getCCTCollisionFlags(characterIndex) end

---@param characterIndex integer
---@return number height
function getCCTHeight(characterIndex) end

---@param transformId integer
---@return number x
---@return number y
---@return number z
function getCenterOfMass(transformId) end

---@param transformId integer
---@return vector centerOfMass
function getCenterOfMassVector(transformId) end

---@param objectId integer
---@param childName string
---@return integer childId
function getChild(objectId, childName) end

---@param objectId integer
---@param index integer
---@return integer childId
function getChildAt(objectId, index) end

---@param objectId integer
---@return integer childIndex
function getChildIndex(objectId) end

---@param objectId integer
---@return number distance
function getClipDistance(objectId) end

---@param objectId integer
---@return number minDist
---@return number maxDist
function getClipDistancesWithLOD(objectId) end

---@param shapeId integer
---@param worldX number
---@param worldY number
---@param worldZ number
---@param eps number
---@return number worldX
---@return number worldY
---@return number worldZ
---@return number time
function getClosestSplinePosition(shapeId, worldX, worldY, worldZ, eps) end

---@param shapeId integer
---@param world vector
---@param eps number
---@return vector world
---@return number time
function getClosestSplinePositionVector(shapeId, world, eps) end

---@param transformId integer
---@return integer group
---@return integer mask
function getCollisionFilter(transformId) end

---@param transformId integer
---@return integer group
function getCollisionFilterGroup(transformId) end

---@param transformId integer
---@return integer mask
function getCollisionFilterMask(transformId) end

---@param conditionalAnimationEntityId integer
---@param parameterId integer
---@return boolean value
function getConditionalAnimationBoolValue(conditionalAnimationEntityId, parameterId) end

---@param conditionalAnimationEntityId integer
---@param parameterId integer
---@return number value
function getConditionalAnimationFloatValue(conditionalAnimationEntityId, parameterId) end

---@param conditionalAnimationEntityId integer
---@return number time
function getConditionalAnimationTime(conditionalAnimationEntityId) end

---@return number volume
function getCurrentMasterVolume() end

---@param dataPlaneId integer
---@return integer tgId
function getDataPlaneAssociatedTransformGroup(dataPlaneId) end

---@param transformId integer
---@return number density
function getDensity(transformId) end

---@param dataPlaneId integer
---@param x number
---@param y number
---@param z number
---@return integer density
function getDensityAtWorldPos(dataPlaneId, x, y, z) end

---@param fillDataPlaneId integer
---@param x number
---@param y number
---@param z number
---@return number height
---@return number delta
function getDensityHeightAtWorldPos(fillDataPlaneId, x, y, z) end

---@param terrainDataPlane integer
---@return integer mapSize
function getDensityMapSize(terrainDataPlane) end

---@param densityMapSyncerId integer
---@param densityMapId integer
---@param worldX number
---@param worldZ number
---@return integer cellX
---@return integer cellZ
---@return boolean inRangeFlag
function getDensityMapSyncerCellIndicesAtWorldPosition(densityMapSyncerId, densityMapId, worldX, worldZ) end

---@param fillDataPlaneId integer
---@param x number
---@param y number
---@param z number
---@return number nx
---@return number ny
---@return number nz
function getDensityNormalAtWorldPos(fillDataPlaneId, x, y, z) end

---@param dataPlaneId integer
---@param x number
---@param y number
---@param z number
---@return integer states
function getDensityStatesAtWorldPos(dataPlaneId, x, y, z) end

---@param dataPlaneId integer
---@param x number
---@param y number
---@param z number
---@return integer typeIndex
function getDensityTypeIndexAtWorldPos(dataPlaneId, x, y, z) end

---@param objectId integer
---@return number minDist
---@return number maxDist
function getEffectiveClipDistancesWithLOD(objectId) end

---@param transformId integer
---@return boolean visibility
function getEffectiveVisibility(transformId) end

---@param particleSystemId integer
---@return number countScale
function getEmitCountScale(particleSystemId) end

---@param particleSystemId integer
---@return number emitStartTime
function getEmitStartTime(particleSystemId) end

---@param particleSystemId integer
---@return number emitStopTime
function getEmitStopTime(particleSystemId) end

---@param particleSystemId integer
---@return integer shapeId
function getEmitterShape(particleSystemId) end

---@param particleSystemId integer
---@return number shape
function getEmitterShapeVelocityScale(particleSystemId) end

---@param cameraId integer
---@return number farClip
function getFarClip(cameraId) end

---@param fillPlaneShapeId integer
---@param x number
---@param z number
---@return number height
function getFillPlaneHeightAtLocalPos(fillPlaneShapeId, x, z) end

---@param foliageBendingSystemId integer
---@param rectangleId integer
---@return number minX
---@return number maxX
---@return number minZ
---@return number maxZ
---@return number yOffset
function getFoliageBendingRectangleAttributes(foliageBendingSystemId, rectangleId) end

---@param terrainId integer
---@param detailName string
---@return integer foliageTgId
function getFoliageTransformGroupIdByFoliageName(terrainId, detailName) end

---@param cameraId integer
---@return number fovY
function getFovY(cameraId) end

---@param axisNumber integer
---@param gamepadIndex integer
---@return string axisLabel
function getGamepadAxisLabel(axisNumber, gamepadIndex) end

---@param buttonNumber integer
---@param gamepadIndex integer
---@return string buttonLabel
function getGamepadButtonLabel(buttonNumber, gamepadIndex) end

---@param gamepadIndex integer
---@return string gamepadName
function getGamepadName(gamepadIndex) end

---@param shapeId integer
---@return integer geometryId
function getGeometry(shapeId) end

---@param objectId integer
---@param classId integer
---@return boolean hasClassId
function getHasClassId(objectId, classId) end

---@param transformId integer
---@return boolean hasCollision
function getHasCollision(transformId) end

---@param shapeId integer
---@param parameterName string
---@param materialIndex integer?
---@return boolean hasParam
function getHasShaderParameter(shapeId, parameterName, materialIndex) end

---@return boolean hasTouchpad
function getHasTouchpad() end

---@param shapeId integer
---@return boolean hasTriggerFlag
function getHasTrigger(shapeId) end

---@return number volume
function getInactiveWindowAudioVolume() end

---@param axisNumber integer
---@param gamepadIndex integer
---@return number axisValue
function getInputAxis(axisNumber, gamepadIndex) end

---@param buttonNumber integer
---@param gamepadIndex integer
---@return number buttonValue
function getInputButton(buttonNumber, gamepadIndex) end

---@param transformId integer
---@return boolean isAddedToPhysics
function getIsAddedToPhysics(transformId) end

---@param transformId integer
---@return boolean isCompound
function getIsCompound(transformId) end

---@param transformId integer
---@return boolean isCompound
function getIsCompoundChild(transformId) end

---@param transformId integer
---@return boolean locked
function getIsLockedGroup(transformId) end

---@param transformId integer
---@return boolean true_
function getIsLODTransformGroup(transformId) end

---@param shapeId integer
---@return boolean isNonRenderable
function getIsNonRenderable(shapeId) end

---@param cameraId integer
---@return boolean isOrthographic
function getIsOrthographic(cameraId) end

---@param overlay integer
---@return boolean isReady
function getIsOverlayReady(overlay) end

---@param shapeId integer
---@return boolean isClosed
function getIsSplineClosed(shapeId) end

---@param textureEntity integer
---@return boolean isReady
function getIsTextureEntityReady(textureEntity) end

---@param value1 string
---@param value2 string
---@return integer distance
function getLevenshteinDistance(value1, value2) end

---@param lightId integer
---@return boolean doesCastShadowMap
---@return integer depthMapResolution
function getLightCastingShadowMap(lightId) end

---@param lightId integer
---@return number cone
function getLightConeAngle(lightId) end

---@param lightId integer
---@return number cone
function getLightConeAngleFromIESProfile(lightId) end

---@param lightId integer
---@return number dropoff
function getLightDropOff(lightId) end

---@param lightId integer
---@return string ___ies_
function getLightIESProfile(lightId) end

---@param lightId integer
---@return number range
function getLightRange(lightId) end

---@param lightId integer
---@return number scattering
function getLightScatteringConeAngle(lightId) end

---@param lightId integer
---@return number dirX
---@return number dirY
---@return number dirZ
function getLightScatteringDirection(lightId) end

---@param lightId integer
---@return number scattering
function getLightScatteringIntensity(lightId) end

---@param lightId integer
---@return number extrusion
function getLightShadowExtrusionDistance(lightId) end

---@param lightId integer
---@return number shadowPriority
function getLightShadowPriority(lightId) end

---@param lightId integer
---@return number softShadowBias
function getLightSoftShadowDepthBiasFactor(lightId) end

---@param lightId integer
---@return number softShadowDistance
function getLightSoftShadowDistance(lightId) end

---@param lightId integer
---@return number softShadowSize
function getLightSoftShadowSize(lightId) end

---@param lightId integer
---@return integer lightType
function getLightType(lightId) end

---@param lightId integer
---@return boolean usesLightScattering
function getLightUseLightScattering(lightId) end

---@param transformId integer
---@return number linearDamping
function getLinearDamping(transformId) end

---@param transformId integer
---@return number velocityX
---@return number velocityY
---@return number velocityZ
function getLinearVelocity(transformId) end

---@param transformId integer
---@return vector velocity
function getLinearVelocityVector(transformId) end

---@param shapeId integer
---@param time number
---@param timeRange number
---@param worldX number
---@param worldY number
---@param worldZ number
---@param eps number
---@return number worldX
---@return number worldY
---@return number worldZ
---@return number time
function getLocalClosestSplinePosition(shapeId, time, timeRange, worldX, worldY, worldZ, eps) end

---@param shapeId integer
---@param time number
---@param timeRange number
---@param world vector
---@param eps number
---@return vector world
---@return number time
function getLocalClosestSplinePositionVector(shapeId, time, timeRange, world, eps) end

---@param transformId integer
---@return number velocityX
---@return number velocityY
---@return number velocityZ
function getLocalLinearVelocity(transformId) end

---@param transformId integer
---@return vector velocity
function getLocalLinearVelocityVector(transformId) end

---@param transformId integer
---@return integer lodTransformId
function getLODTransformGroup(transformId) end

---@param transformId integer
---@return number mass
function getMass(transformId) end

---@return number volume
function getMasterVolume() end

---@param shapeId integer
---@param materialIndex integer
---@return integer materialId
function getMaterial(shapeId, materialIndex) end

---@param materialId integer
---@return boolean success
---@return number r
---@return number g
---@return number b
---@return number a
function getMaterialAlbedoColor(materialId) end

---@param materialId integer
---@param customMapName string
---@return string filename
function getMaterialCustomMapFilename(materialId, customMapName) end

---@param materialId integer
---@param customMapName string
---@return boolean isSRGB
function getMaterialCustomMapIsSRGB(materialId, customMapName) end

---@param materialId integer
---@param name string
---@return number x
---@return number y
---@return number z
---@return number w
function getMaterialCustomParameter(materialId, name) end

---@param materialId integer
---@return string customShaderFilename
function getMaterialCustomShaderFilename(materialId) end

---@param materialId integer
---@return string customShaderVariation
function getMaterialCustomShaderVariation(materialId) end

---@param materialId integer
---@return string filename
function getMaterialDiffuseMapFilename(materialId) end

---@param materialId integer
---@return boolean hasAlphaChannel
function getMaterialDiffuseMapHasAlpha(materialId) end

---@param materialId integer
---@return string filename
function getMaterialEmissiveMapFilename(materialId) end

---@param materialId integer
---@return boolean hasAlphaChannel
function getMaterialEmissiveMapHasAlpha(materialId) end

---@param materialId integer
---@return string filename
function getMaterialGlossMapFilename(materialId) end

---@param materialId integer
---@return boolean hasRefractionMap
function getMaterialHasRefractionMap(materialId) end

---@param materialId integer
---@return boolean isAlphaBlended
function getMaterialIsAlphaBlended(materialId) end

---@param materialId integer
---@return boolean isAlphaTested
function getMaterialIsAlphaTested(materialId) end

---@param materialId integer
---@return boolean success
---@return number metalness
function getMaterialMetalness(materialId) end

---@param materialId integer
---@return string filename
function getMaterialNormalMapFilename(materialId) end

---@param materialId integer
---@return integer normalFormat
function getMaterialNormalMapFormat(materialId) end

---@param materialId integer
---@return number reflectionMapScaling
function getMaterialReflectionMapScaling(materialId) end

---@param shapeId integer
---@param materialIndex integer
---@return string slotName
function getMaterialSlotName(shapeId, materialIndex) end

---@param materialId integer
---@return boolean success
---@return number smoothness
function getMaterialSmoothness(materialId) end

---@param particleSystemId integer
---@return integer maxNumParticles
function getMaxNumOfParticles(particleSystemId) end

---@param lightId integer
---@return integer settingsLightId
function getMergedShadowSettingsLight(lightId) end

---@param objectId integer
---@return number minDist
function getMinClipDistance(objectId) end

---@param transformId integer
---@return number motorRotSpeed
---@return number clutchRotSpeed
---@return number motorLoad
function getMotorRotationSpeed(transformId) end

---@param transformId integer
---@return number availableTorque
---@return number appliedTorque
---@return number externalTorque
function getMotorTorque(transformId) end

---@param entityId integer
---@return string entityName
function getName(entityId) end

---@param cameraId integer
---@return number nearClip
function getNearClip(cameraId) end

---@param noteId integer
---@return string text
function getNoteNodeText(noteId) end

---@param audioSource integer
---@return integer count
function getNumOfAudioSourceSampleElements(audioSource) end

---@param objectId integer
---@return integer numOfChildren
function getNumOfChildren(objectId) end

---@return integer numOfGamepads
function getNumOfGamepads() end

---@param shapeId integer
---@return integer numMaterials
function getNumOfMaterials(shapeId) end

---@param particleSystemId integer
---@return number emittedParticlesPerMs
function getNumOfParticlesToEmitPerMs(particleSystemId) end

---@param shapeId integer
---@param materialIndex integer?
---@param variationIndex integer?
---@return integer numOfShaderParameters
function getNumOfShaderParameters(shapeId, materialIndex, variationIndex) end

---@param shapeId integer
---@return integer numOfBones
function getNumOfShapeBones(shapeId) end

---@return integer fileCount
function getNumOfSharedI3DFiles() end

---@return integer numTriggers
function getNumOfTriggers() end

---@param objectId integer
---@return integer numAttributes
function getNumOfUserAttributes(objectId) end

---@param shapeId integer
---@return integer numAttributes
function getNumSplineAttributes(shapeId) end

---@param objectId integer
---@return integer mask
function getObjectMask(objectId) end

---@param cameraId integer
---@return number orthographicHeight
function getOrthographicHeight(cameraId) end

---@param objectId integer
---@return integer parentId
function getParent(objectId) end

---@param particleSystemId integer
---@return number normalSpeed
---@return number tangentSpeed
function getParticleSystemAverageSpeed(particleSystemId) end

---@param particleSystemEntityId integer
---@return number damping
function getParticleSystemDamping(particleSystemEntityId) end

---@param particleSystemId integer
---@return number lifeSpan
function getParticleSystemLifespan(particleSystemId) end

---@param particleSystemEntityId integer
---@return number normalSpeed
function getParticleSystemNormalSpeed(particleSystemEntityId) end

---@param particleSystemId integer
---@return number speed
function getParticleSystemSpeed(particleSystemId) end

---@param particleSystemEntityId integer
---@return number speedRandom
function getParticleSystemSpeedRandom(particleSystemEntityId) end

---@param particleSystemEntityId integer
---@return number spriteScaleX
function getParticleSystemSpriteScaleX(particleSystemEntityId) end

---@param particleSystemEntityId integer
---@return number spriteScaleXGain
function getParticleSystemSpriteScaleXGain(particleSystemEntityId) end

---@param particleSystemEntityId integer
---@return number spriteScaleY
function getParticleSystemSpriteScaleY(particleSystemEntityId) end

---@param particleSystemEntityId integer
---@return number spriteScaleXGain
function getParticleSystemSpriteScaleYGain(particleSystemEntityId) end

---@param particleSystemEntityId integer
---@return number tangentSpeed
function getParticleSystemTangentSpeed(particleSystemEntityId) end

---@param cameraId integer
---@return number x
---@return number y
function getProjectionOffset(cameraId) end

---@param objectId integer
---@return number x
---@return number y
---@return number z
---@return number w
function getQuaternion(objectId) end

---@return number multiplier
function getRainAmountMultiplier() end

---@param transformId integer
---@return number minX
---@return number maxX
---@return number minY
---@return number maxY
---@return number minZ
---@return number maxZ
function getRigidBodyAABB(transformId) end

---@param transformId integer
---@return vector min
---@return vector max
function getRigidBodyAABBVector(transformId) end

---@param transformId integer
---@return integer rigidBodyType
function getRigidBodyType(transformId) end

---@return integer transformId
function getRootNode() end

---@param transformId integer
---@return number x
---@return number y
---@return number z
function getRotation(transformId) end

---@param transformId integer
---@return vector localRotation
function getRotationVector(transformId) end

---@param sampleId integer
---@return number duration
function getSampleDuration(sampleId) end

---@param sampleId integer
---@return number loadFactor
function getSampleLoopSynthesisLoadFactor(sampleId) end

---@param sampleId integer
---@return number max
function getSampleLoopSynthesisMaxRPM(sampleId) end

---@param sampleId integer
---@return number min
function getSampleLoopSynthesisMinRPM(sampleId) end

---@param sampleId integer
---@param useNormalizedValue boolean
---@return number rpm
function getSampleLoopSynthesisRPM(sampleId, useNormalizedValue) end

---@param sampleId integer
---@return number startDuration
function getSampleLoopSynthesisStartDuration(sampleId) end

---@param sampleId integer
---@return number stopDuration
function getSampleLoopSynthesisStopDuration(sampleId) end

---@param sampleId integer
---@return number loadFactor
function getSampleLoopSynthesisTargetLoadFactor(sampleId) end

---@param sampleId integer
---@param useNormalizedValue boolean
---@return number rpm
function getSampleLoopSynthesisTargetRPM(sampleId, useNormalizedValue) end

---@param sampleId integer
---@return number pitch
function getSamplePitch(sampleId) end

---@param sampleId integer
---@return number offset
function getSamplePlayOffset(sampleId) end

---@param sampleId integer
---@return number leftPlayTime
function getSamplePlayTimeLeft(sampleId) end

---@param sampleId integer
---@return number x
---@return number y
---@return number z
function getSampleVelocity(sampleId) end

---@param sampleId integer
---@return number volume
function getSampleVolume(sampleId) end

---@param transformId integer
---@return number x
---@return number y
---@return number z
function getScale(transformId) end

---@param transformId integer
---@return vector
function getScaleVector(transformId) end

---@param shapeId integer
---@param parameterName string
---@param materialIndex integer?
---@return number x
---@return number y
---@return number z
---@return number w
function getShaderParameter(shapeId, parameterName, materialIndex) end

---@param shapeId integer
---@param parameterIndex integer
---@param materialIndex integer?
---@param variationIndex integer?
---@return number x
---@return number y
---@return number z
---@return number w
function getShaderParameterByIndex(shapeId, parameterIndex, materialIndex, variationIndex) end

---@param shapeId integer
---@param parameterIndex integer
---@param materialIndex integer?
---@param variationIndex integer?
---@return string parameterName
function getShaderParameterNameByIndex(shapeId, parameterIndex, materialIndex, variationIndex) end

---@param shallowWaterSimulation integer
---@return number height
function getShallowWaterSimulationFakeExtraDepth(shallowWaterSimulation) end

---@param shallowWaterSimulation integer
---@return number foam
function getShallowWaterSimulationFoamAccumulationRate(shallowWaterSimulation) end

---@param shallowWaterSimulation integer
---@return number foam
function getShallowWaterSimulationFoamDecayRate(shallowWaterSimulation) end

---@param shallowWaterSimulation integer
---@return integer textureId
function getShallowWaterSimulationOutputTexture(shallowWaterSimulation) end

---@param shallowWaterSimulation integer
---@return integer textureId
function getShallowWaterSimulationOutputVelocityUTexture(shallowWaterSimulation) end

---@param shallowWaterSimulation integer
---@return integer textureId
function getShallowWaterSimulationOutputVelocityVTexture(shallowWaterSimulation) end

---@param shapeId integer
---@param boneIndex integer
---@return integer boneId
function getShapeBone(shapeId, boneIndex) end

---@param shapeId integer
---@return number localPosX
---@return number localPosY
---@return number localPosZ
---@return number radius
---@return boolean usesGeometry
function getShapeBoundingSphere(shapeId) end

---@param shapeId integer
---@return integer mask
function getShapeBuildNavMeshMask(shapeId) end

---@param shapeId integer
---@return number localPosX
---@return number localPosY
---@return number localPosZ
---@return number radius
function getShapeGeometryBoundingSphere(shapeId) end

---@param shapeId integer
---@return boolean isCPUMesh
function getShapeIsCPUMesh(shapeId) end

---@param shapeId integer
---@return boolean isSkinned
---@return boolean isSkinnedSingleWeight
function getShapeIsSkinned(shapeId) end

---@param shapeId integer
---@return number worldPosX
---@return number worldPosY
---@return number worldPosZ
---@return number radius
function getShapeWorldBoundingSphere(shapeId) end

---@param requestId integer
---@return string progress
---@return number elapsedTime
---@return string filename
---@return string function_
---@return object target
---@return object args
function getSharedI3DFileProgressInfo(requestId) end

---@param filename string
---@return integer refCount
function getSharedI3DFileRefCount(filename) end

---@param shapeId integer
---@param attributeIndex integer
---@param t number
---@return number value
function getSplineAttribute(shapeId, attributeIndex, t) end

---@param shapeId integer
---@param attributeIndex integer
---@param CVIndex integer
---@return number value
function getSplineAttributeAtCV(shapeId, attributeIndex, CVIndex) end

---@param shapeId integer
---@param attributeName string
---@return integer attributeIndex
function getSplineAttributeIndex(shapeId, attributeName) end

---@param shapeId integer
---@param attributeIndex integer
---@return string attributeName
function getSplineAttributeName(shapeId, attributeIndex) end

---@param shapeId integer
---@param time number
---@return number curvature
function getSplineCurvature(shapeId, time) end

---@param shapeId integer
---@param index integer
---@return number x
---@return number y
---@return number z
function getSplineCV(shapeId, index) end

---@param shapeId integer
---@param index integer
---@return vector worldspace
function getSplineCVVector(shapeId, index) end

---@param shapeId integer
---@param time number
---@return number dirX
---@return number dirY
---@return number dirZ
function getSplineDirection(shapeId, time) end

---@param shapeId integer
---@param time number
---@return vector dir
function getSplineDirectionVector(shapeId, time) end

---@param shapeId integer
---@param index integer
---@return number x
---@return number y
---@return number z
function getSplineEP(shapeId, index) end

---@param shapeId integer
---@param index integer
---@return vector worldspace
function getSplineEPVector(shapeId, index) end

---@param shapeId integer
---@return number length
function getSplineLength(shapeId) end

---@param shapeId integer
---@return integer num
function getSplineNumOfCV(shapeId) end

---@param shapeId integer
---@param time number
---@param upDirX number
---@param upDirY number
---@param upDirZ number
---@return number rx
---@return number ry
---@return number rz
function getSplineOrientation(shapeId, time, upDirX, upDirY, upDirZ) end

---@param shapeId integer
---@param time number
---@param upDir vector
---@return vector orientation
function getSplineOrientationVector(shapeId, time, upDir) end

---@param shapeId integer
---@param time number
---@return number x
---@return number y
---@return number z
function getSplinePosition(shapeId, time) end

---@param shapeId integer
---@param time number
---@return vector position
function getSplinePositionVector(shapeId, time) end

---@param shapeId integer
---@param time number
---@param distance number
---@param positiveTimeOffset boolean
---@param eps number
---@return number worldX
---@return number worldY
---@return number worldZ
---@return number time
function getSplinePositionWithDistance(shapeId, time, distance, positiveTimeOffset, eps) end

---@param shapeId integer
---@param time number
---@param distance number
---@param positiveTimeOffset boolean
---@param eps number
---@return vector world
---@return number time
function getSplinePositionWithDistanceVector(shapeId, time, distance, positiveTimeOffset, eps) end

---@param shapeId integer
---@return integer splitType
function getSplitType(shapeId) end

---@param streamedSampleId integer
---@return number volume
function getStreamedSampleVolume(streamedSampleId) end

---@param requestId integer
---@return string progress
---@return number elapsedTime
---@return string filename
---@return string callbackFunctionName
---@return object callbackTarget
---@return object args
function getStreamI3DFileProgressInfo(requestId) end

---@param terrainId integer
---@param x number
---@param y number
---@param z number
---@param xComb boolean
---@param yComb boolean
---@param zComb boolean
---@param wComb boolean
---@param uComb boolean
---@return number x
---@return number y
---@return number z
---@return number w
---@return number u
function getTerrainAttributesAtWorldPos(terrainId, x, y, z, xComb, yComb, zComb, wComb, uComb) end

---@param terrainId integer
---@param detailName string
---@return integer detailId
---@return integer typeId
function getTerrainDataPlaneByName(terrainId, detailName) end

---@param terrainId integer
---@param detailName string
---@return integer detailId
function getTerrainDetailByName(terrainId, detailName) end

---@param dataPlaneId integer
---@return string viewDistance
function getTerrainDetailName(dataPlaneId) end

---@param dataPlaneId integer
---@return integer numChannels
function getTerrainDetailNumChannels(dataPlaneId) end

---@param dataPlaneId integer
---@return integer typeIndex
function getTerrainDetailTypeIndex(dataPlaneId) end

---@param terrainId integer
---@param x number
---@param y number
---@param z number
---@return number height
function getTerrainHeightAtWorldPos(terrainId, x, y, z) end

---@param terrainId integer
---@return number unitSize
function getTerrainHeightmapUnitSize(terrainId) end

---@param terrainId integer
---@param worldX number
---@param worldZ number
---@return integer cellX
---@return integer cellZ
---@return boolean inRangeFlag
function getTerrainHeightSyncerCellIndicesAtWorldPosition(terrainId, worldX, worldZ) end

---@param terrainId integer
---@param x number
---@param y number
---@param z number
---@return number nx
---@return number ny
---@return number nz
function getTerrainNormalAtWorldPos(terrainId, x, y, z) end

---@param terrainId integer
---@return number size
function getTerrainSize(terrainId) end

---@param fontSize number
---@param utf8string string
---@return number width
function getText3DWidth(fontSize, utf8string) end

---@param fontSize number
---@param utf8string string
---@return number textHeight
---@return integer numLines
function getTextHeight(fontSize, utf8string) end

---@param fontSize number
---@param utf8string string
---@param maxNumLines integer
---@return integer numChars
function getTextLength(fontSize, utf8string, maxNumLines) end

---@param fontSize number
---@param utf8string string
---@param maxWidth number
---@return integer numChars
function getTextLineLength(fontSize, utf8string, maxWidth) end

---@param fontSize number
---@param utf8string string
---@return number textWidth
function getTextWidth(fontSize, utf8string) end

---@param shapeId integer
---@param index integer
---@return number t
function getTimeAtSplineCV(shapeId, index) end

---@param transformId integer
---@return number x
---@return number y
---@return number z
function getTranslation(transformId) end

---@param transformId integer
---@return vector translation
function getTranslationVector(transformId) end

---@param objectId integer
---@param name string
---@return any? value
function getUserAttribute(objectId, name) end

---@param objectId integer
---@param attributeIndex integer
---@return any? value
---@return string name
---@return integer type
function getUserAttributeByIndex(objectId, attributeIndex) end

---@param objectId integer
---@param name string
---@return any? value
---@return integer type
function getUserAttributeValueAndType(objectId, name) end

---@param transformId integer
---@param positionX number
---@param positionY number
---@param positionZ number
---@return number velocityX
---@return number velocityY
---@return number velocityZ
function getVelocityAtLocalPos(transformId, positionX, positionY, positionZ) end

---@param transformId integer
---@param position vector
---@return vector velocity
function getVelocityAtLocalPosVector(transformId, position) end

---@param transformId integer
---@param positionX number
---@param positionY number
---@param positionZ number
---@return number velocityX
---@return number velocityY
---@return number velocityZ
function getVelocityAtWorldPos(transformId, positionX, positionY, positionZ) end

---@param transformId integer
---@param position vector
---@return vector velocity
function getVelocityAtWorldPosVector(transformId, position) end

---@param transformId integer
---@return boolean visibility
function getVisibility(transformId) end

---@param objectId integer
---@return integer dayOfYearStart
---@return integer dayOfYearEnd
---@return boolean hasOwnVisibilityCondition
function getVisibilityConditionDayOfYear(objectId) end

---@param objectId integer
---@return boolean isVisible
function getVisibilityConditionEntityState(objectId) end

---@param objectId integer
---@return integer minuteOfDayStart
---@return integer minuteOfDayEnd
---@return boolean hasOwnVisibilityCondition
function getVisibilityConditionMinuteOfDay(objectId) end

---@param objectId integer
---@return boolean renderInvisible
---@return boolean hasOwnVisibilityCondition
function getVisibilityConditionRenderInvisible(objectId) end

---@param objectId integer
---@return integer viewerSpacialityRequiredMask
---@return integer viewerSpacialityPreventMask
---@return boolean hasOwnVisibilityCondition
function getVisibilityConditionViewerSpacialityMask(objectId) end

---@param objectId integer
---@return number shaderVisibilityParam
---@return boolean hasOwnVisibilityCondition
function getVisibilityConditionVisibleShaderParameter(objectId) end

---@param objectId integer
---@return integer weatherRequiredMask
---@return integer weatherPreventMask
---@return boolean hasOwnVisibilityCondition
function getVisibilityConditionWeatherMask(objectId) end

---@param transformId integer
---@return number volume
function getVolume(transformId) end

---@return number wetness
function getWetness() end

---@param transformId integer
---@param wheelShapeIndex integer
---@return number axleSpeed
function getWheelShapeAxleSpeed(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return number contactForce
function getWheelShapeContactForce(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return number x
---@return number y
---@return number z
function getWheelShapeContactNormal(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return vector normal
function getWheelShapeContactNormalVector(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return integer wheelShapeContactObject
---@return integer contactSubShapeIndex
function getWheelShapeContactObject(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return number positionX
---@return number positionY
---@return number positionZ
---@return number contactSkinWidth
function getWheelShapeContactPoint(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return vector position
---@return number contactSkinWidth
function getWheelShapeContactPointVector(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return number positionX
---@return number positionY
---@return number positionZ
---@return number rotation
---@return number suspensionLength
function getWheelShapePosition(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return vector position
---@return number rotation
---@return number suspensionLength
function getWheelShapePositionVector(transformId, wheelShapeIndex) end

---@param transformId integer
---@param wheelShapeIndex integer
---@return number wheelShapeSlip
---@return number wheelShapeSlip
function getWheelShapeSlip(transformId, wheelShapeIndex) end

---@param objectId integer
---@return number x
---@return number y
---@return number z
---@return number w
function getWorldQuaternion(objectId) end

---@param transformId integer
---@return number x
---@return number y
---@return number z
function getWorldRotation(transformId) end

---@param transformId integer
---@return vector worldRotation
function getWorldRotationVector(transformId) end

---@param transformId integer
---@return number x
---@return number y
---@return number z
function getWorldTranslation(transformId) end

---@param transformId integer
---@return vector translation
function getWorldTranslationVector(transformId) end

---@param xmlId integer
---@param xmlElementPath string
---@param index integer
---@return string attributeName
function getXMLAttributeName(xmlId, xmlElementPath, index) end

---@param xmlId integer
---@param nodePath string
---@return boolean value
function getXMLBool(xmlId, nodePath) end

---@param xmlId integer
---@param nodePath string
---@return string elementName
function getXMLElementName(xmlId, nodePath) end

---@param xmlId integer
---@return string xmlFilename
function getXMLFilename(xmlId) end

---@param xmlId integer
---@param nodePath string
---@return number value
function getXMLFloat(xmlId, nodePath) end

---@param xmlId integer
---@param nodePath string
---@return integer value
function getXMLInt(xmlId, nodePath) end

---@param xmlId integer
---@param nodePath string
---@return integer lineNumber
function getXMLLineNum(xmlId, nodePath) end

---@param xmlId integer
---@param xmlElementPath string
---@return integer numOfAttributes
function getXMLNumOfAttributes(xmlId, xmlElementPath) end

---@param xmlId integer
---@param xmlElementPath string
---@return integer numOfChildren
function getXMLNumOfChildren(xmlId, xmlElementPath) end

---@param xmlId integer
---@param xmlElementPath string
---@return integer numOfElements
function getXMLNumOfElements(xmlId, xmlElementPath) end

---@param xmlId integer
---@param nodePath string
---@return string value
function getXMLString(xmlId, nodePath) end

---@param xmlId integer
---@param nodePath string
---@return integer value
function getXMLUInt(xmlId, nodePath) end

---@param lightId integer
---@return boolean has
function hasMergedShadow(lightId) end

---@param xmlId integer
---@param nodePath string
---@return boolean hasElementOrAttribute
---@return boolean hasAttributeParentElement
function hasXMLProperty(xmlId, nodePath) end

---@param conditionalAnimationEntityId integer
---@param charsetNodeId integer
---@param xmlFilePath string
---@param baseNodeName string
function initConditionalAnimation(conditionalAnimationEntityId, charsetNodeId, xmlFilePath, baseNodeName) end

---@param shapeId integer
function invalidateShapeBoundingVolume(shapeId) end

---@param characterSetId integer
---@param trackId integer
---@return boolean isClipAssigned
function isAnimTrackClipAssigned(characterSetId, trackId) end

---@param characterSetId integer
---@param trackId integer
---@return boolean state
function isAnimTrackEnabled(characterSetId, trackId) end

---@param lightId integer
---@return boolean isActive
function isMergedShadowActive(lightId) end

---@param sampleId integer
---@return boolean isPlaying
function isSamplePlaying(sampleId) end

---@param actor1Id integer
---@param actor2Id integer
function JointConstructor:setActors(actor1Id, actor2Id) end

---@param jointNode1 integer
---@param jointNode2 integer
function JointConstructor:setJointTransforms(jointNode1, jointNode2) end

---@param parentNodeId integer
---@param childNodeId integer
---@param index integer?
function link(parentNodeId, childNodeId, index) end

---@param filename string
---@param addPhysics boolean?
---@param callOnCreate boolean?
---@param verbose boolean?
---@return integer rootNodeId
---@return integer failedReason
function loadI3DFile(filename, addPhysics, callOnCreate, verbose) end

---@param sampleId integer
---@param sampleFilename string
---@param is3DSound boolean
---@return boolean success
function loadSample(sampleId, sampleFilename, is3DSound) end

---@param filename string
---@param addPhysics boolean?
---@param callOnCreate boolean?
---@param verbose boolean?
---@return integer rootNodeId
---@return integer requestId
---@return integer failedReason
function loadSharedI3DFile(filename, addPhysics, callOnCreate, verbose) end

---@param streamedSampleId integer
---@param sampleFilename string
---@return boolean success
function loadStreamedSample(streamedSampleId, sampleFilename) end

---@param objectName string
---@param filename string
---@return integer xmlId
function loadXMLFile(objectName, filename) end

---@param objectName string
---@param xmlString string
---@return integer xmlId
function loadXMLFileFromMemory(objectName, xmlString) end

---@param transformId integer
---@param targetTransformId integer
---@param dx number
---@param dy number
---@param dz number
---@return number dx
---@return number dy
---@return number dz
function localDirectionToLocal(transformId, targetTransformId, dx, dy, dz) end

---@param sourceTransformId integer
---@param targetTransformId integer
---@param sourceDirection vector
---@return vector targetDirection
function localDirectionToLocalVector(sourceTransformId, targetTransformId, sourceDirection) end

---@param transformId integer
---@param ldx number
---@param ldy number
---@param ldz number
---@return number wdx
---@return number wdy
---@return number wdz
function localDirectionToWorld(transformId, ldx, ldy, ldz) end

---@param transformId integer
---@param localDirection vector
---@return vector worldDirection
function localDirectionToWorldVector(transformId, localDirection) end

---@param transformId integer
---@param targetTransformId integer
---@param rx number
---@param ry number
---@param rz number
---@return number rx
---@return number ry
---@return number rz
function localRotationToLocal(transformId, targetTransformId, rx, ry, rz) end

---@param sourceTransformId integer
---@param targetTransformId integer
---@param sourceRotation vector
---@return vector targetRotation
function localRotationToLocalVector(sourceTransformId, targetTransformId, sourceRotation) end

---@param transformId integer
---@param lrx number
---@param lry number
---@param lrz number
---@return number wrx
---@return number wry
---@return number wrz
function localRotationToWorld(transformId, lrx, lry, lrz) end

---@param transformId integer
---@param localRotation vector
---@return vector worldRotation
function localRotationToWorldVector(transformId, localRotation) end

---@param transformId integer
---@param targetTransformId integer
---@param x number
---@param y number
---@param z number
---@return number x
---@return number y
---@return number z
function localToLocal(transformId, targetTransformId, x, y, z) end

---@param sourceTransformId integer
---@param targetTransformId integer
---@param source vector
---@return vector target
function localToLocalVector(sourceTransformId, targetTransformId, source) end

---@param transformId integer
---@param lx number
---@param ly number
---@param lz number
---@return number wx
---@return number wy
---@return number wz
function localToWorld(transformId, lx, ly, lz) end

---@param transformId integer
---@param localTranslation vector
---@return vector worldTranslation
function localToWorldVector(transformId, localTranslation) end

---@param angle integer
---@return floatArray color
---@return number error
function MaterialCalibrationSolver:getCurrentSRGB(angle) end

---@param angle integer
---@return floatArray color
function MaterialCalibrationSolver:getTargetSRGB(angle) end

---@return boolean isDone
function MaterialCalibrationSolver:isDone() end

---@return integer iterationStep
---@return integer iterationMaxStep
function MaterialCalibrationSolver:iterate() end

function MaterialCalibrationSolver:prepare() end

function MaterialCalibrationSolver:reset() end

---@param channelR boolean
---@param channelG boolean
---@param channelB boolean
---@param channelSmoothness boolean
---@param channelMetalness boolean
function MaterialCalibrationSolver:setChannels(channelR, channelG, channelB, channelSmoothness, channelMetalness) end

---@param parameterName string
---@param channelR boolean
---@param channelG boolean
---@param channelB boolean
---@param channelA boolean
function MaterialCalibrationSolver:setCustomParameterChannels(parameterName, channelR, channelG, channelB, channelA) end

---@param parameterName string
---@param channelIndex integer
---@param minValue number
---@param maxValue number
function MaterialCalibrationSolver:setCustomParameterChannelValueRange(parameterName, channelIndex, minValue, maxValue) end

---@param shapeId integer
function MaterialCalibrationSolver:setShape(shapeId) end

---@param minValue number
---@param maxValue number
function MaterialCalibrationSolver:setValueRangeChannelB(minValue, maxValue) end

---@param minValue number
---@param maxValue number
function MaterialCalibrationSolver:setValueRangeChannelG(minValue, maxValue) end

---@param minValue number
---@param maxValue number
function MaterialCalibrationSolver:setValueRangeChannelMetalness(minValue, maxValue) end

---@param minValue number
---@param maxValue number
function MaterialCalibrationSolver:setValueRangeChannelR(minValue, maxValue) end

---@param minValue number
---@param maxValue number
function MaterialCalibrationSolver:setValueRangeChannelSmoothness(minValue, maxValue) end

---@param x number
---@param y number
---@param z number
---@param x number
---@param y number
---@param z number
---@return number x
---@return number y
---@return number z
function mathEulerRotateVector(x, y, z, x, y, z) end

---@param x number
---@param y number
---@param z number
---@return number qx
---@return number qy
---@return number qz
---@return number qw
function mathEulerToQuaternion(x, y, z) end

---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param x number
---@param y number
---@param z number
---@return number x
---@return number y
---@return number z
function mathQuaternionRotateVector(qx, qy, qz, qw, x, y, z) end

---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@return number x
---@return number y
---@return number z
function mathQuaternionToEuler(qx, qy, qz, qw) end

---@param lightId integer
---@param lightId2 integer
---@param lightId3 integer
---@param lightId4 integer
---@param lightId5 integer
---@param lightId6 integer
---@param lightId7 integer
---@param lightId8 integer
---@param lightId9 integer
---@param lightId10 integer
function mergeLightShadows(lightId, lightId2, lightId3, lightId4, lightId5, lightId6, lightId7, lightId8, lightId9, lightId10) end

---@param characterIndex integer
---@param x number
---@param y number
---@param z number
---@param collisionGroup integer
---@param collisionMask integer
function moveCCT(characterIndex, x, y, z, collisionGroup, collisionMask) end

---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param ex number
---@param ey number
---@param ez number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapBox(x, y, z, rx, ry, rz, ex, ey, ez, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param ex number
---@param ey number
---@param ez number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapBoxAsync(x, y, z, rx, ry, rz, ex, ey, ez, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param center vector
---@param rotation vector
---@param halfExtents vector
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapBoxAsyncVector(center, rotation, halfExtents, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param center vector
---@param rotation vector
---@param halfExtents vector
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapBoxVector(center, rotation, halfExtents, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param shapeId integer
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapConvex(shapeId, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param shapeId integer
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapConvexAsync(shapeId, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param shapeVertexPositions floatArray
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapConvexPolyhedron(shapeVertexPositions, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param shapeVertexPositions floatArray
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapConvexPolyhedronAsync(shapeVertexPositions, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param height number
---@param axis integer
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapCylinder(x, y, z, radius, height, axis, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param height number
---@param axis integer
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapCylinderAsync(x, y, z, radius, height, axis, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param center vector
---@param radius number
---@param height number
---@param axis integer
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapCylinderAsyncVector(center, radius, height, axis, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param center vector
---@param radius number
---@param height number
---@param axis integer
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapCylinderVector(center, radius, height, axis, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapSphere(x, y, z, radius, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapSphereAsync(x, y, z, radius, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param center vector
---@param radius number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
function overlapSphereAsyncVector(center, radius, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param center vector
---@param radius number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@param exactTest boolean?
---@return integer numShapes
function overlapSphereVector(center, radius, callbackFunctionName, callbackTargetObject, collisionMask, includeDynamics, includeKinematics, includeStatics, exactTest) end

---@param streamedSampleId integer
function pauseStreamedSample(streamedSampleId) end

---@param filename string
---@param verbose boolean
function pinSharedI3DFileInCache(filename, verbose) end

---@param sampleId integer
---@param loops integer
---@param volume number
---@param offset number
---@param delay number
---@param playAfterSample integer
function playSample(sampleId, loops, volume, offset, delay, playAfterSample) end

---@param streamedSampleId integer
---@param repeatCount integer
function playStreamedSample(streamedSampleId, repeatCount) end

---@param index integer
---@param x number
---@param z number
function PointList2D:add(index, x, z) end

---@param index integer
---@return number x
---@return number z
function PointList2D:get(index) end

---@param pointList2 PointList2D
---@return boolean isColliding
function PointList2D:getAreBoundariesColliding(pointList2) end

---@param x number
---@param z number
---@return number x
---@return number z
---@return number dirX
---@return number dirZ
function PointList2D:getClosestPositionAndDirectionOnBoundary(x, z) end

---@param x number
---@param z number
---@return number x
---@return number z
function PointList2D:getClosestPositionOnBoundary(x, z) end

---@param x number
---@param z number
---@return number distance
function PointList2D:getDistanceToBoundary(x, z) end

---@param x number
---@param z number
---@return boolean isInside
function PointList2D:getIsPointInsideBoundary(x, z) end

---@param l1x number
---@param l1z number
---@param l2x number
---@param l2z number
---@return boolean isInside
function PointList2D:getIsSegmentInsideBoundary(l1x, l1z, l2x, l2z) end

---@return integer numPoints
function PointList2D:getNumPoints() end

---@param l1x number
---@param l1z number
---@param l2x number
---@param l2z number
---@return boolean isIntersecting
---@return number ix
---@return number iz
function PointList2D:getSegmentBoundaryIntersection(l1x, l1z, l2x, l2z) end

---@param l1x number
---@param l1z number
---@param l2x number
---@param l2z number
---@return boolean isIntersecting
---@return number ix
---@return number iz
---@return integer lineSegment
function PointList2D:getSegmentClosestBoundaryIntersection(l1x, l1z, l2x, l2z) end

---@param l1x number
---@param l1z number
---@param l2x number
---@param l2z number
---@return integer numIntersections
function PointList2D:getSegmentNumBoundaryIntersections(l1x, l1z, l2x, l2z) end

---@return number length
function PointList2D:length() end

---@param index integer
---@param x number
---@param z number
function PointList2D:set(index, x, z) end

---@param arg1 any?
---@param arg2 any?
---@param arg3 any?
---@param arg4 any?
---@param arg5 any?
---@param arg6 any?
---@param arg7 any?
---@param arg8 any?
function print(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end

---@param message string?
function printCallstack(message) end

---@param arg1 any?
---@param arg2 any?
---@param arg3 any?
---@param arg4 any?
---@param arg5 any?
---@param arg6 any?
---@param arg7 any?
---@param arg8 any?
function printError(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end

---@param arg1 any?
---@param arg2 any?
---@param arg3 any?
---@param arg4 any?
---@param arg5 any?
---@param arg6 any?
---@param arg7 any?
---@param arg8 any?
function printWarning(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end

---@param wx number
---@param wy number
---@param wz number
---@return number sx
---@return number sy
---@return number sz
function project(wx, wy, wz) end

---@param cameraId integer
---@param aspectRatio number
---@param x number
---@param y number
---@param z number
---@return number x
---@return number y
---@return number z
function projectToCamera(cameraId, aspectRatio, x, y, z) end

---@param x number
---@param y number
---@param z number
---@param nx number
---@param ny number
---@param nz number
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@return integer numShapes
function raycastAll(x, y, z, nx, ny, nz, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param x number
---@param y number
---@param z number
---@param nx number
---@param ny number
---@param nz number
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
function raycastAllAsync(x, y, z, nx, ny, nz, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param origin vector
---@param direction vector
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
function raycastAllAsyncVector(origin, direction, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param origin vector
---@param direction vector
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@return integer numShapes
function raycastAllVector(origin, direction, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param x number
---@param y number
---@param z number
---@param nx number
---@param ny number
---@param nz number
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@return integer numShapes
function raycastClosest(x, y, z, nx, ny, nz, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param x number
---@param y number
---@param z number
---@param nx number
---@param ny number
---@param nz number
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
function raycastClosestAsync(x, y, z, nx, ny, nz, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param origin vector
---@param direction vector
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
function raycastClosestAsyncVector(origin, direction, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param origin vector
---@param direction vector
---@param maxDistance number
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@return integer numShapes
function raycastClosestVector(origin, direction, maxDistance, callbackFunctionName, callbackTargetObject, collisionMask) end

---@param fillPlaneShapeId integer
---@param streamId integer
---@param totalVolume number
---@return boolean success
function readFillPlaneFromStream(fillPlaneShapeId, streamId, totalVolume) end

---@param requestId integer
---@param warnIfInvalid boolean?
function releaseSharedI3DFile(requestId, warnIfInvalid) end

---@param transformId integer
function removeAllDifferentials(transformId) end

---@param triggerNodeId integer
function removeAllTriggers(triggerNodeId) end

---@param audioSource integer
---@param sampleElementIndex integer
function removeAudioSourceSampleElement(audioSource, sampleElementIndex) end

---@param characterIndex integer
function removeCCT(characterIndex) end

---@param transformId integer
function removeFromPhysics(transformId) end

---@param lightId integer
---@param nodeId integer
function removeLightShadowIgnoreShapes(lightId, nodeId) end

---@param lightId integer
---@param shapeId integer
function removeMergedShadowIgnoreShapes(lightId, shapeId) end

---@param shapeId integer
---@param attributeIndex integer
function removeSplineAttribute(shapeId, attributeIndex) end

---@param triggerNodeId integer
---@param callbackId integer?
function removeTrigger(triggerNodeId, callbackId) end

---@param objectId integer
---@param attributeName string
function removeUserAttribute(objectId, attributeName) end

---@param xmlId integer
---@param xmlPath string
---@return boolean success
function removeXMLProperty(xmlId, xmlPath) end

---@param overlayId integer
---@param x number
---@param y number
---@param width number
---@param height number
function renderOverlay(overlayId, x, y, width, height) end

---@param x number
---@param y number
---@param fontSize number
---@param string string
function renderText(x, y, fontSize, string) end

---@param particleSystemId integer
---@param time number?
function resetEmitStartTimer(particleSystemId, time) end

---@param particleSystemId integer
---@param time number?
function resetEmitStopTimer(particleSystemId, time) end

---@param particleSystemId integer
function resetNumOfEmittedParticles(particleSystemId) end

---@param streamedSampleId integer
function resumeStreamedSample(streamedSampleId) end

---@param transformId integer
---@param rotation number
---@param dx number
---@param dy number
---@param dz number
function rotateAboutLocalAxis(transformId, rotation, dx, dy, dz) end

---@param transformId integer
---@param rotation number
---@param axisDirection vector
function rotateAboutLocalAxisVector(transformId, rotation, axisDirection) end

---@param xmlId integer
---@return boolean success
function saveXMLFile(xmlId) end

---@param xmlId integer
---@return string xmlString
function saveXMLFileToMemory(xmlId) end

---@param overlayId integer
---@param maskAlphaOnly boolean
---@param x number
---@param y number
---@param width number
---@param height number
function set2DMaskFromOverlay(overlayId, maskAlphaOnly, x, y, width, height) end

---@param textureId integer
---@param maskAlphaOnly boolean
---@param x number
---@param y number
---@param width number
---@param height number
function set2DMaskFromTexture(textureId, maskAlphaOnly, x, y, width, height) end

---@param transformId integer
---@param angularDamping number
function setAngularDamping(transformId, angularDamping) end

---@param transformId integer
---@param velocityX number
---@param velocityY number
---@param velocityZ number
function setAngularVelocity(transformId, velocityX, velocityY, velocityZ) end

---@param transformId integer
---@param velocity vector
function setAngularVelocityVector(transformId, velocity) end

---@param characterSetId integer
---@param trackId integer
---@param weight number
function setAnimTrackBlendWeight(characterSetId, trackId, weight) end

---@param characterSetId integer
---@param trackId integer
---@param loopState boolean
function setAnimTrackLoopState(characterSetId, trackId, loopState) end

---@param characterSetId integer
---@param trackId integer
---@param speedScale number
function setAnimTrackSpeedScale(characterSetId, trackId, speedScale) end

---@param characterSetId integer
---@param trackId integer
---@param time number
---@param immediateUpdate boolean?
function setAnimTrackTime(characterSetId, trackId, time, immediateUpdate) end

---@param gridMinX number
---@param gridMinY number
---@param gridMinZ number
---@param gridMaxX number
---@param gridMaxY number
---@param gridMaxZ number
---@param gridSize integer
---@param clipDistanceThreshold1 number
---@param clipDistanceThreshold2 number
function setAudioCullingWorldProperties(gridMinX, gridMinY, gridMinZ, gridMaxX, gridMaxY, gridMaxZ, gridSize, clipDistanceThreshold1, clipDistanceThreshold2) end

---@param audioSource integer
---@param autoPlayEnabled boolean
function setAudioSourceAutoPlay(audioSource, autoPlayEnabled) end

---@param audioSource integer
---@param range number
function setAudioSourceInnerRange(audioSource, range) end

---@param audioSource integer
---@param maxRetriggerDelay number
function setAudioSourceMaxRetriggerDelay(audioSource, maxRetriggerDelay) end

---@param audioSource integer
---@param minRetriggerDelay number
function setAudioSourceMinRetriggerDelay(audioSource, minRetriggerDelay) end

---@param audioSource integer
---@param priority integer
function setAudioSourcePriority(audioSource, priority) end

---@param audioSource integer
---@param randomPlayback boolean
function setAudioSourceRandomPlayback(audioSource, randomPlayback) end

---@param audioSource integer
---@param range number
function setAudioSourceRange(audioSource, range) end

---@param audioSource integer
---@param index integer
---@param probability number
function setAudioSourceSampleElementProbability(audioSource, index, probability) end

---@param audioSource integer
---@param tickIfInaudible boolean
function setAudioSourceTickInaudible(audioSource, tickIfInaudible) end

---@param cameraId integer
function setCamera(cameraId) end

---@param characterIndex integer
---@param height number
---@param collisionGroup integer
---@param collisionMask integer
function setCCTHeight(characterIndex, height, collisionGroup, collisionMask) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
function setCenterOfMass(transformId, x, y, z) end

---@param transformId integer
---@param centerOfMass vector
function setCenterOfMassVector(transformId, centerOfMass) end

---@param objectId integer
---@param distance number
function setClipDistance(objectId, distance) end

---@param transformId integer
---@param group integer
---@param mask integer
function setCollisionFilter(transformId, group, mask) end

---@param transformId integer
---@param group integer
function setCollisionFilterGroup(transformId, group) end

---@param transformId integer
---@param mask integer
function setCollisionFilterMask(transformId, mask) end

---@param conditionalAnimationEntityId integer
---@param parameterId integer
---@param value boolean
---@return boolean success
function setConditionalAnimationBoolValue(conditionalAnimationEntityId, parameterId, value) end

---@param conditionalAnimationEntityId integer
---@param parameterId integer
---@param value number
---@return boolean success
function setConditionalAnimationFloatValue(conditionalAnimationEntityId, parameterId, value) end

---@param conditionalAnimationEntityId integer
---@param velocityParmId integer
---@param angularVelocityParmId integer
function setConditionalAnimationSpecificParameterIds(conditionalAnimationEntityId, velocityParmId, angularVelocityParmId) end

---@param conditionalAnimationEntityId integer
---@param time number
function setConditionalAnimationTime(conditionalAnimationEntityId, time) end

---@param gridMinX number
---@param gridMinZ number
---@param gridMaxX number
---@param gridMaxZ number
---@param gridSize integer
function setDecalCullingWorldProperties(gridMinX, gridMinZ, gridMaxX, gridMaxZ, gridSize) end

---@param densityMapSyncerId integer
---@param densityMapId integer
---@param callbackFunctionName string
---@param target object?
function setDensityMapSyncerCellChangedCallback(densityMapSyncerId, densityMapId, callbackFunctionName, target) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
---@param upX number
---@param upY number
---@param upZ number
function setDirection(transformId, x, y, z, upX, upY, upZ) end

---@param transformId integer
---@param direction vector
---@param up vector
function setDirectionVector(transformId, direction, up) end

---@param particleSystemId integer
---@param countScale number
function setEmitCountScale(particleSystemId, countScale) end

---@param particleSystemId integer
---@param emitStartTime number
function setEmitStartTime(particleSystemId, emitStartTime) end

---@param particleSystemId integer
---@param emitStopTime number
function setEmitStopTime(particleSystemId, emitStopTime) end

---@param particleSystemId integer
---@param shapeId integer
function setEmitterShape(particleSystemId, shapeId) end

---@param particleSystemId integer
---@param shape number
function setEmitterShapeVelocityScale(particleSystemId, shape) end

---@param particleSystemId integer
---@param state boolean
function setEmittingState(particleSystemId, state) end

---@param densityMapSyncer integer
---@param densityMapId integer
---@param cellX integer
---@param cellZ integer
---@param enable boolean?
function setEnableDensityMapSyncerCellChangedCallback(densityMapSyncer, densityMapId, cellX, cellZ, enable) end

---@param terrainId integer
---@param cellX integer
---@param cellZ integer
---@param enable boolean?
function setEnableTerrainHeightSyncerCellChangedCallback(terrainId, cellX, cellZ, enable) end

---@param cameraId integer
---@param farClip number
function setFarClip(cameraId, farClip) end

---@param cameraId integer
---@param fastUpdate boolean
function setFastShadowUpdate(cameraId, fastUpdate) end

---@param fillPlaneShapeId integer
---@param physicalSurfAngle number
function setFillPlaneMaxPhysicalSurfaceAngle(fillPlaneShapeId, physicalSurfAngle) end

---@param foliageBendingSystemId integer
---@param rectangleId integer
---@param minX number
---@param maxX number
---@param minZ number
---@param maxZ number
---@param yOffset number
function setFoliageBendingRectangleAttributes(foliageBendingSystemId, rectangleId, minX, maxX, minZ, maxZ, yOffset) end

---@param terrainId integer
---@param foliageBendingSystemId integer
function setFoliageBendingSystem(terrainId, foliageBendingSystemId) end

---@param cameraId integer
---@param fovY number
function setFovY(cameraId, fovY) end

---@param objectId integer
---@param velocity number
function setFrictionVelocity(objectId, velocity) end

---@param transformId integer
---@param hasCollision boolean
function setHasCollision(transformId, hasCollision) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
function setInertiaScale(transformId, x, y, z) end

---@param transformId integer
---@param centerOfMass vector
function setInertiaScaleVector(transformId, centerOfMass) end

---@param transformId integer
---@param isCompound boolean
function setIsCompound(transformId, isCompound) end

---@param transformId integer
---@param isCompoundChild boolean
function setIsCompoundChild(transformId, isCompoundChild) end

---@param shapeId integer
---@param isNonRenderable boolean
function setIsNonRenderable(shapeId, isNonRenderable) end

---@param cameraId integer
---@param isOrthographic boolean
function setIsOrthographic(cameraId, isOrthographic) end

---@param jointIndex integer
---@param axis integer
---@param usePosition boolean
---@param useVelocity boolean
---@param spring number
---@param damping number
---@param forceLimit number
---@param targetRotation number
---@param targetAngularVelocity number
function setJointAngularDrive(jointIndex, axis, usePosition, useVelocity, spring, damping, forceLimit, targetRotation, targetAngularVelocity) end

---@param jointIndex integer
---@param isLinear boolean
---@param isPosition boolean
---@param valueX number
---@param valueY number
---@param valueZ number
---@param angle number
function setJointDrive(jointIndex, isLinear, isPosition, valueX, valueY, valueZ, angle) end

---@param jointIndex integer
---@param axis integer
---@param usePosition boolean
---@param useVelocity boolean
---@param spring number
---@param damping number
---@param forceLimit number
---@param targetPosition number
---@param targetVelocity number
function setJointLinearDrive(jointIndex, axis, usePosition, useVelocity, spring, damping, forceLimit, targetPosition, targetVelocity) end

---@param lightId integer
---@param cone number
function setLightConeAngle(lightId, cone) end

---@param gridMinX number
---@param gridMinY number
---@param gridMinZ number
---@param gridMaxX number
---@param gridMaxY number
---@param gridMaxZ number
---@param gridSize integer
---@param clipDistanceThreshold1 number
---@param clipDistanceThreshold2 number
function setLightCullingWorldProperties(gridMinX, gridMinY, gridMinZ, gridMaxX, gridMaxY, gridMaxZ, gridSize, clipDistanceThreshold1, clipDistanceThreshold2) end

---@param lightId integer
---@param dropoff number
function setLightDropOff(lightId, dropoff) end

---@param lightId integer
---@param ___ies_ string
function setLightIESProfile(lightId, ___ies_) end

---@param lightId integer
---@param range number
function setLightRange(lightId, range) end

---@param lightId integer
---@param red number
---@param green number
---@param blue number
function setLightScatteringColor(lightId, red, green, blue) end

---@param lightId integer
---@param scattering number
function setLightScatteringConeAngle(lightId, scattering) end

---@param lightId integer
---@param dirX number
---@param dirY number
---@param dirZ number
function setLightScatteringDirection(lightId, dirX, dirY, dirZ) end

---@param lightId integer
---@param scattering number
function setLightScatteringIntensity(lightId, scattering) end

---@param lightId integer
---@param extrusion number
function setLightShadowExtrusionDistance(lightId, extrusion) end

---@param lightId integer
---@param castShowMap boolean
---@param depthMapResolution integer
function setLightShadowMap(lightId, castShowMap, depthMapResolution) end

---@param lightId integer
---@param shadowPriority number
function setLightShadowPriority(lightId, shadowPriority) end

---@param lightId integer
---@param softShadowDistance number
function setLightSoftShadowDepthBiasFactor(lightId, softShadowDistance) end

---@param lightId integer
---@param softShadowDistance number
function setLightSoftShadowDistance(lightId, softShadowDistance) end

---@param lightId integer
---@param softShadowSize number
function setLightSoftShadowSize(lightId, softShadowSize) end

---@param lightId integer
---@param useLightScattering boolean
function setLightUseLightScattering(lightId, useLightScattering) end

---@param transformId integer
---@param linearDamping number
function setLinearDamping(transformId, linearDamping) end

---@param transformId integer
---@param velocityX number
---@param velocityY number
---@param velocityZ number
function setLinearVelocity(transformId, velocityX, velocityY, velocityZ) end

---@param transformId integer
---@param velocity vector
function setLinearVelocityVector(transformId, velocity) end

---@param transformId integer
---@param locked boolean
function setLockedGroup(transformId, locked) end

---@param transformId integer
---@param mass number
function setMass(transformId, mass) end

---@param shapeId integer
---@param material integer
---@param materialIndex integer
function setMaterial(shapeId, material, materialIndex) end

---@param materialId integer
---@param name string
---@param filename string
---@param textueWrap boolean?
---@param isSRGB boolean?
---@param sharedEdit boolean?
---@return integer newMaterialId
function setMaterialCustomMapFromFile(materialId, name, filename, textueWrap, isSRGB, sharedEdit) end

---@param materialId integer
---@param name string
---@param x number
---@param y number
---@param z number
---@param w number
---@param sharedEdit boolean?
---@return integer newMaterialId
function setMaterialCustomParameter(materialId, name, x, y, z, w, sharedEdit) end

---@param materialId integer
---@param shaderVariationName string
---@param sharedEdit boolean
---@return integer newMaterialId
function setMaterialCustomShaderVariation(materialId, shaderVariationName, sharedEdit) end

---@param materialId integer
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer newMaterialId
function setMaterialDiffuseMapFromFile(materialId, filename, textueWrap, isSRGB, sharedEdit) end

---@param materialId integer
---@param name string
---@param size integer
---@param sharedEdit boolean?
---@return integer newMaterialId
function setMaterialDynamicArrayOfTextureSize(materialId, name, size, sharedEdit) end

---@param materialId integer
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer newMaterialId
function setMaterialGlossMapFromFile(materialId, filename, textueWrap, isSRGB, sharedEdit) end

---@param materialId integer
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer newMaterialId
function setMaterialNormalMapFromFile(materialId, filename, textueWrap, isSRGB, sharedEdit) end

---@param shapeId integer
---@param materialIndex integer
---@param slotName string
function setMaterialSlotName(shapeId, materialIndex, slotName) end

---@param particleSystemId integer
---@param maxNumParticles integer
function setMaxNumOfParticles(particleSystemId, maxNumParticles) end

---@param lightId integer
---@param shouldEnable boolean
function setMergedShadowActive(lightId, shouldEnable) end

---@param lightId integer
---@param lightSize number
function setMergedShadowLightSize(lightId, lightSize) end

---@param lightId integer
---@param nearPlane number
function setMergedShadowNearPlaneOffset(lightId, nearPlane) end

---@param lightId integer
---@param depthBias number?
---@param slopeScaleDepthBias number?
---@param slopeScaleDepthClamp number?
---@param shadowMapResolution integer?
function setMergedShadowSettings(lightId, depthBias, slopeScaleDepthBias, slopeScaleDepthClamp, shadowMapResolution) end

---@param lightId integer
---@param shadowSettingsLightId integer
function setMergedShadowSettingsLight(lightId, shadowSettingsLightId) end

---@param objectId integer
---@param minDist number
function setMinClipDistance(objectId, minDist) end

---@param entityId integer
---@param entityName string
function setName(entityId, entityName) end

---@param cameraId integer
---@param nearClip number
function setNearClip(cameraId, nearClip) end

---@param noteId integer
---@param colorR number
---@param colorG number
---@param colorB number
function setNoteNodeColor(noteId, colorR, colorG, colorB) end

---@param noteId integer
---@param fixedSize boolean
function setNoteNodeFixedSize(noteId, fixedSize) end

---@param noteId integer
---@param text string
function setNoteNodeText(noteId, text) end

---@param particleSystemId integer
---@param emittedParticlesPerMs number
function setNumOfParticlesToEmitPerMs(particleSystemId, emittedParticlesPerMs) end

---@param objectId integer
---@param mask integer
function setObjectMask(objectId, mask) end

---@param cameraId integer
---@param orthographicHeight number
function setOrthographicHeight(cameraId, orthographicHeight) end

---@param overlayId integer
---@param red number
---@param green number
---@param blue number
---@param alpha number
function setOverlayColor(overlayId, red, green, blue, alpha) end

---@param overlayId integer
---@param cornerIndex integer
---@param red number
---@param green number
---@param blue number
---@param alpha number
function setOverlayCornerColor(overlayId, cornerIndex, red, green, blue, alpha) end

---@param overlayId integer
---@param layer integer
function setOverlayLayer(overlayId, layer) end

---@param overlayId integer
---@param rotation number
---@param pivotX number
---@param pivotY number
function setOverlayRotation(overlayId, rotation, pivotX, pivotY) end

---@param overlayId integer
---@param sdfWidth number
function setOverlaySignedDistanceFieldWidth(overlayId, sdfWidth) end

---@param overlayId integer
---@param u0 number
---@param v0 number
---@param u1 number
---@param v1 number
---@param u2 number
---@param v2 number
---@param u3 number
---@param v3 number
function setOverlayUVs(overlayId, u0, v0, u1, v1, u2, v2, u3, v3) end

---@param particleSystemId integer
---@param nodeId integer
function setParticleShape(particleSystemId, nodeId) end

---@param particleSystemEntityId integer
---@param damping number
function setParticleSystemDamping(particleSystemEntityId, damping) end

---@param particleSystemId integer
---@param lifeSpan number
---@param keepBlendTimes boolean
function setParticleSystemLifespan(particleSystemId, lifeSpan, keepBlendTimes) end

---@param particleSystemEntityId integer
---@param normalSpeed number
function setParticleSystemNormalSpeed(particleSystemEntityId, normalSpeed) end

---@param particleSystemId integer
---@param speed number
function setParticleSystemSpeed(particleSystemId, speed) end

---@param particleSystemEntityId integer
---@param speedRandom number
function setParticleSystemSpeedRandom(particleSystemEntityId, speedRandom) end

---@param particleSystemEntityId integer
---@param spriteScaleX number
function setParticleSystemSpriteScaleX(particleSystemEntityId, spriteScaleX) end

---@param particleSystemEntityId integer
---@param spriteScaleXGain number
function setParticleSystemSpriteScaleXGain(particleSystemEntityId, spriteScaleXGain) end

---@param particleSystemEntityId integer
---@param spriteScaleY number
function setParticleSystemSpriteScaleY(particleSystemEntityId, spriteScaleY) end

---@param particleSystemEntityId integer
---@param spriteScaleYGain number
function setParticleSystemSpriteScaleYGain(particleSystemEntityId, spriteScaleYGain) end

---@param particleSystemEntityId integer
---@param tangentSpeed number
function setParticleSystemTangentSpeed(particleSystemEntityId, tangentSpeed) end

---@param particleSystemId integer
---@param timeScale number
function setParticleSystemTimeScale(particleSystemId, timeScale) end

---@param fillPlaneShapeId integer
---@param polyLineIdx integer
---@param dx number
---@param dz number
function setPolylineTranslation(fillPlaneShapeId, polyLineIdx, dx, dz) end

---@param cameraId integer
---@param x number
---@param y number
function setProjectionOffset(cameraId, x, y) end

---@param objectId integer
---@param x number
---@param y number
---@param z number
---@param w number
function setQuaternion(objectId, x, y, z, w) end

---@param precipitationEntity integer
---@param rain number
function setRainActiveDropsMultiplier(precipitationEntity, rain) end

---@param multiplier number
function setRainAmountMultiplier(multiplier) end

---@param precipitationEntity integer
---@param randomfactor number
function setRainBounceRandomFactor(precipitationEntity, randomfactor) end

---@param precipitationEntity integer
---@param restitution number
function setRainBounceRestitution(precipitationEntity, restitution) end

---@param precipitationEntity integer
---@param multiplier number
function setRainCameraVelocityMultiplier(precipitationEntity, multiplier) end

---@param precipitationEntity integer
---@param tolerance number
function setRainHeightmapCollisionThreshold(precipitationEntity, tolerance) end

---@param precipitationEntity integer
---@param bounces integer
function setRainMaxBounces(precipitationEntity, bounces) end

---@param precipitationEntity integer
---@param max number
function setRainMaxDropsMultiplier(precipitationEntity, max) end

---@param precipitationGeometry integer
---@param shallowWaterSim integer
function setRainShallowWaterSimulation(precipitationGeometry, shallowWaterSim) end

---@param precipitationEntity integer
---@param spawnHeight number
---@param boxWidth number
---@param boxDepth number
function setRainSpawnBoxParameters(precipitationEntity, spawnHeight, boxWidth, boxDepth) end

---@param precipitationEntity integer
---@param velocityX number
---@param velocityY number
---@param velocityZ number
function setRainSpawnVelocity(precipitationEntity, velocityX, velocityY, velocityZ) end

---@param precipitationEntity integer
---@param turbulence number
---@param timeScale number
---@param pulsePeriod number
---@param frequency number
function setRainTurbulenceParameters(precipitationEntity, turbulence, timeScale, pulsePeriod, frequency) end

---@param precipitationGeometry integer
---@param weatherType integer
function setRainWeatherType(precipitationGeometry, weatherType) end

---@param precipitationEntity integer
---@param forceX number
---@param forceZ number
function setRainWindForce(precipitationEntity, forceX, forceZ) end

---@param shapeId integer
---@param scale number
---@param shared boolean
function setReflectionMapScaling(shapeId, scale, shared) end

---@param transformId integer
---@param type integer
function setRigidBodyType(transformId, type) end

---@param transformId integer
function setRootNode(transformId) end

---@param objectId integer
---@param x number
---@param y number
---@param z number
function setRotation(objectId, x, y, z) end

---@param transformId integer
---@param rotation vector
function setRotationVector(transformId, rotation) end

---@param sampleId integer
---@param pitch number
function setSamplePitch(sampleId, pitch) end

---@param sampleId integer
---@param x number
---@param y number
---@param z number
function setSampleVelocity(sampleId, x, y, z) end

---@param sampleId integer
---@param volume number
function setSampleVolume(sampleId, volume) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
function setScale(transformId, x, y, z) end

---@param transformId integer
---@param scale vector
function setScaleVector(transformId, scale) end

---@param shapeId integer
---@param parameterName string
---@param x number?
---@param y number?
---@param z number?
---@param w number?
---@param shared boolean?
---@param materialIndex integer?
function setShaderParameter(shapeId, parameterName, x, y, z, w, shared, materialIndex) end

---@param transformId integer
---@param parameterName string
---@param x number?
---@param y number?
---@param z number?
---@param w number?
---@param shared boolean?
---@param materialIndex integer?
function setShaderParameterRecursive(transformId, parameterName, x, y, z, w, shared, materialIndex) end

---@param shapeId integer
function setShadowFocusBox(shapeId) end

---@param shallowWaterSimulation integer
---@param height number
function setShallowWaterSimulationFakeExtraDepth(shallowWaterSimulation, height) end

---@param shallowWaterSimulation integer
---@param foam number
function setShallowWaterSimulationFoamAccumulationRate(shallowWaterSimulation, foam) end

---@param shallowWaterSimulation integer
---@param foam number
function setShallowWaterSimulationFoamDecayRate(shallowWaterSimulation, foam) end

---@param shallowWaterSimulation integer
---@param textureId integer
function setShallowWaterSimulationGroundHeightTexture(shallowWaterSimulation, textureId) end

---@param shallowWaterSimulation integer
---@param terrainTransformGroup integer
function setShallowWaterSimulationGroundHeightTextureFromTerrain(shallowWaterSimulation, terrainTransformGroup) end

---@param shallowWaterSimulation integer
---@param deltaTime number
---@param externalAcceleration number
---@param velocityDampening number
function setShallowWaterSimulationParameters(shallowWaterSimulation, deltaTime, externalAcceleration, velocityDampening) end

---@param shallowWaterSimulation integer
---@param dampeningFactor number
---@param lambdaUpdateFactor number
---@param lambdaDecay number
---@param borderSize integer
---@param isCubicScaling boolean
---@param leftBorder boolean
---@param rightBorder boolean
---@param bottomBorder boolean
---@param topBorder boolean
function setShallowWaterSimulationPerfectlyMatchedLayerParameters(shallowWaterSimulation, dampeningFactor, lambdaUpdateFactor, lambdaDecay, borderSize, isCubicScaling, leftBorder, rightBorder, bottomBorder, topBorder) end

---@param shallowWaterSimulation integer
---@param width number
---@param height number
function setShallowWaterSimulationPhysicalGridSize(shallowWaterSimulation, width, height) end

---@param shallowWaterSimulation integer
---@param x number
---@param z number
---@return number ax
---@return number az
function setShallowWaterSimulationWorldPosition(shallowWaterSimulation, x, z) end

---@param shapeId integer
---@param newRootBoneId integer
---@param oldRootBoneId integer
---@param keepBindPoses boolean?
---@return boolean success
function setShapeBones(shapeId, newRootBoneId, oldRootBoneId, keepBindPoses) end

---@param shapeId integer
---@param sourceShapeId integer
---@return boolean success
function setShapeBonesFromShape(shapeId, sourceShapeId) end

---@param shapeId integer
---@param localPosX number
---@param localPosY number
---@param localPosZ number
---@param radius number
function setShapeBoundingSphere(shapeId, localPosX, localPosY, localPosZ, radius) end

---@param shapeId integer
---@param mask integer
function setShapeBuildNavMeshMask(shapeId, mask) end

---@param shapeId integer
---@param castShadowmap boolean
function setShapeCastShadowmap(shapeId, castShadowmap) end

---@param gridMinX number
---@param gridMinY number
---@param gridMinZ number
---@param gridMaxX number
---@param gridMaxY number
---@param gridMaxZ number
---@param gridSize integer
---@param clipDistanceThreshold1 number
---@param clipDistanceThreshold2 number
function setShapeCullingWorldProperties(gridMinX, gridMinY, gridMinZ, gridMaxX, gridMaxY, gridMaxZ, gridSize, clipDistanceThreshold1, clipDistanceThreshold2) end

---@param shapeId integer
---@param decalLayer integer
function setShapeDecalLayer(shapeId, decalLayer) end

---@param shapeId integer
---@param localPosX number
---@param localPosY number
---@param localPosZ number
---@param radius number
function setShapeGeometryBoundingSphere(shapeId, localPosX, localPosY, localPosZ, radius) end

---@param shapeId integer
---@param receiveShadowmap boolean
function setShapeReceiveShadowmap(shapeId, receiveShadowmap) end

---@param transformId integer
---@param count integer
function setSolverIterationCount(transformId, count) end

---@param shapeId integer
---@param attributeIndex integer
---@param CVIndex integer
---@param value number
function setSplineAttributeAtCV(shapeId, attributeIndex, CVIndex, value) end

---@param shapeId integer
---@param index integer
---@param x number
---@param y number
---@param z number
function setSplineCV(shapeId, index, x, y, z) end

---@param shapeId integer
---@param index integer
---@param position vector
function setSplineCVVector(shapeId, index, position) end

---@param shapeId integer
---@param index integer
---@param x number
---@param y number
---@param z number
function setSplineEP(shapeId, index, x, y, z) end

---@param shapeId integer
---@param index integer
---@param position vector
function setSplineEPVector(shapeId, index, position) end

---@param streamedSampleId integer
---@param group integer
function setStreamedSampleGroup(streamedSampleId, group) end

---@param streamedSampleId integer
---@param volume number
function setStreamedSampleVolume(streamedSampleId, volume) end

---@param minDelay number
---@param maxDelay number
function setStreamI3DFileDelay(minDelay, maxDelay) end

---@param minDelay number
---@param maxDelay number
---@param minDelayCached number
---@param maxDelayCached number
function setStreamSharedI3DFileDelay(minDelay, maxDelay, minDelayCached, maxDelayCached) end

---@param fillDataPlaneId integer
---@param fillType integer
---@param firstFillLevel integer
---@param firstMappedFillLevel number
---@param lastFillLevel integer?
---@param lastMappedFillLevel number?
function setTerrainFillVisualHeight(fillDataPlaneId, fillType, firstFillLevel, firstMappedFillLevel, lastFillLevel, lastMappedFillLevel) end

---@param terrainId integer
---@param x number
---@param y number
---@param z number
---@param height number
function setTerrainHeightAtWorldPos(terrainId, x, y, z, height) end

---@param terrainId integer
---@param callbackFunctionName string
---@param numCellsPerSide integer
---@param target object?
function setTerrainHeightSyncerCellChangedCallback(terrainId, callbackFunctionName, numCellsPerSide, target) end

---@param alignment integer
function setTextAlignment(alignment) end

---@param isBold boolean
function setTextBold(isBold) end

---@param clipMinX number
---@param clipMinY number
---@param clipMaxX number
---@param clipMaxY number
function setTextClipArea(clipMinX, clipMinY, clipMaxX, clipMaxY) end

---@param r number
---@param g number
---@param b number
---@param a number
function setTextColor(r, g, b, a) end

---@param depthCheckEnabled boolean
function setTextDepthTestEnabled(depthCheckEnabled) end

---@param indentation number
function setTextFirstLineIndentation(indentation) end

---@param startLine integer
---@param numLines integer
function setTextLineBounds(startLine, numLines) end

---@param lineHeightScale number
function setTextLineHeightScale(lineHeightScale) end

---@param rotation number
---@param rotationCenterX number?
---@param rotationCenterY number?
function setTextRotation(rotation, rotationCenterX, rotationCenterY) end

---@param verticalAlignment integer
function setTextVerticalAlignment(verticalAlignment) end

---@param scaleWidth number
function setTextWidthScale(scaleWidth) end

---@param wrapWidth number
---@param allowForcedWrap boolean?
function setTextWrapWidth(wrapWidth, allowForcedWrap) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
function setTranslation(transformId, x, y, z) end

---@param transformId integer
---@param translation vector
function setTranslationVector(transformId, translation) end

---@param triggerNodeId integer
---@param reportStatics boolean
function setTriggerReportStatics(triggerNodeId, reportStatics) end

---@param objectId integer
---@param name string
---@param type integer?
---@param value any?
function setUserAttribute(objectId, name, type, value) end

---@param transformId integer
---@param visibility boolean
function setVisibility(transformId, visibility) end

---@param objectId integer
---@param dayOfYearStart integer
---@param dayOfYearEnd integer
function setVisibilityConditionDayOfYear(objectId, dayOfYearStart, dayOfYearEnd) end

---@param objectId integer
---@param minuteOfDayStart integer
---@param minuteOfDayEnd integer
function setVisibilityConditionMinuteOfDay(objectId, minuteOfDayStart, minuteOfDayEnd) end

---@param objectId integer
---@param renderInvisible boolean
function setVisibilityConditionRenderInvisible(objectId, renderInvisible) end

---@param objectId integer
---@param viewerSpacialityRequiredMask integer
---@param viewerSpacialityPreventMask integer
function setVisibilityConditionViewerSpacialityMask(objectId, viewerSpacialityRequiredMask, viewerSpacialityPreventMask) end

---@param objectId integer
---@param shaderVisibilityParam number
function setVisibilityConditionVisibleShaderParameter(objectId, shaderVisibilityParam) end

---@param objectId integer
---@param weatherRequiredMask integer
---@param weatherPreventMask integer
function setVisibilityConditionWeatherMask(objectId, weatherRequiredMask, weatherPreventMask) end

---@param wetness number
function setWetness(wetness) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param dirX number
---@param dirY number
---@param dirZ number
---@param axleX number
---@param axleY number
---@param axleZ number
function setWheelShapeDirection(transformId, wheelShapeIndex, dirX, dirY, dirZ, axleX, axleY, axleZ) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param dir vector
---@param axle vector
function setWheelShapeDirectionVector(transformId, wheelShapeIndex, dir, axle) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param positionX number
---@param positionY number
---@param positionZ number
function setWheelShapeForcePoint(transformId, wheelShapeIndex, positionX, positionY, positionZ) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param position vector
function setWheelShapeForcePointVector(transformId, wheelShapeIndex, position) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param motorTorque number
---@param brakeTorque number
---@param steerAngle number
---@param rotationDamping number
function setWheelShapeProps(transformId, wheelShapeIndex, motorTorque, brakeTorque, steerAngle, rotationDamping) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param positionX number
---@param positionY number
---@param positionZ number
function setWheelShapeSteeringCenter(transformId, wheelShapeIndex, positionX, positionY, positionZ) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param position vector
function setWheelShapeSteeringCenterVector(transformId, wheelShapeIndex, position) end

---@param transformId integer
---@param wheelShapeIndex integer
---@param maxLongStiffness number
---@param maxLatStiffness number
---@param maxLatStiffnessTireLoad number
---@param frictionMultiplier number
function setWheelShapeTireFriction(transformId, wheelShapeIndex, maxLongStiffness, maxLatStiffness, maxLatStiffnessTireLoad, frictionMultiplier) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
---@param upX number
---@param upY number
---@param upZ number
function setWorldDirection(transformId, x, y, z, upX, upY, upZ) end

---@param transformId integer
---@param direction vector
---@param up vector
function setWorldDirectionVector(transformId, direction, up) end

---@param objectId integer
---@param x number
---@param y number
---@param z number
---@param w number
function setWorldQuaternion(objectId, x, y, z, w) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
function setWorldRotation(transformId, x, y, z) end

---@param transformId integer
---@param rotation vector
function setWorldRotationVector(transformId, rotation) end

---@param transformId integer
---@param wx number
---@param wy number
---@param wz number
function setWorldTranslation(transformId, wx, wy, wz) end

---@param transformId integer
---@param translation vector
function setWorldTranslationVector(transformId, translation) end

---@param xmlId integer
---@param nodePath string
---@param value boolean
function setXMLBool(xmlId, nodePath, value) end

---@param xmlId integer
---@param nodePath string
---@param value number
function setXMLFloat(xmlId, nodePath, value) end

---@param xmlId integer
---@param nodePath string
---@param value integer
function setXMLInt(xmlId, nodePath, value) end

---@param xmlId integer
---@param nodePath string
---@param value string
function setXMLString(xmlId, nodePath, value) end

---@param xmlId integer
---@param nodePath string
---@param value integer
function setXMLUInt(xmlId, nodePath, value) end

---@param shallowWaterSimulation integer
---@param waterGeometry integer
function shallowWaterSimulationAddWaterPlaneGeometry(shallowWaterSimulation, waterGeometry) end

---@param shallowWaterSimulation integer
---@param obstacleIndex integer
---@param x number
---@param z number
---@param width number
---@param height number
---@param angle number
---@param velocityX number
---@param velocityY number
---@param yPosition number
function shallowWaterSimulationPaintCustomObstacle(shallowWaterSimulation, obstacleIndex, x, z, width, height, angle, velocityX, velocityY, yPosition) end

---@param shallowWaterSimulation integer
---@param obstacleIndex integer
---@param x number
---@param z number
---@param width number
---@param height number
---@param angle number
---@param velocityX number
---@param velocityZ number
---@param yPosition number
function shallowWaterSimulationPaintCustomObstacleEllipse(shallowWaterSimulation, obstacleIndex, x, z, width, height, angle, velocityX, velocityZ, yPosition) end

---@param shallowWaterSimulation integer
---@param x number
---@param y number
---@param radius number
---@param value number
---@param paintHeight number?
function shallowWaterSimulationPaintDepthCircle(shallowWaterSimulation, x, y, radius, value, paintHeight) end

---@param shallowWaterSimulation integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param value number
---@param paintHeight number?
function shallowWaterSimulationPaintDepthRect(shallowWaterSimulation, x, y, width, height, value, paintHeight) end

---@param shallowWaterSimulation integer
---@param sourceIndex integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param angle number
---@param depth number
function shallowWaterSimulationPaintDepthSource(shallowWaterSimulation, sourceIndex, x, y, width, height, angle, depth) end

---@param shallowWaterSimulation integer
---@param x number
---@param y number
---@param radius number
---@param velocityX number
---@param velocityY number
---@param paintHeight number?
function shallowWaterSimulationPaintVelocityCircle(shallowWaterSimulation, x, y, radius, velocityX, velocityY, paintHeight) end

---@param shallowWaterSimulation integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param velocityX number
---@param velocityY number
---@param paintHeight number?
function shallowWaterSimulationPaintVelocityRect(shallowWaterSimulation, x, y, width, height, velocityX, velocityY, paintHeight) end

---@param shallowWaterSimulation integer
---@param waterGeometry integer
function shallowWaterSimulationRemoveWaterPlaneGeometry(shallowWaterSimulation, waterGeometry) end

---@param shallowWaterSimulation integer
function shallowWaterSimulationResetSimulation(shallowWaterSimulation) end

---@param shallowWaterSimulation integer
---@param numDepthSource integer
function shallowWaterSimulationSetNumDepthSources(shallowWaterSimulation, numDepthSource) end

---@param shallowWaterSimulation integer
---@param x integer
---@param y integer
function shallowWaterSimulationTranslateSimulation(shallowWaterSimulation, x, y) end

---@param state boolean
function simulatePhysics(state) end

---@param scale number
function simulatePhysicsTimeScale(scale) end

---@param filename string
---@param environment ref?
function source(filename, environment) end

---@param lightId integer
function splitLightShadow(lightId) end

function startDebugging() end

function stopDebugging() end

---@param sampleId integer
---@param delay number
---@param fadeTime number
function stopSample(sampleId, delay, fadeTime) end

---@param streamedSampleId integer
function stopStreamedSample(streamedSampleId) end

---@param streamId integer
function streamAlignReadToByteBoundary(streamId) end

---@param streamId integer
function streamAlignWriteToByteBoundary(streamId) end

---@param streamId integer
---@return integer value
function streamGetNumOfUnreadBits(streamId) end

---@param streamId integer
---@return integer offset
function streamGetReadOffset(streamId) end

---@param streamId integer
---@return integer offset
function streamGetWriteOffset(streamId) end

---@param filename string
---@param callbackFunctionName string?
---@param callbackTarget object?
---@param arguments object?
---@param addPhysics boolean?
---@param callOnCreate boolean?
---@param verbose boolean?
---@return integer requestId
function streamI3DFile(filename, callbackFunctionName, callbackTarget, arguments, addPhysics, callOnCreate, verbose) end

---@param streamId integer
---@return boolean value
function streamReadBool(streamId) end

---@param streamId integer
---@return number value
function streamReadFloat32(streamId) end

---@param streamId integer
---@return integer value
function streamReadInt16(streamId) end

---@param streamId integer
---@return integer value
function streamReadInt32(streamId) end

---@param streamId integer
---@return integer value
function streamReadInt8(streamId) end

---@param streamId integer
---@param numberofBits integer
---@return integer value
function streamReadIntN(streamId, numberofBits) end

---@param streamId integer
---@return integer timestamp
function streamReadManualTimestamp(streamId) end

---@param streamId integer
---@return string value
function streamReadString(streamId) end

---@param streamId integer
---@return integer uint16
function streamReadUInt16(streamId) end

---@param streamId integer
---@return integer value
function streamReadUInt32(streamId) end

---@param streamId integer
---@return integer uint8
function streamReadUInt8(streamId) end

---@param streamId integer
---@param numberOfBits integer
---@return integer value
function streamReadUIntN(streamId, numberOfBits) end

---@param streamId integer
---@param offset integer
function streamSetReadOffset(streamId, offset) end

---@param streamId integer
---@param offset integer
function streamSetWriteOffset(streamId, offset) end

---@param filename string
---@param callbackFunctionName string?
---@param callbackTarget object?
---@param arguments object?
---@param addPhysics boolean?
---@param callOnCreate boolean?
---@param verbose boolean?
---@return integer requestId
function streamSharedI3DFile(filename, callbackFunctionName, callbackTarget, arguments, addPhysics, callOnCreate, verbose) end

---@param streamId integer
---@param value boolean
---@return boolean value
function streamWriteBool(streamId, value) end

---@param streamId integer
---@param value number
function streamWriteFloat32(streamId, value) end

---@param streamId integer
---@param value integer
function streamWriteInt16(streamId, value) end

---@param streamId integer
---@param value integer
function streamWriteInt32(streamId, value) end

---@param streamId integer
---@param value integer
function streamWriteInt8(streamId, value) end

---@param streamId integer
---@param value integer
---@param numberOfBits integer
function streamWriteIntN(streamId, value, numberOfBits) end

---@param streamId integer
---@param timestamp integer
function streamWriteManualTimestamp(streamId, timestamp) end

---@param streamId integer
---@param streamSrcId integer
---@param numBits integer
---@param useReadStream boolean
function streamWriteStream(streamId, streamSrcId, numBits, useReadStream) end

---@param streamId integer
---@param value string
function streamWriteString(streamId, value) end

---@param streamId integer
function streamWriteTimestamp(streamId) end

---@param streamId integer
---@param value integer
function streamWriteUInt16(streamId, value) end

---@param streamId integer
---@param value integer
function streamWriteUInt32(streamId, value) end

---@param streamId integer
---@param uint8 integer
function streamWriteUInt8(streamId, uint8) end

---@param streamId integer
---@param value integer
---@param numberofBits integer
function streamWriteUIntN(streamId, value, numberofBits) end

---@param center vector
---@param rotation vector
---@param halfExtents vector
---@param direction vector
---@param maxDistance number
---@param callbackFunction object?
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param closestShapeOnly boolean?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
function sweepBoxAsyncVector(center, rotation, halfExtents, direction, maxDistance, callbackFunction, callbackFunctionName, callbackTargetObject, collisionMask, closestShapeOnly, includeDynamics, includeKinematics, includeStatics) end

---@param center vector
---@param rotation vector
---@param halfExtents vector
---@param direction vector
---@param maxDistance number
---@param callbackFunction object?
---@param callbackFunctionName string
---@param callbackTargetObject object?
---@param collisionMask integer?
---@param closestShapeOnly boolean?
---@param includeDynamics boolean?
---@param includeKinematics boolean?
---@param includeStatics boolean?
---@return integer numShapes
function sweepBoxVector(center, rotation, halfExtents, direction, maxDistance, callbackFunction, callbackFunctionName, callbackTargetObject, collisionMask, closestShapeOnly, includeDynamics, includeKinematics, includeStatics) end

---@param cameraId integer
---@param x number
---@param y number
---@param z number
---@return number x
---@return number y
---@return number z
function transformToViewSpace(cameraId, x, y, z) end

---@param unicode integer
---@return string utf8string
function unicodeToUtf8(unicode) end

---@param objectId integer
function unlink(objectId) end

---@param filename string
function unpinSharedI3DFileInCache(filename) end

---@param sx number
---@param sy number
---@param sz number
---@return number wx
---@return number wy
---@return number wz
function unProject(sx, sy, sz) end

---@param conditionalAnimationEntityId integer
---@param dt number
function updateConditionalAnimation(conditionalAnimationEntityId, dt) end

---@param transformId integer
---@param index integer
---@param ratio number
---@param bias number
function updateDifferential(transformId, index, ratio, bias) end

---@param shallowWaterSimulation integer
---@param simulatedTime number
function updateShallowWaterSimulation(shallowWaterSimulation, simulatedTime) end

---@param utf8string1 string
---@param utf8string2 string
---@param languageId integer?
---@return integer result
function utf8Compare(utf8string1, utf8string2, languageId) end

---@param utf8string string
---@return integer length
function utf8Strlen(utf8string) end

---@param utf8string string
---@param startIndex integer
---@param length integer?
---@return string subString
function utf8Substr(utf8string, startIndex, length) end

---@param utf8string string
---@return string utf8string
function utf8ToLower(utf8string) end

---@param utf8string string
---@return integer unicode
---@return integer utf8Len
function utf8ToUnicode(utf8string) end

---@param utf8string string
---@return string utf8string
function utf8ToUpper(utf8string) end

---@param connectionId integer
function voiceChatRemoveConnection(connectionId) end

---@param transformId integer
---@param wdx number
---@param wdy number
---@param wdz number
---@return number ldx
---@return number ldy
---@return number ldz
function worldDirectionToLocal(transformId, wdx, wdy, wdz) end

---@param transformId integer
---@param worldDirection vector
---@return vector localDirection
function worldDirectionToLocalVector(transformId, worldDirection) end

---@param transformId integer
---@param wrx number
---@param wry number
---@param wrz number
---@return number lrx
---@return number lry
---@return number lrz
function worldRotationToLocal(transformId, wrx, wry, wrz) end

---@param transformId integer
---@param worldRotation vector
---@return vector localRotation
function worldRotationToLocalVector(transformId, worldRotation) end

---@param transformId integer
---@param wx number
---@param wy number
---@param wz number
---@return number lx
---@return number ly
---@return number lz
function worldToLocal(transformId, wx, wy, wz) end

---@param transformId integer
---@param world vector
---@return vector local_
function worldToLocalVector(transformId, world) end

---@param fillPlaneShapeId integer
---@param streamId integer
---@return boolean success
function writeFillPlaneToStream(fillPlaneShapeId, streamId) end
