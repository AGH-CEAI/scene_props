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

// Parameters for the THT component
block_side = 10;
block_height = 10;

// Parameters for the THT's pins
pin_vertices = 5;
pin_diameter = block_side / 2;
pin_height = block_height * 2;
pin_is_cylinder = true;

cols = 4; // Number of columns (x)
rows = 3; // Number of rows (y)
default_pin = true;

// Pairs of x (col) and y (row)
inverted_pins = [
    [0, 0],
    [2, 0],
    [0, 2],
    [2, 2],
];

tht_component(block_side = block_side,
              block_height = block_height,
              cols = cols,
              rows = rows,
              inverted_positions = inverted_pins,
              default_pin = default_pin) {
    regular_prism(vertices = pin_vertices,
                  diameter = pin_diameter,
                  height = pin_height,
                  angle_offset = angle_offset(pin_vertices),
                  is_cylinder = pin_is_cylinder);
};
