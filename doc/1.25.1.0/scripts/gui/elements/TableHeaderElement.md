# gui/elements/TableHeaderElement.lua

*[Version française](../../../fr/scripts/gui/elements/TableHeaderElement.md)*

Source: `dataS/scripts/gui/elements/TableHeaderElement.lua` — FS25 1.25.1.0

✍ Button element (derived from ButtonElement) used as a column header of a table, with sorting state off, ascending or descending. Children named iconAscending or iconDescending in the screen XML serve as sort icons, and the header must sit outside the table. It loads targetTableId, columnName, allowSortingAsc and allowSortingDesc from XML or profile.

- **TableHeaderElement** inherits from `ButtonElement` (l.37)

## Functions

| Function | Line | Description |
|---|---|---|
| `TableHeaderElement.new(target: any, custom_mt: any)` | 43 | ✍ Constructor. Allows only the off state, empties the icon slots, sets the order to off and clears target table id and column name. |
| `TableHeaderElement:loadFromXML(xmlFile: any, key: any)` | 67 | ✍ Loads targetTableId, columnName, allowSortingAsc and allowSortingDesc from the XML node after the parent class, keeping current values when an attribute is missing. |
| `TableHeaderElement:loadProfile(profile: any, applyProfile: any)` | 81 | ✍ Reads columnName, allowSortingAsc and allowSortingDesc from the GUI profile, keeping current values as defaults. targetTableId is not read from profiles. |
| `TableHeaderElement:copyAttributes(src: any)` | 91 | ✍ Copies target table id, column name and allowed sorting states from a source header. Note: unpack is used on the states table, whose false entries and index keys may not be copied faithfully. |
| `TableHeaderElement:onGuiSetupFinished()` | 101 | ✍ After the parent setup, scans child elements and registers those named for ascending or descending as the sort icons. |
| `TableHeaderElement:toggleSorting() → The` | 118 | ✍ Advances to the next allowed sorting state, wrapping around and ending on off at the latest, refreshes the icons if the state changed and returns the new order index. |
| `TableHeaderElement:disableSorting()` | 135 | ✍ Forces the state back to off and refreshes the icon display. |
| `TableHeaderElement:updateSortingDisplay()` | 142 | ✍ Shows only the icon for the current state and hides the others. Note: it calls setVisible on every entry in sortingIcons without a nil check, though the off state has no icon. |
