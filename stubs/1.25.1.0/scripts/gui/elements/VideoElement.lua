---@meta
-- FS25 1.25.1.0 : gui/elements/VideoElement.lua (generated stub, FS25 Lua Atlas)

--- GUI element that plays a video overlay (engine functions createVideoOverlay, playVideoOverlay, etc.; their internals are UNVERIFIED), derived from GuiElement. It supports looping, volume, optional subtitles loaded from an XML next to the video, an optional playback bar and a remaining-time label referenced by element id, and an onEndVideo callback. The video can be skipped by mouse or key when allowStop is set.
---@class VideoElement : GuiElement
VideoElement = {}

--- Constructor. Initialises video filename, looping off, volume 1, empty subtitles and the optional subtitle/progress-bar/time-left element references.
---@param target any
---@param custom_mt any
function VideoElement.new(target, custom_mt) end

--- Reads videoFilename, volume, allowStop, isLooping, the subtitle/playbackBar/timeLeft element ids and the onEndVideo callback from XML, then loads the video through changeVideo.
---@param xmlFile any
---@param key any
function VideoElement:loadFromXML(xmlFile, key) end

--- Reads the same video settings and element ids from a GUI profile; unlike the XML path it does not load the video itself.
---@param profile any
---@param applyProfile any
function VideoElement:loadProfile(profile, applyProfile) end

--- Copies volume, flags, callback, subtitles and element ids from a source and loads the source video via changeVideo (which resets the subtitles first).
---@param src any
function VideoElement:copyAttributes(src) end

--- Stops and deletes the video overlay, then calls the parent delete.
function VideoElement:delete() end

--- Looks for an XML named like the video file (without extension) and reads its Subtitles.Subtitle entries (startTime, endTime, text translated via g_i18n). Note: the path comes from self.videoFilename, not from the argument, which is only tested for nil.
---@param filename any
function VideoElement:loadSubtitles(filename) end

--- When visible, passes the event to the parent; if unused and allowStop is set, a mouse press stops the video and raises the end callback. Returns true in that case.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function VideoElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- When visible, any key press stops and disposes the video and raises the end callback (regardless of allowStop), and the event is reported as consumed.
---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function VideoElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

--- Per-frame: starts a pending play once the video is ready, updates the overlay while playing, advances subtitles, resizes the playback bar and writes the remaining time as -MM:SS. When playback has ended it disposes the video and raises the end callback.
---@param dt any
function VideoElement:update(dt) end

--- Renders the video frame while playing, or a centred bold loading text (l10n ui_loading) until it is ready, then draws the parent.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function VideoElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Calls onEndVideoCallback with the target if one is set, otherwise without arguments.
function VideoElement:onEndVideo() end

--- Stops and deletes the overlay (nil afterwards) and clears the subtitle text element if present.
function VideoElement:disposeVideo() end

--- Active whenever the element is visible.
function VideoElement:getIsActive() end

--- Marks the video to start as soon as it is ready and resets the subtitle index. Does nothing without an overlay.
function VideoElement:playVideo() end

--- Cancels any pending play and stops the overlay if it is currently playing.
function VideoElement:stopVideo() end

--- Disposes the current video, replaces $l10nSuffix with g_languageSuffix in the new file name, creates the overlay with the looping flag and given or default volume, stores the duration argument and loads subtitles. Note: duration is nil if not passed, which the progress/time code would divide by.
---@param newVideoFilename any
---@param volume any
---@param duration any
function VideoElement:changeVideo(newVideoFilename, volume, duration) end
