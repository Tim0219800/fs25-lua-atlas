# gui/elements/MultiTextOptionElement.lua

*[English version](../../../../scripts/gui/elements/MultiTextOptionElement.md)*

Source: `dataS/scripts/gui/elements/MultiTextOptionElement.lua` — FS25 1.25.1.0

✍ Élément d'interface à choix multiple : un bouton gauche, un bouton droit et un texte (ou une icône) qui affiche l'entrée courante d'une liste de textes. Il étend GuiElement et inclut IndexChangeSubjectMixin et PlaySampleMixin. Les éléments enfants sont retrouvés par leur nom (left, right, label, text, icon, gradient, background) et ceux qui manquent peuvent être créés à partir de profils par défaut. Gère le bouclage, la répétition à bouton maintenu avec pas accélérés, et les entrées manette, souris et tactile.

- **MultiTextOptionElement** hérite de `GuiElement` (l.37)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MultiTextOptionElement.new(target: any, custom_mt: any)` | 44 | ✍ Constructeur. Crée l'élément, y ajoute les mixins de changement d'index et de son, et initialise les valeurs par défaut : état 1, bouclage actif, aucun texte, aucune référence d'enfant. |
| `MultiTextOptionElement:loadFromXML(xmlFile: any, key: any)` | 97 | ✍ Charge l'élément depuis le XML après le chargeur parent, en fixant d'abord l'environnement du mod pour la traduction. Lit les callbacks (onClick, onFocus, onLeave), les options de bouclage et de visibilité des boutons, les délais de défilement et une chaîne de textes séparés par '\|' dont les parties $l10n_ sont traduites. |
| `MultiTextOptionElement:loadProfile(profile: any, applyProfile: any)` | 138 | ✍ Applique un profil GUI après le parent : mêmes options que le chargeur XML, plus les profils par défaut des boutons, du texte et des fonds, autoAddDefaultElements et une liste de textes. À noter : les textes $l10n_ sont ici traduits sans l'environnement personnalisé du mod. |
| `MultiTextOptionElement:clone(parent: any, includeId: any, suppressOnCreate: any, blockFocusHandlingReload: any)` | 173 | ✍ Clone l'élément via le clone du parent, puis ajoute les éléments enfants par défaut manquants et relie les enfants du clone par leur nom. |
| `MultiTextOptionElement:copyAttributes(src: any)` | 184 | ✍ Copie l'état, les options, les délais, les profils par défaut, les callbacks et tous les textes depuis un élément source, et clone les deux mixins depuis celui-ci. |
| `MultiTextOptionElement:onGuiSetupFinished()` | 222 | ✍ Appelé une fois l'interface construite : ajoute les enfants par défaut si activé, associe les enfants par nom, met à jour la position absolue et coupe le son de clic des boutons gauche et droit. |
| `MultiTextOptionElement:setElementsByName()` | 237 | ✍ Parcourt les enfants et les associe par nom : boutons left/right (reliés aux gestionnaires de clic de cet élément, les doublons étant supprimés), label, text, icon, gradients et background (redimensionné à la largeur de l'élément). Journalise un avertissement et s'arrête au premier enfant sans nom. |
| `MultiTextOptionElement:addDefaultElements()` | 296 | ✍ Si autoAddDefaultElements est actif, crée les enfants manquants : fond (arrondi, trois parties ou bitmap selon le profil), bouton gauche, bouton droit et texte, puis applique le profil par défaut correspondant. |
| `MultiTextOptionElement:setState(state: any, forceEvent: any)` | 342 | ✍ Définit l'index courant, borné entre 1 et le nombre de textes, met à jour l'affichage et notifie les observateurs d'index. Avec forceEvent, déclenche aussi le callback de clic. |
| `MultiTextOptionElement:getState()` | 356 | ✍ Retourne l'index courant (base 1). |
| `MultiTextOptionElement:disableButtonSounds()` | 362 | ✍ Désactive la lecture automatique de sons sur les boutons enfants gauche et droit. |
| `MultiTextOptionElement:addText(text: any, i: any)` | 374 | ✍ Ajoute un texte à la fin, ou à l'index i, met à jour l'affichage, recalcule le pas de défilement rapide dynamique (textes/5, max 10) sauf s'il est désactivé, et notifie les observateurs. |
| `MultiTextOptionElement:setTexts(texts: any)` | 391 | ✍ Remplace toute la liste de textes (nil la vide), quitte le mode image, borne l'état à la nouvelle taille, met à jour l'affichage et le pas de défilement dynamique, puis notifie les observateurs. |
| `MultiTextOptionElement:setIcons(icons: any)` | 412 | ✍ Utilise la liste comme entrées d'icônes (noms de fichiers image) au lieu de textes et active le mode image : l'élément icon affiche l'entrée si le fichier existe. Borne l'état et notifie les observateurs. |
| `MultiTextOptionElement:setLabel(labelString: any)` | 430 | ✍ Définit le texte de l'étiquette d'en-tête si un enfant label existe ; sinon ne fait rien. |
| `MultiTextOptionElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 438 | ✍ Gère la souris : détecte quel bouton fléché est maintenu (et lance le minuteur de répétition), relâche l'entrée si aucun bouton n'est pressé et gère la surbrillance au survol via FocusManager. Retourne si l'événement a été consommé. |
| `MultiTextOptionElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 482 | ✍ Équivalent tactile de mouseEvent, avec la même logique de bouton maintenu et de surbrillance, en utilisant le hotspot de l'élément pour le test de zone. |
| `MultiTextOptionElement:inputEvent(action: any, value: any, eventUsed: any)` | 524 | ✍ Gère les actions manette/clavier : l'axe gauche/droite au-delà de la tolérance analogique et les actions page précédente/suivante appellent inputLeft/inputRight et pressent visuellement le bouton correspondant. Retourne true si consommé. |
| `MultiTextOptionElement:update(dt: any)` | 556 | ✍ Mise à jour par image : tant qu'une flèche est maintenue et que le délai est écoulé, répète le pas, cumule le temps de déclenchement continu, et relâche les boutons si aucun événement d'entrée n'est arrivé pendant une image. inputLeft, inputRight et releaseInput ne sont pas dans le dump (NON VÉRIFIÉ). |
| `MultiTextOptionElement:onRightButtonClicked(steps: any, noFocus: any)` | 663 | ✍ Avance l'état de steps pas (1 par défaut, ou le pas rapide après un maintien long), avec bouclage ou blocage, joue un clic si l'état change, donne éventuellement le focus, puis met à jour, déclenche le callback de clic avec false et notifie les observateurs. |
| `MultiTextOptionElement:onLeftButtonClicked(steps: any, noFocus: any)` | 714 | ✍ Recule l'état, avec la même logique que le gestionnaire du bouton droit, mais déclenche le callback de clic avec true. À noter : le booléen passé au callback diffère entre les deux directions. |
| `MultiTextOptionElement:getCanChangeState()` | 765 | ✍ Retourne si l'utilisateur peut actuellement changer l'état avec les boutons. |
| `MultiTextOptionElement:setCanChangeState(canChangeState: any)` | 771 | ✍ Active ou bloque les changements d'état faits via les boutons gauche et droit. |
| `MultiTextOptionElement:canReceiveFocus(element: any, direction: any)` | 777 | ✍ Retourne true si l'élément est actif, visible, gère le focus et, si disableButtonsOnSingleText est actif, possède plus d'un texte. |
| `MultiTextOptionElement:onFocusLeave()` | 783 | ✍ Exécute le traitement parent de perte de focus et déclenche onLeaveCallback avec cet élément. |
| `MultiTextOptionElement:onFocusEnter()` | 791 | ✍ Exécute le traitement parent de prise de focus et déclenche onFocusCallback avec cet élément. |
| `MultiTextOptionElement:updateContentElement()` | 799 | ✍ Met à jour l'affichage pour l'état courant : montre l'icône (en mode image si le fichier de texture existe) ou le texte, bascule les dégradés, désactive l'élément s'il a au plus un texte si configuré, et masque les flèches aux limites sans bouclage. |
