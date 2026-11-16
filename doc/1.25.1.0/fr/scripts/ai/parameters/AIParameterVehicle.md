# ai/parameters/AIParameterVehicle.lua

*[English version](../../../../scripts/ai/parameters/AIParameterVehicle.md)*

Source: `dataS/scripts/ai/parameters/AIParameterVehicle.lua` — FS25 1.25.1.0

✍ Paramètre de job IA qui référence un véhicule par son identifiant d'objet réseau. Il s'affiche sous forme du nom du véhicule et ne peut pas être modifié par le joueur. Il est sauvegardé par identifiant unique du véhicule et vérifie que le véhicule existe et, par défaut, gère les cibles IA.

- **AIParameterVehicle** hérite de `AIParameter` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterVehicle.new(customMt: any)` | 16 | ✍ Crée le paramètre de type TEXT, sans véhicule sélectionné. |
| `AIParameterVehicle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 27 | ✍ Écrit l'identifiant unique du véhicule dans `#vehicleUniqueId` lorsqu'un véhicule est résolu. Sinon rien n'est écrit. |
| `AIParameterVehicle:readStream(streamId: any, connection: any)` | 36 | ✍ Lit un indicateur de présence puis, s'il est actif, l'identifiant d'objet réseau du véhicule. |
| `AIParameterVehicle:writeStream(streamId: any, connection: any)` | 44 | ✍ Écrit un indicateur de présence puis, si un véhicule est défini, son identifiant d'objet réseau. |
| `AIParameterVehicle:getCanBeChanged()` | 52 | ✍ Retourne toujours false : le joueur ne peut pas modifier ce paramètre dans l'interface. |
| `AIParameterVehicle:getString()` | 58 | ✍ Retourne le nom du véhicule pour l'affichage, ou une chaîne vide s'il est introuvable. |
| `AIParameterVehicle:setVehicle(vehicle: any)` | 69 | ✍ Stocke l'identifiant d'objet réseau du véhicule donné. |
| `AIParameterVehicle:getVehicle()` | 75 | ✍ Résout l'identifiant stocké en véhicule et ne le retourne que s'il est synchronisé, sinon nil. |
| `AIParameterVehicle:validate(needsAITarget: any)` | 86 | ✍ Échoue si aucun véhicule n'est défini ou s'il n'existe plus. Sauf si l'argument vaut false, exige aussi que le véhicule possède `setAITarget`. Retourne un booléen et une erreur localisée. |
