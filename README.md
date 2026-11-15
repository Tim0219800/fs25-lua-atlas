# FS25 Lua Atlas: Farming Simulator 25 Lua API reference

*[Version française : README.fr.md](README.fr.md)* · **Browse online: https://tim0219800.github.io/fs25-lua-atlas/**

A detailed reference of the Farming Simulator 25 Lua API, plus LuaLS stubs for autocompletion in VS Code.
It is generated from the Lua sources shipped with the game's SDK (read, never copied) and from an in-game scan
of the globals that actually exist at runtime.

**Game version covered: 1.25.1.0.**

> Unofficial project, not affiliated with or endorsed by GIANTS Software GmbH. See [LEGAL.md](LEGAL.md).
> The written descriptions are in **French**; signatures, types, events and stubs are language-neutral.

## What's inside
| Folder | Content |
|---|---|
| [`doc/1.25.1.0/index.md`](doc/1.25.1.0/index.md) | Entry point: every script file, grouped by folder |
| [`doc/1.25.1.0/evenements.md`](doc/1.25.1.0/evenements.md) | Specialization events: who declares them, how many files listen |
| [`doc/1.25.1.0/messages.md`](doc/1.25.1.0/messages.md) | `MessageType`: publishers and subscribers |
| [`doc/1.25.1.0/globales.md`](doc/1.25.1.0/globales.md) | `g_*` globals and where they are assigned |
| [`doc/1.25.1.0/moteur.md`](doc/1.25.1.0/moteur.md) | Engine functions (signatures from `scriptBinding.xml`) |
| [`doc/1.25.1.0/releve.md`](doc/1.25.1.0/releve.md) | In-game scan: classes and functions present at runtime but missing from the SDK sources (`Weather`, `Environment`, `FSBaseMission`…) |
| `stubs/1.25.1.0/` | `---@meta` stubs: `scripts/` (same tree as `dataS/scripts`), `moteur.lua`, `releve/` |
| `descriptions/1.25.1.0/` | Hand-written descriptions (JSON, French), merged by the generator |
| `outils/` | `extraire.py`, `generer.py`, `importer_releve.py`, `empaqueter.py`, `mod_releve/` |

### Coverage
| Layer | Content |
|---|---|
| SDK sources | 961 files, 13,390 functions (signatures, types, inheritance, `file:line` references) |
| Engine functions | 819 signatures |
| In-game scan | 4,308 globals, 2,651 of them missing from the SDK sources (names only) |
| Written descriptions ✍ | 35 files, 1,325 functions: effects, particles, wheels, weather and wetness, motor, lights, soil-working and harvesting tools |

Descriptions were written first for the visual-effect and environment systems.
They also point out apparent game bugs spotted while reading the code ("à noter…").

## Using the stubs in VS Code
1. Install the **Lua** extension (sumneko / LuaLS).
2. Download `stubs-1.25.1.0.zip` from the [latest release](https://github.com/Tim0219800/fs25-lua-atlas/releases/latest), or clone this repository.
3. At the root of your mod, create `.luarc.json`:
```json
{
  "runtime.version": "LuaJIT",
  "workspace.library": ["C:/dev/fs25-lua-atlas/stubs/1.25.1.0"],
  "diagnostics.globals": ["g_currentMission", "g_currentModDirectory", "g_currentModName"]
}
```

## What is extracted, and what is not
Only **names, signatures, types, inheritance and line numbers** are extracted.
No function body, no GIANTS comment and no `scriptBinding.xml` description is copied.
The ✍ texts are written for the atlas. The game sources are not in this repository: regenerating requires the game.

## Regenerating
```
python -I outils/extraire.py "<extracted gameSource.zip>/dataS/scripts" "<FS25>/sdk/debugger/scriptBinding.xml" donnees/1.25.1.0/statique.json
python -I outils/importer_releve.py 1.25.1.0 "<FS25 profile>/atlas_releve.tsv"
python -I outils/generer.py 1.25.1.0
python -I outils/empaqueter.py 1.25.1.0
```
**In-game scan**: copy `outils/mod_releve/` to `mods/FS25_atlasReleve/`, enable the mod and load a savegame.
`atlas_releve.tsv` appears in the profile folder (console command `atlasReleve` rewrites it). It changes nothing in the game. Remove the mod afterwards.
Moving to a new game version: see [NOUVELLE_VERSION.md](NOUVELLE_VERSION.md) (French).

## Reliability
- **Static**: reliable for the Lua functions present in the SDK dump. 9 files only contain signatures, without bodies (flagged ⚠), and some file headers (constants) are empty.
- **In-game scan**: the `debug` library is not available in game, so classes missing from the SDK only have their names, without parameters.
- `scriptBinding.xml` is incomplete: some engine functions called by the game are not listed.
- Descriptions state their confidence level: **NON VÉRIFIÉ** (depends on missing code), « non relu » (skimmed), « non vérifié en jeu » (read in code, not tested in game).

## License
Texts, docs and stubs: [CC BY 4.0](LICENSE). Tools (`outils/`): [MIT](LICENSE-tools).
