# specialization/SpecializationUtil.lua

*[Version française](../../fr/scripts/specialization/SpecializationUtil.md)*

Source: `dataS/scripts/specialization/SpecializationUtil.lua` — FS25 1.25.1.0

✍ Static helper functions shared by every object type built from specializations (vehicles, placeables...). They register functions, overwritten functions, events and event listeners on a type table, and dispatch events to the listening specializations of an object. A second group manages a simple loading-task counter and the loading step of a type class.

- **SpecializationUtil** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `SpecializationUtil.raiseAsyncEvent(object: table, eventName: string, ...: any)` | 19 | ✍ Like raiseEvent, but each listener call is queued on the object via addAsyncTask instead of running immediately. Arguments are captured first; an unregistered event logs an error with callstack. |
| `SpecializationUtil.raiseEvent(object: table, eventName: string, ...: any)` | 45 | ✍ Calls the event function of every specialization listening to the event on this object, in registration order, passing the object and the extra arguments. Logs an error and returns if the event is not registered for the type. |
| `SpecializationUtil.registerFunction(objectType: table, funcName: string, func: function)` | 68 | ✍ Adds a function to the type's function table under the given name. Errors (and does nothing) if the name is empty, the function is nil, or the name is already used as a function or event. |
| `SpecializationUtil.registerOverwrittenFunction(objectType: table, funcName: string, func: function)` | 103 | ✍ Wraps an already registered type function with a replacement through Utils.overwrittenFunction. If no function with that name exists, nothing happens and no error is raised. |
| `SpecializationUtil.registerEvent(objectType: table, eventName: string)` | 128 | ✍ Declares a new event on the type and creates its empty listener list. Errors if the name is empty or already registered as a function or event. |
| `SpecializationUtil.registerEventListener(objectType: table, eventName: string, specClass: table)` | 158 | ✍ Appends a specialization class to the listeners of an event on the type. The class must define a function named like the event and must not already be registered; an event unknown to the type is silently ignored. |
| `SpecializationUtil.removeEventListener(object: table, eventName: string, specClass: table)` | 207 | ✍ Removes a specialization class from the listener list of an event on a specific object (instance-level, not type-level). Does nothing if the event has no list. |
| `SpecializationUtil.hasSpecialization(spec: table, specializations: table) → boolean` | 225 | ✍ Returns true if the given specialization class appears in the given list of specializations. |
| `SpecializationUtil.initSpecializationsIntoTypeClass(typeManager: any, typeDef: any, target: table) → any` | 241 | ✍ Copies the type definition's references (type, name, specializations, names, by-name map) onto the target object and gives it its own clone (depth 2) of the event listener tables. Returns the typeDef. |
| `SpecializationUtil.copyTypeFunctionsInto(typeDef: table, target: table)` | 256 | ✍ Copies every function registered on the type definition into the target table, overwriting same-named fields. |
| `SpecializationUtil.createLoadingTask(typeClass: table, target: any) → table` | 302 | ✍ Appends a new task entry holding the given target to the type class's loadingTasks list and returns it. The class must already have a loadingTasks table. |
| `SpecializationUtil.finishLoadingTask(typeClass: table, task: table)` | 321 | ✍ Removes a task from loadingTasks (warns if it was not there). If readyForFinishLoading is set and no task remains, calls the class's onFinishedLoading. |
| `SpecializationUtil.setLoadingStep(typeClass: table, loadingStep: SpecializationLoadStep)` | 342 | ✍ Stores the loading step on the type class after validating it against SpecializationLoadStep; an invalid value logs an error with callstack and changes nothing. |
| `SpecializationUtil.getIsValidLoadingStep(loadingStep: SpecializationLoadStep) → boolean` | 359 | ✍ Returns true if the value equals one of the values of the SpecializationLoadStep enum (defined elsewhere, UNVERIFIED here). |
