# collections/ValueInterpolator.lua

*[English version](../../../scripts/collections/ValueInterpolator.md)*

Source: `dataS/scripts/collections/ValueInterpolator.lua` — FS25 1.25.1.0

✍ Assistant qui déplace une liste de valeurs numériques vers des cibles au fil du temps. Il lit les valeurs courantes via un getter, les réécrit via un setter à chaque mise à jour et s'enregistre comme updateable sur g_currentMission sous une clé personnalisée. Il se retire lui-même quand toutes les valeurs atteignent leur cible et peut exécuter des callbacks de mise à jour et de fin. Le mécanisme d'updateable appartient à la classe de mission, absente de ce dump (NON VÉRIFIÉ).

- **ValueInterpolator** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ValueInterpolator.new(customKey: any, get: function, set: function, target: array, duration: number?, speed: number?, customMt: table?) → ValueInterpolator?` | 24 | ✍ Démarre une interpolation : les valeurs courantes viennent de get(), et les vitesses sont déduites de duration (ms) ou de speed par seconde (1 par défaut). Retourne nil si toutes les vitesses sont proches de zéro ; sinon s'enregistre comme updateable avec customKey et se retourne. |
| `ValueInterpolator:setUpdateFunc(updateFunc: any, updateTarget: any, ...: any)` | 66 | ✍ Définit un callback exécuté après chaque pas de mise à jour, appelé comme func(target, ...) avec les arguments supplémentaires fournis ici. |
| `ValueInterpolator:setFinishedFunc(finishedFunc: any, finishedTarget: any, ...: any)` | 74 | ✍ Définit un callback exécuté une fois quand toutes les valeurs ont atteint leur cible, appelé comme func(target, ...) avec les arguments supplémentaires fournis ici. |
| `ValueInterpolator:setDeleteListenerObject(object: any)` | 82 | ✍ Si l'objet dérive de Object, enregistre un écouteur de suppression pour que l'interpolateur s'arrête (onDeleteParent) quand cet objet est supprimé. Les autres valeurs sont ignorées. |
| `ValueInterpolator:delete()` | 91 | ✍ Fonction vide qui existe pour satisfaire l'interface d'updateable. |
| `ValueInterpolator:getTarget()` | 96 | ✍ Retourne la table des valeurs cibles. |
| `ValueInterpolator:updateSpeed()` | 102 | ✍ Recalcule les vitesses par valeur comme distance restante divisée par durée restante, quand duration est un nombre ; sinon utilise la valeur de duration elle-même comme table de vitesses. |
| `ValueInterpolator:update(dt: any)` | 115 | ✍ Fait avancer chaque valeur vers sa cible de vitesse fois dt (ms) sans la dépasser, appelle le setter et le callback de mise à jour, et réduit la durée restante (minimum 1). Quand toutes les valeurs sont arrivées, retire l'updateable et appelle le callback de fin. |
| `ValueInterpolator.removeInterpolator(key: any)` | 153 | ✍ Retire de la mission courante l'updateable enregistré sous la clé donnée, s'il existe. |
| `ValueInterpolator.hasInterpolator(key: any)` | 161 | ✍ Retourne si la mission courante possède encore un updateable enregistré sous la clé donnée. |
| `ValueInterpolator:onDeleteParent()` | 167 | ✍ Callback d'écouteur de suppression qui retire l'updateable de cet interpolateur de la mission quand l'objet parent surveillé est supprimé. |
