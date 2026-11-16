# configurations/ConfigurationManager.lua

*[English version](../../../scripts/configurations/ConfigurationManager.md)*

Source: `dataS/scripts/configurations/ConfigurationManager.lua` — FS25 1.25.1.0

✍ Gestionnaire héritant d'AbstractManager qui contient les types de configuration enregistrés (par exemple options de véhicule ou de placeable), avec recherche par nom/indice et une liste de noms triée par priorité. Dans ce fichier il ne fait que stocker et exposer ces données ; l'enregistrement se fait ailleurs (NON VÉRIFIÉ). Chaque description doit porter une classe d'item avec une valeur SELECTOR et des clés XML.

- **ConfigurationManager** hérite de `AbstractManager` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConfigurationManager.new(typeName: any, rootElementName: any, customMt: any) → table` | 17 | ✍ Crée le gestionnaire via AbstractManager.new, mémorise le nom de type et le nom de l'élément racine XML, et initialise les tables de données. |
| `ConfigurationManager:initDataStructures()` | 29 | ✍ Réinitialise la table des configurations, les correspondances indice vers nom et nom vers indice, et la liste de noms triée à des tables vides. |
| `ConfigurationManager:getNumOfConfigurationTypes() → integer` | 90 | ✍ Retourne le nombre de types de configuration enregistrés (longueur de la liste indice vers nom). |
| `ConfigurationManager:getConfigurationTypes() → table` | 97 | ✍ Retourne la liste des noms de configuration dans l'ordre d'enregistrement (indice). C'est la table interne, pas une copie. |
| `ConfigurationManager:getSortedConfigurationTypes() → table` | 104 | ✍ Retourne la liste des noms de configuration triée par priorité. C'est la table interne, pas une copie. |
| `ConfigurationManager:getConfigurationNameByIndex(index: integer) → string` | 112 | ✍ Retourne le nom de configuration enregistré à l'indice donné, ou nil. |
| `ConfigurationManager:getConfigurationIndexByName(name: string) → integer` | 120 | ✍ Retourne l'indice de la configuration portant le nom donné, ou nil. |
| `ConfigurationManager:getConfigurations() → table` | 127 | ✍ Retourne la table de toutes les descriptions de configuration indexée par nom. |
| `ConfigurationManager:getConfigurationDescByName(name: string) → table` | 135 | ✍ Retourne la table de description d'une configuration par nom, ou nil si inconnue. |
| `ConfigurationManager:getConfigurationAttribute(configurationName: string, attribute: string) → any` | 144 | ✍ Retourne un attribut d'une description de configuration. Non protégé contre nil : provoque une erreur si le nom de configuration est inconnu. |
| `ConfigurationManager:getConfigurationSelectorType(configurationName: string) → integer` | 153 | ✍ Retourne la valeur SELECTOR de la classe d'item de la configuration, ou ConfigurationUtil.SELECTOR_MULTIOPTION si la configuration est inconnue. |
| `ConfigurationManager:getConfigurationKeys(configurationName: string)` | 166 | ✍ Retourne la clé XML du conteneur de configurations et celle de l'élément de configuration individuel pour un nom, ou nil, nil si inconnu. |
| `ConfigurationManager:configurationKeyIterator()` | 177 | ✍ Retourne un itérateur sur tous les types de configuration qui fournit la clé du conteneur et la clé de l'élément avec le joker d'indice `(?)` ajouté. À noter : une erreur surviendrait si un nom n'a pas de clés enregistrées, car une valeur nil est concaténée. |
