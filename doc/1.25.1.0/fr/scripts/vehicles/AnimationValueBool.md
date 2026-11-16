# vehicles/AnimationValueBool.lua

*[English version](../../../scripts/vehicles/AnimationValueBool.md)*

Source: `dataS/scripts/vehicles/AnimationValueBool.lua` — FS25 1.25.1.0

✍ Variante booléenne des classes de valeurs d'animation de véhicule. Elle hérite de AnimationValueFloat mais remplace le chargement et la mise à jour : au lieu d'interpoler dans le temps, elle bascule une propriété vers un booléen fixe dès que l'animation atteint la partie. Utilisée par la spécialisation AnimatedVehicle, qui possède les parties d'animation.

- **AnimationValueBool** hérite de `AnimationValueFloat` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimationValueBool.new(vehicle: any, animation: any, part: any, startName: any, endName: any, name: any, initialUpdate: any, get: any, set: any, extraLoad: any, customMt: any)` | 16 | ✍ Constructeur. Délègue simplement à `AnimationValueFloat.new` avec les mêmes arguments, en utilisant la métatable de cette classe sauf si une métatable personnalisée est fournie. Aucun état propre au booléen n'est créé ici. |
| `AnimationValueBool:load(xmlFile: any, key: any)` | 22 | ✍ Lit le booléen cible depuis l'attribut XML nommé par `startName` sur la clé donnée, et conserve le fichier XML et la clé pour les avertissements. Retourne true seulement si la valeur existe et que le callback `extraLoad` réussit. |
| `AnimationValueBool:init(index: any, numParts: any)` | 33 | ✍ Redéfinition volontairement vide. La logique de chaînage des parties de la classe parente float ne s'applique pas aux booléens. |
| `AnimationValueBool:postInit()` | 38 | ✍ Redéfinition volontairement vide. Aucune valeur de départ n'est lue sur le véhicule, contrairement à la classe parente float. |
| `AnimationValueBool:reset()` | 43 | ✍ Efface la valeur courante en cache, de sorte que la prochaine mise à jour la relise via le callback `get`. |
| `AnimationValueBool:update(durationToEnd: any, dtToUse: any, realDt: any)` | 49 | ✍ Lit la valeur courante via `get` au premier appel, puis si elle diffère de la cible appelle `set` avec la cible. Retourne true si un changement a été appliqué, false sinon. Les arguments de temps sont ignorés. |
