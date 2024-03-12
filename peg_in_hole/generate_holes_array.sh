#!/bin/bash

SCRIPT_PATH=./src/holes_array.scad
OUTPUT_DIR=./meshes/holes

TOLERANCES=(5 10)
ARRAY_X=1
ARRAY_Y=4
BOX_HEIGHT=50
PEG_DIAMETER=40

for tolerance in "${TOLERANCES[@]}"; do
    echo ">>> INSERTION BOX (HOLES) ${ARRAY_X}x${ARRAY_Y} ARRAY FOR MULTIPLE PRISMS WITH ${tolerance}mm TOLERANCE"
    openscad -D array_x=$ARRAY_X -D array_y=$ARRAY_Y -D box_height=$BOX_HEIGHT -D prism_diameter=$PEG_DIAMETER -D tolerance=$tolerance $SCRIPT_PATH -o ${OUTPUT_DIR}/insertion_box_t${tolerance}mm.stl
done
