# vehicles/specializations/BalerStationary.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BalerStationary.md)*

Source: `dataS/scripts/vehicles/specializations/BalerStationary.lua` — FS25 1.25.1.0

✍ Specialization stub for stationary balers. In this dump the file only defines the prerequisites and the event registration: the table BalerStationary is never created here and the onLoad, onDelete and onDraw listeners it registers have no function bodies. UNVERIFIED: the rest of the behaviour (the file is probably truncated by the SDK dump).


## Functions

| Function | Line | Description |
|---|---|---|
| `BalerStationary.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Returns true only when the vehicle type has the Baler, BaleWrapper and FoldableSteps specializations all together. |
| `BalerStationary.registerEventListeners(vehicleType: table)` | 29 | ✍ Registers onLoad, onDelete and onDraw for this specialization. Note: the dump contains no matching BalerStationary:onLoad/onDelete/onDraw definitions, so their behaviour is UNVERIFIED. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 30 |
| registerEventListener | `onDelete` | 31 |
| registerEventListener | `onDraw` | 32 |
