# utils/ClassUtil.lua

*[English version](../../../scripts/utils/ClassUtil.md)*

Source: `dataS/scripts/utils/ClassUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Signature seule (pas de corps dans le dump du SDK) : fonctions pour retrouver des tables de classes, des noms de classes et des fonctions à partir de chaînes, y compris des noms de la forme "customEnv.nom" pointant dans l'environnement d'un mod. Tout le comportement ci-dessous est déduit des noms et paramètres (NON VÉRIFIÉ).

- **ClassUtil** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ClassUtil.getIsValidClassName(className: string) → boolean` | 14 | ✍ Signature seule (pas de corps dans le dump du SDK) : teste vraisemblablement si une chaîne est un nom de classe acceptable et renvoie un booléen. NON VÉRIFIÉ. |
| `ClassUtil.getIsValidIndexName(indexName: string) → boolean` | 25 | ✍ Signature seule (pas de corps dans le dump du SDK) : teste vraisemblablement si une chaîne est un nom d'index acceptable et renvoie un booléen. NON VÉRIFIÉ. |
| `ClassUtil.getClassObject(className: string) → table` | 40 | ✍ Signature seule (pas de corps dans le dump du SDK) : résout vraisemblablement un nom de classe en table de classe. NON VÉRIFIÉ. |
| `ClassUtil.getClassObjectByObject(object: table) → table` | 59 | ✍ Signature seule (pas de corps dans le dump du SDK) : renvoie vraisemblablement la table de classe d'une instance donnée. NON VÉRIFIÉ. |
| `ClassUtil.getClassName(classObject: table) → string\|nil` | 72 | ✍ Signature seule (pas de corps dans le dump du SDK) : renvoie vraisemblablement le nom enregistré d'une table de classe, ou nil si inconnu. NON VÉRIFIÉ. |
| `ClassUtil.getClassNameByObject(object: table) → string\|nil` | 94 | ✍ Signature seule (pas de corps dans le dump du SDK) : renvoie vraisemblablement le nom de classe d'une instance, ou nil. NON VÉRIFIÉ. |
| `ClassUtil.getClassModName(className: string) → string\|nil` | 107 | ✍ Signature seule (pas de corps dans le dump du SDK) : extrait vraisemblablement le nom du mod d'un nom de classe écrit "customEnv.className", ou nil. NON VÉRIFIÉ. |
| `ClassUtil.getFunction(functionName: string) → any` | 119 | ✍ Signature seule (pas de corps dans le dump du SDK) : résout vraisemblablement une fonction à partir d'un nom écrit "customEnv.functionName" et la renvoie. NON VÉRIFIÉ. |
