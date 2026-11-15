---@meta
-- FS25 1.25.1.0 : relevé en jeu, absent des sources du SDK (types inconnus)

---@class PlayerStatePassenger
PlayerStatePassenger = {}

function PlayerStatePassenger:addTransition(...) end
function PlayerStatePassenger:caclulateDebugScreenBounds(...) end
function PlayerStatePassenger.calculateIfShouldBeForced(...) end
function PlayerStatePassenger:calculateIfValidEntryState(...) end
function PlayerStatePassenger.class(...) end
function PlayerStatePassenger.copy(...) end
function PlayerStatePassenger:createTransitions(...) end
function PlayerStatePassenger:debugDraw(...) end
function PlayerStatePassenger:debugDrawTransitions(...) end
function PlayerStatePassenger.getCurrentCameraNode(...) end
function PlayerStatePassenger.getCurrentFacingDirection(...) end
function PlayerStatePassenger.getCurrentRootNode(...) end
function PlayerStatePassenger.getCurrentVehicle(...) end
function PlayerStatePassenger.getIsInVehicle(...) end
function PlayerStatePassenger.getPosition(...) end
function PlayerStatePassenger.getSpeed(...) end
function PlayerStatePassenger.getYaw(...) end
function PlayerStatePassenger.isa(...) end
function PlayerStatePassenger:loadDebugInfoFromXMLFile(...) end
function PlayerStatePassenger.new(...) end
function PlayerStatePassenger:onEnterVehicle(...) end
function PlayerStatePassenger.onEnterVehicleAsPassenger(...) end
function PlayerStatePassenger.onStateEntered(...) end
function PlayerStatePassenger.onStateExited(...) end
function PlayerStatePassenger:registerXMLPaths(...) end
function PlayerStatePassenger.superClass(...) end
function PlayerStatePassenger:trySwitchToValidTransition(...) end
function PlayerStatePassenger:updateAsCurrent(...) end
function PlayerStatePassenger:updateAsInactive(...) end
function PlayerStatePassenger:updateWhileInConversation(...) end
