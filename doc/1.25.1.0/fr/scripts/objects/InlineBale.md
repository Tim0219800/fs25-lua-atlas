# objects/InlineBale.lua

*[English version](../../../scripts/objects/InlineBale.md)*

Source: `dataS/scripts/objects/InlineBale.lua` — FS25 1.25.1.0

✍ Objet réseau (hérite de Object) représentant une file de balles enrubannées bout à bout, produite par une enrubanneuse en ligne. Il garde la liste ordonnée des InlineBaleSingle, relie les voisines par des joints physiques qui se raidissent avec le temps, crée les connecteurs visuels et suit l'avancement de l'enrubannage. Un joueur peut l'ouvrir via InlineBaleActivatable ; il est sauvegardé/chargé via les uniqueId de ses balles et synchronisé par des dirty flags (balles et enrubanneuse). La config vient d'un XML inlineBale (maxOpenDistance, connector, replacementBale, textures, clés de wrapping, limites de joint).

- **InlineBale** hérite de `Object` (l.21)
- **InlineBaleActivatable** (l.942)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InlineBale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 66 | ✍ Crée l'objet de balles en ligne : tables de balles et de joints vides, limites de joint et temps de verrouillage (5000 ms) par défaut, enregistrement dans l'item system et le registre de noms de classe, création de l'activatable et des dirty flags. |
| `InlineBale:delete()` | 111 | ✍ Retire l'activatable et l'entrée de l'item system, désenregistre le nom de classe puis appelle le delete parent. Ne supprime pas les balles individuelles. |
| `InlineBale:loadFromConfigXML(configFileName: configFileName) → table` | 123 | ✍ Charge le XML de la balle en ligne : distance d'ouverture, fichier/axe/décalage du connecteur, balle de remplacement optionnelle, textures diffuse et normale du film (obligatoires), clés d'état d'enrubannage et limites de joint/temps de verrouillage. Retourne false si un fichier ou une texture manque. |
| `InlineBale:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 199 | ✍ Chargement de sauvegarde : lit le nom du fichier de config et l'uniqueId, charge la config puis met en file les uniqueId des balles sauvegardées dans balesToLoad. S'il n'y en a aucune, l'objet est marqué pour suppression. |
| `InlineBale:saveToXMLFile(xmlFile: any, key: any)` | 243 | ✍ Écrit le nom du fichier de config, l'uniqueId et l'uniqueId de chaque balle. Rien n'est sauvegardé si la seule balle est encore la balle en attente. |
| `InlineBale:readStream(streamId: integer, connection: table)` | 262 | ✍ Côté client à la connexion : lit le nom du fichier de config, charge la config, appelle le readStream parent, enregistre dans l'item system et lit la liste des balles. |
| `InlineBale:writeStream(streamId: integer, connection: table)` | 276 | ✍ Côté serveur à la connexion : écrit le nom du fichier de config, appelle le writeStream parent puis écrit la liste des balles. |
| `InlineBale:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 289 | ✍ Lecture de mise à jour côté client (uniquement depuis la connexion serveur) : lit éventuellement la liste des balles et l'objet enrubanneuse courant, selon deux booléens. |
| `InlineBale:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 305 | ✍ Écriture de mise à jour côté serveur : envoie la liste des balles si le dirty flag des balles est levé et l'enrubanneuse courante si celui de l'enrubanneuse est levé. |
| `InlineBale:readBales(streamId: any, timestamp: any, connection: any)` | 318 | ✍ Lit le nombre de balles et leurs ids d'objet depuis un flux. Retire les connecteurs des anciennes balles, vide la liste, met les ids en file dans balesToLoad et enregistre l'activatable s'il y a des balles. |
| `InlineBale:writeBales(streamId: any, connection: any, dirtyMask: any)` | 345 | ✍ Écrit le nombre de balles et leurs objets réseau dans un flux. La dernière balle est omise tant qu'une balle en attente existe, car elle va être remplacée ; le nombre envoyé est mémorisé dans numBalesSent. |
| `InlineBale:update(dt: number)` | 363 | ✍ Surcharge vide, ne fait rien. |
| `InlineBale:updateTick(dt: number)` | 369 | ✍ Tick principal. Serveur : résout les balles de sauvegarde en attente par uniqueId, fait avancer le raidissement des joints, calcule l'état d'enrubannage de chaque balle selon la position de l'enrubanneuse, signale les changements pour la synchro, gère le réveil différé et la suppression si vide. Client : résout les ids réseau en attente, ajoute les balles et recrée les connecteurs. |
| `InlineBale:addBale(bale: any, baleType: any)` | 488 | ✍ Ajoute une balle à la file. Sur le serveur, il faut l'absence de balle en attente et l'accord de getIsBaleAllowed ; la balle devient la balle en attente, est liée et surveillée pour sa suppression. Sur le client, elle est simplement ajoutée. Retourne true en cas de succès et applique l'info d'enrubanneuse en attente. |
| `InlineBale:getIsBaleAllowed(bale: any, baleType: any)` | 532 | ✍ Retourne true pour la première balle ; sinon false si le nombre maximal (InlineBale.MAX_NUM_BALES, défini hors de ce fichier) est atteint ou si la config en ligne du type de balle diffère de celle-ci. |
| `InlineBale:replacePendingBale(spawnNode: any, color: any)` | 550 | ✍ Côté serveur : remplace la balle en attente par une nouvelle InlineBaleSingle créée à spawnNode avec les mêmes attributs, textures de film et couleur optionnelle. Supprime l'ancienne et retourne replaced (booléen) et le nouvel id d'objet réseau. |
| `InlineBale:getPendingBale()` | 590 | ✍ Retourne la balle en attente de connexion, ou nil. |
| `InlineBale:connectPendingBale()` | 596 | ✍ Enregistre l'activatable et, s'il y a une balle en attente, la relie à la précédente quand il y en a au moins deux, puis vide l'emplacement. Retourne true si une balle était en attente. L'argument de nom de fichier passé par un appelant est ignoré. |
| `InlineBale:connectBale(bale: any)` | 613 | ✍ Crée le joint physique et le connecteur visuel entre l'avant-dernière balle et la dernière balle donnée. |
| `InlineBale:createBaleJoint(bale1: any, bale2: any)` | 623 | ✍ Construit un joint physique entre deux balles, collision activée, avec les limites de rotation et de translation de départ, et le mémorise avec un chrono indexé par la première balle. |
| `InlineBale:updateBaleJoints(dt: any)` | 648 | ✍ Fait avancer le chrono de chaque joint jusqu'à lockTime et interpole ses limites entre valeurs de départ et de fin, ce qui raidit progressivement la file. |
| `InlineBale:setBaleJointLimits(jointIndex: any, alpha: any)` | 661 | ✍ Applique les limites de rotation et de translation à un joint, interpolées linéairement entre les tables de départ et de fin selon alpha (0 à 1). |
| `InlineBale:loadBaleConnector(bale1: any, bale2: any, filename: any)` | 675 | ✍ Attache un connecteur visuel à bale2 par rapport à bale1 si un nom de fichier est donné et que bale2 n'en a pas. Retourne true en cas de succès, sinon false. |
| `InlineBale:removeBaleConnector(bale: any)` | 691 | ✍ Retire le connecteur de la balle donnée si elle n'est pas nil. |
| `InlineBale:setCurrentWrapperInfo(wrapper: any, wrappingNode: any)` | 699 | ✍ Mémorise le noeud d'enrubannage, réveille l'objet et, si l'enrubanneuse a changé, la met à jour et lève le dirty flag correspondant pour la synchro réseau. |
| `InlineBale:getNumberOfBales()` | 711 | ✍ Retourne le nombre de balles de la file. |
| `InlineBale:getBales()` | 717 | ✍ Retourne la table ordonnée des balles. |
| `InlineBale:setWrappingState(state: any)` | 733 | ✍ Applique le même état d'enrubannage à chaque balle et à l'objet lui-même. |
| `InlineBale:wakeUp(delay: any)` | 743 | ✍ Réveille la physique de toutes les balles immédiatement, ou après le délai donné en ms (traité dans updateTick côté serveur). |
| `InlineBale:getCanInteract()` | 756 | ✍ True s'il y a des balles, qu'aucune enrubanneuse n'est active et que la position d'interaction du joueur est à moins de maxOpenDistance de la première ou de la dernière balle. |
| `InlineBale:getInteractionPosition()` | 789 | ✍ Retourne la position du joueur local, ou rien s'il est dans un véhicule ou n'a pas accès à la première balle. |
| `InlineBale:getCanBeOpened()` | 803 | ✍ True uniquement si toutes les balles sont entièrement enrubannées et qu'aucune ne fermente encore. |
| `InlineBale:openBaleAtPosition(x: any, y: any, z: any)` | 815 | ✍ Ouvre la balle d'extrémité (première ou dernière) la plus proche de la position monde donnée. |
| `InlineBale:openBale(bale: any, isFirst: any, replaceBale: any)` | 838 | ✍ Détache une balle d'extrémité : retire son joint et son connecteur, met à jour la liste, supprime son lien et, sauf si replaceBale vaut false, la remplace par une Bale normale ouverte aux mêmes attributs. Supprime l'objet quand il est vide. |
| `InlineBale:onBaleDeleted(bale: any)` | 902 | ✍ Listener de suppression. Si une balle de la file est supprimée, détache les balles du côté le plus court jusqu'à elle pour garder la file cohérente. Sans effet tant qu'une balle est en attente. |
| `InlineBaleActivatable.new(inlineBale: any)` | 946 | ✍ Crée l'activatable d'une balle en ligne et charge le texte 'action_cutBale'. |
| `InlineBaleActivatable:getIsActivatable()` | 957 | ✍ Actif uniquement si le joueur peut interagir et si les balles peuvent être ouvertes. |
| `InlineBaleActivatable:run()` | 969 | ✍ Ouvre la balle la plus proche du joueur : directement sur le serveur, sinon en envoyant un InlineBaleOpenEvent (défini ailleurs) au serveur. |
