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
use <libpeginhole.scad>
$fa = 1;
$fs = 0.4;

// Holes array
rotation = [ 0, 0, 0 ]; // in degs

vertices = [ 4, 6, 8, 12 ];
height = 100;

array_x = 1;
array_y = 4;
box_height = 50;
prism_diameter = 40;
tolerance = 1.0;

depth = box_height / 2;
slot_size = 1.5 * prism_diameter;
leg_width = 2 * slot_size;

rotate(rotation)
multiple_insertion_box(slot_size = slot_size,
					   array_size = [ array_x, array_y ],
                       height = box_height)
{
	regular_prism(vertices = vertices[0], diameter = hole_diameter(vertices[0], prism_diameter, tolerance), height = height, angle_offset = angle_offset(vertices[0]));
	regular_prism(vertices = vertices[1], diameter = hole_diameter(vertices[1], prism_diameter, tolerance), height = height, angle_offset = angle_offset(vertices[1]));
	regular_prism(vertices = vertices[2], diameter = hole_diameter(vertices[2], prism_diameter, tolerance), height = height, angle_offset = angle_offset(vertices[2]));
	regular_prism(vertices = vertices[3], diameter = hole_diameter(vertices[3], prism_diameter, tolerance), height = height, angle_offset = angle_offset(vertices[3]));
};
