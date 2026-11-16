# utils/TargetedFunction.lua

*[Version française](../../fr/scripts/utils/TargetedFunction.md)*

Source: `dataS/scripts/utils/TargetedFunction.lua` — FS25 1.25.1.0

✍ Small class that wraps a function with an optional target object and optional bound arguments, so it can be stored as an event listener and called later. Instances are callable directly through the __call metamethod, which forwards to invoke. Pure Lua, no client or server distinction.

- **TargetedFunction** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TargetedFunction.new(targetFunction: function, targetObject: table?, ...: any) → TargetedFunction` | 20 | ✍ Creates a TargetedFunction from a function, an optional target table and optional extra arguments stored as a packed table. Debug builds assert on the types. |
| `TargetedFunction:delete()` | 43 | ✍ Clears the stored function and target references so they can be collected. The bound arguments are kept. |
| `TargetedFunction.resolveListener(targetFunction: function, targetObject: table?) → TargetedFunction` | 53 | ✍ Wraps a plain function (with optional target) into a new TargetedFunction; any other value is assumed to be a TargetedFunction already and returned unchanged, without checking. |
| `TargetedFunction:unpackCombinedArguments(...: any) → any` | 68 | ✍ Returns the bound arguments followed by the extra arguments given now, as separate values. It relies on table.getListUnion, defined elsewhere (UNVERIFIED). |
| `TargetedFunction:invoke(...: any) → any` | 76 | ✍ Calls the stored function, passing the target object first if there is one, then the bound arguments (when any) followed by the call arguments. Returns the function's return value. |
| `TargetedFunction_mt.__call(instance: TargetedFunction, ...: any) → any` | 99 | ✍ Metamethod that lets the instance be called like a function; it simply forwards the arguments to invoke and returns its result. |
