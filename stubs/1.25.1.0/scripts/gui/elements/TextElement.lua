---@meta
-- FS25 1.25.1.0 : gui/elements/TextElement.lua (generated stub, FS25 Lua Atlas)

--- Base GUI element (derived from GuiElement) that renders one or more lines of text, with an optional secondary text (text2) drawn behind it. It supports per-state colours, offsets and bold flags, alignment, formats (number, currency, accounting, temperature, percentage) fed by setValue, localisation keys, auto-sizing, and layout modes (truncate, resize, overflow, scrolling, fill). Attributes come from XML or GUI profiles. FORMAT, LAYOUT_MODE and VERTICAL_ALIGNMENT constants, getTextPosition and the g_i18n and message-center internals are not defined in this file (UNVERIFIED).
---@class TextElement : GuiElement
TextElement = {}

--- Constructor. Sets defaults: white text, size 0.03, centred, one line, truncate layout, no format, empty text, no text2 (size 0) and cleared scrolling state.
---@param target any
---@param custom_mt any
function TextElement.new(target, custom_mt) end

--- Loads all text attributes from XML (colours, offsets, sizes, bold flags, alignment, layout mode, width and line limits, format, text and an onTextChanged callback). Sets the mod environment from the file path so $l10n_ keys resolve with it, then updates the size.
---@param xmlFile any
---@param key any
function TextElement:loadFromXML(xmlFile, key) end

--- Loads the same text attributes from a GUI profile (colours, offsets, sizes, bold, alignment, layout mode, limits and format). Updates the size only if applyProfile is true. Unlike XML loading, it does not read the text itself or the callback.
---@param profile any
---@param applyProfile any
function TextElement:loadProfile(profile, applyProfile) end

--- Copies text, format, value, source text, colours, offsets, sizes, layout settings and the change callback from a source element, cloning the tables. Used when cloning elements.
---@param src any
function TextElement:copyAttributes(src) end

--- Unsubscribes this element from the Fahrenheit and money-unit setting-change messages, then deletes it via the parent class.
function TextElement:delete() end

--- Sets the text size and recomputes the element size. Note: it does not update the default size used by resize mode, so the next setText resets it.
---@param size any
function TextElement:setTextSize(size) end

--- Sets the absolute position through the parent class (children follow) and, unless a scroll update is running, stores the new x as the start position for scrolling.
---@param x any
---@param y any
function TextElement:setAbsolutePosition(x, y) end

--- Sets the disabled state through the parent class, then refreshes the scrolling layout mode so a scrolling text stops properly.
---@param isDisabled any
function TextElement:setDisabled(isDisabled) end

--- Recomputes the absolute position through the parent class, re-lays out the source text unless it is a single line in overflow or scrolling mode or auto-sized, and resets the scrolling start position and parameters.
function TextElement:updateAbsolutePosition() end

--- Sets the displayed text, clearing any loca key, value and format. If the text changed (or forceScrollingParameterUpdate is set), restarts the scroll timer and updates the scrolling parameters. Returns nothing despite the original doc suggesting a leftover.
---@param text any
---@param forceTextSize any
---@param isInitializing any
---@param forceScrollingParameterUpdate any
---@return string
function TextElement:setText(text, forceTextSize, isInitializing, forceScrollingParameterUpdate) end

--- Core text routine: stores the source text (upper-cased if enabled), resets sizes, then fits it to the width and line limit according to the layout mode (shrink, ellipsis, line cut). Raises onTextChangedCallback unless skipCallback, and returns true if the text changed.
---@param text any
---@param forceTextSize any
---@param skipCallback any
---@param doNotUpdateSize any
function TextElement:setTextInternal(text, forceTextSize, skipCallback, doNotUpdateSize) end

--- Returns the source text, i.e. the full text before any truncation or cutting.
function TextElement:getText() end

--- Stores a value and regenerates the text using the current format. Takes effect only through updateFormattedText, which uses the value over any loca key.
---@param value any
function TextElement:setValue(value) end

--- Returns the value last set with setValue, or nil.
function TextElement:getValue() end

--- Changes the value format (nil means none), refreshes the text, and subscribes to or unsubscribes from the Fahrenheit and money-unit setting messages as the format requires. Note: the unsubscribe of the old currency format only runs when the new format is a currency one.
---@param format any
function TextElement:setFormat(format) end

--- Shows the translation of a loca key (a trailing colon is kept after translation). Clears the format and value and refreshes the text using the element's mod environment.
---@param key any
function TextElement:setLocaKey(key) end

