#!/bin/bash
# Difference bitween $@ and $*.
# "$@" treats each argument separately (preserving spaces).
echo 'Using $@:'
for arg in "$@"; do
  echo "$arg"
done
# "$*" treats all arguments as a single string.
echo 'Using $*:'
for arg in "$*"; do
  echo "$arg"
done
# For best practice, use "$@" when passing arguments to another command or script to preserve individual arguments correctly.

# ./args.sh sindu 1 siva1 priya