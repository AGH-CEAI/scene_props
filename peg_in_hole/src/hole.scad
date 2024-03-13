/*
 *  Copyright 2024 AGH Center of Excellence in Artificial Intelligence
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

// Single hole
rotation = [ 0, 0, 0 ]; // in degs
vertices = 12;
box_height = 50;
depth = box_height / 2;
prism_diameter = 40;
slot_size = 1.5 * prism_diameter;
leg_width = 2 * slot_size;
tolerance = 1.0;
angle_offset = (360 / vertices) / 2;

rotate(rotation)
single_insertion_box(slot_size = slot_size, depth = box_height / 2, height = box_height, leg_width = 2 * slot_size)
{
	regular_prism(vertices = vertices, diameter = prism_diameter + tolerance, height = 100,
	              angle_offset = angle_offset);
};
