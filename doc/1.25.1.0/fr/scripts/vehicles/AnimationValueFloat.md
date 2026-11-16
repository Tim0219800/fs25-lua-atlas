# vehicles/AnimationValueFloat.lua

*[English version](../../../scripts/vehicles/AnimationValueFloat.md)*

Source: `dataS/scripts/vehicles/AnimationValueFloat.lua` — FS25 1.25.1.0

✍ Propriété animée composée d'un ou plusieurs nombres, pilotée par une partie d'animation de la spécialisation AnimatedVehicle. Elle charge les valeurs de début et de fin depuis le XML, puis chaque mise à jour rapproche les valeurs courantes de la cible à une vitesse déduite de la durée restante, et les applique via un callback `set` avec une interpolation linéaire, par palier ou par spline. AnimationValueBool en hérite. Les parties consécutives qui animent la même propriété sont chaînées pour que la suivante démarre à la valeur de fin de la précédente.

- **AnimationValueFloat** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimationValueFloat.new(vehicle: any, animation: any, part: any, startName: any, endName: any, name: any, initialUpdate: any, get: any, set: any, extraLoad: any, customMt: any)` | 25 | ✍ Constructeur. Stocke le véhicule, l'animation, la partie, les noms d'attributs XML et les callbacks `get`, `set` et `extraLoad`, et prépare des tables vides pour les paramètres de comparaison ainsi que les valeurs et vitesses en cache. |
| `AnimationValueFloat:load(xmlFile: any, key: any)` | 56 | ✍ Lit les valeurs de début et de fin dans le XML (nombre, booléen, chaîne ou table, normalisés en table de nombres), exécute `extraLoad`, puis résout l'attribut `tangentType` (linéaire par défaut, variantes palier ou spline). Retourne true en cas de succès. |
| `AnimationValueFloat:addCompareParameters(...: any)` | 138 | ✍ Ajoute des noms de champs que `init` compare entre deux valeurs de parties différentes : deux valeurs ne sont chaînées que si tous ces champs sont égaux. |
| `AnimationValueFloat:setWarningInformation(info: any)` | 147 | ✍ Définit le texte servant à identifier cette valeur dans les avertissements XML. |
| `AnimationValueFloat:init(index: any, numParts: any)` | 153 | ✍ Parcourt les parties suivantes de la même animation, de même direction, à la recherche d'une valeur avec le même attribut de fin et des paramètres de comparaison identiques, puis les relie comme précédente et suivante. Journalise un avertissement XML en cas de chevauchement et peut copier cette valeur de fin comme début de la suivante. |
| `AnimationValueFloat:postInit()` | 194 | ✍ Si une valeur de fin existe mais qu'aucune valeur de début n'est donnée dans le XML, relève la valeur de départ sur le véhicule via le callback `get`. |
| `AnimationValueFloat:reset()` | 202 | ✍ Conserve les dernières valeurs et vitesses courantes pour les réutiliser, puis efface les valeurs actives afin que la prochaine mise à jour réinitialise le mouvement. |
| `AnimationValueFloat:initValues(targetValue: any, durationToEnd: any, fixedTimeUpdate: any, ...: any)` | 212 | ✍ Fixe les valeurs courantes, calcule la vitesse de chaque valeur comme distance restante sur durée restante (minimum 0,001) et mémorise les valeurs de départ de la spline. Avec une mise à jour à temps fixe, part de la valeur de début ou de fin selon le sens de lecture. Retourne l'indicateur `initialUpdate`. |
| `AnimationValueFloat:update(durationToEnd: any, dtToUse: any, realDt: any, fixedTimeUpdate: any)` | 252 | ✍ Rapproche les valeurs courantes de la cible (valeur de fin, ou de début en lecture inverse) avec le dt réel, puis appelle `set` avec le résultat linéaire, spline ou palier. Retourne true si des valeurs ont été appliquées. Ne fait rien sans valeur de début ou si la partie n'est pas active. |
