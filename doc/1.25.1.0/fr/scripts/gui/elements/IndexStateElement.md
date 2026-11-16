# gui/elements/IndexStateElement.lua

*[English version](../../../../scripts/gui/elements/IndexStateElement.md)*

Source: `dataS/scripts/gui/elements/IndexStateElement.lua` — FS25 1.25.1.0

✍ IndexStateElement est un BoxLayoutElement qui affiche un petit indicateur par page ou élément et met en évidence l'index courant. Il clone un élément modèle caché pour chaque page et écoute un élément indexable (ListElement, PageElement, multi-option) qui inclut IndexChangeSubjectMixin. Clés XML : stateElementTemplateId, indexableElementId, reverseElements, indexMinimizeWidth. Les vues peuvent aussi le piloter à la main.

- **IndexStateElement** hérite de `BoxLayoutElement` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IndexStateElement.new(target: any, custom_mt: any)` | 27 | ✍ Constructeur. Crée une liste vide d'éléments de page, l'index de page 1, aucun modèle ni élément indexable, et les indicateurs reverse et minimize-width désactivés. |
| `IndexStateElement:loadFromXML(xmlFile: any, key: any)` | 55 | ✍ Lit stateElementTemplateId, indexableElementId, reverseElements et indexMinimizeWidth depuis le nœud XML après le chargement du parent. |
| `IndexStateElement:loadProfile(profile: any, applyProfile: any)` | 66 | ✍ Lit les booléens reverseElements et indexMinimizeWidth depuis le profil. |
| `IndexStateElement:copyAttributes(src: any)` | 75 | ✍ Copie les réglages d'un élément source, clone son modèle d'état et relocalise l'élément indexable. Échoue si la source n'a pas de modèle. |
| `IndexStateElement:onGuiSetupFinished()` | 89 | ✍ Après la mise en place du GUI, localise le modèle d'état s'il manque et, si un id d'élément indexable est configuré, localise aussi cet élément. |
| `IndexStateElement:locateStateElementTemplate()` | 105 | ✍ Cherche le modèle par id parmi les descendants du parent, le masque, désactive sa gestion du focus et le détache de la hiérarchie. Affiche un avertissement s'il est introuvable. |
| `IndexStateElement:locateIndexableElement()` | 121 | ✍ Remonte jusqu'à 20 niveaux de parents vers la racine de la vue, trouve l'élément indexable par id et enregistre onIndexChange comme observateur s'il inclut IndexChangeSubjectMixin ; avertit sinon. |
| `IndexStateElement:onIndexChange(index: integer, count: integer)` | 148 | ✍ Callback d'observateur. Reconstruit les indicateurs si le nombre d'éléments a changé, puis appelle setPageIndex (défini ailleurs, pas dans ce fichier) avec le nouvel index. |
| `IndexStateElement:setPageCount(count: integer, initialIndex: integer?)` | 161 | ✍ Si le nombre diffère, supprime les indicateurs existants, clone le modèle autant de fois que demandé, invalide la mise en page, fixe éventuellement l'index initial et met à jour la taille. |
