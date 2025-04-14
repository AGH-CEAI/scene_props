#!/bin/bash

SCRIPT_PATH=./src/tht_hole.scad
OUTPUT_DIR=./meshes/tht_holes
mkdir -p $OUTPUT_DIR

# Parameters for the THT hole
BLOCK_SIDE=12
BLOCK_HEIGHT=15
PIN_DIAMETER=6
PIN_HEIGHT=10
DEFAULT_PIN=true
TOLERANCE=2.0

# Function to generate THT holes
generate_tht_hole() {
    local COLS=$1
    local ROWS=$2
    local INVERTED_PINS=$3
    local NAME_SUFFIX=$4

    echo ">>> GENERATING THT-HOLE ${COLS}x${ROWS}${NAME_SUFFIX}"
    openscad \
        -D block_side=$BLOCK_SIDE \
        -D block_height=$BLOCK_HEIGHT \
        -D pin_diameter=$PIN_DIAMETER \
        -D pin_height=$PIN_HEIGHT \
        -D cols=$COLS \
        -D rows=$ROWS \
        -D default_pin=$DEFAULT_PIN \
        -D tolerance=$TOLERANCE \
        -D inverted_pins="$INVERTED_PINS" \
        $SCRIPT_PATH \
        -o ${OUTPUT_DIR}/tht_hole_${COLS}x${ROWS}${NAME_SUFFIX}.stl
}

# ------------------------------------------- #
# ------------ Generate THT Holes ------------ #
# ------------------------------------------- #

# THT 2x2, all holes
generate_tht_hole 2 2 "[]" ""

# THT 2x3, all holes
generate_tht_hole 2 3 "[]" ""

# THT 2x3, missing holes
generate_tht_hole 2 3 "[[0,0],[1,1]]" "_asymetric"
