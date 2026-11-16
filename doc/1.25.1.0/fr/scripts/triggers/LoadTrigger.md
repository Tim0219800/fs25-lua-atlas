# triggers/LoadTrigger.lua

*[English version](../../../scripts/triggers/LoadTrigger.md)*

Source: `dataS/scripts/triggers/LoadTrigger.lua` — FS25 1.25.1.0

✍ Objet réseau (sous-classe de Object) pour une station de chargement qui remplit les unités de remplissage des véhicules depuis un objet source, comme un silo ou un point de production. Les véhicules sont suivis par un trigger physique ; le joueur (ou un minuteur automatique si la plateforme active le remplissage automatique) démarre et arrête le chargement. Le serveur transfère les litres dans update, le client joue effets, sons et un shader défilant. Définit aussi LoadTriggerActivatable, l'activable qui expose l'action démarrer/arrêter. Dépend de EffectManager, SoundManager et SiloDialog, absents du dump (NON VÉRIFIÉ).

- **LoadTrigger** hérite de `Object` (l.13)
- **LoadTriggerActivatable** (l.699)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LoadTrigger.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Enregistre les attributs XML d'un trigger de chargement : triggerNode, fillLitersPerSecond, useTimeScale, noeud et taille de déversement, identifiants de sons et sons, noeud/shader/vitesse du défileur, fillTypes ou fillTypeCategories, autoStart, infiniteCapacity, textes démarrer/arrêter et aiNode. Enregistre aussi les chemins d'effets et d'échantillons. |
| `LoadTrigger.new(isServer: any, isClient: any, customMt: any)` | 51 | ✍ Crée le trigger de chargement comme objet réseau avec les drapeaux serveur/client donnés et une table vide d'objets remplissables. Appeler ensuite load pour le configurer depuis le XML. |
| `LoadTrigger:load(components: any, xmlFile: any, xmlNode: any, i3dMappings: any, rootNode: any)` | 61 | ✍ Lit la configuration depuis le XML et retourne false si le noeud racine ou triggerNode manque. Enregistre le trigger physique et l'objet de noeud, lit le débit, l'éventuel noeud IA et les infos de déversement, et sur les clients charge effets, échantillons et défileur. Restreint les types par liste ou catégorie, crée l'activable et règle le remplissage automatique depuis Platform.gameplay. |
| `LoadTrigger:delete()` | 209 | ✍ Retire les écouteurs de suppression sur les objets suivis, retire le trigger physique et l'objet de noeud, supprime échantillons et effets, retire l'activable, puis appelle le delete du parent. |
| `LoadTrigger:setSource(object: any)` | 242 | ✍ Définit l'objet source qui fournit les niveaux. Vérifie par assert qu'il implémente getSupportedFillTypes, getAllFillLevels, addFillLevelToFillableObject et getIsFillAllowedToFarm ; erreur sinon. |
| `LoadTrigger:raiseActive()` | 253 | ✍ Maintient cet objet dans la boucle de mise à jour via le raiseActive du parent, et active aussi l'objet source s'il possède cette méthode. |
| `LoadTrigger:loadTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 263 | ✍ Callback physique d'entrée/sortie. Trouve une unité du véhicule qui accepte un type proposé par la source (celle du noeud, sinon une unité sans noeud de remplissage exact), et suit l'objet avec un écouteur de suppression et un drapeau de portée. Puis lance le chargement auto ou ajoute/retire l'activable. |
| `LoadTrigger:farmIdForFillableObject(fillableObject: any)` | 369 | ✍ Retourne l'identifiant de ferme d'un objet remplissable : sa ferme active si disponible, sinon sa ferme propriétaire, avec repli sur la ferme spectateur si aucune n'est trouvée. |
| `LoadTrigger:getIsFillableObjectAvailable()` | 384 | ✍ Retourne true si un objet suivi peut être chargé maintenant. Pendant un chargement, il vérifie l'objet courant ; sinon il choisit une cible valide (activation permise, outil TRIGGER supporté, capacité libre, ferme autorisée), en déprioritisant le dernier rempli, et la mémorise comme validFillableObject. |
| `LoadTrigger:toggleLoading()` | 432 | ✍ Arrête le chargement s'il est en cours. Sinon collecte les niveaux de la source (pour la ferme courante) autorisés par l'unité cible ; sauf autoStart, ouvre SiloDialog pour choisir le type (freine le véhicule en mode automatique), sinon démarre avec le premier type. Utilise le véhicule du joueur local. |
| `LoadTrigger:onFillTypeSelection(fillType: any)` | 486 | ✍ Callback de la sélection de type : si le type est valide et que la cible autorise encore l'activation, démarre son chargement sur l'objet et l'unité validés via setIsLoading. Ignoré pour un type nil ou inconnu. |
| `LoadTrigger:setIsLoading(isLoading: any, targetObject: any, fillUnitIndex: any, fillType: any, noEventSend: any)` | 498 | ✍ Envoie LoadTriggerSetIsLoadingEvent (sauf noEventSend), puis démarre le chargement et le son, ou arrête le son et le chargement. Point d'entrée utilisé pour synchroniser l'état de chargement entre serveur et clients. |
| `LoadTrigger:getAllowsActivation(fillableObject: any)` | 512 | ✍ Retourne true si aucun véhicule actif n'est requis (remplissage automatique), ou si l'objet indique true via getAllowLoadTriggerActivation ; false sinon. |
| `LoadTrigger:startLoading(fillType: any, fillableObject: any, fillUnitIndex: any)` | 526 | ✍ Marque le chargement comme démarré (une seule fois) : mémorise type, objet cible et unité, passe le texte de l'activable en texte d'arrêt, et sur les clients démarre effets, les deux échantillons et la vitesse du défileur. Ne transfère aucun litre. |
| `LoadTrigger:stopLoading()` | 550 | ✍ Termine le chargement : réinitialise type et texte, notifie la cible via aiStoppedLoadingFromTrigger si présent, note quel objet a été rempli en dernier pour la priorité, et sur les clients arrête effets, échantillons et défileur. |
| `LoadTrigger:update(dt: any)` | 579 | ✍ Serveur uniquement. Pendant le chargement, transfère des litres à chaque image de la source vers la cible (débit fois dt, plafonné par getLoadTriggerMaxFillSpeed de la cible, mis à l'échelle du temps si activé) et s'arrête quand plus rien n'est transféré. En mode automatique, tente de démarrer toutes les 10 secondes. |
| `LoadTrigger:getCurrentFillType()` | 622 | ✍ Retourne le type de remplissage en cours de chargement (FillType.UNKNOWN au repos). |
| `LoadTrigger:getFillTargetNode()` | 628 | ✍ Retourne le noeud racine de l'unité cible en cours de chargement, ou nil si aucun objet n'est rempli. |
| `LoadTrigger:setFillSoundIsPlaying(state: any)` | 638 | ✍ Sans infos de déversement, déplace le noeud sonore à la position de la cible au démarrage. Sans échantillon `load` personnalisé, il délègue à FillTrigger.setFillSoundIsPlaying, et transmet aussi l'état au setFillSoundIsPlaying de la cible si présent. À noter : lit self.samples, qui n'existe que sur les clients. |
| `LoadTrigger:onDeleteObject(vehicle: any)` | 661 | ✍ Callback de l'écouteur de suppression : retire le véhicule supprimé des objets suivis et, si c'était celui en cours de chargement, arrête le chargement. |
| `LoadTrigger:getIsFillTypeSupported(fillType: any)` | 677 | ✍ Retourne true si le type est dans la liste autorisée du trigger. À noter : il indexe self.fillTypes sans test de nil, alors que load le met à nil sans restriction configurée, ce qui provoquerait une erreur. |
| `LoadTrigger:getSupportAILoading()` | 683 | ✍ Indique si le chargement par IA est supporté, ce qui est vrai quand un aiNode est défini dans le XML. |
| `LoadTrigger:getAITargetPositionAndDirection()` | 689 | ✍ Retourne x et z monde du noeud IA ainsi que x et z de sa direction locale avant (+Z), comme cible d'approche de l'IA. |
| `LoadTriggerActivatable.new(loadTrigger: any)` | 703 | ✍ Crée l'activable lié à un trigger de chargement, avec un texte d'action vide. |
| `LoadTriggerActivatable:setText(text: any)` | 714 | ✍ Définit le texte affiché pour l'action d'activation. |
| `LoadTriggerActivatable:getIsActivatable()` | 720 | ✍ Indique si le trigger de chargement propriétaire a actuellement un objet remplissable disponible. |
| `LoadTriggerActivatable:run()` | 726 | ✍ Exécute l'action en basculant le chargement du trigger de chargement propriétaire. |
