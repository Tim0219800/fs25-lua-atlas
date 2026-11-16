# utils/BlurUtil.lua

*[Version française](../../fr/scripts/utils/BlurUtil.md)*

Source: `dataS/scripts/utils/BlurUtil.lua` — FS25 1.25.1.0

✍ Generic 2D blur helpers that work on any data reachable through a getter(x, y) and a setter(x, y, value), using a stack-blur style weighted sliding window (triangular weights). Rows and columns are processed independently, either synchronously or as tasks queued on an async task manager. Coordinates are 1-based, and edge values are clamped.

- **BlurUtil** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `BlurUtil.stackBlurAsync(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer, asyncManager: AsyncTaskManager?, callback: function)` | 39 | ✍ Queues one task per row, then one per column, on the given async manager (g_asyncTaskManager if nil) and calls the callback in the task of the last column. Note: the callback is invoked unconditionally, so passing nil would error. |
| `BlurUtil.stackBlurHorizontal(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer)` | 74 | ✍ Blurs every row of the data synchronously, reusing one queue table across rows. Writes results in place through the setter. |
| `BlurUtil.stackBlurVertical(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer)` | 92 | ✍ Blurs every column of the data synchronously, reusing one queue table across columns. Writes results in place through the setter. |
| `BlurUtil.stackBlurRow(dataGetter: function, dataSetter: function, width: integer, radius: integer, y: integer, queue: table)` | 111 | ✍ Blurs the single row y: primes the window with the first value, then slides along x. Reads beyond the right edge are clamped to the last column. An optional queue table can be reused. |
| `BlurUtil.stackBlurColumn(dataGetter: function, dataSetter: function, height: integer, radius: integer, x: integer, queue: table)` | 148 | ✍ Blurs the single column x: primes the window with the first value, then slides along y. Reads beyond the bottom edge are clamped to the last row. An optional queue table can be reused. |
| `BlurUtil.recalculateBlurQueueAndSums(queue: table, kernelSize: integer, radius: integer, edgeValue: number) → number, number, number` | 186 | ✍ Fills the queue with the edge value and returns the initial weighted sum, incoming sum and outgoing sum for a kernel of the given size. Used at the start of each row or column. |
| `BlurUtil.iterateStackBlur(dataGetter: function, dataSetter: function, queue: table, kernelSize: integer, stackSize: integer, radius: integer, sum: number, inSum: number, outSum: number, queueCounter: integer, x: integer, y: integer) → number, number, number, integer` | 234 | ✍ Internal step: writes the averaged value at (x, y), then updates the queue and the three running sums with the next sample, and returns the new sums and counter. Not meant to be called from outside this class. |
