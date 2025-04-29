#!/bin/bash

SCRIPT_PATH=./src/tht_test_bed.scad
OUTPUT_DIR=./meshes/tht_test_bed
mkdir -p $OUTPUT_DIR

echo ">>> THT INSERTION ARRAY (TEST BED) WITH MULTIPLE TOLERANCES"
openscad $SCRIPT_PATH -o ${OUTPUT_DIR}/tht_test_bed.stl
