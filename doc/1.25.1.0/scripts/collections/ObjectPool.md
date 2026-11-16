# collections/ObjectPool.lua

*[Version française](../../fr/scripts/collections/ObjectPool.md)*

Source: `dataS/scripts/collections/ObjectPool.lua` — FS25 1.25.1.0

✍ Reusable object pool that hands out pooled tables and builds new ones with a constructor when empty. A set prevents the same instance being pooled twice. ObjectPool.EMPTY_TABLE_CONSTRUCTOR is used here but not defined in this file (UNVERIFIED).

- **ObjectPool** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ObjectPool.new(objectConstructor: function?, ...: any) → ObjectPool` | 27 | ✍ Creates a pool. The optional constructor and its extra arguments are kept for creating objects when the pool is empty; without one, a default empty-table constructor is used. |
| `ObjectPool:getLength() → integer` | 52 | ✍ Returns how many objects are currently waiting in the pool. |
| `ObjectPool:clear()` | 59 | ✍ Empties the pool and its duplicate-check set. Pooled objects are simply forgotten, not deleted. |
| `ObjectPool:getOrCreateNext() → table` | 67 | ✍ Removes and returns the last pooled object, or creates a new one with the constructor and its saved arguments if the pool is empty. |
| `ObjectPool:returnToPool(instance: table)` | 94 | ✍ Puts an instance back in the pool. Default empty tables are cleared, other objects get their reset method called if present. Returns false for nil or an already pooled instance, else true. |
