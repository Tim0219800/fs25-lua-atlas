# ai/errors/AIMessage.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessage.md)*

Source: `dataS/scripts/ai/errors/AIMessage.lua` — FS25 1.25.1.0

✍ Base class of all messages shown when an AI helper job ends, with error or success. Subclasses supply the localized text through `getI18NText` and may override the type and the network serialization; `AIMessageManager` registers them and `AIJobStopEvent` transmits them.

- **AIMessage** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessage.new(customMt: any)` | 16 | ✍ Creates a message instance with the given optional metatable so that subclasses can reuse it. |
| `AIMessage:getMessage(job: any)` | 23 | ✍ Formats the text from `self:getI18NText()` with the helper name of the given job, using "Unknown" if the job or name is nil. Returns an empty string when there is no text. `getI18NText` is not defined in this class. |
| `AIMessage:getType()` | 43 | ✍ Returns `AIMessageType.ERROR` by default; success subclasses override it. |
| `AIMessage:readStream(streamId: any, connection: any)` | 49 | ✍ Empty hook for reading message data from a network stream; subclasses with state override it. |
| `AIMessage:writeStream(streamId: any, connection: any)` | 54 | ✍ Empty hook for writing message data to a network stream; subclasses with state override it. |