--- Builds the text from the value and format (plain, number, currency, accounting, temperature, percentage) through g_i18n, or from the loca key when no value is set, then applies it. Empty text if neither exists.
function TextElement:updateFormattedText() end

--- Only in scrolling mode: resets the offset, computes the maximum scroll distance from the source text width and the clip rectangle, and left-aligns the text if it overflows, else restores the original alignment.
function TextElement:updateScrollingParameters() end

--- Sets the normal text colour from r, g, b, a.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextColor(r, g, b, a) end

--- Sets the text colour used when the element is selected.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextSelectedColor(r, g, b, a) end

--- Sets the text colour used when the element has focus.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextFocusedColor(r, g, b, a) end

--- Sets the colour for the combined focused-plus-selected state.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextFocusedSelectedColor(r, g, b, a) end

--- Sets the colour used when the element is both highlighted and selected.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextHighlightedSelectedColor(r, g, b, a) end

--- Sets the text colour used when the element is highlighted.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextHighlightedColor(r, g, b, a) end

--- Returns the colour for the current state. Priority: disabled (unless ignoreDisabled), selected (with focused or highlighted variants), focused, highlighted, then normal. Falls back to the normal colour if the state colour is unset.
function TextElement:getTextColor() end

--- Sets the normal colour of the secondary text.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2Color(r, g, b, a) end

--- Sets the secondary text colour used when selected.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2SelectedColor(r, g, b, a) end

--- Sets the secondary text colour used when focused.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2FocusedColor(r, g, b, a) end

--- Sets the secondary text colour used when highlighted.
---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2HighlightedColor(r, g, b, a) end

--- Returns the secondary text colour for the current state (disabled, selected, focused, highlighted or normal). Note: unlike getTextColor it has no fallback, so an unset state colour returns nil and draw would fail on unpack.
function TextElement:getText2Color() end

--- Measures the text width with the engine, using bold if set and optionally the source text. Unless overflow, scrolling or auto-width applies, the result is capped to the element width.
---@param useSourceText any
function TextElement:getTextWidth(useSourceText) end

--- Returns the text height and line count from the engine, applying wrap width, bold, indentation and line-height scale temporarily. With includeNegativeSpacing, adds 10% of a line for descenders. Resets the engine text state afterwards.
---@param includeNegativeSpacing any
function TextElement:getTextHeight(includeNegativeSpacing) end

--- Returns the x and y text offset for the current overlay state (focused, selected, highlighted, pressed), falling back to the base offset when the state offset is unset.
function TextElement:getTextOffset() end

--- Returns the secondary text offset: the focused offset for focused, pressed, selected or highlighted states, otherwise the base offset.
function TextElement:getText2Offset() end

--- Returns true if scrolling may run: always when textScrollOnFocusOnly is false, otherwise only while the element is focused, highlighted or selected.
function TextElement:getIsScrollingAllowed() end

--- Returns the effective layout mode: a scrolling element reports truncate whenever scrolling is not currently allowed, otherwise the configured mode.
function TextElement:getTextLayoutMode() end

--- Returns true; hook that subclasses may override to suppress text rendering in draw.
function TextElement:getDoRenderText() end

--- Returns the x anchor of the text: left edge, centre or right edge of the element according to the alignment.
function TextElement:getTextPositionX() end

--- Returns the y position of the first line for the vertical alignment (top, middle, otherwise bottom), from the line height and the total text height.
---@param lineHeight any
---@param totalHeight any
function TextElement:getTextPositionY(lineHeight, totalHeight) end

--- Per-frame update with dt in ms. In scrolling mode it advances a timer and moves the element left by a smoothstep offset, pausing at both ends (cycle of 9000 ms or more depending on overflow). Does nothing extra in other modes.
---@param dt any
function TextElement:update(dt) end

--- Renders the text, and the secondary text first if its size is above 0, with state colours, alpha, bold, wrap, page lines and clip area, then restores engine text state and draws children. Skips empty text. Draws debug guides when UI debug is on.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TextElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- If the effective layout mode changed since last time, re-applies the source text and forces a scrolling parameter update, then stores the mode.
function TextElement:updateScrollingLayoutMode() end

--- For an element whose size is 0 by 0 and which has text, sets its size to the text width (divided by xScale) and the text height. Only xScale is used.
---@param xScale number
function TextElement:updateScaledWidth(xScale) end

--- Resizes to fit the content when textAutoWidth (single-line width plus offset, clamped by min and max width) or textAutoHeight applies, unless forceTextSize is true, and invalidates the parent layout if it auto-validates. In fill mode, recomputes the maximum line count from the height.
---@param forceTextSize any
function TextElement:updateSize(forceTextSize) end
