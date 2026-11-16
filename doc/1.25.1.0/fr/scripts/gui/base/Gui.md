# gui/base/Gui.lua

*[English version](../../../../scripts/gui/base/Gui.md)*

Source: `dataS/scripts/gui/base/Gui.lua` — FS25 1.25.1.0

✍ Contrôleur central de l'interface (l'instance g_gui). Il charge profils, traits et préréglages GUI, construit écrans, dialogues et cadres réutilisables depuis le XML, suit l'écran courant et la pile des dialogues ouverts, et aiguille les événements souris, tactile, clavier, update, draw et entrées de menu vers eux. Il s'appuie sur FocusManager pour le focus, GuiSoundPlayer pour les sons, g_inputBinding pour les contextes d'entrée, g_messageCenter pour les messages d'ouverture/fermeture et g_depthOfFieldManager pour le flou des dialogues. Il contient aussi la table qui associe les noms d'éléments XML aux classes GuiElement (tables et constantes définies hors des corps visibles, NON VÉRIFIÉ). Interface côté client uniquement.

- **Gui** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Gui.new() → Gui` | 61 | ✍ Crée le contrôleur d'interface : registres vides pour écrans, dialogues, profils, traits et préréglages, un GuiSoundPlayer enregistré auprès de FocusManager, les closures de callback, et une région d'occlusion du système de publicité pour l'UI (inactive au départ). |
| `Gui:loadPresets(xmlFile: any, rootKey: any)` | 121 | ✍ Lit les paires nom/valeur des Preset sous une clé racine, en résolvant les références $preset_ vers des préréglages antérieurs, et les stocke dans self.presets. Un nom en double journalise une erreur de dev sauf pendant un rechargement. Retourne les préréglages lus dans ce fichier. |
| `Gui:loadTraits(xmlFile: any, rootKey: any, presets: any)` | 159 | ✍ Charge chaque élément Trait sous une clé racine comme GuiProfile de trait et l'enregistre par nom ; les doublons journalisent une erreur de dev sauf pendant un rechargement. |
| `Gui:loadProfileSet(xmlFile: any, rootKey: any, presets: any, categoryName: any)` | 182 | ✍ Charge chaque élément Profile sous une clé racine dans self.profiles en lui donnant une catégorie, et charge aussi ses enfants Variant comme profils séparés nommés nomVariante_nomProfil dont le parent par défaut est le profil. Un nom en double journalise une erreur de dev. |
| `Gui:loadProfiles(xmlFilename: xmlFilename)` | 241 | ✍ Ouvre un fichier XML de profils et charge préréglages, traits, profils de premier niveau et chaque bloc Category. Retourne true en cas de succès, ou journalise une erreur et retourne false si le fichier ne peut pas être ouvert. |
| `Gui:loadGui(xmlFilename: xmlFilename, name: name, controller: controller, isFrame: isFrame?) → Root` | 280 | ✍ Construit un écran ou un cadre depuis un XML de vue : charge ses profils intégrés, crée l'élément racine sous le contrôleur, construit les enfants récursivement, expose les contrôles comme champs et déclenche les callbacks de création. L'enregistre comme cadre ou écran ; en cas d'échec journalise une erreur, supprime le contrôleur et retourne nil. Ajuste la taille pour les écrans à zone de sécurité. |
| `Gui:loadGuiRec(xmlFile: xmlFile, xmlNodePath: xmlNodePath, parentGuiElement: parentGuiElement, target: target)` | 347 | ✍ Instancie récursivement les éléments enfants depuis le XML grâce à la table de classes (nom de type en majuscules), ignore les nœuds de profil, avertit pour les types inconnus, applique les fonctions de traitement par type, puis déclenche le callback onCreate une fois les enfants construits. |
| `Gui:resolveFrameReference(frameRefElement: self) → Cloned` | 396 | ✍ Remplace un élément de référence de cadre par un clone du cadre enregistré de ce nom, redimensionné au parent, re-ciblé, ajouté au système de focus, et supprime l'élément de référence. Retourne la référence d'origine si aucun cadre de ce nom n'existe. |
| `Gui:getProfile(profileName: any)` | 445 | ✍ Retourne un profil par nom, en préférant les variantes propres à la plateforme (Platform.guiPrefixes, puis préfixes console_ ou mobile_). Un nom inconnu non vide journalise un avertissement et se replie sur le profil de référence de base (Gui.GUI_PROFILE_BASE). |
| `Gui:getIsGuiVisible()` | 489 | ✍ Retourne true quand un écran est courant ou qu'un dialogue est ouvert. |
| `Gui:getIsDialogVisible()` | 499 | ✍ Retourne true quand au moins un dialogue est ouvert. |
| `Gui:getIsOverlayGuiVisible()` | 505 | ✍ Retourne toujours false dans cette version ; un point d'extension pour les vues en surimpression qui gardent l'affichage du jeu. |
| `Gui:showGui(guiName: any) → Root` | 512 | ✍ Ouvre l'écran enregistré sous un nom en appelant changeScreen avec la classe d'écran de ce nom. Un nom nil est traité comme un nom vide. À noter : il interroge self.guis avec l'élément courant plutôt qu'un nom, ce qui donne nil, donc changeScreen se replie sur le GUI courant comme source. |
| `Gui:showDialog(guiName: any, closeAllOthers: any) → Root` | 524 | ✍ Ouvre un dialogue par nom : ferme éventuellement les autres, entre dans le contexte d'entrée (propre au dialogue sauf si la cible met needInput à false), fixe le focus, l'empile, appelle onOpen, publie GUI_DIALOG_OPENED et enregistre une zone de flou si la cible en fournit une. Retourne l'élément racine, ou nil pour un nom inconnu. |
| `Gui:closeDialogByName(guiName: any)` | 579 | ✍ Ferme le dialogue enregistré sous le nom donné ; ne fait rien si le nom est inconnu. |
| `Gui:closeDialog(gui: any)` | 589 | ✍ Ferme un dialogue ouvert : appelle onClose, le retire de la pile, retire sa zone de flou, rend le rôle d'écouteur et le focus au dialogue ou écran précédent, rétablit le contexte d'entrée et ferme entièrement l'interface si plus rien n'est visible. |
| `Gui:closeAllDialogs()` | 638 | ✍ Ferme tous les dialogues ouverts. À noter : elle retire des entrées de la liste pendant son parcours avec ipairs, donc certains dialogues peuvent être sautés quand plusieurs sont ouverts. |
| `Gui:registerMenuInput()` | 646 | ✍ Enregistre des événements d'action d'entrée pour les actions et axes de navigation du menu (masqués dans l'aide), avec des gestionnaires de relâchement pour les actions de page et d'axe, et marque l'interface comme à l'écoute des entrées. |
| `Gui:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 690 | ✍ Transmet un événement souris à l'élément écouteur courant et, s'il n'est pas consommé, au mouseEvent de la cible de l'écouteur s'il existe. |
| `Gui:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any)` | 707 | ✍ Transmet un événement tactile à l'élément écouteur courant et, s'il n'est pas consommé, au touchEvent de la cible de l'écouteur s'il existe. |
| `Gui:keyEvent(unicode: any, sym: any, modifier: any, isDown: any)` | 724 | ✍ Transmet un événement clavier brut à l'élément écouteur courant et, s'il n'est pas consommé, au keyEvent de la cible s'il existe. Utilisé par les éléments qui ont besoin des touches brutes, comme la saisie de texte. |
| `Gui:update(dt: any)` | 740 | ✍ Appelle update sur la cible de chaque dialogue ouvert, puis preUpdate et update sur la cible de l'écran courant (en vérifiant que l'écran n'a pas changé en cours de route), et réinitialise la cible d'entrée et l'indicateur de traitement de la frame. |
| `Gui:draw()` | 772 | ✍ Dessine la cible de l'écran courant, puis celle de chaque dialogue par-dessus. Quand g_uiDebugEnabled est actif, elle affiche aussi un texte de débogage sur l'élément focalisé et ses voisins et entoure l'élément focalisé. |
| `Gui:notifyControls(action: action, value: value) → True` | 825 | ✍ Distribue une action de menu à un seul récepteur par frame sauf si FocusManager la verrouille : l'élément cible d'entrée de la frame, sa cible, l'élément focalisé s'il est actif, puis FocusManager lui-même. Enregistre si l'événement a été consommé. Ne retourne rien malgré le commentaire de doc. |
| `Gui:onMenuInput(actionName: any, inputValue: any)` | 865 | ✍ Callback d'événement d'entrée pour les actions de menu : transmet à notifyControls seulement si l'interface écoute et qu'aucune entrée n'a encore été traitée dans cette frame. |
| `Gui:onReleaseMovement(action: any)` | 873 | ✍ Callback pour le relâchement d'un axe de déplacement : traite le relâchement comme onReleaseInput puis efface les verrous de direction de FocusManager pour cet axe. |
| `Gui:onReleaseInput(action: any)` | 881 | ✍ Callback pour une action de menu relâchée : si non verrouillée, appelle inputReleaseEvent sur la cible d'entrée de la frame, sur sa cible et sur l'élément focalisé s'il est actif. |
| `Gui:hasElementInputFocus(element: any)` | 907 | ✍ Retourne true si la cible de l'écouteur courant est l'élément donné. |
| `Gui:getScreenInstanceByClass(screenClass: table) → table` | 919 | ✍ Retourne l'instance de contrôleur enregistrée pour une classe d'écran, ou nil. |
| `Gui:changeScreen(sourceScreen: table?, screenClass: table?, returnScreenClass: table?) → table` | 929 | ✍ Passe à l'écran de la classe donnée (nil ferme l'interface) : ferme tous les dialogues et l'écran précédent, définit le nouvel écran courant, entre dans le contexte d'entrée de menu à l'ouverture, fixe le focus, appelle onOpen et publie les messages GUI_BEFORE/AFTER_OPEN ou CLOSE. Retourne l'élément racine de l'écran, ou nil avec un avertissement de dev si la classe n'est pas enregistrée. |
| `Gui:makeChangeScreenClosure()` | 984 | ✍ Retourne une fonction (source, screenClass, returnScreenClass) qui appelle changeScreen sur cette instance, pour que les contrôleurs puissent changer d'écran sans détenir g_gui. |
| `Gui:toggleCustomInputContext(isActive: any, contextName: any)` | 992 | ✍ Entre dans le contexte d'entrée de menu personnalisé nommé si isActive est vrai, sinon quitte le contexte de menu courant. |
| `Gui:makeToggleCustomInputContextClosure()` | 1002 | ✍ Retourne une fonction (isActive, contextName) qui appelle toggleCustomInputContext sur cette instance. |
| `Gui:makePlaySampleClosure()` | 1010 | ✍ Retourne une fonction (sampleName) qui joue un échantillon GUI via le GuiSoundPlayer de cette instance. |
| `Gui:assignPlaySampleCallback(guiElement: table) → table` | 1020 | ✍ Si l'élément inclut PlaySampleMixin, lui donne la closure de lecture de son. Retourne le même élément dans tous les cas ; utilisable comme fonction de traitement d'élément. |
| `Gui:enterMenuContext(contextName: string?)` | 1032 | ✍ Définit le contexte de liaison des entrées (par défaut Gui.INPUT_CONTEXT_MENU) comme nouveau niveau, enregistre les événements d'entrée de menu et marque l'interface comme à l'écoute. |
| `Gui:leaveMenuContext()` | 1042 | ✍ Rétablit une fois le contexte d'entrée si l'interface écoute, puis ne continue d'écouter que tant qu'un écran ou dialogue reste visible. |
| `Gui:addFrame(frameController: any, frameRootElement: any)` | 1051 | ✍ Enregistre l'élément racine d'un cadre chargé sous le nom de son contrôleur et donne au contrôleur les callbacks de changement d'écran, de contexte d'entrée et de lecture de son. |
| `Gui:addScreen(screenClass: any, screenInstance: any, screenRootElement: any)` | 1062 | ✍ Enregistre l'élément racine et le contrôleur d'un écran par classe et donne au contrôleur les callbacks de changement d'écran, de contexte d'entrée et de lecture de son. |
| `Gui:setCurrentMission(currentMission: any)` | 1074 | ✍ Transmet la mission courante à chaque contrôleur d'écran qui implémente setCurrentMission. |
| `Gui:loadMapData(mapXmlFile: integer, missionInfo: any, baseDirectory: any)` | 1085 | ✍ Permet aux écrans de configuration de boutique, de plaques d'immatriculation et de sélecteur de couleur (hors mobile) ainsi qu'à l'écran de garde-robe (si la plateforme en a un) de charger les données de la carte. Elle indexe directement ces contrôleurs, qui doivent donc être enregistrés sinon une erreur survient. |
| `Gui:unloadMapData()` | 1101 | ✍ Appelle unloadMapData sur les contrôleurs du menu en jeu, de configuration de boutique, de plaques et de sélecteur de couleur, ainsi que sur la garde-robe si disponible. Les contrôleurs doivent être enregistrés sinon une erreur survient. |
| `Gui:setClient(client: any)` | 1116 | ✍ Transmet l'objet client réseau à chaque contrôleur d'écran qui implémente setClient. |
| `Gui:setServer(server: any)` | 1126 | ✍ Transmet l'objet serveur à chaque contrôleur d'écran qui implémente setServer. À noter : le commentaire de doc d'origine dit à tort client. |
| `Gui.initGuiLibrary(baseDir: string)` | 1152 | ✍ Charge avec source() les fichiers Lua de base de l'interface : profil, utilitaires, overlay, source de données, mixins, tweens et toutes les classes GuiElement, dans un ordre fixe. L'argument est le répertoire de base des scripts. |
| `Gui.registerGuiElement(name: string, class: table)` | 1215 | ✍ Enregistre une classe dans Gui.CONFIGURATION_CLASS_MAPPING sous le nom d'élément XML en majuscules, pour que les vues XML puissent l'instancier. Utile aux mods qui ajoutent des éléments personnalisés. |
| `Gui.registerGuiElementProcFunction(name: string, procFunction: table)` | 1224 | ✍ Enregistre une fonction de traitement dans Gui.ELEMENT_PROCESSING_FUNCTIONS sous le nom d'élément en majuscules ; loadGuiRec l'appelle sur chaque élément de ce type nouvellement chargé et utilise sa valeur de retour comme élément. |

## Messages

- publie `MessageType.GUI_DIALOG_OPENED` (l.562)
- publie `MessageType.GUI_BEFORE_OPEN` (l.954)
- publie `MessageType.GUI_AFTER_OPEN` (l.965)
- publie `MessageType.GUI_BEFORE_CLOSE` (l.970)
- publie `MessageType.GUI_AFTER_CLOSE` (l.973)
