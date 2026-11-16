# objects/SunAdmirer.lua

*[English version](../../../scripts/objects/SunAdmirer.md)*

Source: `dataS/scripts/objects/SunAdmirer.lua` — FS25 1.25.1.0

✍ Objet de carte dont le noeud n'est visible que lorsque le soleil est levé et qu'il ne pleut pas. Il s'abonne au message jour/nuit et peut basculer le masque de collision avec la visibilité (attribut utilisateur `switchCollision`).

- **SunAdmirer** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SunAdmirer:onCreate(id: integer)` | 14 | ✍ Callback onCreate de l'i3d : crée l'objet pour le noeud et l'enregistre comme non-updatable dans la mission courante. |
| `SunAdmirer.new(id: integer) → table` | 22 | ✍ Constructeur : lit l'attribut utilisateur `switchCollision` (false par défaut), mémorise le masque de collision d'origine si activé, affiche le noeud et s'abonne à `MessageType.DAY_NIGHT_CHANGED`. À noter : `setVisibility` n'est pas défini dans ce fichier (NON VÉRIFIÉ). |
| `SunAdmirer:delete()` | 41 | ✍ Désabonne cet objet de toutes les souscriptions du centre de messages. |
| `SunAdmirer:onWeatherChanged()` | 55 | ✍ Gestionnaire de message : si l'environnement de la mission existe, la visibilité est vraie seulement si le soleil est levé et que la météo ne signale pas de pluie. Le fonctionnement de la météo est NON VÉRIFIÉ (classe absente du dump). |

## Messages

- s'abonne à `MessageType.DAY_NIGHT_CHANGED` (l.34)
