#!/bin/bash

SCRIPT_PATH=./src/peg.scad
OUTPUT_DIR=./meshes
DIAMETER=40
HEIGHT=100

openscad -D vertices=4 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/square_peg.stl
openscad -D vertices=6 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/hexagon_peg.stl
openscad -D vertices=8 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/octagon_peg.stl
openscad -D vertices=12 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/dodecagon_peg.stl
