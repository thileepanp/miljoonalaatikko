#!/bin/bash

# A phony executable for the exercises :)

usage="Usage: bash myexe.sh INPUT"


# Check that the first argument $1 points (1) to a regular file, and
# (2) the file name contains '_in'

[[ -f "$1" ]] && [[ "$1" =~ _in ]] || {
    echo "$usage" >&2
    exit 1
}


# Output file name is computed from the input file name, by replacing
# '_in' in the filename with '_out'

ifile="$1"
ofile="${1/_in/_out}"


# Random number from 3 to 5

workhard=$(( 3 + (RANDOM * 3) / 32767))


# Pretend to $workhard seconds
sleep $workhard


# Copy input file to output file
cp "$ifile" "$ofile"
echo "Slept for $workhard seconds" >> "$ofile"
