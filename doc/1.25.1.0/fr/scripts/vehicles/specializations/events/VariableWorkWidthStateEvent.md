# vehicles/specializations/events/VariableWorkWidthStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/VariableWorkWidthStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VariableWorkWidthStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise les sections de largeur de travail gauche et droite actives d'un véhicule (spécialisation VariableWorkWidth). Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **VariableWorkWidthStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VariableWorkWidthStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `VariableWorkWidthStateEvent.new(vehicle: table, leftSide: integer, rightSide: integer)` | 24 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et deux valeurs de sections (gauche, droite) sur VariableWorkWidth.SEND_NUM_BITS bits chacune) ; elles sont conservées sur l'instance pour `writeStream`. |
| `VariableWorkWidthStateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit un objet nœud et deux valeurs de sections (gauche, droite) sur VariableWorkWidth.SEND_NUM_BITS bits chacune depuis le flux, puis appelle `run(connection)`. |
| `VariableWorkWidthStateEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit un objet nœud et deux valeurs de sections (gauche, droite) sur VariableWorkWidth.SEND_NUM_BITS bits chacune dans le flux (même ordre que `readStream`). |
| `VariableWorkWidthStateEvent:run(connection: Connection)` | 56 | ✍ Applique l'événement côté récepteur : appelle `setSectionsActive(gauche, droite, true)` sur le véhicule s'il est synchronisé, puis le serveur retransmet. À noter : la retransmission passe `self.object`, jamais défini (l'événement utilise `self.vehicle`), donc nil. |
| `VariableWorkWidthStateEvent.sendEvent(vehicle: table, leftSide: integer, rightSide: integer, noEventSend: boolean)` | 72 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |
