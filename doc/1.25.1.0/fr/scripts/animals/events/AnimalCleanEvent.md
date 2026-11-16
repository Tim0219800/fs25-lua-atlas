# animals/events/AnimalCleanEvent.lua

*[English version](../../../../scripts/animals/events/AnimalCleanEvent.md)*

Source: `dataS/scripts/animals/events/AnimalCleanEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui réduit le niveau de saleté d'un groupe d'animaux (cheval) dans un élevage. Il transporte l'élevage, l'identifiant du groupe et un delta de saleté positif, et applique le changement via changeDirt du groupe à l'exécution.

- **AnimalCleanEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalCleanEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `AnimalCleanEvent.new(husbandry: any, clusterId: any, delta: any)` | 19 | ✍ Crée l'événement pour un élevage, un identifiant de groupe et une quantité de saleté (stockée comme valeur absolue du delta arrondi à l'entier inférieur). |
| `AnimalCleanEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Lit l'élevage, l'identifiant du groupe et le delta (largeur en bits AnimalClusterHorse.NUM_BITS_DIRT), puis exécute l'événement aussitôt. |
| `AnimalCleanEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Écrit l'élevage, l'identifiant du groupe et le delta de saleté dans le flux. |
| `AnimalCleanEvent:run(connection: any)` | 49 | ✍ Retrouve le groupe par identifiant dans l'élevage et, s'il possède changeDirt, réduit sa saleté du delta. Rien n'est rediffusé ici. |
