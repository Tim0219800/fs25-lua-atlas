# misc/Logging.lua

*[Version française](../../fr/scripts/misc/Logging.md)*

Source: `dataS/scripts/misc/Logging.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Global `Logging` table that prints prefixed messages to the console and log file. Variants exist for plain messages, XML files and i3d nodes. All bodies are stripped from the SDK dump, so behaviour is taken from the doc lines only and is UNVERIFIED.

- **Logging** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `Logging.xmlWarning(xmlFile: table\|integer\|string, warningMessage: string, ...: any)` | 33 | ✍ Signature only (no body in the SDK dump): prints a warning prefixed with the XML file name; accepts an XML file object, handle or string, plus a format message and its arguments. UNVERIFIED. |
| `Logging.xmlError(xmlFile: table\|integer\|string, errorMessage: string, ...: any)` | 44 | ✍ Signature only (no body in the SDK dump): prints an error prefixed with the XML file name, with a format message and arguments. UNVERIFIED. |
| `Logging.xmlInfo(xmlFile: table\|integer\|string, infoMessage: string, ...: any)` | 55 | ✍ Signature only (no body in the SDK dump): prints an info line prefixed with the XML file name, with a format message and arguments. UNVERIFIED. |
| `Logging.i3dWarning(node: integer, warningMessage: string, ...: any)` | 66 | ✍ Signature only (no body in the SDK dump): prints a warning prefixed with the name path and index path of an i3d node, with a format message and arguments. UNVERIFIED. |
| `Logging.i3dError(node: integer, errorMessage: string, ...: any)` | 77 | ✍ Signature only (no body in the SDK dump): prints an error prefixed with the name path and index path of an i3d node, with a format message and arguments. UNVERIFIED. |
| `Logging.i3dInfo(node: integer, infoMessage: string, ...: any)` | 88 | ✍ Signature only (no body in the SDK dump): prints an info line prefixed with the name path and index path of an i3d node, with a format message and arguments. UNVERIFIED. |
| `Logging.warning(warningMessage: string, ...: any)` | 133 | ✍ Signature only (no body in the SDK dump): prints a message prefixed with Warning:, with a format message and arguments. UNVERIFIED. |
| `Logging.error(errorMessage: string, ...: any)` | 142 | ✍ Signature only (no body in the SDK dump): prints a message prefixed with Error:, with a format message and arguments. UNVERIFIED. |
| `Logging.info(infoMessage: string, ...: any)` | 151 | ✍ Signature only (no body in the SDK dump): prints a message prefixed with Info:, with a format message and arguments. UNVERIFIED. |
| `Logging.fatal(fatalMessage: string, ...: any)` | 161 | ✍ Signature only (no body in the SDK dump): prints a fatal error and stops the game; documented for unrecoverable errors only. UNVERIFIED. |
