# gui/base/IndexChangeSubjectMixin.lua

*[English version](../../../../scripts/gui/base/IndexChangeSubjectMixin.md)*

Source: `dataS/scripts/gui/base/IndexChangeSubjectMixin.lua` — FS25 1.25.1.0

✍ Mixin GuiMixin qui donne à un GuiElement une liste d'observateurs pour les changements d'indice (pagination, sélecteurs, listes). Les observateurs enregistrent un callback recevant le nouvel indice et le nombre d'éléments. Prérequis : l'élément doit être décoré via le mécanisme GuiMixin.

- **IndexChangeSubjectMixin** hérite de `GuiMixin` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IndexChangeSubjectMixin.new()` | 25 | ✍ Crée le mixin avec une table de callbacks vide indexée par observateur. À noter : il passe `IndexableElementMixin_mt` à `GuiMixin.new`, apparemment une erreur de copier-coller au lieu de sa propre métatable. |
| `IndexChangeSubjectMixin:addTo(guiElement: any)` | 34 | ✍ Attache le mixin à un GuiElement via le `addTo` parent et, en cas de succès, ajoute les méthodes `addIndexChangeObserver` et `notifyIndexChange` à l'élément. Renvoie si l'ajout a eu lieu. |
| `IndexChangeSubjectMixin.addIndexChangeObserver(guiElement: guiElement, observer: observer, indexChangeCallback: indexChangeCallback)` | 50 | ✍ Enregistre ou remplace le callback d'un observateur ; il est appelé sous la forme callback(observer, index, count). Un seul callback par observateur. |
| `IndexChangeSubjectMixin.notifyIndexChange(guiElement: guiElement, index: index, count: count)` | 59 | ✍ Appelle chaque callback enregistré avec l'observateur, le nouvel indice et le nombre d'éléments. L'itération utilise `pairs`, l'ordre d'appel n'est donc pas défini. |
| `IndexChangeSubjectMixin:clone(srcGuiElement: any, dstGuiElement: any)` | 69 | ✍ Copie (clone superficiel) la table de callbacks d'un GuiElement source vers son clone si la source en possède une. |
