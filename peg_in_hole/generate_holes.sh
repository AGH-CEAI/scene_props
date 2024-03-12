#!/bin/bash

SCRIPT_PATH=./src/hole.scad
OUTPUT_DIR=./meshes/holes

TOLERANCES=(5 10)
VERTICES_LIST=(4 6 8 12)
BOX_HEIGHT=50
PEG_DIAMETER=40

for tolerance in "${TOLERANCES[@]}"; do

    for vertices in "${VERTICES_LIST[@]}"; do
        echo ">>> INSERTION BOX (HOLE) FOR ${vertices}-GONAL PRISM WITH ${tolerance}mm TOLERANCE"
        openscad -D vertices=$vertices -D box_height=$BOX_HEIGHT -D prism_diameter=$PEG_DIAMETER $SCRIPT_PATH -o ${OUTPUT_DIR}/${vertices}gon_box_t${tolerance}mm.stl
    done

done