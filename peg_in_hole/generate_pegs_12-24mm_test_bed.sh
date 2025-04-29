#!/bin/bash

SCRIPT_PATH=./src/pegs_12-24mm_test_bed.scad
OUTPUT_DIR=./meshes/pegs_test_bed
mkdir -p $OUTPUT_DIR

# Function to generate pegs for a given diameter
generate_test_bed() {
    local DIAMETER=$1

    echo ">>> ${DIAMETER}mm DIAMETER PEGS INSERTION ARRAY (TEST BED) WITH MULTIPLE TOLERANCES"
    openscad \
            -D prism_diameter=$DIAMETER \
            $SCRIPT_PATH \
            -o ${OUTPUT_DIR}/pegs_${DIAMETER}mm_test_bed.stl
}

# Call the function for each diameter
generate_test_bed 12 # mm
generate_test_bed 24 # mm
