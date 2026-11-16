# gui/base/TabbedMenu.lua

*[English version](../../../../scripts/gui/base/TabbedMenu.md)*

Source: `dataS/scripts/gui/base/TabbedMenu.lua` — FS25 1.25.1.0

✍ Classe de base (étend ScreenElement) des menus plein écran à onglets, comme le menu en jeu. Elle conserve les cadres de pages enregistrés, leurs onglets d'en-tête et leurs prédicats d'activation, pilote un PagingElement et un sélecteur de page, et relie les boutons du bas du menu aux actions d'entrée et aux callbacks. Les cadres de page exposent onFrameOpen/onFrameClose, requestClose et les infos de boutons ; les sous-classes surchargent setupMenuButtonInfo et onMenuOpened. Un flou de profondeur de champ optionnel et le changement d'état de jeu se font à l'ouverture/fermeture.

- **TabbedMenu** hérite de `ScreenElement` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TabbedMenu.new(target: any, custom_mt: any)` | 42 | ✍ Crée le menu avec des tables vides pour pages, onglets, prédicats et callbacks de boutons, la page courante à 1 et des callbacks pour page suivante/précédente. Les sous-classes peuvent activer performBackgroundBlur. |
| `TabbedMenu:delete()` | 78 | ✍ Désabonne le menu de tous les sujets du message center, puis le supprime via la classe parente. |
| `TabbedMenu:onGuiSetupFinished()` | 86 | ✍ Après le chargement du GUI, crée le callback de retour, appelle setupMenuButtonInfo et, pour le profil uiInGameMenuPaging, dimensionne l'élément de pagination sur la largeur restant à côté de l'en-tête. |
| `TabbedMenu:exitMenu()` | 100 | ✍ Quitte le menu en changeant d'écran vers aucun (nil). |
| `TabbedMenu:reset()` | 106 | ✍ Remet la page courante, l'index de page mémorisé et le décalage de défilement à leurs valeurs initiales (première page). |
| `TabbedMenu:onOpen(element: any)` | 118 | ✍ À l'ouverture : pousse éventuellement un flou plein écran, joue le son de pagination sauf si muet, applique l'état de jeu du menu, rafraîchit les pages actives et restaure la dernière page et le défilement des onglets. Les sons de focus sont supprimés entre-temps ; termine par onMenuOpened. |
| `TabbedMenu:onClose(element: any)` | 156 | ✍ À la fermeture : prévient d'abord la page courante, retire le flou, restaure les bindings d'entrée, efface les actions de boutons, mémorise page, index et défilement des onglets pour la prochaine fois et réinitialise l'état de jeu si un était défini. |
| `TabbedMenu:update(dt: any)` | 187 | ✍ Mise à jour par image. Force le focus sur la page courante quand aucun dialogue n'est visible, transmet aux boutons les infos de la page quand elles sont marquées modifiées et que ce menu est l'écouteur actif, et met à jour la visibilité de l'en-tête à la demande de la page. |
| `TabbedMenu:setupMenuButtonInfo()` | 215 | ✍ Point d'extension vide ici ; les sous-classes le surchargent pour définir leurs infos de boutons par défaut. |
| `TabbedMenu:addPageTab(frameController: any, iconFilename: any, iconUVs: any, iconSliceId: any, soundId: any)` | 221 | ✍ Enregistre les données d'onglet (fichier d'icône, UV, slice, son) d'un cadre de page et construit son callback de clic, qui demande à la page courante de se fermer puis bascule vers cette page. À appeler avec registerPage pour garder un ordre cohérent. |
| `TabbedMenu:onPageClicked(oldPage: any)` | 244 | ✍ Point d'extension vide appelé au clic sur un onglet ; TabbedMenuWithDetails le surcharge. À noter : le callback d'onglet passe self.activeDetailPage, que ce fichier ne définit jamais. |
| `TabbedMenu:setPageTabEnabled(pageController: any, isEnabled: any, blockListReload: any)` | 249 | ✍ Marque l'onglet d'en-tête d'une page comme actif ou inactif et recharge la liste d'onglets sauf si blockListReload est défini. |
| `TabbedMenu:rebuildTabList()` | 259 | ✍ Reconstruit la liste des pages actives dans l'ordre d'enregistrement, recharge la liste d'onglets et restaure la sélection sur l'index courant. |
| `TabbedMenu:updatePages()` | 300 | ✍ Évalue le prédicat d'activation de chaque page (les pages désactivées via setPageEnabled restent inactives), met à jour la pagination et les onglets sans effets de changement de page, puis reconstruit la liste d'onglets et les titres du sélecteur. |
| `TabbedMenu:clearMenuButtonActions()` | 318 | ✍ Vide la table action-vers-callback et retire les événements d'action d'entrée enregistrés pour les boutons personnalisés. |
| `TabbedMenu:assignMenuButtonInfo(menuButtonInfo: any)` | 331 | ✍ Applique une liste de descripteurs de boutons (inputAction, text, callback, son, disabled, showWhenPaused...) aux boutons du menu : définit action, texte, son de clic et callback, enregistre des événements d'entrée personnalisés ou stocke les callbacks des actions par défaut, et masque les boutons inutilisés. Garantit toujours que MENU_BACK fonctionne, puis recalcule la mise en page. |
| `TabbedMenu:setPageSelectorTitles()` | 417 | ✍ Remplit le sélecteur de page avec les titres des pages visibles, le désactive s'il n'y en a qu'une et synchronise son état sur la page courante sans déclencher d'événements. |
| `TabbedMenu:goToPage(page: any, muteSound: any)` | 430 | ✍ Bascule vers le cadre de page donné via le sélecteur, avec un événement forcé. Le son est coupé pendant le changement si muteSound vaut true ; l'état précédent est ensuite restauré. |
| `TabbedMenu:updatePagingVisibility(visible: any)` | 444 | ✍ Affiche ou masque l'en-tête du menu. |
| `TabbedMenu:onMenuActionClick(menuActionName: any) → boolean` | 455 | ✍ Appelle le callback stocké pour une action d'entrée, s'il existe. Renvoie son résultat ou false s'il a été exécuté, et true (événement non consommé) s'il n'y avait pas de callback. |
| `TabbedMenu:onClickOk()` | 466 | ✍ Gère l'entrée de validation en envoyant MENU_ACCEPT au callback stocké ; la classe parente n'est volontairement pas appelée. |
| `TabbedMenu:onClickBack()` | 474 | ✍ Gère le retour : demande à la page courante d'autoriser la fermeture, puis appelle le gestionnaire parent et le callback MENU_BACK. Renvoie si l'événement est resté inutilisé. |
| `TabbedMenu:onClickCancel()` | 490 | ✍ Gère l'annulation (quitter vers le menu principal) : exécute le gestionnaire parent, puis le callback MENU_CANCEL si l'événement est encore inutilisé. |
| `TabbedMenu:onClickActivate()` | 502 | ✍ Gère l'activation (sauvegarder la partie) : exécute le gestionnaire parent, puis le callback MENU_ACTIVATE si l'événement est encore inutilisé. |
| `TabbedMenu:onClickMenuExtra1()` | 514 | ✍ Exécute le gestionnaire parent, puis le callback MENU_EXTRA_1 si l'événement est encore inutilisé. |
| `TabbedMenu:onClickMenuExtra2()` | 526 | ✍ Exécute le gestionnaire parent, puis le callback MENU_EXTRA_2 si l'événement est encore inutilisé. |
| `TabbedMenu:onClickPageSelection(state: any)` | 537 | ✍ Appelé quand le sélecteur de page change d'état : active cette page dans la pagination et joue le son de l'onglet (ou le clic par défaut) sauf si muet. |
| `TabbedMenu:onPagePrevious()` | 551 | ✍ Va à la page précédente. Sur mobile, demande à la page sa propre sous-page précédente ; sinon demande à la page l'autorisation de se fermer, puis laisse le parent changer de page. |
| `TabbedMenu:onPageNext()` | 565 | ✍ Va à la page suivante, avec la même distinction mobile/bureau que onPagePrevious. |
| `TabbedMenu:onPageChange(pageIndex: any, pageMappingIndex: any, element: any, skipTabVisualUpdate: any)` | 579 | ✍ Callback de pagination au changement de page : ferme et masque l'ancienne page, réinitialise les bindings, affiche la nouvelle, lui donne le focus sons supprimés, met à jour l'onglet sélectionné, rafraîchit boutons et onglets, puis appelle onFrameOpen sur la nouvelle page. |
| `TabbedMenu:updateButtonsPanel(page: any)` | 618 | ✍ Assigne aux boutons les infos de la page (personnalisées ou par défaut) et déplace la boîte de boutons de la page en dernier dans son parent pour qu'elle s'affiche au-dessus. |
| `TabbedMenu:getPageButtonInfo(page: any)` | 664 | ✍ Renvoie les infos de boutons propres à la page si elle en déclare, sinon celles par défaut du menu. |
| `TabbedMenu:onPageUpdate()` | 678 | ✍ Point d'extension vide pour la désactivation ou mise à jour d'une page ; ne fait rien ici. |
| `TabbedMenu:onButtonBack()` | 683 | ✍ Action par défaut du bouton retour : quitte le menu. |
| `TabbedMenu:onMenuOpened()` | 689 | ✍ Point d'extension vide appelé à la fin de onOpen, après restauration de la page. |
| `TabbedMenu:registerPage(pageFrameElement: any, position: any, enablingPredicateFunction: any)` | 704 | ✍ Insère un cadre de page dans la liste du menu (position bornée, à la fin par défaut), l'indexe par classe, stocke son élément racine et son prédicat d'activation optionnel, et le masque. Ne touche pas au composant de pagination. Renvoie l'élément racine et la position finale. |
| `TabbedMenu:unregisterPage(pageFrameClass: table) → boolean, table, table, table` | 731 | ✍ Retire des tables du menu la page enregistrée pour une classe de cadre. Renvoie un indicateur, le contrôleur, la racine et l'onglet. À noter : l'onglet n'est jamais recherché, donc l'onglet renvoyé est toujours nil, et rien n'est retiré de pagingElement. |
| `TabbedMenu:addPage(pageFrameElement: any, position: any, tabIconFilename: any, tabIconUVs: any, enablingPredicateFunction: any)` | 780 | ✍ Ajoute une page à l'exécution : l'enregistre, crée son onglet d'en-tête à partir d'un fichier d'icône et d'UV, et l'ajoute à la pagination sous son titre (titre de la racine ou clé l10n ui_<nom>). Dure jusqu'au redémarrage du jeu ou au retrait de la page. |
| `TabbedMenu:removePage(pageFrameClass: table)` | 804 | ✍ Retire une page par classe et la supprime avec ses enfants, mais ne fait que désactiver les pages natives (celles de defaultPageElementIDs, NON VÉRIFIÉ où c'est rempli). À noter : unregisterPage renvoie un onglet nil, donc l'appel pageTab:delete() échouerait pour les pages non natives. |
| `TabbedMenu:setPageEnabled(pageFrameClass: table, isEnabled: boolean)` | 829 | ✍ Active ou désactive une page par classe de contrôleur : met à jour la pagination, l'état désactivé du contrôleur, la liste persistante des pages désactivées et son onglet. Survit à reset() ; à annuler manuellement. |
| `TabbedMenu:makeSelfCallback(func: any)` | 853 | ✍ Renvoie une fermeture qui appelle func avec ce menu en premier argument suivi des arguments reçus. |
