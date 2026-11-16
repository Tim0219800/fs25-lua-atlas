# misc/Logging.lua

*[English version](../../../scripts/misc/Logging.md)*

Source: `dataS/scripts/misc/Logging.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Table globale `Logging` qui écrit des messages préfixés dans la console et le fichier de log, avec des variantes pour les messages simples, les fichiers XML et les noeuds i3d. Tous les corps sont retirés du dump du SDK : le comportement vient des seules lignes de documentation et reste NON VÉRIFIÉ.

- **Logging** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Logging.xmlWarning(xmlFile: table\|integer\|string, warningMessage: string, ...: any)` | 33 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit un avertissement préfixé du nom du fichier XML ; accepte un objet fichier XML, un handle ou une chaîne, plus un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.xmlError(xmlFile: table\|integer\|string, errorMessage: string, ...: any)` | 44 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit une erreur préfixée du nom du fichier XML, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.xmlInfo(xmlFile: table\|integer\|string, infoMessage: string, ...: any)` | 55 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit une ligne d'information préfixée du nom du fichier XML, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.i3dWarning(node: integer, warningMessage: string, ...: any)` | 66 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit un avertissement préfixé du chemin de noms et du chemin d'indices d'un noeud i3d, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.i3dError(node: integer, errorMessage: string, ...: any)` | 77 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit une erreur préfixée du chemin de noms et du chemin d'indices d'un noeud i3d, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.i3dInfo(node: integer, infoMessage: string, ...: any)` | 88 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit une ligne d'information préfixée du chemin de noms et du chemin d'indices d'un noeud i3d, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.warning(warningMessage: string, ...: any)` | 133 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit un message préfixé par Warning:, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.error(errorMessage: string, ...: any)` | 142 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit un message préfixé par Error:, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.info(infoMessage: string, ...: any)` | 151 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit un message préfixé par Info:, avec un message de format et ses arguments. NON VÉRIFIÉ. |
| `Logging.fatal(fatalMessage: string, ...: any)` | 161 | ✍ Signature seule (pas de corps dans le dump du SDK) : écrit une erreur fatale et arrête le jeu ; documenté pour les erreurs irrécupérables uniquement. NON VÉRIFIÉ. |
