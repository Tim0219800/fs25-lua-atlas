# gui/base/GuiMixin.lua

*[English version](../../../../scripts/gui/base/GuiMixin.md)*

Source: `dataS/scripts/gui/base/GuiMixin.lua` — FS25 1.25.1.0

✍ Classe de base des mixins d'éléments d'interface, de petits objets attachés à un GuiElement pour lui ajouter un comportement. L'instance du mixin est stockée sur l'élément sous la clé de son mixinType, et les mixins concrets héritent de cette classe en surchargeant clone.

- **GuiMixin** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiMixin.new(class: class, mixinType: mixinType) → New` | 24 | ✍ Crée une instance de mixin ; class vaut par défaut la métatable de GuiMixin et mixinType vaut GuiMixin. Les sous-classes fournissent leur propre table de type, utilisée ensuite comme clé de stockage sur l'élément. |
| `GuiMixin:addTo(guiElement: any)` | 42 | ✍ Attache ce mixin à un GuiElement sous element[mixinType] et copie l'aide hasIncluded sur lui. Retourne true en cas de succès, false si ce type de mixin était déjà présent. |
| `GuiMixin.hasIncluded(guiElement: guiElement, mixinType: mixinType)` | 57 | ✍ Retourne true si l'élément contient une entrée pour le type de mixin donné. Installée sur les éléments par addTo, elle s'appelle donc element:hasIncluded(type). |
| `GuiMixin.cloneMixin(mixinType: any, srcGuiElement: any, dstGuiElement: any)` | 63 | ✍ Aide statique qui délègue à mixinType:clone pour copier l'état du mixin entre deux éléments. |
| `GuiMixin:clone(srcGuiElement: any, dstGuiElement: any)` | 69 | ✍ Point d'extension vide dans la classe de base ; les sous-classes le surchargent pour copier leur état de l'élément source vers l'élément destination. |
