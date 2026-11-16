# gui/elements/ToggleButtonElement.lua

*[English version](../../../../scripts/gui/elements/ToggleButtonElement.md)*

Source: `dataS/scripts/gui/elements/ToggleButtonElement.lua` — FS25 1.25.1.0

✍ Bouton à deux états dérivé de BitmapElement. Son premier élément enfant s'affiche quand il est coché et le second quand il est décoché ; les clics des enfants sont redirigés vers onButtonClicked, qui inverse l'état et appelle le callback onClick. Clés XML : onClick, isChecked. La gestion du focus est transmise aux enfants.

- **ToggleButtonElement** hérite de `BitmapElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ToggleButtonElement.new(target: any, custom_mt: any)` | 23 | ✍ Constructeur. Crée l'élément sur BitmapElement, initialement décoché. |
| `ToggleButtonElement:loadFromXML(xmlFile: any, key: any)` | 36 | ✍ Charge depuis le XML le callback onClick et l'indicateur isChecked, puis applique l'état. |
| `ToggleButtonElement:loadProfile(profile: any, applyProfile: any)` | 45 | ✍ Charge isChecked depuis un profil GUI et applique l'état. |
| `ToggleButtonElement:copyAttributes(src: any)` | 53 | ✍ Copie l'état coché et le callback de clic depuis un élément source. |
| `ToggleButtonElement:setIsChecked(isChecked: any)` | 61 | ✍ Mémorise l'état et affiche le premier enfant si coché, le second sinon. N'appelle pas le callback de clic. |
| `ToggleButtonElement:addElement(element: any)` | 73 | ✍ Ajoute un enfant ; pour les deux premiers, il en fait la cible, redirige leur callback de clic vers onButtonClicked et réapplique les états coché et désactivé. |
| `ToggleButtonElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 85 | ✍ Lorsqu'il est actif, met le bouton en surbrillance au survol (ou l'enlève) et transmet l'événement au parent. Renvoie false s'il est inactif. |
| `ToggleButtonElement:onButtonClicked()` | 101 | ✍ Inverse l'état coché, puis appelle onClickCallback avec (target, self, isChecked) ou (self, isChecked) si aucune cible n'est définie. |
| `ToggleButtonElement:canReceiveFocus()` | 115 | ✍ Vrai sauf si le bouton est désactivé ou invisible. |
| `ToggleButtonElement:getFocusTarget()` | 122 | ✍ Renvoie toujours le bouton lui-même comme cible de focus, en remplaçant le comportement du parent. |
| `ToggleButtonElement:onFocusLeave()` | 129 | ✍ Transmet l'événement de perte de focus aux deux éléments enfants s'ils existent. |
| `ToggleButtonElement:onFocusEnter()` | 140 | ✍ Transmet l'événement de prise de focus aux deux éléments enfants s'ils existent. |
| `ToggleButtonElement:onFocusActivate()` | 151 | ✍ L'activation via le focus (ex. bouton de validation) bascule l'état comme un clic. |
