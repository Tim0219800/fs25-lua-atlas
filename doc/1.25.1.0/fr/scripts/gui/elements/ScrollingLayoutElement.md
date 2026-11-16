# gui/elements/ScrollingLayoutElement.lua

*[English version](../../../../scripts/gui/elements/ScrollingLayoutElement.md)*

Source: `dataS/scripts/gui/elements/ScrollingLayoutElement.lua` — FS25 1.25.1.0

✍ Disposition en boîte (étend BoxLayoutElement) avec défilement fluide, clipping et défilement tactile optionnel. Avec un seul flux, elle défile le long de l'axe du flux ; avec plusieurs flux (ou 0 pour autant que nécessaire), l'axe de défilement est perpendiculaire. Un SliderElement peut s'y lier via sliderElement. Une grande partie de la logique de défilement (update, gestion des entrées, mise à jour des clippers, updateContentSize) est absente de ce dump (NON VÉRIFIÉ).

- **ScrollingLayoutElement** hérite de `BoxLayoutElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ScrollingLayoutElement.new(target: any, custom_mt: any)` | 20 | ✍ Constructeur. Construit un BoxLayoutElement avec clipping et bouclage du focus activés, décalages et cibles de contenu à zéro, taille de contenu 1, pas de curseur, et support du défilement tactile pris dans Platform.hasTouchInput. |
| `ScrollingLayoutElement:loadFromXML(xmlFile: any, key: any)` | 51 | ✍ Charge la disposition de base, puis lit topClipperElementName, bottomClipperElementName et supportsTouchScrolling depuis le XML. |
| `ScrollingLayoutElement:copyAttributes(src: any)` | 68 | ✍ Copie les noms des éléments clippers et l'indicateur de défilement tactile depuis un élément source. |
| `ScrollingLayoutElement:onGuiSetupFinished()` | 78 | ✍ Après la construction de base, retrouve les éléments clippers haut et bas parmi les descendants du parent, enregistre des écouteurs de focus sur les enfants, déduit la direction de défilement du sens et du nombre de flux, et fixe l'intervalle de vitesse de défilement d'après la taille de pixel sur cet axe. |
| `ScrollingLayoutElement:invalidateLayout(ignoreVisibility: any, blockLayoutUpdate: any)` | 115 | ✍ Reconstruit la disposition : sauf blocage, recalcule les cellules, puis applique les positions des cellules avec les décalages de contenu courants, relie le focus, met à jour la taille du contenu et les clippers de défilement. Retourne la taille de flux maximale. |
| `ScrollingLayoutElement:onSliderValueChanged(slider: any, newValue: any)` | 161 | ✍ Appelé par le curseur lié : convertit sa valeur en décalage de contenu (signe inversé sur l'axe horizontal) et fait défiler jusque-là sans remettre à jour le curseur. |
| `ScrollingLayoutElement:scrollTo(startPos: any, updateSlider: any, noUpdateTarget: any)` | 181 | ✍ Fait défiler jusqu'à un décalage le long de l'axe de défilement, en conservant éventuellement la cible, réapplique les positions, met à jour le curseur lié sauf désactivation et déclenche onScrollCallback. |
| `ScrollingLayoutElement:raiseSliderUpdateEvent()` | 276 | ✍ Si un curseur est lié, lui demande de se rafraîchir depuis cette disposition via son onBindUpdate. |
| `ScrollingLayoutElement:removeElement(element: any)` | 317 | ✍ Retire l'enfant via le parent. À noter : la condition 'scrollingFocusEnter_orig == nil' semble inversée, de sorte qu'elle affecte nil à onFocusEnter au lieu de restaurer l'original sauvegardé. |
| `ScrollingLayoutElement:removeActionEvents()` | 481 | ✍ Supprime les événements d'action d'entrée hors interface enregistrés par cet élément dans g_inputBinding. |
| `ScrollingLayoutElement:onVerticalCursorInput(_: any, inputValue: any)` | 487 | ✍ Callback d'entrée pour un axe vertical secondaire : si l'entrée ne vient pas de la souris, déplace le curseur lié de son pas multiplié par la valeur d'entrée. Réinitialise l'indicateur useMouse. Provoque une erreur si aucun curseur n'est lié. |
