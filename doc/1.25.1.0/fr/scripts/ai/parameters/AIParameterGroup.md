# ai/parameters/AIParameterGroup.lua

*[English version](../../../../scripts/ai/parameters/AIParameterGroup.md)*

Source: `dataS/scripts/ai/parameters/AIParameterGroup.lua` — FS25 1.25.1.0

✍ Simple conteneur qui regroupe plusieurs paramètres IA sous un titre localisé pour l'écran de préparation du job. Ce n'est pas lui-même un `AIParameter`.

- **AIParameterGroup** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterGroup.new(title: any, customMt: any)` | 16 | ✍ Crée un groupe avec le titre donné et une liste de paramètres vide. |
| `AIParameterGroup:getTitle()` | 27 | ✍ Renvoie le titre du groupe. |
| `AIParameterGroup:addParameter(parameter: any)` | 33 | ✍ Ajoute un paramètre au groupe. |
| `AIParameterGroup:getParameters()` | 39 | ✍ Renvoie la liste des paramètres du groupe. |
