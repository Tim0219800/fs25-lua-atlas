---@meta
-- FS25 1.25.1.0 : gui/hud/SpeakerDisplay.lua (generated stub, FS25 Lua Atlas)

--- Multiplayer HUD display (extends HUDDisplay) listing the users who are currently speaking in voice chat, shown at the top-right under the side notifications. A speaker stays listed for 500 time units after the last voice activity. It reads g_currentMission.userManager users and VoiceChatUtil. Client-side only.
---@class SpeakerDisplay : HUDDisplay
SpeakerDisplay = {}

--- Creates the display with three-part background overlays, talk and muted icons at half alpha, and an empty per-user speaking timer table.
---@param customMt any
---@return table
function SpeakerDisplay.new(customMt) end

--- Anchors the display below the top-right anchor (offset -300 px) and converts the reference-pixel sizes of background parts, text, spacing and icons to screen units.
function SpeakerDisplay:storeScaledValues() end

--- For each user, sets the speaking timer to 500 when voice activity is detected and the user is not blocked, then draws a rounded row with muted or talk icon and the upper-cased nickname while the timer entry exists. Returns early without users. Note: the timer is set here but never decreased in this file, so UNVERIFIED whether entries ever expire.
function SpeakerDisplay:draw() end
