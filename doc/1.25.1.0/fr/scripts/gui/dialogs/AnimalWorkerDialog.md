# gui/dialogs/AnimalWorkerDialog.lua

*[English version](../../../../scripts/gui/dialogs/AnimalWorkerDialog.md)*

Source: `dataS/scripts/gui/dialogs/AnimalWorkerDialog.lua` — FS25 1.25.1.0

✍ Sous-classe de MessageDialog pour gérer les tâches d'ouvriers engageables d'un élevage : une ligne par tâche avec planning, coût, nombre d'animaux concernés, un interrupteur et un bouton d'exécution immédiate. Elle ne modifie qu'une copie locale de l'état ; l'appelant l'applique, le diffuse en réseau et gère l'exécution immédiate. Se désabonne de PlaceableHusbandryAnimalWorkerPerformAnswerEvent à la fermeture. La construction des lignes et le rafraîchissement sont dans assignTaskRows et refreshInfo, absents de ce fichier (NON VÉRIFIÉ).

- **AnimalWorkerDialog** hérite de `MessageDialog` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalWorkerDialog:onGuiSetupFinished()` | 80 | ✍ Après la mise en place du GUI, détache le modèle de ligne de tâche de la mise en page et du gestionnaire de focus, et mémorise la hauteur maximale de la boîte et la hauteur restante du cadre pour le redimensionnement. |
| `AnimalWorkerDialog:delete()` | 93 | ✍ Supprime le modèle de ligne détaché, puis le dialogue lui-même, car le modèle n'appartient plus à la mise en page. |
| `AnimalWorkerDialog:onOpen()` | 111 | ✍ Si un élevage est défini, construit les lignes de tâches avec assignTaskRows, relance le minuteur et rafraîchit aussitôt les infos. Rien de plus si husbandry est nil. |
| `AnimalWorkerDialog:onClose()` | 126 | ✍ Efface la ligne en attente et se désabonne de l'événement de réponse d'exécution. L'élevage et les callbacks sont aussi effacés, sauf pendant un rechargement du GUI (g_gui.currentlyReloading) afin de conserver l'état. |
| `AnimalWorkerDialog:update(dt: number)` | 147 | ✍ Tant qu'il est ouvert avec un élevage, décompte le minuteur de dt (ms) et appelle refreshInfo à chaque échéance (AnimalWorkerDialog.INFO_REFRESH_INTERVAL, défini ailleurs). |
