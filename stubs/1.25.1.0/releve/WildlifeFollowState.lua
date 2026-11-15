---@meta
-- FS25 1.25.1.0 : relevé en jeu, absent des sources du SDK (types inconnus)

---@class WildlifeFollowState
WildlifeFollowState = {}

function WildlifeFollowState:addTransition(...) end
function WildlifeFollowState:caclulateDebugScreenBounds(...) end
function WildlifeFollowState.calculateIfShouldBeForced(...) end
function WildlifeFollowState:calculateIfValidEntryState(...) end
function WildlifeFollowState.canSetFollowTarget(...) end
function WildlifeFollowState.class(...) end
function WildlifeFollowState.copy(...) end
function WildlifeFollowState:createTransitions(...) end
function WildlifeFollowState:debugDraw(...) end
function WildlifeFollowState:debugDrawTransitions(...) end
function WildlifeFollowState.isa(...) end
function WildlifeFollowState.loadAttributesTable(...) end
function WildlifeFollowState:loadDebugInfoFromXMLFile(...) end
function WildlifeFollowState.new(...) end
function WildlifeFollowState.onInstanceDespawned(...) end
function WildlifeFollowState.onInstanceSpawned(...) end
function WildlifeFollowState.onMovementTargetReached(...) end
function WildlifeFollowState.onStateEntered(...) end
function WildlifeFollowState.onStateExited(...) end
function WildlifeFollowState.registerXMLPaths(...) end
function WildlifeFollowState.resetMovementState(...) end
function WildlifeFollowState.superClass(...) end
function WildlifeFollowState:trySwitchToValidTransition(...) end
function WildlifeFollowState:updateAsCurrent(...) end
function WildlifeFollowState:updateAsInactive(...) end
