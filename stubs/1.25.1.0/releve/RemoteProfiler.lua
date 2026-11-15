---@meta
-- FS25 1.25.1.0 : in-game scan, missing from the SDK sources (types unknown)

---@class RemoteProfiler
RemoteProfiler = {}

function RemoteProfiler.message(...) end
function RemoteProfiler.zoneBegin(...) end
function RemoteProfiler.zoneBeginN(...) end
function RemoteProfiler.zoneBeginNS(...) end
function RemoteProfiler.zoneBeginS(...) end
function RemoteProfiler.zoneEnd(...) end
function RemoteProfiler.zoneName(...) end
function RemoteProfiler.zoneText(...) end
