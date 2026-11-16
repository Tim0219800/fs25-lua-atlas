# objects/AnimatedObject.lua

*[English version](../../../scripts/objects/AnimatedObject.md)*

Source: `dataS/scripts/objects/AnimatedObject.lua` — FS25 1.25.1.0

✍ Sous-classe d'Object en réseau pour les objets animés de carte ou de placeable : portes, portails, barrières. Une animation a un temps normalisé de 0 à 1 et une direction (-1, 0, 1) pilotée par le serveur : keyframes de nœuds (translation, rotation, échelle, visibilité), keyframes de paramètres de shader, clip i3d optionnel et animations de portail roulant. Fonctions optionnelles : déclencheur joueur avec actions d'entrée, horaires d'ouverture liés au message de changement d'heure, sons de mouvement et de fin. Le fichier contient aussi AnimatedObjectBuilder, un assistant pour construire un objet animé par code, et l'enregistrement du schéma XML.

- **AnimatedObject** hérite de `Object` (l.12)
- **AnimatedObjectBuilder** (l.807)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimatedObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 22 | ✍ Constructeur : crée l'Object avec ses indicateurs serveur/client et initialise la table controls, les interpolateurs réseau de temps et de temps d'animation, ainsi qu'un AnimatedObjectActivatable lié à cet objet. |
| `AnimatedObject:load(rootNode: integer\|table, xmlFile: XMLFile, key: string, xmlFilename: string, i3dMappings: table?) → boolean` | 53 | ✍ Charge l'objet depuis une clé XML : lit saveId, durée d'animation, keyframes de pièces et de shaders (normalisées par le plus grand temps de clé en courbes d'animation), clip optionnel (i3d partagé chargé en asynchrone), portails roulants, initialTime, openingHours, nœud déclencheur avec contrôles posAction/negAction, et sons côté client. Les pièces à corps rigide statique sont ignorées avec un avertissement. Appelle applyAnimation et onSharedAnimationFileLoaded, absents de ce fichier (NON VÉRIFIÉ). Retourne true. |
| `AnimatedObject:loadFrameValues(xmlFile: XMLFile, key: string, node: integer) → number, number, number, number, number, number, number, number, number, integer` | 311 | ✍ Lit une keyframe depuis le XML et retourne dix valeurs (translation, rotation, échelle, visibilité 1 ou 0). Toute composante absente prend la transformation actuelle du nœud ; la visibilité est visible par défaut. |
| `AnimatedObject:delete()` | 381 | ✍ Libère tout ce que possède l'objet : rappels de déclencheur, sons, requête i3d partagée, enregistrement de l'activatable et abonnements au centre de messages, le marque supprimé puis appelle le delete parent. |
| `AnimatedObject:readStream(streamId: integer, connection: table)` | 426 | ✍ Côté client, à la connexion : après la lecture parente, lit le temps d'animation (float32) et la direction (2 bits, stockée comme direction + 1), applique le temps immédiatement et réinitialise les interpolateurs réseau. |
| `AnimatedObject:writeStream(streamId: integer, connection: table)` | 444 | ✍ Côté serveur, quand un client se connecte : après l'écriture parente, envoie le temps d'animation courant (float32) et la direction (2 bits, direction + 1). |
| `AnimatedObject:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 457 | ✍ Côté client : si le bit de modification est présent, démarre une nouvelle phase d'interpolation réseau et lit le temps d'animation cible et la direction envoyés par le serveur. |
| `AnimatedObject:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 475 | ✍ Côté serveur : écrit un booléen pour le drapeau de modification de l'objet et, s'il est actif, le dernier temps d'animation envoyé (animation.timeSend) et la direction. |
| `AnimatedObject:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 490 | ✍ Restaure l'état depuis une clé de sauvegarde : si #time existe, l'applique (ainsi que #direction, 0 par défaut), puis réévalue les horaires d'ouverture. Retourne true. |
| `AnimatedObject:update(dt: number)` | 542 | ✍ Mise à jour par trame. Serveur : avance le temps d'animation de direction * dt / durée (ms), s'arrête à 0 ou 1, met à jour la zone de blocage de l'IA en fin de course et lève le drapeau de modification si le temps a changé. Client : interpole vers le temps réseau. Les deux gèrent les sons de mouvement et de fin et gardent l'objet actif tant qu'il bouge. |
| `AnimatedObject:setAnimTime(t: number, omitSound: any)` | 632 | ✍ Borne t entre 0 et 1 et l'applique à chaque pièce (translation, rotation, échelle, visibilité), paramètre de shader, clip i3d et portail roulant, puis mémorise le temps et marque l'objet en mouvement. Retourne le temps borné. L'argument omitSound n'est pas utilisé dans le corps. |
| `AnimatedObject:setFrameValues(node: integer, v: table)` | 676 | ✍ Applique directement à un nœud une table de dix valeurs (translation, rotation, échelle, indicateur de visibilité). |
| `AnimatedObject:hourChanged()` | 685 | ✍ Serveur uniquement. Compare l'heure courante de l'environnement aux horaires d'ouverture : lance l'ouverture (direction 1) ou la fermeture (direction -1) une fois à chaque transition et, si disableIfClosed est actif, bascule isEnabled. Ne fait rien sans horaires ni environnement. |
| `AnimatedObject:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 730 | ✍ Rappel de déclencheur. Uniquement dans les parties carrière, quand le nœud racine du joueur local entre dans le déclencheur ou en sort, ajoute ou retire l'activatable du système d'objets activables et garde l'objet actif. |
| `AnimatedObject.registerXMLPaths(schema: any, basePath: any)` | 749 | ✍ Enregistre les chemins du schéma XML d'une entrée animatedObject : saveId, animation (pièces, shaders, clip, portail roulant, durée, initialTime), openingHours, controls et sons. |
| `AnimatedObject.registerSavegameXMLPaths(schema: any, basePath: any)` | 799 | ✍ Enregistre les attributs XML de sauvegarde #time (flottant) et #direction (entier, 0 par défaut). |
| `AnimatedObjectBuilder.registerXMLPaths(schema: any, basePath: any)` | 811 | ✍ Enregistre uniquement les chemins des échantillons sonores (moving, posEnd, negEnd) sous le chemin de base donné pour les objets créés par le builder. |
| `AnimatedObjectBuilder.new(animatedObject: any, xmlFilename: any, saveId: any)` | 819 | ✍ Crée un builder pour un objet animé existant : définit son répertoire de base, son nom de mod et son saveId, et lui donne une animation vide (durée 1000 ms, temps 0, direction 0) avec isEnabled = true. |
| `AnimatedObjectBuilder:build(rootNodeId: any)` | 844 | ✍ Finalise la construction : applique le temps d'animation 0, s'abonne au message de changement d'heure s'il y a des horaires d'ouverture, enregistre les rappels de déclencheur sur le nœud déclencheur et ses enfants, et alloue le drapeau de modification. Retourne true. L'argument rootNodeId n'est pas utilisé. |
| `AnimatedObjectBuilder:setTrigger(node: any)` | 871 | ✍ Mémorise le nœud déclencheur du joueur sur l'objet animé. |
| `AnimatedObjectBuilder:setActions(posAction: any, posText: any, negAction: any, negText: any)` | 877 | ✍ Définit les actions d'entrée positive et éventuellement négative ainsi que leurs textes (traduits si une entrée l10n correspond). Les noms d'action inconnus provoquent un avertissement et sont ignorés. |
| `AnimatedObjectBuilder:addSimplePart(node: any, openRotation: any, openTranslation: any)` | 912 | ✍ Ajoute un nœud animé entre sa transformation actuelle (temps 0) et la rotation et/ou translation d'ouverture donnée (temps 1), avec échelle inchangée et visibilité active. |
| `AnimatedObjectBuilder:setDuration(duration: any)` | 953 | ✍ Définit la durée d'animation. La valeur est stockée telle quelle ; ailleurs dans le fichier elle est traitée en millisecondes (le défaut du builder est 1000). |
| `AnimatedObjectBuilder:setSounds(xmlFile: any, key: any, rootNode: any)` | 959 | ✍ Uniquement côté client, charge les échantillons moving, posEnd et negEnd depuis une clé XML, attachés au nœud racine donné (les i3dMappings ne sont pas pris en charge ici). |
| `AnimatedObjectBuilder:setOpeningTimes(startTime: any, endTime: any, disableIfClosed: any, closedText: any)` | 970 | ✍ Mémorise des horaires d'ouverture (début, fin, disableIfClosed, texte de fermeture) quand début et fin sont fournis ; sans eux l'objet est toujours utilisable. |

## Messages

- s'abonne à `MessageType.HOUR_CHANGED` (l.228)
- s'abonne à `MessageType.HOUR_CHANGED` (l.851)
