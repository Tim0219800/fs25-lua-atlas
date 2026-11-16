---@meta
-- FS25 1.25.1.0 : gui/hud/ChatDisplay.lua (generated stub, FS25 Lua Atlas)

--- HUD panel for the multiplayer chat history, derived from HUDDisplay. It owns a three-slice background (top, scalable middle, bottom) tinted with the HUD background colour, keeps a reference to the message list owned by the mission and tracks scroll position and auto-close time (10 s duration, up to 50 messages). Drawing code is not in this file.
---@class ChatDisplay : HUDDisplay
ChatDisplay = {}

--- Constructor. Creates the background overlays from gui.chat_top/middle/bottom, an empty message reference, max 50 messages, scroll offset 0 and a 10 000 ms display duration.
---@return table
function ChatDisplay.new() end

--- Computes position (left, bottom anchors with a 300 px offset), 300 px wide background slices and scaled text/title sizes, offsets and the maximum panel height from the current UI scale.
function ChatDisplay:storeScaledValues() end

--- Adds a delta (in messages, positive or negative) to the scroll offset, clamped between 0 and the message count minus one.
---@param delta integer
function ChatDisplay:scrollChatMessages(delta) end
