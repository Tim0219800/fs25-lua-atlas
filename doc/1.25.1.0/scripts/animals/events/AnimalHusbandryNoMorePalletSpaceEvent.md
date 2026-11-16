# animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua

*[Version française](../../../fr/scripts/animals/events/AnimalHusbandryNoMorePalletSpaceEvent.md)*

Source: `dataS/scripts/animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua` — FS25 1.25.1.0

✍ Server-to-client network event that tells clients a husbandry could not spawn a pallet because there is no room. On a client it makes the husbandry show its pallet-blocked warning for the given fill type.

- **AnimalHusbandryNoMorePalletSpaceEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalHusbandryNoMorePalletSpaceEvent.emptyNew() → table` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `AnimalHusbandryNoMorePalletSpaceEvent.new(animalHusbandry: table, fillTypeIndex: integer) → AnimalHusbandryNoMorePalletSpaceEvent` | 22 | ✍ Creates the event for a husbandry and a fill type index. |
| `AnimalHusbandryNoMorePalletSpaceEvent:readStream(streamId: integer, connection: table)` | 36 | ✍ Reads the husbandry and the fill type (FillTypeManager.SEND_NUM_BITS bits), then runs the event. |
| `AnimalHusbandryNoMorePalletSpaceEvent:writeStream(streamId: integer, connection: table)` | 47 | ✍ Writes the husbandry and the fill type index to the stream. |
| `AnimalHusbandryNoMorePalletSpaceEvent:run(connection: table)` | 55 | ✍ Only when received from the server (client side): calls showPalletBlockedWarning on the husbandry with the fill type, if the husbandry exists. |
