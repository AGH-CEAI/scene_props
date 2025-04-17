#!/bin/bash

SCRIPT_PATH=./src/peg_with_handle.scad
OUTPUT_DIR=./meshes/pegs_with_handle

VERTICES_LIST=(3 4 5 6 7 8 9 10 11 12)
HANDLE_DIAMETER=10
HANDLE_HEIGHT=15
HEIGHT=12


# Function to generate pegs for a given diameter
generate_pegs_with_handle() {
    local DIAMETER=$1
    mkdir -p $OUTPUT_DIR/${DIAMETER}mm_diameter

    for vertices in "${VERTICES_LIST[@]}"; do
        echo ">>> UNIFORM ${vertices}-GONAL PRISM WITH HANDLE"
        openscad -D handle_diameter=$HANDLE_DIAMETER \
                 -D handle_height=$HANDLE_HEIGHT \
                 -D vertices=$vertices \
                 -D diameter=$DIAMETER \
                 -D height=$HEIGHT \
                 $SCRIPT_PATH \
                 -o ${OUTPUT_DIR}/${DIAMETER}mm_diameter/${vertices}gon_peg.stl
    done

    # Generate a cylinder
    echo ">>> UNIFORM CYLINDER PRISM WITH HANDLE"
    openscad -D handle_diameter=$HANDLE_DIAMETER \
             -D handle_height=$HANDLE_HEIGHT \
             -D vertices=$vertices \
             -D diameter=$DIAMETER \
             -D height=$HEIGHT \
             -D is_cylinder=true \
             $SCRIPT_PATH \
             -o ${OUTPUT_DIR}/${DIAMETER}mm_diameter/cylinder_peg.stl
}

# Call the function for each diameter
generate_pegs_with_handle 12 # mm
generate_pegs_with_handle 24 # mm
