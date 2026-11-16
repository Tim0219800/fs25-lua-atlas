# objects/NightlightFlicker.lua

*[English version](../../../scripts/objects/NightlightFlicker.md)*

Source: `dataS/scripts/objects/NightlightFlicker.lua` — FS25 1.25.1.0

✍ Updateable attaché à un noeud i3D (via l'attribut utilisateur onCreate) qui fait vaciller une lumière par de brèves extinctions aléatoires. Elle n'est visible que lorsque le soleil est couché ou qu'il pleut, d'après l'état de l'environnement (classes Environment/Weather absentes du dump, NON VÉRIFIÉ). Elle est enregistrée parmi les updateables de la mission.

- **NightlightFlicker** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `NightlightFlicker:onCreate(id: integer)` | 14 | ✍ Hook onCreate d'i3D : crée un NightlightFlicker pour le noeud et l'ajoute aux updateables de la mission. |
| `NightlightFlicker.new(id: integer) → table` | 22 | ✍ Crée le vacillement pour un noeud, le masque au départ et s'abonne à DAY_NIGHT_CHANGED. À noter : l'abonnement utilise le nom mal orthographié oNWeatherChanged au lieu de onWeatherChanged, donc le callback n'est probablement jamais atteint. |
| `NightlightFlicker:update(dt: number)` | 44 | ✍ Tant que la lumière est visible, la masque à intervalles aléatoires (jusqu'à environ 1,5 s) et la réaffiche après une courte durée aléatoire (moins de 200 ms). Sans effet si la lumière n'est pas visible. |
| `NightlightFlicker:onWeatherChanged()` | 68 | ✍ Rend le noeud visible quand le soleil n'est pas levé ou qu'il pleut, sinon le masque. Ignorée si la mission ou l'environnement n'existe pas encore. |

## Messages

- s'abonne à `MessageType.DAY_NIGHT_CHANGED` (l.32)
