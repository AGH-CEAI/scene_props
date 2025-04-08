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

box_side = 10;
box_height = 10;
with_peg = true;

pin_vertices = 5;
pin_diameter = box_side / 2;
pin_height = box_height * 2;
pin_is_cylinder = false;


tht_pin_block(block_side = box_side, block_height = box_height, peg=with_peg)
{
    regular_prism(vertices = pin_vertices, diameter = pin_diameter, height = pin_height, angle_offset = angle_offset(pin_vertices), is_cylinder = pin_is_cylinder);
};
