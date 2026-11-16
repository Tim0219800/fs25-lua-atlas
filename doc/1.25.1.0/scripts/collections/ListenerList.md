# collections/ListenerList.lua

*[Version française](../../fr/scripts/collections/ListenerList.md)*

Source: `dataS/scripts/collections/ListenerList.lua` — FS25 1.25.1.0

✍ Small observer helper holding an ordered list of listeners, each resolved through TargetedFunction.resolveListener (class defined elsewhere, UNVERIFIED). Calling the list, or invoke, runs every listener in registration order. There is no unregister function in this file.

- **ListenerList** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `ListenerList.new(ignoreFirstArgument: boolean?) → ListenerList` | 18 | ✍ Creates an empty listener list. With ignoreFirstArgument true, invoke drops its first argument (typically the owning table) before calling listeners. |
| `ListenerList:registerListener(listenerFunction: (function\|TargetedFunction), targetObject: table?)` | 37 | ✍ Resolves a function or TargetedFunction with an optional target object and appends it to the list. The same listener can be added more than once. |
| `ListenerList:invoke(targetObject: any, ...: any)` | 49 | ✍ Calls every listener in order with the given arguments; the first argument is skipped when the list was created with ignoreFirstArgument. Return values are discarded. |
| `ListenerList_mt.__call(instance: ListenerList, ...: any)` | 67 | ✍ Metamethod that lets the list be called like a function, forwarding to invoke with the same arguments. |
