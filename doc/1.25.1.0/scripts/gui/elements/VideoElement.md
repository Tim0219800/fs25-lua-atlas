# gui/elements/VideoElement.lua

*[Version française](../../../fr/scripts/gui/elements/VideoElement.md)*

Source: `dataS/scripts/gui/elements/VideoElement.lua` — FS25 1.25.1.0

✍ GUI element that plays a video overlay (engine functions createVideoOverlay, playVideoOverlay, etc.; their internals are UNVERIFIED), derived from GuiElement. It supports looping, volume, optional subtitles loaded from an XML next to the video, an optional playback bar and a remaining-time label referenced by element id, and an onEndVideo callback. The video can be skipped by mouse or key when allowStop is set.

- **VideoElement** inherits from `GuiElement` (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `VideoElement.new(target: any, custom_mt: any)` | 26 | ✍ Constructor. Initialises video filename, looping off, volume 1, empty subtitles and the optional subtitle/progress-bar/time-left element references. |
| `VideoElement:loadFromXML(xmlFile: any, key: any)` | 51 | ✍ Reads videoFilename, volume, allowStop, isLooping, the subtitle/playbackBar/timeLeft element ids and the onEndVideo callback from XML, then loads the video through changeVideo. |
| `VideoElement:loadProfile(profile: any, applyProfile: any)` | 69 | ✍ Reads the same video settings and element ids from a GUI profile; unlike the XML path it does not load the video itself. |
| `VideoElement:copyAttributes(src: any)` | 83 | ✍ Copies volume, flags, callback, subtitles and element ids from a source and loads the source video via changeVideo (which resets the subtitles first). |
| `VideoElement:delete()` | 130 | ✍ Stops and deletes the video overlay, then calls the parent delete. |
| `VideoElement:loadSubtitles(filename: any)` | 137 | ✍ Looks for an XML named like the video file (without extension) and reads its Subtitles.Subtitle entries (startTime, endTime, text translated via g_i18n). Note: the path comes from self.videoFilename, not from the argument, which is only tested for nil. |
| `VideoElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 165 | ✍ When visible, passes the event to the parent; if unused and allowStop is set, a mouse press stops the video and raises the end callback. Returns true in that case. |
| `VideoElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 190 | ✍ When visible, any key press stops and disposes the video and raises the end callback (regardless of allowStop), and the event is reported as consumed. |
| `VideoElement:update(dt: any)` | 209 | ✍ Per-frame: starts a pending play once the video is ready, updates the overlay while playing, advances subtitles, resizes the playback bar and writes the remaining time as -MM:SS. When playback has ended it disposes the video and raises the end callback. |
| `VideoElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 273 | ✍ Renders the video frame while playing, or a centred bold loading text (l10n ui_loading) until it is ready, then draws the parent. |
| `VideoElement:onEndVideo()` | 294 | ✍ Calls onEndVideoCallback with the target if one is set, otherwise without arguments. |
| `VideoElement:disposeVideo()` | 306 | ✍ Stops and deletes the overlay (nil afterwards) and clears the subtitle text element if present. |
| `VideoElement:getIsActive()` | 319 | ✍ Active whenever the element is visible. |
| `VideoElement:playVideo()` | 325 | ✍ Marks the video to start as soon as it is ready and resets the subtitle index. Does nothing without an overlay. |
| `VideoElement:stopVideo()` | 334 | ✍ Cancels any pending play and stops the overlay if it is currently playing. |
| `VideoElement:changeVideo(newVideoFilename: any, volume: any, duration: any)` | 343 | ✍ Disposes the current video, replaces $l10nSuffix with g_languageSuffix in the new file name, creates the overlay with the looping flag and given or default volume, stores the duration argument and loads subtitles. Note: duration is nil if not passed, which the progress/time code would divide by. |
