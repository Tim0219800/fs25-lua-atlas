# gui/elements/OptionSliderElement.lua

*[English version](../../../../scripts/gui/elements/OptionSliderElement.md)*

Source: `dataS/scripts/gui/elements/OptionSliderElement.lua` — FS25 1.25.1.0

✍ Variante de MultiTextOptionElement qui ajoute un curseur déplaçable (et une barre de remplissage optionnelle) dont la position suit l'état courant. Les enfants nommés slider et fillingBar sont associés par nom et peuvent être créés automatiquement depuis des profils par défaut. Le curseur couvre la largeur de l'élément moins un décalage latéral (la largeur du bouton gauche par défaut), et le texte de valeur peut suivre le curseur.

- **OptionSliderElement** hérite de `MultiTextOptionElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `OptionSliderElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructeur. Construit un MultiTextOptionElement et ajoute les champs du curseur : références du curseur et de la barre de remplissage, noms de profils par défaut, barre de remplissage désactivée, texte suivant le curseur activé. |
| `OptionSliderElement:loadFromXML(xmlFile: any, key: any)` | 39 | ✍ Charge l'élément de base, puis lit sliderOffset, useFillingBar et updateTextPosition depuis le XML. À noter : à cause du motif 'or', un false explicite pour les deux booléens ne peut pas remplacer une valeur par défaut à true. |
| `OptionSliderElement:loadProfile(profile: any, applyProfile: any)` | 49 | ✍ Charge le profil de base, puis sliderOffset, useFillingBar, updateTextPosition et les noms de profils par défaut du curseur, du curseur arrondi, de la barre de remplissage et de la barre en trois parties. |
| `OptionSliderElement:copyAttributes(src: any)` | 65 | ✍ Copie les réglages propres au curseur et les noms de profils par défaut depuis un élément source, après la copie de base. |
| `OptionSliderElement:setElementsByName()` | 81 | ✍ Associe les enfants slider et fillingBar par nom après l'association de base. Désactive la barre de remplissage si elle est absente, et journalise un avertissement si le curseur manque ou si la place est insuffisante ; le décalage vaut alors la moitié de la largeur. |
| `OptionSliderElement:addDefaultElements()` | 110 | ✍ Quand autoAddDefaultElements est actif, crée aussi une barre de remplissage manquante (bitmap ou trois parties) et un curseur manquant (coins arrondis ou bitmap), selon les profils par défaut définis. |
| `OptionSliderElement:onOpen()` | 146 | ✍ Exécute le traitement d'ouverture de base, puis repositionne le curseur selon l'état courant. |
| `OptionSliderElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 154 | ✍ Gestion de la souris qui saute la version de MultiTextOptionElement : détecte les appuis sur les flèches, le curseur ou la piste, réinitialise la répétition au relâchement et, pendant le glissement, aligne le curseur sur un pas, appelle setState avec forceEvent et déplace le texte et la barre de remplissage. |
| `OptionSliderElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 259 | ✍ Version tactile du gestionnaire souris : seul un appui sur le curseur lui-même démarre un glissement (la piste n'est pas utilisée), avec le même alignement, changement d'état et mise à jour du texte et de la barre. |
| `OptionSliderElement:updateSlider()` | 352 | ✍ Place le curseur proportionnellement à (état-1)/(nombre de textes-1) entre ses positions X min et max, centre le texte dessus si activé et dimensionne la barre de remplissage. Fixe le décalage par défaut à la largeur du bouton gauche s'il n'est pas défini. |
| `OptionSliderElement:updateAbsolutePosition()` | 388 | ✍ Met à jour la position absolue via le parent, puis repositionne le curseur. |
| `OptionSliderElement:updateContentElement()` | 396 | ✍ Met à jour le contenu affiché via le parent, puis repositionne le curseur. |
