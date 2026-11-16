# gui/elements/TextElement.lua

*[English version](../../../../scripts/gui/elements/TextElement.md)*

Source: `dataS/scripts/gui/elements/TextElement.lua` — FS25 1.25.1.0

✍ Élément GUI de base (dérivé de GuiElement) qui affiche une ou plusieurs lignes de texte, avec un texte secondaire optionnel (text2) dessiné derrière. Il gère couleurs, décalages et gras par état, alignement, formats (nombre, monnaie, comptabilité, température, pourcentage) alimentés par setValue, clés de localisation, redimensionnement automatique et modes de mise en page (truncate, resize, overflow, scrolling, fill). Les attributs viennent du XML ou des profils GUI. Les constantes FORMAT, LAYOUT_MODE et VERTICAL_ALIGNMENT, getTextPosition et les internes de g_i18n et du centre de messages ne sont pas définis dans ce fichier (NON VÉRIFIÉ).

- **TextElement** hérite de `GuiElement` (l.57)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TextElement.new(target: any, custom_mt: any)` | 96 | ✍ Constructeur. Définit les valeurs par défaut : texte blanc, taille 0.03, centré, une ligne, mode truncate, aucun format, texte vide, pas de text2 (taille 0) et état de défilement vidé. |
| `TextElement:loadFromXML(xmlFile: any, key: any)` | 164 | ✍ Charge tous les attributs de texte depuis le XML (couleurs, décalages, tailles, gras, alignement, mode de mise en page, limites de largeur et de lignes, format, texte et callback onTextChanged). Définit l'environnement du mod depuis le chemin du fichier pour résoudre les clés $l10n_, puis met la taille à jour. |
| `TextElement:loadProfile(profile: any, applyProfile: any)` | 307 | ✍ Charge les mêmes attributs de texte depuis un profil GUI (couleurs, décalages, tailles, gras, alignement, mode, limites et format). Ne met la taille à jour que si applyProfile est vrai. Contrairement au XML, il ne lit ni le texte ni le callback. |
| `TextElement:copyAttributes(src: any)` | 423 | ✍ Copie texte, format, valeur, texte source, couleurs, décalages, tailles, réglages de mise en page et callback de changement depuis un élément source, en clonant les tables. Utilisé lors du clonage d'éléments. |
| `TextElement:delete()` | 516 | ✍ Désabonne cet élément des messages de changement des réglages Fahrenheit et unité monétaire, puis le supprime via la classe parente. |
| `TextElement:setTextSize(size: any)` | 525 | ✍ Définit la taille du texte et recalcule la taille de l'élément. À noter : ne met pas à jour la taille par défaut utilisée par le mode resize, donc le prochain setText la réinitialise. |
| `TextElement:setAbsolutePosition(x: any, y: any)` | 533 | ✍ Définit la position absolue via la classe parente (les enfants suivent) et, sauf pendant une mise à jour de défilement, mémorise le nouveau x comme position de départ du défilement. |
| `TextElement:setDisabled(isDisabled: any)` | 543 | ✍ Définit l'état désactivé via la classe parente, puis rafraîchit le mode de défilement pour qu'un texte défilant s'arrête correctement. |
| `TextElement:updateAbsolutePosition()` | 551 | ✍ Recalcule la position absolue via la classe parente, remet en page le texte source sauf s'il s'agit d'une ligne unique en mode overflow ou scrolling ou d'un dimensionnement automatique, et réinitialise position de départ et paramètres de défilement. |
| `TextElement:setText(text: any, forceTextSize: any, isInitializing: any, forceScrollingParameterUpdate: any) → string` | 572 | ✍ Définit le texte affiché en effaçant clé de localisation, valeur et format. Si le texte a changé (ou si forceScrollingParameterUpdate est vrai), relance le minuteur de défilement et met à jour les paramètres. Ne retourne rien. |
| `TextElement:setTextInternal(text: any, forceTextSize: any, skipCallback: any, doNotUpdateSize: any)` | 586 | ✍ Routine centrale du texte : mémorise le texte source (en majuscules si activé), réinitialise les tailles, puis l'ajuste à la largeur et au nombre de lignes selon le mode (réduction, points de suspension, coupe de lignes). Lève onTextChangedCallback sauf si skipCallback, et retourne true si le texte a changé. |
| `TextElement:getText()` | 743 | ✍ Retourne le texte source, c'est-à-dire le texte complet avant toute troncature ou coupe. |
| `TextElement:setValue(value: any)` | 749 | ✍ Mémorise une valeur et régénère le texte selon le format courant. N'agit que via updateFormattedText, qui privilégie la valeur sur toute clé de localisation. |
| `TextElement:getValue()` | 756 | ✍ Retourne la valeur définie en dernier par setValue, ou nil. |
| `TextElement:setFormat(format: any)` | 762 | ✍ Change le format de la valeur (nil signifie aucun), rafraîchit le texte et s'abonne ou se désabonne des messages de réglage Fahrenheit et unité monétaire selon le format. À noter : le désabonnement de l'ancien format monétaire ne s'exécute que si le nouveau format est aussi monétaire. |
| `TextElement:setLocaKey(key: any)` | 789 | ✍ Affiche la traduction d'une clé de localisation (un deux-points final est conservé après traduction). Efface format et valeur et rafraîchit le texte avec l'environnement du mod de l'élément. |
| `TextElement:updateFormattedText()` | 798 | ✍ Construit le texte à partir de la valeur et du format (brut, nombre, monnaie, comptabilité, température, pourcentage) via g_i18n, ou de la clé de localisation si aucune valeur, puis l'applique. Texte vide si aucun des deux n'existe. |
| `TextElement:updateScrollingParameters()` | 835 | ✍ Seulement en mode scrolling : réinitialise le décalage, calcule la distance maximale de défilement d'après la largeur du texte source et le rectangle de clipping, et aligne à gauche si le texte déborde, sinon restaure l'alignement d'origine. |
| `TextElement:setTextColor(r: any, g: any, b: any, a: any)` | 866 | ✍ Définit la couleur normale du texte à partir de r, g, b, a. |
| `TextElement:setTextSelectedColor(r: any, g: any, b: any, a: any)` | 872 | ✍ Définit la couleur du texte quand l'élément est sélectionné. |
| `TextElement:setTextFocusedColor(r: any, g: any, b: any, a: any)` | 878 | ✍ Définit la couleur du texte quand l'élément a le focus. |
| `TextElement:setTextFocusedSelectedColor(r: any, g: any, b: any, a: any)` | 884 | ✍ Définit la couleur de l'état combiné focalisé plus sélectionné. |
| `TextElement:setTextHighlightedSelectedColor(r: any, g: any, b: any, a: any)` | 890 | ✍ Définit la couleur utilisée quand l'élément est à la fois surligné et sélectionné. |
| `TextElement:setTextHighlightedColor(r: any, g: any, b: any, a: any)` | 896 | ✍ Définit la couleur du texte quand l'élément est surligné. |
| `TextElement:getTextColor()` | 902 | ✍ Retourne la couleur de l'état courant. Priorité : désactivé (sauf ignoreDisabled), sélectionné (avec variantes focalisé ou surligné), focalisé, surligné, puis normal. Retombe sur la couleur normale si celle de l'état n'est pas définie. |
| `TextElement:setText2Color(r: any, g: any, b: any, a: any)` | 930 | ✍ Définit la couleur normale du texte secondaire. |
| `TextElement:setText2SelectedColor(r: any, g: any, b: any, a: any)` | 936 | ✍ Définit la couleur du texte secondaire quand l'élément est sélectionné. |
| `TextElement:setText2FocusedColor(r: any, g: any, b: any, a: any)` | 942 | ✍ Définit la couleur du texte secondaire quand l'élément a le focus. |
| `TextElement:setText2HighlightedColor(r: any, g: any, b: any, a: any)` | 948 | ✍ Définit la couleur du texte secondaire quand l'élément est surligné. |
| `TextElement:getText2Color()` | 954 | ✍ Retourne la couleur du texte secondaire pour l'état courant (désactivé, sélectionné, focalisé, surligné ou normal). À noter : contrairement à getTextColor, aucun repli n'existe ; une couleur d'état absente donne nil et draw échouerait sur unpack. |
| `TextElement:getTextWidth(useSourceText: any)` | 971 | ✍ Mesure la largeur du texte avec le moteur, en gras si activé et éventuellement sur le texte source. Sauf overflow, scrolling ou largeur automatique, le résultat est plafonné à la largeur de l'élément. |
| `TextElement:getTextHeight(includeNegativeSpacing: any)` | 989 | ✍ Retourne la hauteur du texte et le nombre de lignes via le moteur, en appliquant temporairement largeur de retour à la ligne, gras, indentation et échelle de hauteur de ligne. Avec includeNegativeSpacing, ajoute 10 % d'une ligne pour les jambages. Réinitialise ensuite l'état de texte du moteur. |
| `TextElement:getTextOffset()` | 1018 | ✍ Retourne le décalage x et y du texte pour l'état d'overlay courant (focalisé, sélectionné, surligné, pressé), avec repli sur le décalage de base si celui de l'état n'est pas défini. |
| `TextElement:getText2Offset()` | 1041 | ✍ Retourne le décalage du texte secondaire : le décalage focalisé pour les états focalisé, pressé, sélectionné ou surligné, sinon le décalage de base. |
| `TextElement:getIsScrollingAllowed()` | 1053 | ✍ Retourne true si le défilement peut s'exécuter : toujours si textScrollOnFocusOnly est faux, sinon seulement quand l'élément est focalisé, surligné ou sélectionné. |
| `TextElement:getTextLayoutMode()` | 1059 | ✍ Retourne le mode de mise en page effectif : un élément défilant renvoie truncate quand le défilement n'est pas autorisé, sinon le mode configuré. |
| `TextElement:getDoRenderText()` | 1069 | ✍ Retourne true ; point d'extension que les sous-classes peuvent surcharger pour supprimer le rendu du texte dans draw. |
| `TextElement:getTextPositionX()` | 1075 | ✍ Retourne l'ancre x du texte : bord gauche, centre ou bord droit de l'élément selon l'alignement. |
| `TextElement:getTextPositionY(lineHeight: any, totalHeight: any)` | 1087 | ✍ Retourne la position y de la première ligne selon l'alignement vertical (haut, milieu, sinon bas), à partir de la hauteur de ligne et de la hauteur totale du texte. |
| `TextElement:update(dt: any)` | 1113 | ✍ Mise à jour par image avec dt en ms. En mode scrolling, elle avance un minuteur et décale l'élément vers la gauche par un décalage smoothstep, avec pause aux deux extrémités (cycle d'au moins 9000 ms selon le débordement). Rien de plus dans les autres modes. |
| `TextElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 1145 | ✍ Dessine le texte, et d'abord le texte secondaire si sa taille dépasse 0, avec couleurs d'état, alpha, gras, retour à la ligne, lignes de page et zone de clipping, puis restaure l'état de texte du moteur et dessine les enfants. Ignore un texte vide. Affiche des repères de debug si le debug UI est actif. |
| `TextElement:updateScrollingLayoutMode()` | 1267 | ✍ Si le mode de mise en page effectif a changé depuis la dernière fois, réapplique le texte source avec mise à jour forcée des paramètres de défilement, puis mémorise le mode. |
| `TextElement:updateScaledWidth(xScale: number)` | 1278 | ✍ Pour un élément de taille 0 par 0 qui contient du texte, fixe sa taille à la largeur du texte (divisée par xScale) et à la taille du texte. Seul xScale est utilisé. |
| `TextElement:updateSize(forceTextSize: any)` | 1293 | ✍ Redimensionne pour s'adapter au contenu quand textAutoWidth (largeur d'une ligne plus décalage, bornée par les largeurs min et max) ou textAutoHeight s'applique, sauf si forceTextSize est vrai, et invalide la mise en page du parent si elle se valide automatiquement. En mode fill, recalcule le nombre maximal de lignes d'après la hauteur. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.780)
- s'abonne à `MessageType.SETTING_CHANGED` (l.782)
