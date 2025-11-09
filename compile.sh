#!/usr/bin/env bash

if [ "${1:-}" = "" ]; then
  printf "Usage: %s <gamemodes/file.pwn|filterscripts/file.pwn|file.inc>\n" "$0"
  exit 1
fi

SRC="$1"
if [ ! -f "$SRC" ]; then
  printf "File not found: %s\n" "$SRC"
  exit 2
fi

WORKDIR="$(pwd)"
COMP="$WORKDIR/pawn-compiler/pawncc"
if [ ! -x "$COMP" ]; then
  printf "Compiler not found or not executable: %s\n" "$COMP"
  exit 3
fi

DIR="$(cd "$(dirname "$SRC")" && pwd)"
BASENAME="$(basename "$SRC")"
NAME="${BASENAME%.*}"
ABS="$DIR/$BASENAME"
OUT="$DIR/$NAME.amx"

# Tambah folder pawn-compiler ke LD_LIBRARY_PATH tanpa menghasilkan leading colon
if [ -z "${LD_LIBRARY_PATH:-}" ]; then
  export LD_LIBRARY_PATH="$WORKDIR/pawn-compiler"
else
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$WORKDIR/pawn-compiler"
fi

printf "Compiling %s...\n" "$ABS"
"$COMP" "$ABS" "-D$DIR" "-i${WORKDIR}/include" "-;+" "-(+" "-Z+" "-d3" "-o$OUT"

printf "Done: %s\n" "$OUT"
