# animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua

*[English version](../../../../scripts/animals/events/AnimalHusbandryNoMorePalletSpaceEvent.md)*

Source: `dataS/scripts/animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua` — FS25 1.25.1.0

✍ Événement réseau serveur vers client qui indique aux clients qu'un élevage n'a pas pu faire apparaître une palette faute de place. Côté client, il fait afficher à l'élevage l'avertissement de palette bloquée pour le type de remplissage donné.

- **AnimalHusbandryNoMorePalletSpaceEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalHusbandryNoMorePalletSpaceEvent.emptyNew() → table` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `AnimalHusbandryNoMorePalletSpaceEvent.new(animalHusbandry: table, fillTypeIndex: integer) → AnimalHusbandryNoMorePalletSpaceEvent` | 22 | ✍ Crée l'événement pour un élevage et un indice de type de remplissage. |
| `AnimalHusbandryNoMorePalletSpaceEvent:readStream(streamId: integer, connection: table)` | 36 | ✍ Lit l'élevage et le type de remplissage (FillTypeManager.SEND_NUM_BITS bits), puis exécute l'événement. |
| `AnimalHusbandryNoMorePalletSpaceEvent:writeStream(streamId: integer, connection: table)` | 47 | ✍ Écrit l'élevage et l'indice du type de remplissage dans le flux. |
| `AnimalHusbandryNoMorePalletSpaceEvent:run(connection: table)` | 55 | ✍ Seulement à la réception depuis le serveur (côté client) : appelle showPalletBlockedWarning sur l'élevage avec le type de remplissage, si l'élevage existe. |
