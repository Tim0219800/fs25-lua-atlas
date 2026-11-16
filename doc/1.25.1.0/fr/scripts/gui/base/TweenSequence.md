# gui/base/TweenSequence.lua

*[English version](../../../../scripts/gui/base/TweenSequence.md)*

Source: `dataS/scripts/gui/base/TweenSequence.lua` — FS25 1.25.1.0

✍ Sous-classe de Tween qui enchaîne tweens enfants, pauses et callbacks sur une seule ligne de temps, et peut elle-même être imbriquée dans une autre séquence. Elle doit être démarrée avec start() avant que update() n'ait un effet, y compris après un reset. Les tweens peuvent se chevaucher via les variantes insert ; la séquence peut boucler.

- **TweenSequence** hérite de `Tween` (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TweenSequence.new(functionTarget: any)` | 25 | ✍ Crée une séquence vide et arrêtée. Le functionTarget optionnel est passé en premier argument à tous les setters et callbacks enfants. |
| `TweenSequence:insertTween(tween: table, instant: number)` | 46 | ✍ Enregistre un tween démarrant à l'instant donné en millisecondes, allonge la durée totale si besoin et applique la cible de la séquence au tween. |
| `TweenSequence:addTween(tween: table)` | 59 | ✍ Ajoute un tween à la fin actuelle de la séquence. |
| `TweenSequence:insertInterval(interval: number, instant: number)` | 68 | ✍ Insère une pause à un instant en décalant de l'intervalle tous les tweens et callbacks situés à cet instant ou après, et allonge la durée totale. |
| `TweenSequence:addInterval(interval: any)` | 89 | ✍ Ajoute une pause à la fin de la séquence. |
| `TweenSequence:insertCallback(callback: function, callbackState: table, instant: number)` | 98 | ✍ Enregistre un callback appelé une fois à l'instant donné avec callbackState (après la cible si définie). Les callbacks sont indexés par fonction : la même fonction ne peut être enregistrée qu'une fois. |
| `TweenSequence:addCallback(callback: function, callbackState: table)` | 108 | ✍ Ajoute un callback à la fin de la séquence. |
| `TweenSequence:getDuration()` | 114 | ✍ Renvoie la durée totale de la séquence en millisecondes. |
| `TweenSequence:setTarget(target: any)` | 121 | ✍ Définit la table cible donnée aux setters et callbacks. À noter : elle ne se propage pas aux tweens déjà ajoutés. |
| `TweenSequence:setLooping(isLooping: boolean)` | 128 | ✍ Active ou désactive la boucle ; à la fin, une séquence en boucle se réinitialise et redémarre, callbacks compris. |
| `TweenSequence:start()` | 135 | ✍ Marque la séquence comme active pour que update() la fasse avancer. |
| `TweenSequence:stop()` | 141 | ✍ Marque la séquence comme terminée, elle cesse de se mettre à jour ; le temps écoulé est conservé. |
| `TweenSequence:reset()` | 147 | ✍ Réinitialise le temps écoulé, chaque tween enfant et les indicateurs d'appel des callbacks, et laisse la séquence arrêtée ; appeler start() pour rejouer. |
| `TweenSequence:update(dt: any)` | 162 | ✍ Si elle est active, avance de dt millisecondes, met à jour tweens et callbacks, et se termine ou boucle quand le temps et tous les tweens sont achevés. |
| `TweenSequence:updateTweens(lastInstant: number, dt: number)` | 185 | ✍ Met à jour chaque tween enfant non terminé dont l'instant de départ est passé, en limitant son dt au temps écoulé depuis son début. Renvoie true si tous sont terminés. L'itération utilise pairs : l'ordre n'est pas garanti. |
| `TweenSequence:updateCallbacks()` | 202 | ✍ Déclenche une fois chaque callback pas encore appelé dont l'instant est atteint, avec son état (et la cible en premier si définie). |
