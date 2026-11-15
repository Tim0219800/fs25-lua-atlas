---@meta
-- FS25 1.25.1.0 : in-game scan, missing from the SDK sources (types unknown)

---@class WildlifeIdleState
WildlifeIdleState = {}

function WildlifeIdleState:addTransition(...) end
function WildlifeIdleState:caclulateDebugScreenBounds(...) end
function WildlifeIdleState:calculateIfShouldBeForced(...) end
function WildlifeIdleState:calculateIfValidEntryState(...) end
function WildlifeIdleState.class(...) end
function WildlifeIdleState.copy(...) end
function WildlifeIdleState.createTransitions(...) end
function WildlifeIdleState:debugDraw(...) end
function WildlifeIdleState:debugDrawTransitions(...) end
function WildlifeIdleState.isa(...) end
function WildlifeIdleState.loadAttributesTable(...) end
function WildlifeIdleState:loadDebugInfoFromXMLFile(...) end
function WildlifeIdleState.new(...) end
function WildlifeIdleState.onStateEntered(...) end
function WildlifeIdleState:onStateExited(...) end
function WildlifeIdleState.registerXMLPaths(...) end
function WildlifeIdleState.superClass(...) end
function WildlifeIdleState.toggleCurrentAnimation(...) end
function WildlifeIdleState:trySwitchToValidTransition(...) end
function WildlifeIdleState.updateAsCurrent(...) end
function WildlifeIdleState:updateAsInactive(...) end
