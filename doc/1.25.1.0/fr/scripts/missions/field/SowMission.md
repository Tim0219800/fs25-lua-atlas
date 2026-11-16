# missions/field/SowMission.lua

*[English version](../../../../scripts/missions/field/SowMission.md)*

Source: `dataS/scripts/missions/field/SowMission.lua` — FS25 1.25.1.0

✍ Contrat de semis, sous-classe de AbstractFieldMission. Ce fichier ne fournit que la requête d'avancement par partition ; le reste est hérité.

- **SowMission** hérite de `AbstractFieldMission` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SowMission:getPartitionCompletion(partitionIndex: any)` | 167 | ✍ Définit la région de la partition donnée puis exécute le modificateur d'achèvement avec son filtre et renvoie pixels cumulés, surface et surface totale. Renvoie 0, 0, 0 sans modificateur d'achèvement. |
