#!/bin/bash

SCRIPT_PATH=./src/peg.scad
OUTPUT_DIR=./meshes/pegs

VERTICES_LIST=(4 6 8 12)
DIAMETER=40
HEIGHT=100


for vertices in "${VERTICES_LIST[@]}"; do
    echo ">>> UNIFORM ${vertices}-GONAL PRISM"
    openscad -D vertices=$vertices -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/${vertices}gon_peg.stl
done