# placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua

*[English version](../../../../../scripts/placeables/configurations/data/PlaceableConfigurationDataObjectChange.md)*

Source: `dataS/scripts/placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua` — FS25 1.25.1.0

✍ Greffon qui ajoute la prise en charge des changements d'objets aux configurations de placeables. Chaque élément de configuration choisit si ses changements d'objets sont appliqués au chargement ou après le post-chargement, via l'attribut XML `#postLoadObjectChange`. Les changements eux-mêmes sont gérés par `ObjectChangeUtil`.

- **PlaceableConfigurationDataObjectChange** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableConfigurationDataObjectChange.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Enregistre le chemin booléen `#postLoadObjectChange` (false par défaut) et les chemins XML standard de changement d'objets sous la clé de configuration. |
| `PlaceableConfigurationDataObjectChange.loadConfigItem(configItem: any, xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 21 | ✍ Lit `#postLoadObjectChange` dans le XML et le stocke sur l'élément de configuration. |
| `PlaceableConfigurationDataObjectChange.onLoad(placeable: any, configItem: any, configId: any)` | 27 | ✍ Si l'élément n'est pas marqué post-chargement, applique les changements d'objets pour l'identifiant de configuration choisi via `ObjectChangeUtil.updateObjectChanges` avec les composants du placeable. |
| `PlaceableConfigurationDataObjectChange.onPostLoad(placeable: any, configItem: any, configId: any)` | 36 | ✍ Identique à `onLoad` mais ne s'exécute que si l'élément est marqué `postLoadObjectChange` : les changements sont alors appliqués après le post-chargement. |
