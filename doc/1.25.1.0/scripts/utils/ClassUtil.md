# utils/ClassUtil.lua

*[Version française](../../fr/scripts/utils/ClassUtil.md)*

Source: `dataS/scripts/utils/ClassUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Signature only (no body in the SDK dump): helpers to resolve class tables, class names and functions from strings, including names of the form "customEnv.name" that point into a mod environment. All behaviour below is inferred from names and parameters (UNVERIFIED).

- **ClassUtil** (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `ClassUtil.getIsValidClassName(className: string) → boolean` | 14 | ✍ Signature only (no body in the SDK dump): presumably tests whether a string is an acceptable class name and returns a boolean. UNVERIFIED. |
| `ClassUtil.getIsValidIndexName(indexName: string) → boolean` | 25 | ✍ Signature only (no body in the SDK dump): presumably tests whether a string is an acceptable index name and returns a boolean. UNVERIFIED. |
| `ClassUtil.getClassObject(className: string) → table` | 40 | ✍ Signature only (no body in the SDK dump): presumably resolves a class name string to the class table. UNVERIFIED. |
| `ClassUtil.getClassObjectByObject(object: table) → table` | 59 | ✍ Signature only (no body in the SDK dump): presumably returns the class table of a given object instance. UNVERIFIED. |
| `ClassUtil.getClassName(classObject: table) → string\|nil` | 72 | ✍ Signature only (no body in the SDK dump): presumably returns the registered name of a class table, or nil if unknown. UNVERIFIED. |
| `ClassUtil.getClassNameByObject(object: table) → string\|nil` | 94 | ✍ Signature only (no body in the SDK dump): presumably returns the class name of an object instance, or nil. UNVERIFIED. |
| `ClassUtil.getClassModName(className: string) → string\|nil` | 107 | ✍ Signature only (no body in the SDK dump): presumably extracts the mod name from a class name written as "customEnv.className", or nil. UNVERIFIED. |
| `ClassUtil.getFunction(functionName: string) → any` | 119 | ✍ Signature only (no body in the SDK dump): presumably resolves a function from a name written as "customEnv.functionName" and returns it. UNVERIFIED. |
