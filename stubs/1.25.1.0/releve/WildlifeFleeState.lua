---@meta
-- FS25 1.25.1.0 : in-game scan, missing from the SDK sources (types unknown)

---@class WildlifeFleeState
WildlifeFleeState = {}

function WildlifeFleeState:addTransition(...) end
function WildlifeFleeState:caclulateDebugScreenBounds(...) end
function WildlifeFleeState.calculateIfShouldBeForced(...) end
function WildlifeFleeState.calculateIfShouldFlee(...) end
function WildlifeFleeState:calculateIfValidEntryState(...) end
function WildlifeFleeState.class(...) end
function WildlifeFleeState.copy(...) end
function WildlifeFleeState:createTransitions(...) end
function WildlifeFleeState:debugDraw(...) end
function WildlifeFleeState:debugDrawTransitions(...) end
function WildlifeFleeState.fleeFromPlayer(...) end
function WildlifeFleeState.fleeInDirection(...) end
function WildlifeFleeState.fleeToDespawn(...) end
function WildlifeFleeState.isa(...) end
function WildlifeFleeState.loadAttributesTable(...) end
function WildlifeFleeState:loadDebugInfoFromXMLFile(...) end
function WildlifeFleeState.new(...) end
function WildlifeFleeState.onInstanceDespawned(...) end
function WildlifeFleeState.onInstanceSpawned(...) end
function WildlifeFleeState.onMovementTargetReached(...) end
function WildlifeFleeState.onStateEntered(...) end
function WildlifeFleeState:onStateExited(...) end
function WildlifeFleeState.onTargetCallback(...) end
function WildlifeFleeState.registerXMLPaths(...) end
function WildlifeFleeState.replenishPatience(...) end
function WildlifeFleeState.superClass(...) end
function WildlifeFleeState:trySwitchToValidTransition(...) end
function WildlifeFleeState.updateAsCurrent(...) end
function WildlifeFleeState.updateAsInactive(...) end
