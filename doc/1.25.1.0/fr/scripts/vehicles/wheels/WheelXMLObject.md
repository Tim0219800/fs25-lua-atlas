# vehicles/wheels/WheelXMLObject.lua

*[English version](../../../../scripts/vehicles/wheels/WheelXMLObject.md)*

Source: `dataS/scripts/vehicles/wheels/WheelXMLObject.lua` — FS25 1.25.1.0

✍ Objet utilitaire employé au chargement d'une roue depuis le XML d'un véhicule. Il résout chaque attribut soit dans l'entrée de roue du véhicule, soit dans un fichier XML de roue externe (choisi par nom de fichier et configId), ce qui permet de partager et de surcharger les définitions de roues. Des méthodes comme getXMLFileAndKey et getXMLFileAndPropertyKey sont appelées mais leur corps est absent du dump du SDK (NON VÉRIFIÉ).

- **WheelXMLObject** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelXMLObject.new(xmlFile: any, baseKey: any, configIndex: any, wheelKey: any, indexToParentIndex: any)` | 16 | ✍ Crée l'objet pour un fichier XML de véhicule, une clé de base, un index de configuration et une clé de roue donnés. Mémorise le répertoire de base du mod et appelle aussitôt setXMLLoadKey avec un suffixe vide. |
| `WheelXMLObject:getValue(attributeKey: any, ...: any)` | 135 | ✍ Lit un attribut via la recherche XML véhicule/externe et renvoie nil si le texte stocké est un simple tiret. Si aucune source ne contient la clé, lit la clé par défaut du XML du véhicule pour obtenir la valeur par défaut du type XML. |
| `WheelXMLObject:getLocalValue(attributeKey: any, ...: any)` | 153 | ✍ Comme getValue mais transmet un indicateur à la recherche de clé, apparemment pour se limiter à l'entrée propre du véhicule (règles exactes NON VÉRIFIÉES). Une valeur tiret donne nil ; une clé absente retombe sur la clé par défaut. |
| `WheelXMLObject:getValueAlternative(attributeKey: any, altAttributeKey: any, ...: any)` | 171 | ✍ Lit un attribut en fournissant aussi une clé d'attribut alternative à la recherche, pour les valeurs pouvant être stockées sous un second nom. Un tiret donne nil ; sinon retombe sur la clé par défaut comme getValue. |
| `WheelXMLObject:xmlWarning(attributeKey: any, text: any, ...: any)` | 211 | ✍ Écrit un avertissement XML sur le fichier du véhicule, en ajoutant au message le chemin complet de la clé de roue de l'attribut. |
| `WheelXMLObject:checkDeprecatedXMLElements(oldAttributeKey: any, newAttribute: any)` | 217 | ✍ Vérifie dans le XML du véhicule la présence d'un ancien attribut sous la clé de cette roue et le signale comme obsolète au profit du nouveau, via XMLUtil.checkDeprecatedXMLElements. |
| `WheelXMLObject:setXMLLoadKey(key: any, alternativeFilename: any)` | 224 | ✍ Ajoute une sous-clé à la clé de roue, puis lit localement #filename et #configId pour choisir un fichier de roue externe. Sans nom de fichier, le XML externe déjà chargé est supprimé et l'état externe est réinitialisé. |
| `WheelXMLObject:setExternalFilename(externalFilename: any, configId: any)` | 244 | ✍ Résout le nom du fichier de roue externe par rapport au répertoire de base du mod et le mémorise avec son configId. Si l'un des deux change, le XML externe chargé est supprimé et le nom de roue en cache est réinitialisé pour un rechargement. |
| `WheelXMLObject:loadExternalXMLFile()` | 260 | ✍ Charge le XML de roue externe avec Wheels.xmlSchema, mémorise le nom des métadonnées et repère la configuration dont l'id correspond. Renvoie true en cas de succès ; en cas d'échec, vide les champs externes et renvoie false. |
| `WheelXMLObject:cacheWheelMass()` | 293 | ✍ Renvoie la masse de la roue : la masse physique propre au véhicule si présente, sinon une valeur en cache par fichier externe et configuration, sinon la masse physique plus celles de toutes les pièces visuelles additionnelles. Renvoie 0.1 sans fichier externe. À noter : WheelXMLObject.wheelMassCache est indexé sans être créé dans ce fichier (NON VÉRIFIÉ ailleurs), et le test final d'absence de fichier externe est inatteignable. |
