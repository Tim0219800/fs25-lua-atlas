# gui/elements/FrameElement.lua

*[English version](../../../../scripts/gui/elements/FrameElement.md)*

Source: `dataS/scripts/gui/elements/FrameElement.lua` — FS25 1.25.1.0

✍ FrameElement étend GuiElement et sert de base à toutes les vues GUI, frames partielles comme écrans complets. Il garde une liste d'IDs de contrôles enregistrés, exposés comme champs de la vue après chargement, et des callbacks pour changer d'écran, activer un contexte d'entrée personnalisé et jouer des sons. Il fournit aussi un minuteur court de blocage des entrées.

- **FrameElement** hérite de `GuiElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FrameElement.new(target: any, customMt: any)` | 24 | ✍ Constructeur. Crée controlIDs vide, des callbacks sans effet, l'indicateur de contexte d'entrée à faux, les compteurs de temps à 0 et playHoverSoundOnFocus à false. |
| `FrameElement:clone(parent: any, includeId: any, suppressOnCreate: any, blockFocusHandlingReload: any)` | 44 | ✍ Clone le frame via GuiElement, expose les contrôles enregistrés comme champs du clone et copie les trois callbacks et l'indicateur de contexte d'entrée. |
| `FrameElement:copyAttributes(src: any)` | 59 | ✍ Copie les attributs via le parent, puis marque chaque ID de contrôle de la source comme non résolu pour pouvoir l'exposer de nouveau. |
| `FrameElement:delete()` | 69 | ✍ Supprime via le parent, puis efface tous les IDs de contrôles enregistrés et les champs exposés sous ces noms. |
| `FrameElement:getRootElement()` | 82 | ✍ Renvoie le premier enfant, la racine du frame. S'il n'y en a aucun, crée un GuiElement vide, l'ajoute et le renvoie. |
| `FrameElement:exposeControlsAsFields(viewName: viewName)` | 100 | ✍ Pour chaque descendant ayant un id, l'assigne comme champ du frame ; les ids indexés deviennent des entrées d'une liste. Marque les ids résolus et avertit des non résolus seulement si le debug est actif. |
| `FrameElement:disableInputForDuration(duration: number)` | 132 | ✍ Bloque les entrées pendant la durée donnée en millisecondes, bornée entre 0 et 10000. |
| `FrameElement:isInputDisabled()` | 138 | ✍ Renvoie true tant que le minuteur de blocage des entrées est supérieur à zéro. |
| `FrameElement:update(dt: any)` | 144 | ✍ Mise à jour par frame : appelle le parent, ajoute dt au temps du frame et décompte le minuteur de blocage des entrées. |
| `FrameElement:setChangeScreenCallback(callback: function)` | 156 | ✍ Enregistre la fonction appelée par changeScreen ; nil la remet à une fonction sans effet. |
| `FrameElement:setInputContextCallback(callback: function)` | 163 | ✍ Enregistre la fonction appelée pour activer ou désactiver un contexte d'entrée personnalisé ; nil la remet à une fonction sans effet. |
| `FrameElement:setPlaySampleCallback(callback: function)` | 170 | ✍ Enregistre la fonction utilisée pour jouer un échantillon sonore nommé ; nil la remet à une fonction sans effet. |
| `FrameElement:changeScreen(targetScreenClass: table, returnScreenClass: any)` | 177 | ✍ Demande un changement d'écran en appelant le callback enregistré avec ce frame, la classe d'écran cible et la classe d'écran de retour. |
| `FrameElement:toggleCustomInputContext(isContextActive: string, contextName: string)` | 190 | ✍ Appelle le callback de contexte d'entrée avec l'état et le nom du contexte, seulement si l'état demandé diffère de l'indicateur mémorisé, puis met l'indicateur à jour. |
| `FrameElement:playSample(sampleName: string)` | 200 | ✍ Joue un échantillon sonore par son nom via le callback enregistré, sauf si les sons sont supprimés pour cet élément. |
