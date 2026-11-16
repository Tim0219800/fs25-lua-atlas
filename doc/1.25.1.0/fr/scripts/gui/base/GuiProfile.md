# gui/base/GuiProfile.lua

*[English version](../../../../scripts/gui/base/GuiProfile.md)*

Source: `dataS/scripts/gui/base/GuiProfile.lua` — FS25 1.25.1.0

✍ Un ensemble nommé de propriétés textuelles qui stylise les GuiElement, comme une classe CSS. Les profils sont lus depuis le XML, peuvent hériter d'un profil parent (extends) et fusionner des profils de traits réutilisables (with) ; les valeurs se résolvent le long de la chaîne de parents via g_gui. Les valeurs sont stockées en chaînes et converties à la lecture.

- **GuiProfile** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiProfile.new(profiles: table, traits: table) → New` | 20 | ✍ Crée un profil vide qui garde des références aux tables des profils et traits chargés, utilisées ensuite pour résoudre l'héritage. |
| `GuiProfile:loadFromXML(xmlFile: integer, key: string, presets: table, isTrait: boolean?, isVariant: boolean?) → boolean` | 40 | ✍ Lit les attributs name, extends et with, copie les valeurs des traits listés, puis charge chaque élément enfant comme paire nom/valeur en remplaçant les références $preset_ via presets. Retourne false sans nom ; lève une erreur si le profil s'étend lui-même ; s'arrête sur un élément Variant. |
| `GuiProfile:getValue(name: string, default: string) → string` | 118 | ✍ Retourne la valeur textuelle d'un nom, en essayant d'abord le nom suffixé par g_baseUIPostfix, puis le nom simple, puis le profil parent. La chaîne littérale "nil" compte comme non définie ; sinon retourne la valeur par défaut. |
| `GuiProfile:getBool(name: string, default: boolean) → boolean` | 157 | ✍ Lit une valeur via getValue et retourne true uniquement si elle vaut "true" (insensible à la casse), false pour toute autre chaîne ; retourne la valeur par défaut si elle n'est pas définie. |
| `GuiProfile:getNumber(name: string, default: number) → number` | 173 | ✍ Lit une valeur via getValue et la convertit avec tonumber, ce qui donne nil pour une chaîne non numérique ; retourne la valeur par défaut si elle n'est pas définie. |
