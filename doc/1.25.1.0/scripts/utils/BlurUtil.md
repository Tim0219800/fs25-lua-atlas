# utils/BlurUtil.lua

Source: `dataS/scripts/utils/BlurUtil.lua` — FS25 1.25.1.0

- **BlurUtil** (l.15)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BlurUtil.stackBlurAsync(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer, asyncManager: AsyncTaskManager?, callback: function)` | 39 |  |
| `BlurUtil.stackBlurHorizontal(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer)` | 74 |  |
| `BlurUtil.stackBlurVertical(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer)` | 92 |  |
| `BlurUtil.stackBlurRow(dataGetter: function, dataSetter: function, width: integer, radius: integer, y: integer, queue: table)` | 111 |  |
| `BlurUtil.stackBlurColumn(dataGetter: function, dataSetter: function, height: integer, radius: integer, x: integer, queue: table)` | 148 |  |
| `BlurUtil.recalculateBlurQueueAndSums(queue: table, kernelSize: integer, radius: integer, edgeValue: number) → number, number, number` | 186 |  |
| `BlurUtil.iterateStackBlur(dataGetter: function, dataSetter: function, queue: table, kernelSize: integer, stackSize: integer, radius: integer, sum: number, inSum: number, outSum: number, queueCounter: integer, x: integer, y: integer) → number, number, number, integer` | 234 |  |
