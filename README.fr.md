# Atlas Lua FS25 : référence de l'API Lua de Farming Simulator 25

*[English version: README.md](README.md)* · **Consulter en ligne : https://tim0219800.github.io/fs25-lua-atlas/**

Référence de l'API Lua de Farming Simulator 25 et stubs LuaLS pour l'autocomplétion dans VS Code.
L'atlas est généré à partir des sources Lua fournies dans le SDK du jeu (lues sans être recopiées)
et d'un relevé en jeu des globales réellement disponibles.

**Version du jeu couverte : 1.25.1.0.**

> Projet non officiel, sans lien avec GIANTS Software GmbH ni approuvé par elle. Voir [LEGAL.md](LEGAL.md).

## Contenu
| Dossier | Contenu |
|---|---|
| [`doc/1.25.1.0/index.md`](doc/1.25.1.0/index.md) | Point d'entrée : tous les fichiers de script, regroupés par dossier |
| [`doc/1.25.1.0/evenements.md`](doc/1.25.1.0/evenements.md) | Événements de spécialisation : qui les déclare et combien de fichiers les écoutent |
| [`doc/1.25.1.0/messages.md`](doc/1.25.1.0/messages.md) | `MessageType` : qui publie, qui écoute |
| [`doc/1.25.1.0/globales.md`](doc/1.25.1.0/globales.md) | Globales `g_*` et l'endroit où elles sont affectées |
| [`doc/1.25.1.0/moteur.md`](doc/1.25.1.0/moteur.md) | Fonctions moteur (signatures issues de `scriptBinding.xml`) |
| [`doc/1.25.1.0/releve.md`](doc/1.25.1.0/releve.md) | Relevé en jeu : classes et fonctions présentes en jeu mais absentes des sources du SDK (`Weather`, `Environment`, `FSBaseMission`…) |
| `stubs/1.25.1.0/` | Stubs `---@meta` : `scripts/` (même arborescence que `dataS/scripts`), `moteur.lua`, `releve/` |
| `descriptions/1.25.1.0/` | Descriptions rédigées (JSON, anglais + français), fusionnées par le générateur |
| `outils/` | `extraire.py`, `generer.py`, `verifier_descriptions.py`, `importer_releve.py`, `empaqueter.py`, `mod_releve/` |

### Couverture
| Couche | Contenu |
|---|---|
| Sources du SDK | 961 fichiers, 13 390 fonctions (signatures, types, héritage, renvois `fichier:ligne`) |
| Fonctions moteur | 819 signatures |
| Relevé en jeu | 4 308 globales, dont 2 651 absentes des sources du SDK (noms seulement) |
| Descriptions ✍ | **les 961 fichiers, 13 390 fonctions**, en anglais et en français |

Les descriptions signalent aussi les bugs apparents du jeu repérés en lisant le code (« À noter : … »).
Les pages françaises sont sous `doc/1.25.1.0/fr/` ([site en français](https://tim0219800.github.io/fs25-lua-atlas/1.25.1.0/fr/)).

## Utiliser les stubs dans VS Code
1. Installe l'extension **Lua** (sumneko / LuaLS).
2. Télécharge `stubs-1.25.1.0.zip` depuis la [dernière release](https://github.com/Tim0219800/fs25-lua-atlas/releases/latest), ou clone le dépôt.
3. À la racine de ton mod, crée `.luarc.json` :
```json
{
  "runtime.version": "LuaJIT",
  "workspace.library": ["C:/dev/fs25-lua-atlas/stubs/1.25.1.0"],
  "diagnostics.globals": ["g_currentMission", "g_currentModDirectory", "g_currentModName"]
}
```

## Ce qui est repris, ce qui ne l'est pas
Seuls les **noms, signatures, types, héritages et numéros de ligne** sont extraits.
Aucun corps de fonction, aucun commentaire GIANTS et aucune description de `scriptBinding.xml` ne sont recopiés.
Les textes ✍ sont rédigés pour l'atlas. Les sources du jeu ne sont pas dans ce dépôt : il faut le jeu installé pour régénérer.

## Régénérer
```
python -I outils/extraire.py "<gameSource.zip extrait>/dataS/scripts" "<FS25>/sdk/debugger/scriptBinding.xml" donnees/1.25.1.0/statique.json
python -I outils/importer_releve.py 1.25.1.0 "<profil FS25>/atlas_releve.tsv"
python -I outils/generer.py 1.25.1.0
python -I outils/empaqueter.py 1.25.1.0
```
**Relevé en jeu** : copie `outils/mod_releve/` dans `mods/FS25_atlasReleve/`, active le mod et charge une partie.
Le fichier `atlas_releve.tsv` apparaît dans le dossier du profil (la commande console `atlasReleve` le réécrit). Retire le mod ensuite.
Passage à une nouvelle version du jeu : voir [NOUVELLE_VERSION.md](NOUVELLE_VERSION.md).

## Fiabilité
- **Statique** : fiable pour les fonctions Lua présentes dans le dump du SDK. 9 fichiers n'y contiennent que des signatures, sans corps (signalés ⚠), et certains en-têtes de fichiers (constantes) sont vides.
- **Relevé en jeu** : la bibliothèque `debug` n'existe pas en jeu, donc les classes absentes du SDK n'ont que leurs noms, sans paramètres.
- `scriptBinding.xml` est incomplet : certaines fonctions moteur appelées par le jeu n'y figurent pas.
- Les descriptions indiquent leur niveau de confiance : **NON VÉRIFIÉ** (dépend de code absent du dump), « Signature seule » (fichier sans corps dans le dump), « non vérifié en jeu ».
- Les descriptions ont été rédigées avec l'aide d'une IA à partir des sources du SDK et vérifiées automatiquement (clés, deux langues, aucun texte recopié des sources) ; elles n'ont pas toutes été relues par un humain. Les corrections sont les bienvenues.

## Licence
Textes, doc et stubs : [CC BY 4.0](LICENSE). Outils (`outils/`) : [MIT](LICENSE-tools).
