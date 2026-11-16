# gui/hud/SideNotification.lua

*[English version](../../../../scripts/gui/hud/SideNotification.md)*

Source: `dataS/scripts/gui/hud/SideNotification.lua` — FS25 1.25.1.0

✍ Affichage HUD (étend HUDDisplay) en haut à droite qui empile de courtes notifications colorées, des barres de progression avec titre, texte et pourcentage, et une icône d'enregistrement en rotation. La file de notifications est dessinée jusqu'à SideNotification.MAX_NOTIFICATIONS entrées. L'expiration et le retrait des notifications et la liste des barres de progression ne sont pas gérés dans ce fichier (NON VÉRIFIÉ). Côté client uniquement.

- **SideNotification** hérite de `HUDDisplay` (l.27)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SideNotification.new(customMt: any?) → any` | 33 | ✍ Crée l'affichage avec une file de notifications et une liste de barres de progression vides, des overlays de fond et de progression, une barre de progression en trois parties, une icône d'enregistrement et le texte localisé ui_savegameSaveInProgress. |
| `SideNotification:storeScaledValues()` | 83 | ✍ Ancre l'affichage près du coin haut-droit du HUD et convertit la mise en page en pixels de référence (parties du fond, tailles de texte, panneau de progression de 400 de large, parties de barre, taille d'icône) en unités écran. |
| `SideNotification:draw()` | 149 | ✍ Dessine chaque barre de progression visible (titre, texte, barre et pourcentage) puis efface son drapeau visible, donc les propriétaires doivent le remettre à chaque frame. Dessine ensuite l'icône d'enregistrement (rotation avec g_currentDt) si une sauvegarde est en cours, puis les notifications en file. |
| `SideNotification:addNotification(text: string, color: table, displayDuration: integer)` | 303 | ✍ Ajoute à la file une notification avec texte, couleur RGBA et durée d'affichage (en millisecondes d'après le commentaire de la file). |
