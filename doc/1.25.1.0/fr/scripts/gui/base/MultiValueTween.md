# gui/base/MultiValueTween.lua

*[English version](../../../../scripts/gui/base/MultiValueTween.md)*

Source: `dataS/scripts/gui/base/MultiValueTween.lua` — FS25 1.25.1.0

✍ Sous-classe de Tween qui anime plusieurs valeurs numériques à la fois. Les valeurs de départ et d'arrivée sont des tableaux et le setter les reçoit dépaquetées, éventuellement précédées d'un objet cible. Utilisée pour les animations d'interface comme la position ou la taille.

- **MultiValueTween** hérite de `Tween` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MultiValueTween.new(setterFunction: function, startValues: table, endValues: table, duration: number, customMt: number)` | 24 | ✍ Crée l'interpolation via `Tween.new` et garde une copie de travail des valeurs de départ. Le setter est appelé sous la forme setter(v1..vn), ou setter(cible, v1..vn) si une cible est définie ; la durée est en millisecondes. |
| `MultiValueTween:setTarget(target: any)` | 35 | ✍ Définit ou efface la cible du callback et garde le tableau de valeurs synchronisé en insérant, retirant ou remplaçant la cible en première entrée. Le setter doit alors accepter la cible en premier. |
| `MultiValueTween:tweenValue(t: any)` | 50 | ✍ Interpole linéairement chaque paire départ/arrivée avec un facteur modelé par la fonction de courbe à la progression t, le stocke dans le tableau de valeurs (après l'emplacement de la cible s'il y en a une) et renvoie ce tableau. |
| `MultiValueTween:applyValue()` | 64 | ✍ Appelle le setter avec les valeurs courantes dépaquetées, y compris la cible en premier argument si elle est définie. |
