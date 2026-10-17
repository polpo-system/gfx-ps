# gfx-ps

GfxPS for [polpo](https://github.com/polpo-system/polpo): PostScript output of Gfx (the package gfx):
what a program draws with Gfx goes into a PostScript or EPS file, level 1 or 2. Leonardo prints and
exports with it.

```
portia.Install gfx-ps
```

## What is here

    src/OLR.GfxPS.Mod        the PostScript context
    share/GfxProlog.ps       the prolog written at the start of every file
    test/GfxPSTest.Mod

The source comes from ETH Linux Oberon (OLR, 2017-06-18), converted from an Oberon text to plain
text; the first commit has it unchanged. It compiles unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS).

## Tests

    GfxPSTest.Run      2 checks: a rectangle drawn into a PostScript file, the file written; it
                       needs the desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
