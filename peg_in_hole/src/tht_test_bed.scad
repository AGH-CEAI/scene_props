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
use<libpeginhole.scad>
use<libthtcomponent.scad>
$fa = 1;
$fs = 0.01;
EPS = 0.001;

// Parameters for the THT component
block_side = 12;
block_height = 15;
rotation = [ 0, 0, 0 ];  // in degs

// Parameters for the THT's pins
pin_vertices = 0.5; // for cylinder case
pin_diameter = 6;
pin_is_cylinder = true;

cols = 2; // Number of columns (x)
rows = 3; // Number of rows (y)
default_pin = true;

// Hole paramaeters
tolerance = 2.0;
height = 10;
pin_height = height;
component_z_offset = block_height / 2 + pin_height / 2 + EPS;

max_cols = 4;
max_rows = 4;
// Box parameters
slot_size = max(block_side * max_cols, block_side * max_rows);

module tht_block_1(tolerance)
{
	cols = 2; // Number of columns (x)
	rows = 3; // Number of rows (y)
	// Pairs of x (col) and y (row)
	inverted_pins = [
		[0, 0],
		[1, 1],
	];

	translate([0, 0, component_z_offset])
	tht_component(block_side = block_side,
				block_height = block_height,
				cols = cols,
				rows = rows,
				inverted_positions = inverted_pins,
				default_pin = default_pin) {
		regular_prism(vertices = pin_vertices,
					diameter = hole_diameter(pin_diameter, pin_vertices, tolerance),
					height = height * 2 + EPS,
					angle_offset = angle_offset(pin_vertices),
					is_cylinder = pin_is_cylinder);
	};
};

module tht_block_2(tolerance)
{
	cols = 2; // Number of columns (x)
	rows = 3; // Number of rows (y)
	// Pairs of x (col) and y (row)
	inverted_pins = [];

	translate([0, 0, component_z_offset])
	tht_component(block_side = block_side,
				block_height = block_height,
				cols = cols,
				rows = rows,
				inverted_positions = inverted_pins,
				default_pin = default_pin) {
		regular_prism(vertices = pin_vertices,
					diameter = hole_diameter(pin_diameter, pin_vertices, tolerance),
					height = height * 2 + EPS,
					angle_offset = angle_offset(pin_vertices),
					is_cylinder = pin_is_cylinder);
	};
};

module tht_block_3(tolerance)
{
	cols = 2; // Number of columns (x)
	rows = 2; // Number of rows (y)
	// Pairs of x (col) and y (row)
	inverted_pins = [];

	translate([0, 0, component_z_offset])
	tht_component(block_side = block_side,
				block_height = block_height,
				cols = cols,
				rows = rows,
				inverted_positions = inverted_pins,
				default_pin = default_pin) {
		regular_prism(vertices = pin_vertices,
					diameter = hole_diameter(pin_diameter, pin_vertices, tolerance),
					height = height * 2 + EPS,
					angle_offset = angle_offset(pin_vertices),
					is_cylinder = pin_is_cylinder);
	};
};


array_x = 3;
array_y = 3;

tolerances = [0.5, 1, 1.5]; // mm

difference(){
	rotate(rotation)
	multiple_insertion_box(slot_size = slot_size,
						   array_size = [ array_x, array_y ],
						   height = height)
	{
		tht_block_1(tolerance=tolerances[0]);
		tht_block_2(tolerance=tolerances[0]);
		tht_block_3(tolerance=tolerances[0]);
		tht_block_1(tolerance=tolerances[1]);
		tht_block_2(tolerance=tolerances[1]);
		tht_block_3(tolerance=tolerances[1]);
		tht_block_1(tolerance=tolerances[2]);
		tht_block_2(tolerance=tolerances[2]);
		tht_block_3(tolerance=tolerances[2]);
	};
};
