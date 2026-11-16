# player/events/PlayerSetFarmAnswerEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerSetFarmAnswerEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetFarmAnswerEvent.lua` — FS25 1.25.1.0

✍ Server-to-client answer to a `PlayerSetFarmEvent`. It carries a result state (the `STATE` table, defined elsewhere, e.g. OK or PASSWORD_REQUIRED), the farm id and, on success, the password used. On the client it is republished through the message center.

- **PlayerSetFarmAnswerEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerSetFarmAnswerEvent.emptyNew() → table` | 28 | ✍ Creates an empty event instance for stream reading. |
| `PlayerSetFarmAnswerEvent.new(answerState: integer, farmId: integer, password: string?) → table` | 39 | ✍ Builds an answer with the state, farm id and optional password that was used in the request. |
| `PlayerSetFarmAnswerEvent:writeStream(streamId: integer, connection: table)` | 53 | ✍ Writes the state and farm id as fixed-width integers. The password is written (behind a boolean flag) only when the state is OK and a password is set. |
| `PlayerSetFarmAnswerEvent:readStream(streamId: integer, connection: table)` | 68 | ✍ Reads state, farm id and the optional password, then runs the event. |
| `PlayerSetFarmAnswerEvent:run(connection: table)` | 82 | ✍ Client only: for OK or PASSWORD_REQUIRED, publishes the `PlayerSetFarmAnswerEvent` message on `g_messageCenter` (the password is passed only for OK). On the server it only logs a dev warning. |
