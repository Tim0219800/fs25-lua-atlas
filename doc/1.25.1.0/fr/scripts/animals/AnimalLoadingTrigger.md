# animals/AnimalLoadingTrigger.lua

*[English version](../../../scripts/animals/AnimalLoadingTrigger.md)*

Source: `dataS/scripts/animals/AnimalLoadingTrigger.lua` — FS25 1.25.1.0

✍ Zone de déclenchement où un joueur ou une remorque à bétail peut ouvrir l'écran des animaux, soit à un élevage soit chez un marchand d'animaux. Elle peut être créée depuis un noeud de scène (attributs utilisateur isDealer, animalTypes, title) ou depuis un XML. Elle enregistre un activatable auprès du système d'objets activables de la mission, vérifie la permission tradeAnimals et la propriété de la ferme, et peut s'activer automatiquement sur les plateformes qui l'autorisent. Le fichier définit aussi la classe auxiliaire AnimalLoadingTriggerActivatable.

- **AnimalLoadingTrigger** (l.13)
- **AnimalLoadingTriggerActivatable** (l.251)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalLoadingTrigger.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Enregistre dans le schéma XML les entrées `#node`, `#isDealer`, `#animalTypes` et `#title` (défaut ui_farm) sous le chemin de base donné. |
| `AnimalLoadingTrigger:onCreate(id: integer)` | 29 | ✍ Callback de création de la scène : construit un déclencheur pour le noeud, le charge et l'ajoute aux objets non mis à jour en cas de succès, sinon le supprime. |
| `AnimalLoadingTrigger.new(isServer: boolean, isClient: boolean) → table` | 45 | ✍ Crée l'objet déclencheur (sous-classe de Object) sans noeud, non marchand, désactivé, sans véhicule de chargement, avec un nouvel activatable. Il mémorise le nom du mod de carte courant pour les textes. |
| `AnimalLoadingTrigger:loadFromXML(xmlFile: integer, key: string, components: string, i3dMappings: any)` | 71 | ✍ Charge depuis le XML le noeud, l'indicateur de marchand, les types d'animaux autorisés (noms séparés par des espaces, résolus via le système d'animaux) et le titre, puis enregistre le callback du déclencheur. Retourne false avec un avertissement XML si le noeud manque. |
| `AnimalLoadingTrigger:load(node: integer, husbandry: any)` | 111 | ✍ Charge les mêmes réglages depuis les attributs utilisateur du noeud de scène, conserve l'élevage optionnel, enregistre le callback du déclencheur, active le déclencheur et retourne true. Les noms de types d'animaux inconnus sont journalisés en avertissement. |
| `AnimalLoadingTrigger:delete()` | 145 | ✍ Retire l'activatable de la mission, supprime le déclencheur du noeud et efface la référence à l'élevage. |
| `AnimalLoadingTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 163 | ✍ Callback de déclencheur du moteur à l'entrée ou à la sortie. Un véhicule gérant les animaux devient la remorque de chargement (avec activation automatique et freinage sur certaines plateformes) ; à la sortie il est libéré et l'écran des animaux est prévenu si sa cible part. Pour le joueur local, il suit la portée et met à jour l'activatable. |
| `AnimalLoadingTrigger:updateActivatableObject()` | 205 | ✍ Ajoute l'activatable à la mission quand un véhicule de chargement ou le joueur est à portée, et le retire sinon. |
| `AnimalLoadingTrigger:setLoadingTrailer(loadingVehicle: table)` | 216 | ✍ Remplace le véhicule de chargement courant : retire ce déclencheur de l'ancien et l'enregistre sur le nouveau via setLoadingTrigger si présent, puis met à jour l'activatable. |
| `AnimalLoadingTrigger:getAnimals()` | 232 | ✍ Retourne la liste des indices de types d'animaux autorisés (marchand seulement), ou nil si aucune restriction n'est configurée. Malgré son nom, elle retourne des types, pas des animaux. |
| `AnimalLoadingTrigger:openAnimalMenu()` | 238 | ✍ Ouvre AnimalScreen pour l'élevage, le véhicule de chargement et l'indicateur de marchand, et mémorise le véhicule comme cible activée. Appel d'interface côté client. |
| `AnimalLoadingTriggerActivatable.new(animalLoadingTrigger: any)` | 255 | ✍ Crée l'activatable pour un déclencheur avec le texte localisé animals_openAnimalScreen comme libellé d'action. |
| `AnimalLoadingTriggerActivatable:getIsActivatable()` | 266 | ✍ Vrai seulement si le déclencheur est actif, aucune interface n'est ouverte, le joueur a la permission tradeAnimals, l'élevage éventuel appartient à la ferme du joueur, et le joueur est à portée ou dans le véhicule racine du véhicule de chargement. |
| `AnimalLoadingTriggerActivatable:run()` | 295 | ✍ Ouvre le menu des animaux, sauf si la visite guidée est en cours : une boîte d'information indique alors que la fonction est désactivée. |
| `AnimalLoadingTriggerActivatable:getDistance(x: any, y: any, z: any)` | 306 | ✍ Retourne la distance 3D entre le point donné et le noeud du déclencheur, ou l'infini si le noeud n'existe pas. |
