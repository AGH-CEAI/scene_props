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

EPS = 0.001;

function is_2d_in_list(pos, pos_list) =
    max([for (p = pos_list) p[0] == pos[0] && p[1] == pos[1]]);

/* Makes a single block with attachable peg as a children.
- Args:
- @block_side: num - the side dimension of the graspable block
- @block_height: num - the height of the graspable block
- @pin: bool - flag to attach peg to the block
*/
module tht_pin_block(block_side, block_height, pin = true)
{
    // Block
    cube([block_side, block_side, block_height], center = true);
    // Peg
    if (pin) {
        translate([0, 0, -block_height / 2])
        children(0);
    }
};

/* Makes a THT component as an array of `tht_pin_block`. Requires children to be defined as `regular_prism`.
- Args:
- @block_side: num - the side dimension of the graspable block
- @block_height: num - the height of the graspable block
- @cols: int - the number of pin columns (x axis)
- @rows: int - the number of pin rows (y axis)
- @inverted_positions: array - the list of 2D pins positions ([col, row]) to invert the default_pin value
- @default_pin: bool - default decision to include the pin to attach peg to the block
*/
module tht_component(block_side, block_height, cols, rows, inverted_positions, default_pin=true)
{
    spacing = block_side + EPS;
    total_width = (cols - 1) * (spacing - EPS);
    total_height = (rows - 1) * (spacing - EPS);

    translate([-total_width / 2, -total_height / 2, 0])
    for (x = [0 : cols - 1]) {
        for (y = [0 : rows - 1]) {
            attach_pin = is_2d_in_list([x, y], inverted_positions) ? !default_pin : default_pin;
            translate([x * spacing, y * spacing, 0])
            tht_pin_block(block_side = block_side, block_height = block_height, pin = attach_pin)
            {
                children(0);
            };
        }
    }
};
