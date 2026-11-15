# specialization/SpecializationUtil.lua

Source: `dataS/scripts/specialization/SpecializationUtil.lua` — FS25 1.25.1.0

- **SpecializationUtil** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SpecializationUtil.raiseAsyncEvent(object: table, eventName: string, ...: any)` | 19 |  |
| `SpecializationUtil.raiseEvent(object: table, eventName: string, ...: any)` | 45 |  |
| `SpecializationUtil.registerFunction(objectType: table, funcName: string, func: function)` | 68 |  |
| `SpecializationUtil.registerOverwrittenFunction(objectType: table, funcName: string, func: function)` | 103 |  |
| `SpecializationUtil.registerEvent(objectType: table, eventName: string)` | 128 |  |
| `SpecializationUtil.registerEventListener(objectType: table, eventName: string, specClass: table)` | 158 |  |
| `SpecializationUtil.removeEventListener(object: table, eventName: string, specClass: table)` | 207 |  |
| `SpecializationUtil.hasSpecialization(spec: table, specializations: table) → boolean` | 225 |  |
| `SpecializationUtil.initSpecializationsIntoTypeClass(typeManager: any, typeDef: any, target: table) → any` | 241 |  |
| `SpecializationUtil.copyTypeFunctionsInto(typeDef: table, target: table)` | 256 |  |
| `SpecializationUtil.createLoadingTask(typeClass: table, target: any) → table` | 302 |  |
| `SpecializationUtil.finishLoadingTask(typeClass: table, task: table)` | 321 |  |
| `SpecializationUtil.setLoadingStep(typeClass: table, loadingStep: SpecializationLoadStep)` | 342 |  |
| `SpecializationUtil.getIsValidLoadingStep(loadingStep: SpecializationLoadStep) → boolean` | 359 |  |
