# ai/errors/AIMessageErrorCouldNotPrepare.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorCouldNotPrepare.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorCouldNotPrepare.lua` — FS25 1.25.1.0

✍ AI error message for a vehicle that could not be prepared before the job. Unlike most messages it carries a vehicle reference, formats the text with both the helper name and the vehicle name, and serializes the vehicle over the network.

- **AIMessageErrorCouldNotPrepare** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorCouldNotPrepare.new(vehicle: any, customMt: any)` | 16 | ✍ Constructor taking the vehicle that could not be prepared and storing it in `self.vehicle`. |
| `AIMessageErrorCouldNotPrepare:getMessage(job: any)` | 26 | ✍ Builds the message text from `getI18NText` (not defined in this file, UNVERIFIED), the helper name of the job ("Unknown" if missing) and the vehicle name (empty if none). |
| `AIMessageErrorCouldNotPrepare:readStream(streamId: any, connection: any)` | 50 | ✍ Reads the vehicle as a network node object from the stream, so that the client resolves the same vehicle. |
| `AIMessageErrorCouldNotPrepare:writeStream(streamId: any, connection: any)` | 56 | ✍ Writes the vehicle as a network node object to the stream (counterpart of `readStream`). |
