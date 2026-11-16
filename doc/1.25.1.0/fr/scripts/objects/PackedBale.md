# objects/PackedBale.lua

*[English version](../../../scripts/objects/PackedBale.md)*

Source: `dataS/scripts/objects/PackedBale.lua` — FS25 1.25.1.0

✍ Sous-classe de Bale pour une balle composée de plusieurs balles plus petites (balle packée/empilée). Elle lit la config de la balle simple et les noeuds enfants dans le XML de la balle (bale.packedBale#singleBale et singleBale#node) et permet à un joueur à pied de l'ouvrir via PackedBaleActivatable. Le dépaquetage crée des objets Bale normaux à ces noeuds sur le serveur ; les clients envoient un BaleUnpackEvent (défini ailleurs).

- **PackedBale** hérite de `Bale` (l.17)
- **PackedBaleActivatable** (l.140)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PackedBale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 27 | ✍ Crée la balle packée : enregistre le nom de classe, prépare la liste des noeuds de balles simples, crée l'activatable et fixe la distance maximale de dépaquetage depuis PackedBale.MAX_UNPACK_DISTANCE (défini hors de ce fichier). |
| `PackedBale:delete()` | 41 | ✍ Retire l'activatable du système d'activatables puis appelle le delete parent. |
| `PackedBale:loadBaleAttributesFromXML(xmlFile: table)` | 50 | ✍ Charge les attributs du parent, puis le fichier de balle simple (doit exister, sinon erreur XML et retour false) et la liste des noeuds de balles simples. Enregistre l'activatable et retourne true en cas de succès. |
| `PackedBale:unpack(noEventSend: boolean)` | 78 | ✍ Serveur : pour chaque noeud de balle simple, crée une Bale normale du même type de remplissage avec autant de niveau qu'elle peut contenir, au même propriétaire de ferme, puis supprime la balle packée. Client : envoie un BaleUnpackEvent au serveur. Retire d'abord l'activatable. |
| `PackedBale:getCanInteract()` | 108 | ✍ True si la position d'interaction du joueur existe et est plus proche que la distance maximale de dépaquetage. |
| `PackedBale:getInteractionPosition()` | 123 | ✍ Retourne la position du joueur local, ou rien s'il est dans un véhicule ou n'a pas accès à cette balle. |
| `PackedBaleActivatable.new(packedBale: any)` | 144 | ✍ Crée l'activatable d'une balle packée et charge le texte 'action_cutBale'. |
| `PackedBaleActivatable:getIsActivatable()` | 155 | ✍ Actif lorsque le joueur peut interagir avec la balle packée. |
| `PackedBaleActivatable:run()` | 165 | ✍ Appelle unpack sur la balle packée. |
