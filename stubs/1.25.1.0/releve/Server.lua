---@meta
-- FS25 1.25.1.0 : in-game scan, missing from the SDK sources (types unknown)

---@class Server
Server = {}

function Server:addObject(...) end
function Server:addObjectToUpdateLoop(...) end
function Server:addPacketSize(...) end
function Server.broadcastEvent(...) end
function Server:checkObjectUpdateDebugReadSize(...) end
function Server.class(...) end
function Server.closeConnection(...) end
function Server.consoleCommandToggleNetworkDebug(...) end
function Server:consoleCommandToggleNetworkShowObjects(...) end
function Server:consoleCommandToggleShowNetworkTraffic(...) end
function Server:consoleCommandToggleShowNetworkTrafficClients(...) end
function Server.copy(...) end
function Server.delete(...) end
function Server:drawConnectionNetworkStats(...) end
function Server:drawDebug(...) end
function Server:drawGraphLabels(...) end
function Server.finishRegisterObject(...) end
function Server.getClientClipDistCoeff(...) end
function Server.getClientGuiVisibility(...) end
function Server.getClientPosition(...) end
function Server:getObject(...) end
function Server:getObjectId(...) end
function Server:getObjectPacketType(...) end
function Server:getPacketTypeName(...) end
function Server.hasGhostObject(...) end
function Server.init(...) end
function Server.isa(...) end
function Server.new(...) end
function Server.packetReceived(...) end
function Server.prioCmp(...) end
function Server.registerObject(...) end
function Server.registerObjectInStream(...) end
function Server:removeObject(...) end
function Server:removeObjectFromUpdateLoop(...) end
function Server.removeStreamFromClients(...) end
function Server.sendEventIds(...) end
function Server.sendObjectClassIds(...) end
function Server.sendObjects(...) end
function Server.setClientClipDistCoeff(...) end
function Server.setClientGuiVisibility(...) end
function Server.setClientPosition(...) end
function Server.setCurrentReliableWriteStreamConnection(...) end
function Server:setNetworkListener(...) end
function Server.start(...) end
function Server.startLocal(...) end
function Server.stop(...) end
function Server.superClass(...) end
function Server.unregisterObject(...) end
function Server.update(...) end
function Server:updateActiveObjects(...) end
function Server:updateActiveObjectsTick(...) end
function Server:updatePacketStats(...) end
