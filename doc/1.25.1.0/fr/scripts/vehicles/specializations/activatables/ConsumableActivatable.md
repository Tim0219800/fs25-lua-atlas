# vehicles/specializations/activatables/ConsumableActivatable.lua

*[English version](../../../../../scripts/vehicles/specializations/activatables/ConsumableActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/ConsumableActivatable.lua` — FS25 1.25.1.0

✍ Objet activable utilisé par la spécialisation Consumable pour laisser le joueur choisir une variante de consommable pour un emplacement vide d'un véhicule. Il lit `spec_consumable.types`, interroge g_consumableManager pour les variantes disponibles et affiche un OptionDialog. Le choix est envoyé au serveur par ConsumableRefillEvent. La table `TYPE_TEXTS` qu'il utilise n'est pas définie dans ce fichier (définition NON VÉRIFIÉE).

- **ConsumableActivatable** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConsumableActivatable.new(vehicle: any)` | 23 | ✍ Crée l'activable pour le véhicule donné avec un texte d'activation vide. |
| `ConsumableActivatable:getIsActivatable()` | 35 | ✍ Retourne true si le véhicule est actif pour l'entrée et qu'au moins un type de consommable a un niveau consommé de 0 (à recharger). |
| `ConsumableActivatable:run()` | 50 | ✍ Pour chaque type de consommable vide, récupère ses variantes et ouvre une boîte de choix ; la variante retenue est envoyée via ConsumableRefillEvent. À noter : avec plusieurs types vides, une boîte par type est ouverte dans le même appel. |
| `ConsumableActivatable:updateActivateText()` | 73 | ✍ Définit le texte d'activation sur le libellé localisé d'un type de consommable vide ; s'il y en a plusieurs, c'est le dernier qui l'emporte. |
