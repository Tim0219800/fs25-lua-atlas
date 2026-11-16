---@meta
-- FS25 1.25.1.0 : specialization/SpecializationUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helper functions shared by every object type built from specializations (vehicles, placeables...). They register functions, overwritten functions, events and event listeners on a type table, and dispatch events to the listening specializations of an object. A second group manages a simple loading-task counter and the loading step of a type class.
---@class SpecializationUtil
SpecializationUtil = {}

--- Like raiseEvent, but each listener call is queued on the object via addAsyncTask instead of running immediately. Arguments are captured first; an unregistered event logs an error with callstack.
---@param object table
---@param eventName string
function SpecializationUtil.raiseAsyncEvent(object, eventName, ...) end

--- Calls the event function of every specialization listening to the event on this object, in registration order, passing the object and the extra arguments. Logs an error and returns if the event is not registered for the type.
---@param object table
---@param eventName string
function SpecializationUtil.raiseEvent(object, eventName, ...) end

--- Adds a function to the type's function table under the given name. Errors (and does nothing) if the name is empty, the function is nil, or the name is already used as a function or event.
---@param objectType table
---@param funcName string
---@param func function
function SpecializationUtil.registerFunction(objectType, funcName, func) end

--- Wraps an already registered type function with a replacement through Utils.overwrittenFunction. If no function with that name exists, nothing happens and no error is raised.
---@param objectType table
---@param funcName string
---@param func function
function SpecializationUtil.registerOverwrittenFunction(objectType, funcName, func) end

--- Declares a new event on the type and creates its empty listener list. Errors if the name is empty or already registered as a function or event.
---@param objectType table
---@param eventName string
function SpecializationUtil.registerEvent(objectType, eventName) end

--- Appends a specialization class to the listeners of an event on the type. The class must define a function named like the event and must not already be registered; an event unknown to the type is silently ignored.
---@param objectType table
---@param eventName string
---@param specClass table
function SpecializationUtil.registerEventListener(objectType, eventName, specClass) end

--- Removes a specialization class from the listener list of an event on a specific object (instance-level, not type-level). Does nothing if the event has no list.
---@param object table
---@param eventName string
---@param specClass table
function SpecializationUtil.removeEventListener(object, eventName, specClass) end

--- Returns true if the given specialization class appears in the given list of specializations.
---@param spec table
---@param specializations table
---@return boolean
function SpecializationUtil.hasSpecialization(spec, specializations) end

--- Copies the type definition's references (type, name, specializations, names, by-name map) onto the target object and gives it its own clone (depth 2) of the event listener tables. Returns the typeDef.
---@param typeManager any
---@param typeDef any
---@param target table
---@return any
function SpecializationUtil.initSpecializationsIntoTypeClass(typeManager, typeDef, target) end

--- Copies every function registered on the type definition into the target table, overwriting same-named fields.
---@param typeDef table
---@param target table
function SpecializationUtil.copyTypeFunctionsInto(typeDef, target) end

--- Appends a new task entry holding the given target to the type class's loadingTasks list and returns it. The class must already have a loadingTasks table.
---@param typeClass table
---@param target any
---@return table
function SpecializationUtil.createLoadingTask(typeClass, target) end

--- Removes a task from loadingTasks (warns if it was not there). If readyForFinishLoading is set and no task remains, calls the class's onFinishedLoading.
---@param typeClass table
---@param task table
function SpecializationUtil.finishLoadingTask(typeClass, task) end

--- Stores the loading step on the type class after validating it against SpecializationLoadStep; an invalid value logs an error with callstack and changes nothing.
---@param typeClass table
---@param loadingStep SpecializationLoadStep
function SpecializationUtil.setLoadingStep(typeClass, loadingStep) end

--- Returns true if the value equals one of the values of the SpecializationLoadStep enum (defined elsewhere, UNVERIFIED here).
---@param loadingStep SpecializationLoadStep
---@return boolean
function SpecializationUtil.getIsValidLoadingStep(loadingStep) end
