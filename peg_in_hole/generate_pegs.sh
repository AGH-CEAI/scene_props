#!/bin/bash

SCRIPT_PATH=./src/peg.scad
OUTPUT_DIR=./meshes
DIAMETER=40
HEIGHT=100

openscad -D vertices=3 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/traingle_peg.stl
openscad -D vertices=4 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/square_peg.stl
openscad -D vertices=5 -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/pentagon_peg.stl
openscad -D is_cylinder=true -D diameter=$DIAMETER -D height=$HEIGHT $SCRIPT_PATH -o ${OUTPUT_DIR}/cirlce_peg.stl
