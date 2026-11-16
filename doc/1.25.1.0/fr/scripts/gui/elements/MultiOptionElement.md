# gui/elements/MultiOptionElement.lua

*[English version](../../../../scripts/gui/elements/MultiOptionElement.md)*

Source: `dataS/scripts/gui/elements/MultiOptionElement.lua` — FS25 1.25.1.0

✍ MultiOptionElement est une sous-classe mince de MultiTextOptionElement pour les contrôles de choix multiple en texte. Elle ajoute une table options vide et ne fait sinon que transmettre au parent ; le vrai comportement est dans MultiTextOptionElement, absent de ce fichier.

- **MultiOptionElement** hérite de `MultiTextOptionElement` (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MultiOptionElement.new(target: any, custom_mt: any)` | 14 | ✍ Constructeur. Crée un MultiTextOptionElement et ajoute une table options vide. |
| `MultiOptionElement:loadFromXML(xmlFile: any, key: any)` | 24 | ✍ Appelle seulement le loadFromXML du parent, sans clé supplémentaire. |
| `MultiOptionElement:loadProfile(profile: any, applyProfile: any)` | 30 | ✍ Appelle seulement le loadProfile du parent, sans valeur supplémentaire. |
| `MultiOptionElement:copyAttributes(src: any)` | 36 | ✍ Appelle seulement le copyAttributes du parent. |
| `MultiOptionElement:setState(state: any, forceEvent: any)` | 42 | ✍ Transmet l'état et l'indicateur de forçage d'événement au setState du parent. |
| `MultiOptionElement:getState()` | 48 | ✍ Renvoie le champ d'état courant (index de l'option sélectionnée). |
