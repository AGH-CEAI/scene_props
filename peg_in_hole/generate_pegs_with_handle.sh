#!/bin/bash

SCRIPT_PATH=./src/peg_with_handle.scad
OUTPUT_DIR=./meshes/pegs_with_handle

VERTICES_LIST=(3 4 5 6 7 8 9 10 11 12)
HANDLE_DIAMETER=20
HANDLE_HEIGHT=20
DIAMETER=60
HEIGHT=50


for vertices in "${VERTICES_LIST[@]}"; do
    mkdir -p $OUTPUT_DIR
    echo ">>> UNIFORM ${vertices}-GONAL PRISM WITH HANDLE"
    openscad -D handle_diameter=$HANDLE_DIAMETER -D handle_height=$HANDLE_HEIGHT -D vertices=$vertices -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/${vertices}gon_peg.stl
done

# Cylinder
echo ">>> UNIFORM CYLINDER PRISM WITH HANDLE"
openscad -D handle_diameter=$HANDLE_DIAMETER -D handle_height=$HANDLE_HEIGHT -D vertices=$vertices -D diameter=$DIAMETER -D height=$HEIGHT -D is_cylinder=true $SCRIPT_PATH -o ${OUTPUT_DIR}/cylinder_peg.stl
