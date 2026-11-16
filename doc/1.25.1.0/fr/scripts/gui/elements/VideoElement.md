# gui/elements/VideoElement.lua

*[English version](../../../../scripts/gui/elements/VideoElement.md)*

Source: `dataS/scripts/gui/elements/VideoElement.lua` — FS25 1.25.1.0

✍ Élément GUI qui lit une vidéo via un overlay vidéo (fonctions moteur createVideoOverlay, playVideoOverlay, etc. ; leur fonctionnement interne est NON VÉRIFIÉ), dérivé de GuiElement. Il gère la boucle, le volume, des sous-titres optionnels chargés depuis un XML placé à côté de la vidéo, une barre de progression et une étiquette de temps restant référencées par id, ainsi qu'un callback onEndVideo. La vidéo peut être interrompue à la souris ou au clavier si allowStop est actif.

- **VideoElement** hérite de `GuiElement` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VideoElement.new(target: any, custom_mt: any)` | 26 | ✍ Constructeur. Initialise le nom de fichier vidéo, la boucle désactivée, le volume à 1, des sous-titres vides et les références optionnelles aux éléments de sous-titres/barre de progression/temps restant. |
| `VideoElement:loadFromXML(xmlFile: any, key: any)` | 51 | ✍ Lit depuis le XML videoFilename, volume, allowStop, isLooping, les ids des éléments sous-titres/barre de progression/temps restant et le callback onEndVideo, puis charge la vidéo via changeVideo. |
| `VideoElement:loadProfile(profile: any, applyProfile: any)` | 69 | ✍ Lit les mêmes réglages vidéo et ids d'éléments depuis un profil GUI ; contrairement au chemin XML, il ne charge pas la vidéo. |
| `VideoElement:copyAttributes(src: any)` | 83 | ✍ Copie le volume, les options, le callback, les sous-titres et les ids d'éléments depuis une source et charge sa vidéo via changeVideo (qui réinitialise d'abord les sous-titres). |
| `VideoElement:delete()` | 130 | ✍ Arrête et supprime l'overlay vidéo, puis appelle le delete du parent. |
| `VideoElement:loadSubtitles(filename: any)` | 137 | ✍ Cherche un XML nommé comme le fichier vidéo (sans extension) et lit ses entrées Subtitles.Subtitle (startTime, endTime, text traduit via g_i18n). À noter : le chemin vient de self.videoFilename et non de l'argument, qui est seulement testé contre nil. |
| `VideoElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 165 | ✍ Lorsqu'il est visible, transmet l'événement au parent ; si non utilisé et allowStop actif, un appui souris arrête la vidéo et déclenche le callback de fin. Renvoie true dans ce cas. |
| `VideoElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 190 | ✍ Lorsqu'il est visible, toute touche enfoncée arrête et libère la vidéo et déclenche le callback de fin (sans tenir compte de allowStop), et l'événement est signalé comme consommé. |
| `VideoElement:update(dt: any)` | 209 | ✍ Par frame : lance une lecture en attente dès que la vidéo est prête, met à jour l'overlay pendant la lecture, fait avancer les sous-titres, redimensionne la barre de progression et écrit le temps restant au format -MM:SS. À la fin de la lecture, libère la vidéo et déclenche le callback de fin. |
| `VideoElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 273 | ✍ Affiche l'image de la vidéo pendant la lecture, ou un texte de chargement gras centré (l10n ui_loading) tant qu'elle n'est pas prête, puis dessine le parent. |
| `VideoElement:onEndVideo()` | 294 | ✍ Appelle onEndVideoCallback avec la cible si elle existe, sinon sans argument. |
| `VideoElement:disposeVideo()` | 306 | ✍ Arrête et supprime l'overlay (nil ensuite) et vide l'élément de texte de sous-titre s'il existe. |
| `VideoElement:getIsActive()` | 319 | ✍ Actif dès que l'élément est visible. |
| `VideoElement:playVideo()` | 325 | ✍ Marque la vidéo pour démarrer dès qu'elle est prête et réinitialise l'index des sous-titres. Sans effet sans overlay. |
| `VideoElement:stopVideo()` | 334 | ✍ Annule toute lecture en attente et arrête l'overlay s'il est en cours de lecture. |
| `VideoElement:changeVideo(newVideoFilename: any, volume: any, duration: any)` | 343 | ✍ Libère la vidéo actuelle, remplace $l10nSuffix par g_languageSuffix dans le nouveau nom, crée l'overlay avec l'option de boucle et le volume donné ou par défaut, mémorise l'argument de durée et charge les sous-titres. À noter : la durée vaut nil si elle n'est pas fournie, or le code de progression/temps restant l'utilise. |
