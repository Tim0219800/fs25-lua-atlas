# gui/base/Tween.lua

*[English version](../../../../scripts/gui/base/Tween.md)*

Source: `dataS/scripts/gui/base/Tween.lua` — FS25 1.25.1.0

✍ Interpolation d'un nombre entre une valeur de départ et une valeur d'arrivée sur une durée en millisecondes, envoyée à un callback setter à chaque mise à jour. L'accélération peut être changée via une fonction de courbe (par défaut Tween.CURVE.LINEAR, définie ailleurs). Classe de base de TweenSequence.

- **Tween** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Tween.new(setterFunction: function, startValue: number, endValue: number, duration: number, customMt: table?)` | 21 | ✍ Crée un tween qui appelle setterFunction avec la valeur interpolée. Une durée de 0 le rend terminé immédiatement ; customMt permet la réutilisation par des sous-classes. |
| `Tween:getDuration()` | 40 | ✍ Renvoie la durée en millisecondes. |
| `Tween:getFinished()` | 46 | ✍ Renvoie true quand le tween a atteint sa fin. |
| `Tween:reset()` | 52 | ✍ Remet le temps écoulé à 0 pour rejouer le tween ; il n'est terminé d'emblée que si la durée vaut 0. |
| `Tween:setTarget(target: any)` | 60 | ✍ Définit une table passée en premier argument au setter ; le setter doit alors accepter (target, value). |
| `Tween:update(dt: any)` | 66 | ✍ Avance de dt millisecondes, calcule la valeur et appelle le setter ; en atteignant la durée, applique exactement la valeur finale et marque le tween terminé. Sans effet une fois terminé. |
| `Tween:tweenValue(t: any)` | 87 | ✍ Renvoie la valeur au temps normalisé t (0..1) : un lerp entre départ et arrivée après passage de t dans la fonction de courbe. |
| `Tween:applyValue(newValue: any)` | 93 | ✍ Appelle le setter avec la valeur, précédée de la cible si elle est définie. |
| `Tween:setCurve(func: any)` | 103 | ✍ Définit la fonction d'accélération appliquée au temps normalisé ; nil rétablit la courbe linéaire. |
