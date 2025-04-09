/*
 *  Copyright 2025 AGH Center of Excellence in Artificial Intelligence
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
use<libpeginhole.scad>;
use<libthtcomponent.scad>;
$fs = 0.01;
EPS = 0.001;

box_side = 10;
box_height = 10;
with_peg = true;

pin_vertices = 5;
pin_diameter = box_side / 2;
pin_height = box_height * 2;
pin_is_cylinder = true;


// Parameters for the array
rows = 4; // Number of rows
cols = 4; // Number of columns
spacing = box_side + EPS; // Spacing between blocks

// Define a 2D list of booleans to control the peg usage
peg_array = [
    [true, false, true],  // Row 1
    // [false, true, false], // Row 2
    // [true, false, true]   // Row 3
];
default_peg_value = true;

// Function to safely access peg_array with a fallback
function safe_lookup(array, x, y, default_value) =
    (y < len(array) && x < len(array[y])) ? array[y][x] : default_value;


// Calculate total dimensions of the array
total_width = (cols - 1) * (spacing - EPS);
total_height = (rows - 1) * (spacing - EPS);


// Generate an array of tht_pin_block
// Center the array at (0, 0, 0)
translate([-total_width / 2, -total_height / 2, 0])
for (x = [0:cols-1]) {
    for (y = [0:rows-1]) {
        peg_value = safe_lookup(peg_array, x, y, default_peg_value);
        translate([x * spacing, y * spacing, 0])
        tht_pin_block(block_side = box_side, block_height = box_height, peg=peg_value)
        {
            regular_prism(vertices = pin_vertices, diameter = pin_diameter, height = pin_height, angle_offset = angle_offset(pin_vertices), is_cylinder = pin_is_cylinder);
        };
    }
}
