# configurations/ConfigurationManager.lua

Source : `dataS/scripts/configurations/ConfigurationManager.lua` — FS25 1.25.1.0

- **ConfigurationManager** hérite de `AbstractManager` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConfigurationManager.new(typeName: any, rootElementName: any, customMt: any) → table` | 17 |  |
| `ConfigurationManager:initDataStructures()` | 29 |  |
| `ConfigurationManager:getNumOfConfigurationTypes() → integer` | 90 |  |
| `ConfigurationManager:getConfigurationTypes() → table` | 97 |  |
| `ConfigurationManager:getSortedConfigurationTypes() → table` | 104 |  |
| `ConfigurationManager:getConfigurationNameByIndex(index: integer) → string` | 112 |  |
| `ConfigurationManager:getConfigurationIndexByName(name: string) → integer` | 120 |  |
| `ConfigurationManager:getConfigurations() → table` | 127 |  |
| `ConfigurationManager:getConfigurationDescByName(name: string) → table` | 135 |  |
| `ConfigurationManager:getConfigurationAttribute(configurationName: string, attribute: string) → any` | 144 |  |
| `ConfigurationManager:getConfigurationSelectorType(configurationName: string) → integer` | 153 |  |
| `ConfigurationManager:getConfigurationKeys(configurationName: string)` | 166 |  |
| `ConfigurationManager:configurationKeyIterator()` | 177 |  |
