# gui/elements/BreadcrumbsElement.lua

*[English version](../../../../scripts/gui/elements/BreadcrumbsElement.md)*

Source: `dataS/scripts/gui/elements/BreadcrumbsElement.lua` — FS25 1.25.1.0

✍ Fil d'Ariane pour les menus profonds (boutique, ModHub), dérivé de BoxLayoutElement. À l'initialisation, il détache le premier TextBackdropElement et le premier BitmapElement enfants pour servir de modèles de texte et de flèche de séparation. Seule la gestion des modèles est dans ce fichier ; l'ajout de miettes est NON VÉRIFIÉ ici.

- **BreadcrumbsElement** hérite de `BoxLayoutElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BreadcrumbsElement.new(target: any, custom_mt: any)` | 18 | ✍ Constructeur ; crée la boîte de mise en page et une table `crumbs` vide. |
| `BreadcrumbsElement:copyAttributes(src: any)` | 28 | ✍ Copie par référence les modèles de texte et de flèche de l'élément source et marque cette copie comme non propriétaire, elle ne les supprimera donc pas. |
| `BreadcrumbsElement:onGuiSetupFinished()` | 38 | ✍ Si aucun modèle n'a été hérité, prend les premiers descendants TextBackdropElement et BitmapElement comme modèles, les détache de la mise en page et en devient propriétaire. |
| `BreadcrumbsElement:delete()` | 58 | ✍ Supprime les modèles de texte et de flèche si cet élément en est propriétaire, puis exécute la suppression du parent. |
