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
use <libpeginhole.scad>
$fa = 1;
$fs = 0.4;

// Handle
handle_rotation = [ 0, 0, 0 ]; // in degs
handle_diameter = 15;
handle_height = 25;

// Peg
rotation = [ 0, 0, 0 ]; // in degs
vertices = 6;
diameter = 40;
height = 100;
angle_offset = (360 / vertices) / 2;
is_cylinder = false;

union() {  
    // Handle
    rotate(handle_rotation)
    translate([0, 0, height / 2 + handle_height / 2])
    cube([handle_diameter, handle_diameter, handle_height], center = true);
    // Peg
    rotate(rotation)
    regular_prism(vertices = vertices, diameter = diameter, height = height, angle_offset = angle_offset,
                  is_cylinder = is_cylinder);
};