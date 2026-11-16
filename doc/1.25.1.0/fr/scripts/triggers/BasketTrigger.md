# triggers/BasketTrigger.lua

*[English version](../../../scripts/triggers/BasketTrigger.md)*

Source: `dataS/scripts/triggers/BasketTrigger.lua` — FS25 1.25.1.0

✍ Petite classe de déclencheur pour un panier (zone cible) placé dans une carte via le mécanisme onCreate. Elle enregistre un déclencheur et mémorise quels objets lancés (ceux ayant un champ thrownFromPosition) y sont entrés. La logique de distance ou de score n'existe qu'en code commenté, donc dans ce dump le déclencheur n'a aucun effet de jeu visible.

- **BasketTrigger** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BasketTrigger:onCreate(id: integer)` | 16 | ✍ Point d'entrée onCreate de la carte : crée un déclencheur à partir du nœud donné et l'enregistre comme non mis à jour dans la mission si le chargement réussit, sinon le supprime. |
| `BasketTrigger.new(customMt: table?) → table` | 29 | ✍ Constructeur. Crée une instance avec les identifiants de déclencheur et de nœud à 0. |
| `BasketTrigger:load(nodeId: integer) → boolean` | 42 | ✍ Résout la forme du déclencheur depuis l'attribut utilisateur triggerIndex du nœud (à défaut, le nœud lui-même), enregistre le callback du déclencheur, l'active et retourne true. |
| `BasketTrigger:delete()` | 60 | ✍ Retire l'enregistrement du déclencheur. |
| `BasketTrigger:triggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: any)` | 71 | ✍ Quand le déclencheur est actif, marque un acteur entrant comme présent si son objet a un thrownFromPosition, et retire le marquage à sa sortie. À noter : l'objet retourné pour l'acteur n'est pas testé contre nil à l'entrée, ce qui provoquerait une erreur pour un nœud inconnu. |
