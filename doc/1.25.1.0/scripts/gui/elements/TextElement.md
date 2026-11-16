# gui/elements/TextElement.lua

*[Version française](../../../fr/scripts/gui/elements/TextElement.md)*

Source: `dataS/scripts/gui/elements/TextElement.lua` — FS25 1.25.1.0

✍ Base GUI element (derived from GuiElement) that renders one or more lines of text, with an optional secondary text (text2) drawn behind it. It supports per-state colours, offsets and bold flags, alignment, formats (number, currency, accounting, temperature, percentage) fed by setValue, localisation keys, auto-sizing, and layout modes (truncate, resize, overflow, scrolling, fill). Attributes come from XML or GUI profiles. FORMAT, LAYOUT_MODE and VERTICAL_ALIGNMENT constants, getTextPosition and the g_i18n and message-center internals are not defined in this file (UNVERIFIED).

- **TextElement** inherits from `GuiElement` (l.57)

## Functions

| Function | Line | Description |
|---|---|---|
| `TextElement.new(target: any, custom_mt: any)` | 96 | ✍ Constructor. Sets defaults: white text, size 0.03, centred, one line, truncate layout, no format, empty text, no text2 (size 0) and cleared scrolling state. |
| `TextElement:loadFromXML(xmlFile: any, key: any)` | 164 | ✍ Loads all text attributes from XML (colours, offsets, sizes, bold flags, alignment, layout mode, width and line limits, format, text and an onTextChanged callback). Sets the mod environment from the file path so $l10n_ keys resolve with it, then updates the size. |
| `TextElement:loadProfile(profile: any, applyProfile: any)` | 307 | ✍ Loads the same text attributes from a GUI profile (colours, offsets, sizes, bold, alignment, layout mode, limits and format). Updates the size only if applyProfile is true. Unlike XML loading, it does not read the text itself or the callback. |
| `TextElement:copyAttributes(src: any)` | 423 | ✍ Copies text, format, value, source text, colours, offsets, sizes, layout settings and the change callback from a source element, cloning the tables. Used when cloning elements. |
| `TextElement:delete()` | 516 | ✍ Unsubscribes this element from the Fahrenheit and money-unit setting-change messages, then deletes it via the parent class. |
| `TextElement:setTextSize(size: any)` | 525 | ✍ Sets the text size and recomputes the element size. Note: it does not update the default size used by resize mode, so the next setText resets it. |
| `TextElement:setAbsolutePosition(x: any, y: any)` | 533 | ✍ Sets the absolute position through the parent class (children follow) and, unless a scroll update is running, stores the new x as the start position for scrolling. |
| `TextElement:setDisabled(isDisabled: any)` | 543 | ✍ Sets the disabled state through the parent class, then refreshes the scrolling layout mode so a scrolling text stops properly. |
| `TextElement:updateAbsolutePosition()` | 551 | ✍ Recomputes the absolute position through the parent class, re-lays out the source text unless it is a single line in overflow or scrolling mode or auto-sized, and resets the scrolling start position and parameters. |
| `TextElement:setText(text: any, forceTextSize: any, isInitializing: any, forceScrollingParameterUpdate: any) → string` | 572 | ✍ Sets the displayed text, clearing any loca key, value and format. If the text changed (or forceScrollingParameterUpdate is set), restarts the scroll timer and updates the scrolling parameters. Returns nothing despite the original doc suggesting a leftover. |
| `TextElement:setTextInternal(text: any, forceTextSize: any, skipCallback: any, doNotUpdateSize: any)` | 586 | ✍ Core text routine: stores the source text (upper-cased if enabled), resets sizes, then fits it to the width and line limit according to the layout mode (shrink, ellipsis, line cut). Raises onTextChangedCallback unless skipCallback, and returns true if the text changed. |
| `TextElement:getText()` | 743 | ✍ Returns the source text, i.e. the full text before any truncation or cutting. |
| `TextElement:setValue(value: any)` | 749 | ✍ Stores a value and regenerates the text using the current format. Takes effect only through updateFormattedText, which uses the value over any loca key. |
| `TextElement:getValue()` | 756 | ✍ Returns the value last set with setValue, or nil. |
| `TextElement:setFormat(format: any)` | 762 | ✍ Changes the value format (nil means none), refreshes the text, and subscribes to or unsubscribes from the Fahrenheit and money-unit setting messages as the format requires. Note: the unsubscribe of the old currency format only runs when the new format is a currency one. |
| `TextElement:setLocaKey(key: any)` | 789 | ✍ Shows the translation of a loca key (a trailing colon is kept after translation). Clears the format and value and refreshes the text using the element's mod environment. |
| `TextElement:updateFormattedText()` | 798 | ✍ Builds the text from the value and format (plain, number, currency, accounting, temperature, percentage) through g_i18n, or from the loca key when no value is set, then applies it. Empty text if neither exists. |
| `TextElement:updateScrollingParameters()` | 835 | ✍ Only in scrolling mode: resets the offset, computes the maximum scroll distance from the source text width and the clip rectangle, and left-aligns the text if it overflows, else restores the original alignment. |
| `TextElement:setTextColor(r: any, g: any, b: any, a: any)` | 866 | ✍ Sets the normal text colour from r, g, b, a. |
| `TextElement:setTextSelectedColor(r: any, g: any, b: any, a: any)` | 872 | ✍ Sets the text colour used when the element is selected. |
| `TextElement:setTextFocusedColor(r: any, g: any, b: any, a: any)` | 878 | ✍ Sets the text colour used when the element has focus. |
| `TextElement:setTextFocusedSelectedColor(r: any, g: any, b: any, a: any)` | 884 | ✍ Sets the colour for the combined focused-plus-selected state. |
| `TextElement:setTextHighlightedSelectedColor(r: any, g: any, b: any, a: any)` | 890 | ✍ Sets the colour used when the element is both highlighted and selected. |
| `TextElement:setTextHighlightedColor(r: any, g: any, b: any, a: any)` | 896 | ✍ Sets the text colour used when the element is highlighted. |
| `TextElement:getTextColor()` | 902 | ✍ Returns the colour for the current state. Priority: disabled (unless ignoreDisabled), selected (with focused or highlighted variants), focused, highlighted, then normal. Falls back to the normal colour if the state colour is unset. |
| `TextElement:setText2Color(r: any, g: any, b: any, a: any)` | 930 | ✍ Sets the normal colour of the secondary text. |
| `TextElement:setText2SelectedColor(r: any, g: any, b: any, a: any)` | 936 | ✍ Sets the secondary text colour used when selected. |
| `TextElement:setText2FocusedColor(r: any, g: any, b: any, a: any)` | 942 | ✍ Sets the secondary text colour used when focused. |
| `TextElement:setText2HighlightedColor(r: any, g: any, b: any, a: any)` | 948 | ✍ Sets the secondary text colour used when highlighted. |
| `TextElement:getText2Color()` | 954 | ✍ Returns the secondary text colour for the current state (disabled, selected, focused, highlighted or normal). Note: unlike getTextColor it has no fallback, so an unset state colour returns nil and draw would fail on unpack. |
| `TextElement:getTextWidth(useSourceText: any)` | 971 | ✍ Measures the text width with the engine, using bold if set and optionally the source text. Unless overflow, scrolling or auto-width applies, the result is capped to the element width. |
| `TextElement:getTextHeight(includeNegativeSpacing: any)` | 989 | ✍ Returns the text height and line count from the engine, applying wrap width, bold, indentation and line-height scale temporarily. With includeNegativeSpacing, adds 10% of a line for descenders. Resets the engine text state afterwards. |
| `TextElement:getTextOffset()` | 1018 | ✍ Returns the x and y text offset for the current overlay state (focused, selected, highlighted, pressed), falling back to the base offset when the state offset is unset. |
| `TextElement:getText2Offset()` | 1041 | ✍ Returns the secondary text offset: the focused offset for focused, pressed, selected or highlighted states, otherwise the base offset. |
| `TextElement:getIsScrollingAllowed()` | 1053 | ✍ Returns true if scrolling may run: always when textScrollOnFocusOnly is false, otherwise only while the element is focused, highlighted or selected. |
| `TextElement:getTextLayoutMode()` | 1059 | ✍ Returns the effective layout mode: a scrolling element reports truncate whenever scrolling is not currently allowed, otherwise the configured mode. |
| `TextElement:getDoRenderText()` | 1069 | ✍ Returns true; hook that subclasses may override to suppress text rendering in draw. |
| `TextElement:getTextPositionX()` | 1075 | ✍ Returns the x anchor of the text: left edge, centre or right edge of the element according to the alignment. |
| `TextElement:getTextPositionY(lineHeight: any, totalHeight: any)` | 1087 | ✍ Returns the y position of the first line for the vertical alignment (top, middle, otherwise bottom), from the line height and the total text height. |
| `TextElement:update(dt: any)` | 1113 | ✍ Per-frame update with dt in ms. In scrolling mode it advances a timer and moves the element left by a smoothstep offset, pausing at both ends (cycle of 9000 ms or more depending on overflow). Does nothing extra in other modes. |
| `TextElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 1145 | ✍ Renders the text, and the secondary text first if its size is above 0, with state colours, alpha, bold, wrap, page lines and clip area, then restores engine text state and draws children. Skips empty text. Draws debug guides when UI debug is on. |
| `TextElement:updateScrollingLayoutMode()` | 1267 | ✍ If the effective layout mode changed since last time, re-applies the source text and forces a scrolling parameter update, then stores the mode. |
| `TextElement:updateScaledWidth(xScale: number)` | 1278 | ✍ For an element whose size is 0 by 0 and which has text, sets its size to the text width (divided by xScale) and the text height. Only xScale is used. |
| `TextElement:updateSize(forceTextSize: any)` | 1293 | ✍ Resizes to fit the content when textAutoWidth (single-line width plus offset, clamped by min and max width) or textAutoHeight applies, unless forceTextSize is true, and invalidates the parent layout if it auto-validates. In fill mode, recomputes the maximum line count from the height. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.780)
- subscribes `MessageType.SETTING_CHANGED` (l.782)
