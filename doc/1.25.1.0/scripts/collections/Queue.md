# collections/Queue.lua

*[Version française](../../fr/scripts/collections/Queue.md)*

Source: `dataS/scripts/collections/Queue.lua` — FS25 1.25.1.0

✍ Queue class stub: the dump only contains peek, which reads a `first` field. No constructor or push/pop function is present in this file, so how that field is filled is UNVERIFIED.

- **Queue** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `Queue:peek() → table?` | 69 | ✍ Gives back whatever sits first in the queue, read from the `first` field, without taking it out; nil if there is nothing. |
