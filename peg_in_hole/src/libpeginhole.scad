/*
 *  Copyright 2024-2025 AGH Center of Excellence in Artificial Intelligence
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
EPS = 0.001;

function circle_coordinate(x, r, p) = [ r * cos(x + p), r *sin(x + p) ];
function regular_shape_vertices(n = 3, r = 1, phase = 0) = [for (t = [0:360 / n:360 - EPS]) circle_coordinate(t, r, phase)];

function hole_diameter(vertices, peg_diameter, tolerance = 0) = tolerance + peg_diameter * cos(180 / vertices);
function angle_offset(vertices) = (360 / vertices) / 2;


/* Makes a single peg in form of regular prism
-  Args:
- @vertices: int - number of the base polygon vertices
- @diameter: num - the diameter of the circle to construct the vertices
- @height: num - the height of the prism
- @angle_offset: num - rotation of all vertices
- @is_cylinder: bool - flag to convert prism into cylinder
*/
module regular_prism(vertices, diameter, height, angle_offset, is_cylinder = false)
{
	if (is_cylinder) {
		cylinder(h = height, r = diameter / 2, center = true);
	} else if (vertices < 3) {
		echo("ERROR: Can't construct polygon with less than 3 vertices!");
	} else {
		linear_extrude(height = height, center = true) {
			if (vertices == 4) {
				square(diameter / sqrt(2), center = true);
			} else {
				points = regular_shape_vertices(n = vertices, r = diameter / 2, phase = angle_offset);
				polygon(points);
			}
		}
	}
}

/* Makes a single peghole
-  Args:
- @slot_size: num - the side of the box
- @height: num - the height of the whole box
*/
module single_insertion_box(slot_size, height) {
	difference() {
		// Insertion surface
		cube([ slot_size, slot_size, height ], center = true);
		// Peghole
		children(0);
	}
}

/* Makes multiple pegholes
-  Args:
- @slot_size: num - the side of the box
- @array_size: vec[int, int] - array dimensions of the holes grid
- @height: num - the height of the whole box
*/
module multiple_insertion_box(slot_size, array_size, height) {
	box_dims = slot_size * array_size;
	difference() {
		// Insertion surface
		cube([ box_dims.x, box_dims.y, height ], center = true);

		// Pegholes array
		array_offset = -box_dims / 2 + [ slot_size, slot_size ] / 2;
		for (cnt_y = [0:1:array_size.y - EPS]) {
			dy = slot_size * cnt_y;
			for (cnt_x = [0:1:array_size.x - EPS]) {
				dx = slot_size * cnt_x;
				child_idx = ((cnt_y * array_size.x) + cnt_x) % $children;

				translate([ array_offset.x + dx, array_offset.y + dy, 0 ]) children(child_idx);
			}
		}
	}
}
