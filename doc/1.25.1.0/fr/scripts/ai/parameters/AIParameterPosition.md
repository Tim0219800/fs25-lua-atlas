# ai/parameters/AIParameterPosition.lua

*[English version](../../../../scripts/ai/parameters/AIParameterPosition.md)*

Source: `dataS/scripts/ai/parameters/AIParameterPosition.lua` — FS25 1.25.1.0

✍ Paramètre de job IA qui contient une position monde 2D (x, z). Il est sauvegardé en attributs XML flottants, transmis en deux float32 et validé par le test d'accessibilité du système IA. `AIParameterPositionAngle` l'étend avec un cap.

- **AIParameterPosition** hérite de `AIParameter` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterPosition.new(customMt: any)` | 16 | ✍ Crée le paramètre de type POSITION, sans position. |
| `AIParameterPosition:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Écrit `#x` et `#z` quand une position est définie. |
| `AIParameterPosition:loadFromXMLFile(xmlFile: any, key: any)` | 38 | ✍ Lit `#x` et `#z`, en gardant les valeurs courantes si absentes. |
| `AIParameterPosition:readStream(streamId: any, connection: any)` | 45 | ✍ Lit un drapeau de présence et, si défini, x et z en float32. |
| `AIParameterPosition:writeStream(streamId: any, connection: any)` | 55 | ✍ Écrit un drapeau de présence et, si une position est définie, x et z en float32. |
| `AIParameterPosition:setPosition(x: any, z: any)` | 64 | ✍ Mémorise les coordonnées monde x et z. |
| `AIParameterPosition:getPosition()` | 71 | ✍ Renvoie x et z, tous deux nil si non définis. |
| `AIParameterPosition:getString()` | 77 | ✍ Renvoie la position formatée « < x , z > » avec une décimale. Provoque une erreur si la position est nil (aucun contrôle de nil). |
| `AIParameterPosition:validate()` | 83 | ✍ Renvoie false avec une erreur localisée si la position manque ou si `aiSystem:getIsPositionReachable(x, 0, z)` la dit bloquée ; sinon true et nil. Cette méthode du système IA n'est pas dans ce fichier (NON VÉRIFIÉ). |
