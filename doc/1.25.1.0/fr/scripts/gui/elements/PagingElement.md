# gui/elements/PagingElement.lua

*[English version](../../../../scripts/gui/elements/PagingElement.md)*

Source: `dataS/scripts/gui/elements/PagingElement.lua` — FS25 1.25.1.0

✍ Conteneur d'interface qui affiche une seule page parmi plusieurs enfants à la fois. Chaque enfant ajouté devient une page ; les enfants nommés utilisent la clé de localisation 'ui_' suivie du nom comme titre. Il étend GuiElement et inclut IndexChangeSubjectMixin pour informer les observateurs des changements de page et du nombre de pages. Les pages peuvent être désactivées et sont alors exclues du mappage des pages visibles. Plusieurs méthodes (comme setPage) sont absentes de ce dump (NON VÉRIFIÉ).

- **PagingElement** hérite de `GuiElement` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PagingElement.new(target: any, custom_mt: any)` | 26 | ✍ Constructeur. Crée l'élément avec le mixin de changement d'index et des structures de pages vides : liste des pages, table id vers page, mappage des pages visibles et indices de page courante à 1. |
| `PagingElement:loadFromXML(xmlFile: any, key: any)` | 48 | ✍ Charge l'élément de base, puis enregistre depuis le XML les callbacks onPageChange et onPageUpdate. |
| `PagingElement:copyAttributes(src: any)` | 57 | ✍ Copie les deux callbacks de page depuis un élément source et clone le mixin de changement d'index. |
| `PagingElement:onGuiSetupFinished()` | 67 | ✍ Exécute le traitement parent de fin de construction, puis construit le mappage des pages visibles. |
| `PagingElement:addElement(element: any)` | 100 | ✍ Ajoute l'enfant comme d'habitude et l'enregistre comme page. S'il porte un nom ayant un texte 'ui_<nom>', l'id de page est le nom en majuscules et le titre la traduction ; sinon l'id est la forme texte de l'élément et le titre est vide. addPage n'est pas dans ce dump (NON VÉRIFIÉ). |
| `PagingElement:removeElement(element: any)` | 229 | ✍ Retire l'enfant via le parent, puis supprime toute page dont l'élément racine est cet enfant. |
| `PagingElement:getCurrentPageId()` | 236 | ✍ Retourne l'id de la page à l'indice de page courant. |
| `PagingElement:getPageMappingIndex(pageId: any)` | 242 | ✍ Retourne la position de la page donnée parmi les pages visibles (non désactivées). Provoque une erreur si l'id est inconnu ; les pages désactivées renvoient 1. |
| `PagingElement:getIsPageDisabled(pageId: any)` | 248 | ✍ Retourne si la page portant l'id donné est désactivée. Provoque une erreur si l'id est inconnu. |
| `PagingElement:getPageById(pageId: any)` | 254 | ✍ Retourne la table de page enregistrée sous l'id donné, ou nil s'il n'y en a pas. |
| `PagingElement:setPageDisabled(page: any, disabled: any)` | 260 | ✍ Active ou désactive une page (une page nil est ignorée), reconstruit le mappage des pages visibles et déclenche le callback onPageUpdate avec la page et cet élément. |
| `PagingElement:updatePageMapping()` | 279 | ✍ Reconstruit la liste des indices et titres de pages visibles en ignorant les pages désactivées. Si la page courante est devenue désactivée, borne l'indice de mappage et appelle setPage (sauf si neuterPageUpdates est défini) ; sinon notifie les observateurs du nouveau nombre. |
