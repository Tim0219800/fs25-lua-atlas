# misc/ToolTypeManager.lua

*[English version](../../../scripts/misc/ToolTypeManager.md)*

Source: `dataS/scripts/misc/ToolTypeManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (sous-classe d'AbstractManager) qui enregistre des noms de types d'outil et les numérote dans l'ordre d'enregistrement. Cinq sont intégrés : undefined, dischargeable, pallet, trigger, bale. initDataStructures publie la table globale ToolType (NOM vers indice) pour écrire par exemple ToolType.BALE.

- **ToolTypeManager** hérite de `AbstractManager` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ToolTypeManager.new(customMt: any) → table` | 19 | ✍ Constructeur : crée le gestionnaire à partir d'AbstractManager avec la métatable fournie ou celle par défaut. |
| `ToolTypeManager:initDataStructures()` | 27 | ✍ Réinitialise les tables indice vers nom et nom vers indice et affecte la globale ToolType à la table nom vers indice. |
| `ToolTypeManager:loadMapData() → boolean` | 37 | ✍ Appelle le chargeur parent puis enregistre les cinq types d'outil intégrés (undefined, dischargeable, pallet, trigger, bale), avec les indices 1 à 5. Retourne true. |
| `ToolTypeManager:addToolType(name: string) → table` | 54 | ✍ Enregistre un type d'outil sous son nom en majuscules et retourne son indice ; un nom existant n'est pas dupliqué. Avertit et retourne nil si le nom n'est pas un nom d'indice valide. |
| `ToolTypeManager:getToolTypeNameByIndex(index: integer) → string` | 72 | ✍ Retourne le nom du type d'outil pour un indice, ou "UNDEFINED" si l'indice est inconnu. |
| `ToolTypeManager:getToolTypeIndexByName(name: string) → integer` | 84 | ✍ Retourne l'indice du type d'outil pour un nom (insensible à la casse), ou l'indice de UNDEFINED si le nom est inconnu. |
| `ToolTypeManager:getNumberOfToolTypes() → integer` | 96 | ✍ Retourne le nombre de types d'outil enregistrés. |
