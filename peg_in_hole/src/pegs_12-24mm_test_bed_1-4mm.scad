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
EPS = 0.01;
CYLINDER_VERTICES = cylinder_vertices();

// Pegs
vertices = [CYLINDER_VERTICES, 3, 4, 6, 8, 12 ];
tolerances = [1.0, 2.0, 4.0]; // mm
prism_diameter = 12; // diameter 12mm, 24mm
height = 10 + EPS;
rotation = [ 0, 0, 0 ]; // in degs

// Holes array
array_x = len(vertices);
array_y = len(tolerances);
box_height = 10;
slot_size = 1.25 * (prism_diameter + max(tolerances));

module make_regular_prism(vertices, tolerance){
	regular_prism(vertices = vertices,
				diameter = hole_diameter(prism_diameter, vertices, tolerance),
				height = height,
				angle_offset = angle_offset(vertices));
}

rotate(rotation)
multiple_insertion_box(slot_size = slot_size,
					array_size = [ array_x, array_y ],
                    height = box_height)
{
	// For loops doesn't create multiple children in OpenSCAD
	// so we need to create them manually

	make_regular_prism(vertices = vertices[0], tolerance = tolerances[0]);
	make_regular_prism(vertices = vertices[1], tolerance = tolerances[0]);
	make_regular_prism(vertices = vertices[2], tolerance = tolerances[0]);
	make_regular_prism(vertices = vertices[3], tolerance = tolerances[0]);
	make_regular_prism(vertices = vertices[4], tolerance = tolerances[0]);
	make_regular_prism(vertices = vertices[5], tolerance = tolerances[0]);

	make_regular_prism(vertices = vertices[0], tolerance = tolerances[1]);
	make_regular_prism(vertices = vertices[1], tolerance = tolerances[1]);
	make_regular_prism(vertices = vertices[2], tolerance = tolerances[1]);
	make_regular_prism(vertices = vertices[3], tolerance = tolerances[1]);
	make_regular_prism(vertices = vertices[4], tolerance = tolerances[1]);
	make_regular_prism(vertices = vertices[5], tolerance = tolerances[1]);

	make_regular_prism(vertices = vertices[0], tolerance = tolerances[2]);
	make_regular_prism(vertices = vertices[1], tolerance = tolerances[2]);
	make_regular_prism(vertices = vertices[2], tolerance = tolerances[2]);
	make_regular_prism(vertices = vertices[3], tolerance = tolerances[2]);
	make_regular_prism(vertices = vertices[4], tolerance = tolerances[2]);
	make_regular_prism(vertices = vertices[5], tolerance = tolerances[2]);
};
