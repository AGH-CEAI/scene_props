#!/bin/bash

SCRIPT_PATH=./src/tht_component.scad
OUTPUT_DIR=./meshes/tht_components
mkdir -p $OUTPUT_DIR

# Single block with pin
BLOCK_SIDE=12
BLOCK_HEIGHT=15
PIN_DIAMETER=6
PIN_HEIGHT=12
DEFAULT_PIN=true

# Function to generate THT components
generate_tht_component() {
    local COLS=$1
    local ROWS=$2
    local INVERTED_PINS=$3
    local NAME_SUFFIX=$4

    echo ">>> GENERATING THT-COMPONENT ${COLS}x${ROWS}${NAME_SUFFIX}"
    openscad \
            -D block_side=$BLOCK_SIDE \
            -D block_height=$BLOCK_HEIGHT \
            -D pin_diameter=$PIN_DIAMETER \
            -D pin_height=$PIN_HEIGHT \
            -D cols=$COLS \
            -D rows=$ROWS \
            -D default_pin=$DEFAULT_PIN \
            -D inverted_pins="$INVERTED_PINS" \
            $SCRIPT_PATH \
            -o ${OUTPUT_DIR}/tht_${COLS}x${ROWS}${NAME_SUFFIX}.stl
}

# ------------------------------------------- #
# ------------ Generate Components ----------- #
# ------------------------------------------- #

# THT 2x2, all pins
generate_tht_component 2 2 "[]" ""

# THT 2x3, all pins
generate_tht_component 2 3 "[]" ""

# THT 2x3, missing pins
generate_tht_component 2 3 "[[0,0],[1,1]]" "_asymetric"
