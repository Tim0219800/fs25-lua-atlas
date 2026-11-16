# ai/tasks/AITask.lua

*[Version française](../../../fr/scripts/ai/tasks/AITask.md)*

Source: `dataS/scripts/ai/tasks/AITask.lua` — FS25 1.25.1.0

✍ Base class of all AI job tasks. A task knows whether it runs on the server, which job owns it, and keeps running, finished and mark-as-finished flags; subclasses override start, stop, update and validate. Jobs run their tasks in sequence and read getIsFinished to advance.

- **AITask** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITask.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Creates a task bound to the isServer flag and its owning job, initially not running and not finished. |
| `AITask:delete()` | 30 | ✍ Empty hook for subclasses to release resources. |
| `AITask:update(dt: any)` | 35 | ✍ Empty per-frame hook; the dt argument is the frame time step. Subclasses implement their logic here. |
| `AITask:start()` | 40 | ✍ Marks the task as running and not finished. If skip was requested earlier (markAsFinished), the task is immediately flagged finished and the request is cleared. |
| `AITask:skip()` | 54 | ✍ Finishes the task right away if it is running; otherwise remembers the request so the task completes as soon as it starts. |
| `AITask:stop(wasJobStopped: any)` | 65 | ✍ Marks the task as no longer running and clears any pending skip request. The wasJobStopped argument is unused here. |
| `AITask:reset()` | 73 | ✍ Clears the finished flag so the task can be run again. Subclasses extend it to clear their own references. |
| `AITask:validate(ignoreUnsetParameters: any)` | 79 | ✍ Base check that always succeeds, returning true and no error. Subclasses can return false with a message; ignoreUnsetParameters is unused here. |
| `AITask:getIsFinished()` | 85 | ✍ Returns whether the task has finished. |
