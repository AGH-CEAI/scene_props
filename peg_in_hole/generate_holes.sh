#!/bin/bash

SCRIPT_PATH=./src/holes_array.scad
OUTPUT_DIR=./meshes

ARRAY_X=1
ARRAY_Y=4
BOX_HEIGHT=50
PEG_DIAMETER=40
TOLERANCES=$(seq 5 10)

for tolerance in $TOLERANCES; do
    openscad -D array_x=$ARRAY_X -D array_y=$ARRAY_Y -D box_height=$BOX_HEIGHT -D prism_diameter=$PEG_DIAMETER -D tolerance=$tolerance $SCRIPT_PATH -o ${OUTPUT_DIR}/insertion_box_t${tolerance}mm.stl
done
