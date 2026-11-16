# triggers/FillTrigger.lua

*[English version](../../../scripts/triggers/FillTrigger.md)*

Source: `dataS/scripts/triggers/FillTrigger.lua` — FS25 1.25.1.0

✍ Trigger de remplissage de type station-service : quand le noeud d'une unité de remplissage d'un véhicule entre dans le trigger, le véhicule l'enregistre comme trigger d'unité de remplissage et peut alors être rempli, soit depuis l'unité d'un objet source, soit, sans source, en payant le prix du litre de l'économie. Le type par défaut est le diesel. Des méthodes comme getCurrentFillType et setMoneyChangeType sont appelées mais non définies dans ce fichier (NON VÉRIFIÉ, probablement dans du code absent).

- **FillTrigger** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillTrigger:onCreate(id: integer)` | 13 | ✍ Point d'entrée au chargement de la carte pour un noeud trigger placé dans l'i3d : construit un FillTrigger, enregistre un nouveau type d'argent "other" libellé finance_purchaseFuel, l'assigne et ajoute le trigger aux objets non mis à jour de la mission. |
| `FillTrigger.new(id: integer, sourceObject: table, fillUnitIndex: integer, fillLitersPerSecond: table?, defaultFillType: any, customMt: table?) → table` | 28 | ✍ Crée le trigger sur le noeud donné, ajoute le callback physique `fillTriggerCallback` et crée un noeud sonore à la position du trigger. Mémorise l'objet source, l'index d'unité et le débit en litres par seconde optionnels ; le type commence à diesel et le trigger est actif. |
| `FillTrigger:delete()` | 67 | ✍ Retire ce trigger de chaque véhicule encore dedans, supprime l'échantillon sonore et retire le trigger physique. À noter : `self.sample` n'est jamais affecté dans ce fichier, la suppression dépend donc de code extérieur. |
| `FillTrigger:onVehicleDeleted(vehicle: table)` | 85 | ✍ Oublie un véhicule supprimé alors qu'il était dans le trigger et vide l'affichage de variation d'argent en attente pour sa ferme active, si un type d'argent est défini. |
| `FillTrigger:fillVehicle(vehicle: table, delta: number, dt: any) → number` | 98 | ✍ Transfère jusqu'à delta litres dans le véhicule, plafonné par le débit en litres par seconde multiplié par dt (ms), le niveau de la source et l'accès de la ferme. Prélève sur l'unité source, ou sans source facture la ferme au prix du litre du type. Retourne la quantité réellement ajoutée. |
| `FillTrigger:getIsActivatable(vehicle: table) → boolean` | 156 | ✍ Retourne true seulement si un objet source existe, que son unité n'est pas vide et que la ferme active du véhicule peut y accéder ; un trigger sans source n'est jamais activable ici. |
| `FillTrigger:fillTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 173 | ✍ Callback physique qui ne traite que l'entrée et la sortie. À l'entrée, il cherche l'unité de remplissage du véhicule pour le noeud et, si elle accepte le type courant, compte le noeud et appelle addFillUnitTrigger à la première entrée. À la dernière sortie, il appelle removeFillUnitTrigger et vide l'affichage d'argent. |
