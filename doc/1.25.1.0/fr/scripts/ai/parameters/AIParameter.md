# ai/parameters/AIParameter.lua

*[English version](../../../../scripts/ai/parameters/AIParameter.md)*

Source: `dataS/scripts/ai/parameters/AIParameter.lua` — FS25 1.25.1.0

✍ Classe de base des valeurs qu'un joueur règle lors de la préparation d'un job IA. Elle porte un type (`AIParameterType`, TEXT par défaut) et un drapeau de validité, et fournit des points d'extension vides pour la sérialisation réseau ; les sous-classes ajoutent stockage, validation et défilement des valeurs dans l'interface.

- **AIParameter** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameter.new(customMt: any)` | 16 | ✍ Crée un paramètre de type TEXT, valide au départ. |
| `AIParameter:readStream(streamId: any, connection: any)` | 27 | ✍ Point d'extension vide pour lire la valeur depuis un flux réseau. |
| `AIParameter:writeStream(streamId: any, connection: any)` | 32 | ✍ Point d'extension vide pour écrire la valeur dans un flux réseau. |
| `AIParameter:getType()` | 37 | ✍ Renvoie l'`AIParameterType` du paramètre. |
| `AIParameter:getIsValid()` | 43 | ✍ Renvoie le drapeau de validité, que l'interface peut utiliser pour signaler un paramètre invalide. |
| `AIParameter:setIsValid(isValid: any)` | 49 | ✍ Fixe le drapeau de validité. |
| `AIParameter:getCanBeChanged()` | 55 | ✍ Renvoie true ; les paramètres en lecture seule comme le véhicule le redéfinissent. |
| `AIParameter:getString()` | 61 | ✍ Renvoie une chaîne vide ; les sous-classes renvoient le texte affiché dans l'interface. |
