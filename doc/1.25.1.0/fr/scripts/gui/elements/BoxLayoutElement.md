# gui/elements/BoxLayoutElement.lua

*[English version](../../../../scripts/gui/elements/BoxLayoutElement.md)*

Source: `dataS/scripts/gui/elements/BoxLayoutElement.lua` — FS25 1.25.1.0

✍ Conteneur de mise en page qui range ses enfants en lignes ou colonnes (flux), dérivé de BitmapElement et capable d'afficher une image de fond. Les enfants dont `ignoreLayout` est défini sont ignorés. Les clés XML/profil comprennent alignmentX/Y, fillDirectionX/Y, flowDirection, focusDirection, numFlows, elementSpacing, lateralFlowSize, fitFlowToElements, autoValidateLayout, useFullVisibility, wrapAround et rememberLastFocus. Il relie aussi ses enfants pour la navigation au focus (manette). `invalidateLayout` (qui déclenche la mise en page) est défini hors de ce fichier. Interface côté client.

- **BoxLayoutElement** hérite de `BitmapElement` (l.29)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BoxLayoutElement.new(target: any, custom_mt: any)` | 84 | ✍ Constructeur avec valeurs par défaut : flux horizontal, alignement gauche/haut, remplissage de gauche à droite et de haut en bas, un seul flux, flux ajustés aux éléments, pas d'espacement, pas de validation automatique, vérification de visibilité complète, tables de cellules vides. |
| `BoxLayoutElement:loadFromXML(xmlFile: any, key: any)` | 119 | ✍ Lit l'alignement, les directions de remplissage, la direction de flux et de focus, le nombre de flux, l'espacement, la taille latérale et les options booléennes citées dans la description du module depuis le nœud XML. fitFlowToElements vaut true par défaut quand lateralFlowSize vaut 0. |
| `BoxLayoutElement:loadProfile(profile: any, applyProfile: any)` | 182 | ✍ Mêmes réglages que le chargeur XML mais lus depuis un profil GUI. |
| `BoxLayoutElement:copyAttributes(src: any)` | 246 | ✍ Copie l'alignement, les directions de remplissage, la direction de flux/focus, le nombre de flux, les tailles, l'espacement, les tolérances et les options booléennes depuis une mise en page source. |
| `BoxLayoutElement:onGuiSetupFinished()` | 270 | ✍ Calcule la tolérance de mise en page en unités d'écran à partir de la constante de pixels, puis invalide la mise en page pour qu'elle soit construite. |
| `BoxLayoutElement:addElement(element: any)` | 280 | ✍ Ajoute un enfant, remet son ancre et son pivot à (0,0) pour qu'ils n'interfèrent pas avec la mise en page, et invalide la mise en page si la validation automatique est active. |
| `BoxLayoutElement:removeElement(element: any)` | 294 | ✍ Retire un enfant et invalide la mise en page si la validation automatique est active. |
| `BoxLayoutElement:getIsElementIncluded(element: any, ignoreVisibility: any)` | 304 | ✍ Décide si un enfant participe à la mise en page, d'après `ignoreLayout`, l'argument ignoreVisibility et le mode de visibilité (complète ou indicateur propre). À noter : à cause de la précédence des `and`/`or`, `ignoreLayout` ne protège que la première branche. |
| `BoxLayoutElement:updateLayoutCells(ignoreVisibility: boolean)` | 312 | ✍ Reconstruit la table de cellules à partir des enfants inclus : les place dans l'ordre, ouvre un nouveau flux en cas de dépassement (tant que le nombre de flux le permet) et enregistre les tailles de flux, les tailles latérales et les totaux. Les tailles incluent marges et espacement. |
| `BoxLayoutElement:applyCellPositions(offsetX: integer, offsetY: integer)` | 376 | ✍ Positionne chaque élément de cellule selon l'alignement, les directions de remplissage, les tailles de flux, les marges et l'espacement, avec décalages x/y optionnels (utilisés par les listes défilantes). Réinitialise aussi l'ancre et le pivot de chaque cellule. |
| `BoxLayoutElement:focusLinkCells()` | 439 | ✍ Trouve le premier et le dernier éléments focalisables parmi les cellules, mémorise le premier comme cible de focus par défaut, vide les cibles de focus entrantes et relie chaque cellule focalisable à ses voisines via `focusLinkChildElement` (défini ailleurs). |
| `BoxLayoutElement:canReceiveFocus()` | 541 | ✍ Retourne true seulement si la mise en page gère le focus et qu'au moins un enfant peut le recevoir. |
| `BoxLayoutElement:onFocusLeave()` | 595 | ✍ Exécute le gestionnaire du parent ; si `rememberLastFocus` est actif et que l'élément focalisé est un descendant, le mémorise dans `lastFocusElement`. |
| `BoxLayoutElement:updateAbsolutePosition()` | 608 | ✍ Met à jour la position absolue via le parent, puis réapplique les positions des cellules pour que les enfants suivent. |
