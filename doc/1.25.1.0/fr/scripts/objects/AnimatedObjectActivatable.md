# objects/AnimatedObjectActivatable.lua

*[English version](../../../scripts/objects/AnimatedObjectActivatable.md)*

Source: `dataS/scripts/objects/AnimatedObjectActivatable.lua` — FS25 1.25.1.0

✍ Enveloppe d'activatable qui permet au joueur d'actionner un AnimatedObject via le système d'objets activables. Elle enregistre les événements d'action d'entrée définis dans la table controls de l'objet (une bascule, ou des actions positive/négative continues) et affiche le texte d'action et, si fermé, le texte de fermeture. La méthode getCanBeTriggered de l'objet est appelée mais n'est pas définie dans les fichiers du dump (NON VÉRIFIÉ).

- **AnimatedObjectActivatable** (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimatedObjectActivatable.new(animatedObject: table) → table` | 13 | ✍ Crée l'activatable lié à un objet animé, avec un texte d'activation vide. |
| `AnimatedObjectActivatable:registerCustomInput(inputContext: any)` | 24 | ✍ Enregistre les événements d'entrée à partir des contrôles de l'objet : un événement bascule si seule posAction existe, un événement continu sur axe si les deux actions sont identiques, ou deux événements continus sinon. Définit une priorité de texte très haute, la visibilité et les textes configurés, puis rafraîchit les textes. |
| `AnimatedObjectActivatable:removeCustomInput(inputContext: any)` | 64 | ✍ Supprime tous les événements d'action enregistrés par cet activatable et efface les identifiants d'événements mémorisés dans les contrôles de l'objet. |
| `AnimatedObjectActivatable:onAnimationInputContinuous(actionName: any, inputValue: any)` | 75 | ✍ Rappel d'entrée pour le mouvement maintenu : tant que l'entrée positive ou négative est active, il fixe la direction de l'animation (sauf si elle va déjà dans ce sens ou est en bout de course), et remet la direction à 0 au relâchement si elle avait été pressée. |
| `AnimatedObjectActivatable:onAnimationInputToggle()` | 109 | ✍ Rappel d'entrée en mode bascule : inverse la direction d'animation courante via setDirection et met à jour le texte d'action affiché. À noter : si la direction est 0 (à l'arrêt), le résultat reste 0 car 0 * -1 = 0, donc setDirection reçoit 0. |
| `AnimatedObjectActivatable:updateActionEventTexts()` | 118 | ✍ En mode bascule avec les deux textes définis, affiche le texte positif quand l'animation est fermée ou en fermeture et le texte négatif sinon. |
| `AnimatedObjectActivatable:getIsActivatable()` | 132 | ✍ Retourne si l'objet animé peut actuellement être déclenché, en déléguant à sa méthode getCanBeTriggered (absente du dump, NON VÉRIFIÉ). |
| `AnimatedObjectActivatable:activate()` | 138 | ✍ Enregistre cet activatable comme drawable de la mission afin que draw soit appelé à chaque trame. |
| `AnimatedObjectActivatable:deactivate()` | 144 | ✍ Retire cet activatable des drawables de la mission. |
| `AnimatedObjectActivatable:getDistance(x: any, y: any, z: any)` | 150 | ✍ Retourne la distance entre une position du monde et le nœud déclencheur de l'objet, ou math.huge si l'objet n'a pas de nœud déclencheur. |
| `AnimatedObjectActivatable:draw()` | 161 | ✍ Quand l'objet a des horaires d'ouverture avec un texte de fermeture, ajoute ce texte comme texte supplémentaire à l'écran pour la mission. |
