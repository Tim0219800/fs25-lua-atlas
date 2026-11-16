# gui/hud/GameInfoDisplayMobile.lua

*[English version](../../../../scripts/gui/hud/GameInfoDisplayMobile.md)*

Source: `dataS/scripts/gui/hud/GameInfoDisplayMobile.lua` — FS25 1.25.1.0

✍ Barre HUD supérieure pour la disposition mobile/tactile, dérivée de HUDDisplayElement. Elle occupe la largeur de l'écran dans les marges de zone sûre et héberge les boutons menu, boutique, carte et aide ainsi que des éléments météo, argent et carburant/forme. Les helpers create*, updateInsets et updateButtonPosition sont appelés ici mais non définis dans ce fichier (NON VÉRIFIÉ). Les gestionnaires de boutons appellent les bascules de g_currentMission sauf si le gestionnaire de sommeil dort.

- **GameInfoDisplayMobile** hérite de `HUDDisplayElement` (l.31)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GameInfoDisplayMobile.new(hud: string, hudAtlasPath: string, moneyUnit: any, controlHudAtlasPath: any)` | 38 | ✍ Constructeur prenant le HUD, le chemin de l'atlas HUD, l'unité monétaire et celui de l'atlas des contrôles. Crée le cadre de fond, construit les boutons et les éléments météo/argent/carburant via des helpers create* et s'abonne à MessageType.INSETS_CHANGED. |
| `GameInfoDisplayMobile:setVehicle(vehicle: any)` | 70 | ✍ Mémorise le véhicule contrôlé, indique s'il possède la spécialisation Rideable et n'affiche l'élément carburant/forme que si un véhicule est défini. |
| `GameInfoDisplayMobile:onOpenShop()` | 407 | ✍ Gestionnaire de bouton appelant g_currentMission:onToggleStore() ; ignoré pendant que le gestionnaire de sommeil dort. |
| `GameInfoDisplayMobile:onOpenMap()` | 416 | ✍ Gestionnaire de bouton appelant g_currentMission:onToggleMap() ; ignoré pendant que le gestionnaire de sommeil dort. |
| `GameInfoDisplayMobile:onOpenMenu()` | 425 | ✍ Gestionnaire de bouton appelant g_currentMission:onToggleMenu() ; ignoré pendant que le gestionnaire de sommeil dort. |
| `GameInfoDisplayMobile:onOpenHelp()` | 434 | ✍ Gestionnaire de bouton appelant g_currentMission:onToggleHelp() ; ignoré pendant que le gestionnaire de sommeil dort. |
| `GameInfoDisplayMobile:setMoneyUnit(moneyUnit: integer)` | 444 | ✍ Définit l'unité monétaire (GS_MONEY_EURO, POUND ou DOLLAR) ; toute autre valeur retombe sur le dollar. |
| `GameInfoDisplayMobile:setMissionInfo(missionInfo: table)` | 455 | ✍ Mémorise la référence MissionInfo utilisée pour les informations de base ; elle ne doit pas être modifiée. |
| `GameInfoDisplayMobile:setEnvironment(environment: table)` | 462 | ✍ Mémorise la référence d'environnement utilisée pour l'affichage météo ; sa classe n'est pas dans le dump du SDK (NON VÉRIFIÉ). |
| `GameInfoDisplayMobile:setMoneyVisible(isVisible: any)` | 468 | ✍ Fonction vide : le corps est vide dans cette version, elle n'a donc aucun effet. |
| `GameInfoDisplayMobile:setTimeVisible(isVisible: any)` | 473 | ✍ Fonction vide : le corps est vide dans cette version, elle n'a donc aucun effet. |
| `GameInfoDisplayMobile:setTemperatureVisible(isVisible: any)` | 478 | ✍ Fonction vide : le corps est vide dans cette version, elle n'a donc aucun effet. |
| `GameInfoDisplayMobile:setWeatherVisible(isVisible: any)` | 483 | ✍ Fonction vide : le corps est vide dans cette version, elle n'a donc aucun effet. |
| `GameInfoDisplayMobile:setTutorialVisible(isVisible: any)` | 491 | ✍ Fonction vide : le corps est vide dans cette version, elle n'a donc aucun effet. |
| `GameInfoDisplayMobile:setTutorialProgress(progress: number)` | 497 | ✍ Fonction vide : le corps est vide dans cette version, elle n'a donc aucun effet. |
| `GameInfoDisplayMobile:draw()` | 525 | ✍ Exécute chaque fonction de dessin de texte enregistrée dans textElements, puis dessine l'élément parent. |
| `GameInfoDisplayMobile:setScale(uiScale: any)` | 571 | ✍ Applique une échelle d'interface uniforme, recalcule la position et la taille de la barre, mémorise la position d'origine, repositionne les boutons boutique/menu/carte/aide par rapport au coin de la barre et déplace la surbrillance de l'aide. |
| `GameInfoDisplayMobile.getBackgroundPositionAndSize(scale: scale) → number, number` | 609 | ✍ Renvoie x, y, largeur et hauteur de la barre : elle remplit la largeur de l'écran moins le plus grand de la marge de zone sûre et du décalage mis à l'échelle de chaque côté, et se place en haut de l'écran. |
| `GameInfoDisplayMobile.createBackground()` | 634 | ✍ Crée un overlay sans image avec le rectangle calculé de la barre, utilisé comme cadre de positionnement. |

## Messages

- s'abonne à `MessageType.INSETS_CHANGED` (l.63)
