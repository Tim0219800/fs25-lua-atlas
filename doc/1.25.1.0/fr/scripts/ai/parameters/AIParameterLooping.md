# ai/parameters/AIParameterLooping.lua

*[English version](../../../../scripts/ai/parameters/AIParameterLooping.md)*

Source: `dataS/scripts/ai/parameters/AIParameterLooping.lua` — FS25 1.25.1.0

✍ Paramètre de job IA qui contient un choix oui/non de bouclage que le joueur bascule dans l'interface. Il est sauvegardé en XML comme attribut booléen et transmis comme un seul booléen.

- **AIParameterLooping** hérite de `AIParameter` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterLooping.new(customMt: any)` | 16 | ✍ Crée le paramètre de type SELECTOR, avec le bouclage désactivé. |
| `AIParameterLooping:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 28 | ✍ Écrit le drapeau de bouclage dans `#isLooping`. |
| `AIParameterLooping:loadFromXMLFile(xmlFile: any, key: any)` | 34 | ✍ Lit `#isLooping`, en gardant la valeur courante si absent. |
| `AIParameterLooping:readStream(streamId: any, connection: any)` | 40 | ✍ Lit un booléen et l'applique comme drapeau de bouclage. |
| `AIParameterLooping:writeStream(streamId: any, connection: any)` | 46 | ✍ Écrit le drapeau de bouclage comme un booléen. |
| `AIParameterLooping:setIsLooping(isLooping: any)` | 52 | ✍ Fixe le drapeau de bouclage. |
| `AIParameterLooping:getIsLooping()` | 58 | ✍ Renvoie le drapeau de bouclage. |
| `AIParameterLooping:getString()` | 64 | ✍ Renvoie le texte localisé « en boucle » ou « sans boucle ». |
| `AIParameterLooping:setNextItem()` | 74 | ✍ Bascule le drapeau de bouclage. |
| `AIParameterLooping:setPreviousItem()` | 80 | ✍ Bascule le drapeau de bouclage, comme `setNextItem`. |
