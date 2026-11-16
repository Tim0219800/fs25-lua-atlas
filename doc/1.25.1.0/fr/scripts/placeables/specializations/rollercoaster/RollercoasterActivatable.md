# placeables/specializations/rollercoaster/RollercoasterActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/rollercoaster/RollercoasterActivatable.md)*

Source: `dataS/scripts/placeables/specializations/rollercoaster/RollercoasterActivatable.lua` — FS25 1.25.1.0

✍ Objet activable qui permet au joueur local de monter dans une montagne russe : il affiche le texte d'action traduit et, quand il est déclenché, envoie un événement de demande au serveur. Il n'a pas de classe parente et s'appuie sur `getCanEnter` et `getFreeSeatIndex` de la montagne russe.

- **RollercoasterActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RollercoasterActivatable.new(rollercoaster: table)` | 16 | ✍ Crée l'activable pour une montagne russe et charge le texte `action_rideRollercoaster` comme texte d'activation. |
| `RollercoasterActivatable:getIsActivatable()` | 27 | ✍ Indique si la montagne russe accepte actuellement un nouveau passager, via son `getCanEnter`. |
| `RollercoasterActivatable:run()` | 33 | ✍ Si l'entrée est permise et qu'un siège est libre, envoie un RollercoasterPassengerEnterRequestEvent pour `g_localPlayer` à la connexion serveur. L'index de siège n'est vérifié que localement ; le serveur choisit le siège final. |
