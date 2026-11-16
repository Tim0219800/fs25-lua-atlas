# triggers/TransportMissionTrigger.lua

*[English version](../../../scripts/triggers/TransportMissionTrigger.md)*

Source: `dataS/scripts/triggers/TransportMissionTrigger.lua` — FS25 1.25.1.0

✍ Noeud trigger de carte utilisé par les missions de transport : il s'enregistre auprès du gestionnaire de missions et transmet les événements d'entrée et de sortie d'objets à la mission qui lui est actuellement assignée. La méthode d'assignation setMission est appelée dans le constructeur mais n'est pas définie dans ce fichier (NON VÉRIFIÉ, probablement dans un trou du dump). Il lit un attribut utilisateur nommé index sur le noeud.

- **TransportMissionTrigger** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TransportMissionTrigger:onCreate(id: integer)` | 19 | ✍ Point d'entrée au chargement de la carte pour un noeud de mission de transport : construit un TransportMissionTrigger et l'ajoute aux objets non mis à jour de la mission. |
| `TransportMissionTrigger.new(id: integer) → table` | 27 | ✍ Crée le trigger : lit l'attribut utilisateur `index`, enregistre le callback physique, l'active, s'enregistre auprès de g_missionManager et appelle setMission(nil) pour le masquer jusqu'à l'assignation d'une mission. |
| `TransportMissionTrigger:delete()` | 47 | ✍ Retire le trigger physique et se désenregistre du gestionnaire de missions. |
| `TransportMissionTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 71 | ✍ Si le trigger est actif et qu'une mission est assignée, transmet les entrées à mission:objectEnteredTrigger et les sorties à mission:objectLeftTrigger avec le trigger et l'identifiant du noeud concerné. |
