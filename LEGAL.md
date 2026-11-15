# Legal status

*[Version française : LEGAL.fr.md](LEGAL.fr.md)*

> Analysis by the repository author, 2026-11-15. This is not professional legal advice.

## What GIANTS Software's terms say
Source: [GIANTS Terms and Conditions](https://www.farming-simulator.com/termsAndConditions.php) ("Issued: October 2016", read on 2026-11-15).
- §3.2: basic, non-transferable license for private use.
- §3.4: editing, decompiling, disassembling and reverse engineering the games are prohibited, as is passing them on to third parties.
- §6.8: taking parts from the games is prohibited.

No separate FS25 EULA was found online. The SDK / GDN terms (if any) have not been reviewed: NOT VERIFIED.

## Why this repository stays outside those prohibitions
- **No decompilation.** The Lua sources that were read are the ones GIANTS ships in plain text with the game's SDK
  (`sdk/debugger/gameSource.zip`, meant for debugging mods). The `.gar` archives were never extracted
  and no third-party decompiler was used.
- **The in-game scan is an ordinary Lua mod.** It lists the names of the globals any mod can access,
  using standard script functions, without touching game files or memory.
- **No part of the game is published.** The repository contains no source file, no function body, no GIANTS comment,
  no `scriptBinding.xml` text, no graphics or sound asset. It only contains:
  - names, signatures, types and `file:line` references: functional facts needed to write compatible mods,
    of the same kind as what the official GDN LUADOC publishes;
  - texts written for the atlas (✍ descriptions) and original tools.
- Raw extraction data (`donnees/`) is excluded from the repository and from releases (`.gitignore`).

## Residual risk
GIANTS marks its sources "Confidential". A strict reading could consider the list of internal names,
especially `stubs/*/releve/`, as confidential information. **If GIANTS Software asks for it, the content
concerned will be removed immediately.** Contact: open an issue on this repository.

## Trademarks
Farming Simulator, GIANTS and GIANTS Software are trademarks of GIANTS Software GmbH.
Unofficial project, not affiliated with or endorsed by GIANTS Software GmbH.
