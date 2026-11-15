---@meta
-- FS25 1.25.1.0 : relevé en jeu, absent des sources du SDK (types inconnus)

---@class WildlifeWanderState
WildlifeWanderState = {}

function WildlifeWanderState:addTransition(...) end
function WildlifeWanderState:caclulateDebugScreenBounds(...) end
function WildlifeWanderState:calculateIfShouldBeForced(...) end
function WildlifeWanderState:calculateIfValidEntryState(...) end
function WildlifeWanderState.canStartWandering(...) end
function WildlifeWanderState.class(...) end
function WildlifeWanderState.copy(...) end
function WildlifeWanderState.createTransitions(...) end
function WildlifeWanderState:debugDraw(...) end
function WildlifeWanderState:debugDrawTransitions(...) end
function WildlifeWanderState.hasFinishedWandering(...) end
function WildlifeWanderState.initialiseToSpecies(...) end
function WildlifeWanderState.isa(...) end
function WildlifeWanderState.loadAttributesTable(...) end
function WildlifeWanderState:loadDebugInfoFromXMLFile(...) end
function WildlifeWanderState.new(...) end
function WildlifeWanderState.onInstanceDespawned(...) end
function WildlifeWanderState.onInstanceSpawned(...) end
function WildlifeWanderState.onMovementTargetReached(...) end
function WildlifeWanderState.onStateEntered(...) end
function WildlifeWanderState.onStateExited(...) end
function WildlifeWanderState.onTargetCallback(...) end
function WildlifeWanderState.randomlySetTarget(...) end
function WildlifeWanderState.registerXMLPaths(...) end
function WildlifeWanderState.superClass(...) end
function WildlifeWanderState:trySwitchToValidTransition(...) end
function WildlifeWanderState.updateAsCurrent(...) end
function WildlifeWanderState:updateAsInactive(...) end
