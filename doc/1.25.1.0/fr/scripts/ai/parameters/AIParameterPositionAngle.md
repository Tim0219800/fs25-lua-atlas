# ai/parameters/AIParameterPositionAngle.lua

*[English version](../../../../scripts/ai/parameters/AIParameterPositionAngle.md)*

Source: `dataS/scripts/ai/parameters/AIParameterPositionAngle.lua` — FS25 1.25.1.0

✍ Paramètre de job IA qui mémorise une position sur la carte et un angle de cap (radians). Il étend AIParameterPosition, ajoute la persistance XML et réseau de l'angle et l'aligne sur un pas configurable. La validation exige un angle en plus des contrôles du parent.

- **AIParameterPositionAngle** hérite de `AIParameterPosition` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterPositionAngle.new(snappingAngle: any, customMt: any)` | 16 | ✍ Crée le paramètre de type POSITION_ANGLE, sans angle pour l'instant, avec un pas d'alignement (valeur absolue de l'argument, 5 degrés en radians par défaut). |
| `AIParameterPositionAngle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Appelle la sauvegarde du parent, puis écrit l'angle dans l'attribut `#angle` de la clé s'il est défini. |
| `AIParameterPositionAngle:loadFromXMLFile(xmlFile: any, key: any)` | 38 | ✍ Appelle le chargement du parent, puis lit `#angle` ; la valeur actuelle est conservée si l'attribut est absent. |
| `AIParameterPositionAngle:readStream(streamId: any, connection: any)` | 46 | ✍ Lit les données du parent, puis un angle optionnel transmis comme entier sur 9 bits en degrés, converti en radians via setAngle. |
| `AIParameterPositionAngle:writeStream(streamId: any, connection: any)` | 57 | ✍ Écrit les données du parent, puis un indicateur de présence et l'angle converti en degrés sur 9 bits. La précision se limite aux degrés entiers (arrondi de l'appel moteur NON VÉRIFIÉ). |
| `AIParameterPositionAngle:setAngle(angleRad: any)` | 68 | ✍ Normalise l'angle dans l'intervalle 0 à 2 pi, puis l'arrondit au multiple le plus proche du pas d'alignement si celui-ci est supérieur à zéro, et le stocke. |
| `AIParameterPositionAngle:getAngle()` | 85 | ✍ Retourne l'angle stocké en radians, ou nil s'il n'est pas défini. |
| `AIParameterPositionAngle:getDirection()` | 91 | ✍ Retourne les composantes x et z de la direction unitaire correspondant à l'angle stocké (via MathUtil), ou nil, nil si aucun angle n'est défini. |
| `AIParameterPositionAngle:setSnappingAngle(angle: any)` | 103 | ✍ Définit le pas d'alignement en radians, stocké en valeur absolue. L'angle déjà stocké n'est pas réaligné. |
| `AIParameterPositionAngle:getSnappingAngle()` | 109 | ✍ Retourne le pas d'alignement actuel en radians. |
| `AIParameterPositionAngle:getString()` | 115 | ✍ Construit une chaîne d'affichage avec les coordonnées x et z et l'angle en degrés. À noter : l'angle est formaté sans test, donc une erreur survient si aucun angle n'est défini. |
| `AIParameterPositionAngle:validate(fillTypeIndex: any, farmId: any)` | 121 | ✍ Exécute d'abord la validation du parent, puis échoue avec le message localisé d'absence d'angle si l'angle est nil. Retourne un booléen et un texte d'erreur optionnel. |
