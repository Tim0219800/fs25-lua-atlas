# gui/hud/SpeakerDisplay.lua

*[English version](../../../../scripts/gui/hud/SpeakerDisplay.md)*

Source: `dataS/scripts/gui/hud/SpeakerDisplay.lua` — FS25 1.25.1.0

✍ Affichage HUD multijoueur (étend HUDDisplay) listant les utilisateurs en train de parler en chat vocal, en haut à droite sous les notifications latérales. Un locuteur reste listé 500 unités de temps après sa dernière activité vocale. Il lit les utilisateurs de g_currentMission.userManager et VoiceChatUtil. Côté client uniquement.

- **SpeakerDisplay** hérite de `HUDDisplay` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpeakerDisplay.new(customMt: any) → table` | 28 | ✍ Crée l'affichage avec des overlays de fond en trois parties, des icônes de parole et de sourdine à demi-opacité, et une table vide de minuteurs de parole par utilisateur. |
| `SpeakerDisplay:storeScaledValues()` | 59 | ✍ Ancre l'affichage sous l'ancrage haut-droit (décalage de -300 px) et convertit en unités écran les tailles en pixels de référence du fond, du texte, de l'espacement et des icônes. |
| `SpeakerDisplay:draw()` | 98 | ✍ Pour chaque utilisateur, met le minuteur de parole à 500 quand une activité vocale est détectée et que l'utilisateur n'est pas bloqué, puis dessine une ligne arrondie avec l'icône de sourdine ou de parole et le pseudo en majuscules tant que l'entrée existe. Retourne tôt sans utilisateurs. À noter : le minuteur est posé ici mais jamais décrémenté dans ce fichier, donc NON VÉRIFIÉ que les entrées expirent un jour. |
