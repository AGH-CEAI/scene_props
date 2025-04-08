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

/* Makes a single block with attachable peg as a children
- Args:
- @block_side: num - the side dimension of the graspable block
- @block_height: num - the height of the graspable block
- @with_peg: bool - flag to attach peg to the block
*/
module tht_pin_block(block_side, block_height, peg = true)
{
    // Block
    cube([block_side, block_side, block_height], center = true);
    // Peg
    if (peg) {
        translate([0, 0, -block_height / 2])
            children(0);
    }
};
