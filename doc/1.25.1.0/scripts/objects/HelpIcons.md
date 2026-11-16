# objects/HelpIcons.lua

*[Version française](../../fr/scripts/objects/HelpIcons.md)*

Source: `dataS/scripts/objects/HelpIcons.lua` — FS25 1.25.1.0

✍ Manages the collectable help icons placed on a map: a root node whose children are trigger nodes, each holding an icon child. Entering a trigger with the local player's vehicle hides the icon, stores the found state in the savegame mission info and shows an in-game message from the i18n texts helpIcon_title and helpIcon_text.

- **HelpIcons** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HelpIcons:onCreate(id: integer)` | 16 | ✍ Map callback for an i3d node: builds the HelpIcons object, adds it to the non-updateables of the mission and stores it in g_currentMission.helpIconsBase. |
| `HelpIcons.new(name: integer) → table` | 26 | ✍ Constructor. For each child of the node, takes the first grandchild as icon, reads the customNumber user attribute (default 0), adds a trigger with triggerCallback and records the entry. Starts visible. |
| `HelpIcons:delete()` | 48 | ✍ Removes the triggers of all help icons. |
| `HelpIcons:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 69 | ✍ Trigger callback, enter only and local player only. Requires the player to be in a vehicle that matches the entering node. Hides that icon, disables its trigger, rebuilds the foundHelpIcons string ('1' for found, '0' for visible) and shows the message numbered by customNumber or by index. |
| `HelpIcons:showHelpIcons(visible: boolean, clearIconStates: boolean)` | 124 | ✍ Shows or hides all icons. Unless clearIconStates is true, an icon is shown only if its entry in foundHelpIcons is '0'. Sets the trigger collision mask to 3145728 for visible icons and 0 otherwise. |
| `HelpIcons:deleteHelpIcon(i: integer)` | 148 | ✍ Hides the icon with the given index and disables its trigger collision mask. Does nothing if the index does not exist. |
