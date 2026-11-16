# misc/Timer.lua

*[English version](../../../scripts/misc/Timer.md)*

Source: `dataS/scripts/misc/Timer.lua` — FS25 1.25.1.0

✍ Petit objet minuteur piloté par la boucle de mise à jour de la mission : en marche, il est enregistré comme updateable sur g_currentMission et retranche le delta de trame (éventuellement mis à l'échelle) du temps restant. Les durées sont en millisecondes. Un rappel de fin peut être défini, et le temps restant peut être envoyé dans un flux réseau.

- **Timer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Timer.new(duration: any)` | 15 | ✍ Crée un minuteur avec la durée donnée (ms), sans rappel, à l'arrêt, avec la durée complète comme temps restant. |
| `Timer:delete()` | 28 | ✍ Nettoie le minuteur en appelant reset, ce qui le retire des updateables de la mission. |
| `Timer:reset()` | 34 | ✍ Retire le minuteur des updateables de la mission et le marque comme arrêté. Le temps restant n'est pas rétabli. |
| `Timer:start(noReset: any)` | 41 | ✍ Démarre le minuteur et l'enregistre pour les mises à jour. Le temps restant est remis à la durée complète sauf si noReset vaut true. Journalise une erreur avec pile d'appels et ne fait rien si aucune durée n'est définie. |
| `Timer:startIfNotRunning()` | 58 | ✍ N'appelle start que si le minuteur n'est pas déjà en marche, de sorte qu'un décompte en cours n'est pas relancé. |
| `Timer:stop()` | 66 | ✍ Retire le minuteur des updateables de la mission et le marque comme arrêté en conservant le temps restant (un start ultérieur avec noReset peut reprendre). |
| `Timer:finish()` | 73 | ✍ Termine le minuteur : le retire des updateables, met le temps restant à 0, l'arrête et invoque le rappel de fin avec le minuteur en argument, s'il existe. |
| `Timer:getIsRunning()` | 84 | ✍ Retourne si le minuteur est actuellement en marche. |
| `Timer:setFinishCallback(callback: any)` | 90 | ✍ Définit la fonction appelée à la fin du minuteur et retourne le minuteur lui-même pour le chaînage. |
| `Timer:getTimePassed()` | 97 | ✍ Retourne le temps écoulé en millisecondes, calculé comme la durée moins le temps restant. |
| `Timer:update(dt: any)` | 113 | ✍ Mise à jour par trame appelée par la mission en marche : retranche dt multiplié par le résultat de scaleFunc() (optionnel) du temps restant et appelle finish quand il atteint 0 ou moins. |
| `Timer.createOneshot(duration: any, callback: any, scaleFunc: any)` | 133 | ✍ Crée et démarre un minuteur qui appelle callback une fois après la durée, puis se supprime. À noter : il appelle timer:setScaleFunction, absent de ce fichier (NON VÉRIFIÉ, provoquerait une erreur s'il n'est défini nulle part ailleurs) ; scaleFunc est censé être un getter d'échelle de temps optionnel. |
| `Timer:getDuration()` | 147 | ✍ Retourne la durée configurée en millisecondes. |
| `Timer:setDuration(duration: any)` | 153 | ✍ Définit la durée (ms), effective au prochain démarrage, et retourne le minuteur pour le chaînage. |
| `Timer:writeUpdateStream(streamId: any)` | 160 | ✍ Écrit le temps restant dans un flux réseau sous forme d'entier 32 bits (la partie fractionnaire n'est pas conservée). |
| `Timer:readUpdateStream(streamId: any)` | 166 | ✍ Lit le temps restant depuis un flux réseau sous forme d'entier 32 bits. |
