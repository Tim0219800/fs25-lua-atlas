# vehicles/WorkAreaTypeManager.lua

*[English version](../../../scripts/vehicles/WorkAreaTypeManager.md)*

Source: `dataS/scripts/vehicles/WorkAreaTypeManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (étend `AbstractManager`) qui enregistre les types de zones de travail et les expose par index et par nom. L'enregistrement remplit la table globale `WorkAreaType` (nom vers index) et stocke trois indicateurs par type : attire la faune, zone d'IA, zone d'aide à la conduite. L'endroit où les types sont enregistrés n'est pas dans ce fichier (NON VÉRIFIÉ).

- **WorkAreaTypeManager** hérite de `AbstractManager` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WorkAreaTypeManager.new(customMt: any) → table` | 19 | ✍ Constructeur, crée le gestionnaire via `AbstractManager.new`. |
| `WorkAreaTypeManager:initDataStructures()` | 27 | ✍ Réinitialise la liste des types et les tables de recherche et relie la globale `WorkAreaType` à la table nom vers index. |
| `WorkAreaTypeManager:addWorkAreaType(name: any, attractWildlife: any, isAIArea: any, isSteeringAssistArea: any)` | 36 | ✍ Enregistre un nouveau type de zone de travail avec nom en majuscules et les trois indicateurs optionnels (false par défaut). Journalise une erreur et retourne si le nom est absent ou déjà utilisé. |
| `WorkAreaTypeManager:getWorkAreaTypeNameByIndex(index: any)` | 64 | ✍ Retourne le nom du type pour un index, ou nil s'il est inconnu. |
| `WorkAreaTypeManager:getWorkAreaTypeIndexByName(name: any)` | 75 | ✍ Retourne l'index d'un type d'après son nom (insensible à la casse), ou nil. |
| `WorkAreaTypeManager:getConfigurationDescByName(name: any)` | 84 | ✍ Retourne la table descriptive complète (nom, index, indicateurs) d'un nom de type, ou nil. |
| `WorkAreaTypeManager:getWorkAreaTypeByIndex(index: any)` | 93 | ✍ Retourne la table descriptive stockée à l'index donné, ou nil. |
| `WorkAreaTypeManager:getWorkAreaTypeIsAIArea(index: any)` | 99 | ✍ Indique si le type à cet index est une zone d'IA ; false si l'index est inconnu. |
| `WorkAreaTypeManager:getWorkAreaTypeIsSteeringAssistArea(index: any)` | 109 | ✍ Indique si le type à cet index est une zone d'aide à la conduite ; false si l'index est inconnu. |
