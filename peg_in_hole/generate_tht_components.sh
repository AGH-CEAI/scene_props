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

# ------------------------------------------- #
# ------------ THT 2x2, all pins ------------ #
# ------------------------------------------- #
COLS=2
ROWS=2
INVERTED_PINS="[]"
NAME_SUFFIX=""

echo ">>> DUMMY THT-COMPONENT ${COLS}x${ROWS}"
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

# ------------------------------------------- #
# ------------ THT 2x3, all pins ------------ #
# ------------------------------------------- #
COLS=2
ROWS=3
INVERTED_PINS="[]"
NAME_SUFFIX=""

echo ">>> DUMMY THT-COMPONENT ${COLS}x${ROWS}"
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

# ------------------------------------------- #
# ---------- THT 2x3, missing pins ---------- #
# ------------------------------------------- #
COLS=2
ROWS=3
INVERTED_PINS="[[0,0],[1,1]]"
NAME_SUFFIX="_missing_pins"

echo ">>> DUMMY THT-COMPONENT ${COLS}x${ROWS}"
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
