# gui/elements/BinaryOptionElement.lua

*[English version](../../../../scripts/gui/elements/BinaryOptionElement.md)*

Source: `dataS/scripts/gui/elements/BinaryOptionElement.lua` — FS25 1.25.1.0

✍ Élément d'option à deux choix (gauche/droite, textes par défaut off/on ou non/oui) avec deux boutons et un curseur qui glisse entre eux. Dérivé de MultiTextOptionElement ; proche de CheckedOptionElement mais piloté par les entrées gauche/droite et un curseur animé. Les textes viennent des chaînes `g_i18n` ; les constantes STATE_LEFT, STATE_RIGHT, NUM_SLIDER_STATES et STRING_* sont définies ailleurs. Interface côté client.

- **BinaryOptionElement** hérite de `MultiTextOptionElement` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BinaryOptionElement.new(target: any, custom_mt: any)` | 30 | ✍ Constructeur ; initialise l'état du curseur (pas d'élément curseur, immobile, direction 0) et l'indicateur de textes oui/non à false. |
| `BinaryOptionElement:loadFromXML(xmlFile: any, key: any)` | 45 | ✍ Lit le booléen optionnel `useYesNoTexts` depuis le nœud XML après les attributs du parent. |
| `BinaryOptionElement:loadProfile(profile: any, applyProfile: any)` | 53 | ✍ Lit useYesNoTexts, sliderOffset et les profils de curseur par défaut (simple, arrondi, trois parties) depuis un profil GUI. |
| `BinaryOptionElement:copyAttributes(src: any)` | 66 | ✍ Copie useYesNoTexts et les trois noms de profils de curseur par défaut depuis un élément source. |
| `BinaryOptionElement:setElementsByName()` | 77 | ✍ Reparcourt les enfants une fois nommés : trouve l'enfant "slider" (avertit s'il manque), lie l'état sélectionné et l'autorisation de défilement des deux boutons à l'état et au focus de cet élément, et calcule le déplacement du curseur par pas d'animation. |
| `BinaryOptionElement:addDefaultElements()` | 105 | ✍ Si les éléments par défaut automatiques sont activés et qu'aucun enfant "slider" n'existe, en crée un (RoundCornerElement, ThreePartBitmapElement ou BitmapElement selon le profil de curseur par défaut défini) et lui applique ce profil. |
| `BinaryOptionElement:onGuiSetupFinished()` | 132 | ✍ Règle les textes des deux boutons sur non/oui ou off/on localisés selon `useYesNoTexts` et masque l'élément de texte hérité. |
| `BinaryOptionElement:getIsChecked()` | 146 | ✍ Retourne true quand l'état de droite est sélectionné (le choix de droite compte comme coché). |
| `BinaryOptionElement:setIsChecked(isChecked: any, skipAnimation: any, forceEvent: any)` | 152 | ✍ Place l'état à droite (coché) ou à gauche (décoché), avec possibilité de forcer le callback de clic, puis mémorise `skipAnimation` pour que le curseur saute au lieu de glisser à la mise à jour suivante. |
| `BinaryOptionElement:getIsActiveNonRec()` | 164 | ✍ Considère l'élément comme actif dès qu'il est visible, même désactivé, afin que `update` continue et que le mouvement du curseur puisse se terminer. |
| `BinaryOptionElement:setTexts(texts: any)` | 170 | ✍ Définit les textes des boutons gauche et droit. Journalise un avertissement avec la pile d'appels si la table ne contient pas exactement deux entrées. |
| `BinaryOptionElement:update(dt: any)` | 184 | ✍ Mise à jour à chaque frame qui avance le curseur d'un pas vers sa cible, ou saute à la fin si l'animation est ignorée, s'arrête à chaque extrémité et repositionne l'élément curseur. Réinitialise ensuite `skipAnimation`. |
| `BinaryOptionElement:inputLeft()` | 206 | ✍ Gère une entrée gauche : si le curseur est immobile et que l'élément est focalisé ou que son bouton gauche est pressé, déclenche le clic gauche et retourne true ; sinon false. |
| `BinaryOptionElement:inputRight()` | 218 | ✍ Gère une entrée droite : si le curseur est immobile et que l'élément est focalisé ou que son bouton droit est pressé, déclenche le clic droit et retourne true ; sinon false. |
| `BinaryOptionElement:setState(state: any, forceEvent: any, skipAnimation: any)` | 230 | ✍ Vérifie que l'état est gauche ou droite (avertit sinon). Si inchangé, déclenche éventuellement le callback de clic lorsqu'il est forcé ; sinon l'applique via le parent, met à jour la sélection et la direction du curseur et mémorise `skipAnimation`. |
| `BinaryOptionElement:onRightButtonClicked()` | 255 | ✍ Donne le focus à l'élément sans son, puis, si les changements sont autorisés et que l'état n'est pas déjà à droite, joue le son de clic, passe à droite, met à jour le contenu, déclenche le callback de clic (false) et notifie le changement d'indice. |
| `BinaryOptionElement:onLeftButtonClicked()` | 273 | ✍ Donne le focus sans son, puis, si autorisé et pas déjà à gauche, joue le son de clic, passe à gauche, met à jour le contenu, déclenche le callback de clic (true) et notifie le changement d'indice. |
| `BinaryOptionElement:updateSelection()` | 291 | ✍ Marque le bouton correspondant comme sélectionné et règle la direction du curseur (+1 vers la droite, -1 vers la gauche) pour que `update` l'anime. |
