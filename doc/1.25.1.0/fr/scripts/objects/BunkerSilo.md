# objects/BunkerSilo.lua

*[English version](../../../scripts/objects/BunkerSilo.md)*

Source: `dataS/scripts/objects/BunkerSilo.lua` — FS25 1.25.1.0

✍ Objet réseau représentant un silo-couloir (silo d'ensilage) qui suit une zone rectangulaire de la carte de densité définie par des nœuds start, width et height. Il passe par quatre états : FILL (de l'ensilage est ajouté et compacté par les véhicules), CLOSED (bâché, en fermentation), FERMENTED et DRAIN (ouvert, le type de sortie est prélevé). Les niveaux sont lus côté serveur dans le système de hauteur de la carte de densité puis synchronisés aux clients. Plusieurs constantes et fonctions (STATE_*, NUM_STATES, COMPACTING_BASE_MASS, MILLISECONDS_PER_DAY, updateCompacting, onHourChanged, showBunkerMessage) sont utilisées mais absentes de ce dump (NON VÉRIFIÉ). Le fichier se termine par le début de BunkerSiloActivatable, dont le corps est absent.

- **BunkerSilo** hérite de `Object` (l.7)
- **BunkerSiloActivatable** (l.1005)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSilo:onCreate(id: integer)` | 24 | ✍ Callback de carte obsolète : se contente de journaliser une erreur indiquant que BunkerSilo.onCreate est déprécié et ne crée rien. |
| `BunkerSilo.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 34 | ✍ Constructeur. Initialise les décalages de zone, les types par défaut (entrée chaff, sortie silage, fermentation tarp), les compteurs, l'activatable et l'état FILL, réserve un drapeau dirty et s'abonne à HOUR_CHANGED. Retourne l'instance. |
| `BunkerSilo:load(components: table, xmlFile: table, key: string, i3dMappings: table) → boolean` | 87 | ✍ Charge depuis le XML les nœuds area et innerArea, le déclencheur, les types acceptés, d'entrée et de sortie, distanceToCompactedFillLevel, openingLength et les murs. Enregistre la zone de conversion auprès du gestionnaire de densité et divise la distance de compactage par la difficulté économique. Retourne true. |
| `BunkerSilo:delete()` | 181 | ✍ Retire le déclencheur d'interaction, les zones de types fixes et de conversion, les abonnements aux messages et l'activatable, puis appelle le delete du parent. |
| `BunkerSilo:readStream(streamId: integer, connection: table)` | 199 | ✍ Côté client à la connexion : après le parent, lit l'état (3 bits), les drapeaux d'ouverture avant/arrière, le niveau de remplissage, le pourcentage compacté (7 bits) et le pourcentage de fermentation. |
| `BunkerSilo:writeStream(streamId: integer, connection: table)` | 216 | ✍ Côté serveur à la connexion : après le parent, écrit les mêmes champs que ceux lus par readStream. |
| `BunkerSilo:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 233 | ✍ Mise à jour côté client : si le bit dirty est présent, lit l'état (appelle setState avec notification en cas de changement), le niveau, les drapeaux d'ouverture, puis le pourcentage compacté en FILL ou de fermentation en CLOSED/FERMENTED. |
| `BunkerSilo:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 260 | ✍ Mise à jour côté serveur : écrit un indicateur pour le bit dirty du silo puis, s'il est actif, les champs attendus par readUpdateStream. |
| `BunkerSilo:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 285 | ✍ Restaure depuis la sauvegarde l'état, les niveaux, le temps de fermentation et les ouvertures, recalcule les décalages de zone et corrige la carte de densité : convertit ou vide des types selon l'état et peut repasser de DRAIN à FILL quand le silo est presque vide. Retourne true. |
| `BunkerSilo:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 379 | ✍ Écrit dans la sauvegarde l'état, fillLevel, compactedFillLevel, fermentingTime (pourcentage converti en millisecondes avec les jours par période) et les ouvertures avant/arrière. |
| `BunkerSilo:update(dt: number)` | 391 | ✍ Mise à jour à chaque image. Affiche niveau et compactage ou fermentation quand le joueur local peut interagir. Sur le serveur en état FILL, calcule le compactage d'après la distance parcourue, la masse et le contact des roues des véhicules à portée. Garde bunkerScore au niveau maximal et appelle raiseActive. |
| `BunkerSilo:updateTick(dt: number)` | 481 | ✍ Côté serveur, environ toutes les 200 à 300 ms : actualise le niveau et, s'il a changé, appelle updateCompacting. Au premier appel, porte openingLength à au moins le rayon maximal par défaut du type de sortie plus 1. |
| `BunkerSilo:updateFillLevel()` | 508 | ✍ Lit le niveau de remplissage dans la zone interne de la carte de densité, avec le type correspondant à l'état (entrée, fermentation, ou fermentation plus sortie). En DRAIN sous emptyThreshold, vide la zone et revient à FILL avec notification. |
| `BunkerSilo:setState(state: boolean, showNotification: boolean)` | 541 | ✍ Change l'état du silo et applique ses effets. FILL réinitialise compactage et zones, CLOSED convertit l'entrée en fermentation et efface les traces de pneus, DRAIN fixe le type de sortie. Affiche éventuellement un message et, sur le serveur, lève le drapeau dirty. Sans effet si l'état est inchangé. |
| `BunkerSilo:openSilo(px: number, py: number, pz: number)` | 631 | ✍ Passe en DRAIN avec notification, recalcule les décalages, puis ouvre l'extrémité la plus proche de la position donnée en convertissant le type en fermentation vers le type de sortie sur openingLength. Marque cette extrémité ouverte et lève le drapeau dirty. |
| `BunkerSilo:getBunkerAreaOffset(updateAtFront: boolean, offset: number, fillType: integer) → number` | 656 | ✍ Parcourt la zone par tranches de 1 m depuis l'avant ou l'arrière, à partir du décalage donné, et retourne le décalage de la première tranche contenant le type donné. Retourne la longueur de la zone moins 1 (au moins 0) si rien n'est trouvé. |
| `BunkerSilo:switchFillTypeAtOffset(switchAtFront: boolean, offset: number, length: number)` | 689 | ✍ Convertit le type en fermentation en type de sortie sur une bande de la longueur donnée à partir du décalage, mesuré depuis l'avant ou l'arrière de la zone. |
| `BunkerSilo:getIsCloserToFront(ix: number, iy: number, iz: number) → boolean` | 720 | ✍ Retourne true si la position monde donnée est plus proche du milieu du bord avant (décalage avant inclus) que du bord arrière. |
| `BunkerSilo:getCanInteract(showInformationOnly: boolean) → boolean` | 740 | ✍ Vérification côté client sur le joueur local. En mode information, vrai pour un joueur à pied à portée ou pour le véhicule actuel à portée et actif pour les entrées. Sinon, vrai seulement pour un joueur à pied à portée. Faux sans joueur local. |
| `BunkerSilo:getCanCloseSilo() → boolean` | 772 | ✍ Retourne true quand l'état est FILL, que le niveau est supérieur à 0 et que le pourcentage compacté atteint au moins 100. |
| `BunkerSilo:getCanOpenSilo() → boolean` | 779 | ✍ Retourne true si l'état est FERMENTED ou DRAIN et que l'extrémité la plus proche de la position d'interaction locale n'est pas encore ouverte. Faux s'il n'y a pas de position d'interaction. |
| `BunkerSilo:clearSiloArea()` | 798 | ✍ Efface tout le contenu du système de hauteur de la carte de densité sur la zone du silo définie par les nœuds start, width et height. |
| `BunkerSilo:getInteractionPosition() → number, number, number` | 849 | ✍ Retourne la position du joueur local s'il est à pied à portée, ou celle du premier nœud de composant du véhicule actuel à portée. Retourne nil sinon, y compris sans joueur local. |
| `BunkerSilo:interactionTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 875 | ✍ Callback de déclencheur à l'entrée ou à la sortie. Suit le joueur local et les objets Vehicle à portée, ajoute ou retire l'activatable en conséquence et pose ou retire le callback d'interaction avec le silo du véhicule (pelles). |
| `BunkerSilo.onChangedFillLevelCallback(self: table, vehicle: table, fillDelta: integer, fillType: integer, x: any, y: any, z: any)` | 927 | ✍ Callback d'un véhicule (pelle) dont le niveau a changé. Ne réagit qu'aux variations négatives : sur une extrémité ouverte, il étend la bande ouverte au-delà de la position de l'outil de openingLength et met à jour le décalage avant ou arrière. |
| `BunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 967 | ✍ Enregistre le schéma XML : nœuds area et innerArea, murs wallLeft et wallRight avec collision, nœud interactionTrigger, acceptedFillTypes, inputFillType, outputFillType, distanceToCompactedFillLevel (100 par défaut) et openingLength (5 par défaut). |
| `BunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 992 | ✍ Enregistre les attributs de sauvegarde state (0 FILL, 1 CLOSED, 2 FERMENTED, 3 DRAIN), fillLevel, compactedFillLevel, fermentingTime, openedAtFront et openedAtBack. |

## Messages

- s'abonne à `MessageType.HOUR_CHANGED` (l.75)
