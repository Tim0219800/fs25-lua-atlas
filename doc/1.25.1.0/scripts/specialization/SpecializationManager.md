# specialization/SpecializationManager.lua

Source : `dataS/scripts/specialization/SpecializationManager.lua` — FS25 1.25.1.0

- **SpecializationManager** hérite de `AbstractManager` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpecializationManager.new(typeName: string, xmlFilename: string, customMt: table?) → SpecializationManager` | 34 |  |
| `SpecializationManager:initDataStructures()` | 45 |  |
| `SpecializationManager:loadMapData() → boolean` | 53 |  |
| `SpecializationManager:addSpecialization(name: string, className: string, filename: string, customEnvironment: string) → boolean` | 118 |  |
| `SpecializationManager:initSpecializations()` | 154 |  |
| `SpecializationManager:postInitSpecializations()` | 167 |  |
| `SpecializationManager:getSpecializationByName(name: string) → table?` | 182 |  |
| `SpecializationManager:getSpecializationObjectByName(name: string) → table?` | 194 |  |
| `SpecializationManager:getSpecializations() → table` | 207 |  |
