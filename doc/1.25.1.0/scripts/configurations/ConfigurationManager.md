# configurations/ConfigurationManager.lua

*[Version française](../../fr/scripts/configurations/ConfigurationManager.md)*

Source: `dataS/scripts/configurations/ConfigurationManager.lua` — FS25 1.25.1.0

✍ Manager subclassing AbstractManager that holds the registered configuration types (for example vehicle or placeable options) with name/index lookups and a priority-sorted name list. In this file it only stores and exposes that data; registration of configurations happens elsewhere (UNVERIFIED). Each description is expected to carry an item class with a SELECTOR value and XML keys.

- **ConfigurationManager** inherits from `AbstractManager` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConfigurationManager.new(typeName: any, rootElementName: any, customMt: any) → table` | 17 | ✍ Creates the manager via AbstractManager.new, stores the type name and XML root element name, and initializes the data tables. |
| `ConfigurationManager:initDataStructures()` | 29 | ✍ Resets the configurations table, the index-to-name and name-to-index maps and the sorted name list to empty tables. |
| `ConfigurationManager:getNumOfConfigurationTypes() → integer` | 90 | ✍ Returns how many configuration types are registered (length of the index-to-name list). |
| `ConfigurationManager:getConfigurationTypes() → table` | 97 | ✍ Returns the list of configuration names in registration (index) order. This is the internal table, not a copy. |
| `ConfigurationManager:getSortedConfigurationTypes() → table` | 104 | ✍ Returns the list of configuration names sorted by priority. This is the internal table, not a copy. |
| `ConfigurationManager:getConfigurationNameByIndex(index: integer) → string` | 112 | ✍ Returns the configuration name registered at the given index, or nil. |
| `ConfigurationManager:getConfigurationIndexByName(name: string) → integer` | 120 | ✍ Returns the index of the configuration with the given name, or nil. |
| `ConfigurationManager:getConfigurations() → table` | 127 | ✍ Returns the table of all configuration descriptions keyed by name. |
| `ConfigurationManager:getConfigurationDescByName(name: string) → table` | 135 | ✍ Returns the description table of a configuration by name, or nil if unknown. |
| `ConfigurationManager:getConfigurationAttribute(configurationName: string, attribute: string) → any` | 144 | ✍ Returns one attribute from a configuration description. Not nil-safe: it errors if the configuration name is unknown. |
| `ConfigurationManager:getConfigurationSelectorType(configurationName: string) → integer` | 153 | ✍ Returns the SELECTOR value of the configuration's item class, or ConfigurationUtil.SELECTOR_MULTIOPTION when the configuration is unknown. |
| `ConfigurationManager:getConfigurationKeys(configurationName: string)` | 166 | ✍ Returns the XML key of the configurations container and of the individual configuration element for a name, or nil, nil if unknown. |
| `ConfigurationManager:configurationKeyIterator()` | 177 | ✍ Returns an iterator over all configuration types yielding the container key and the element key with a `(?)` index wildcard appended. Note: it would error if a name has no registered keys, since it concatenates a nil. |
