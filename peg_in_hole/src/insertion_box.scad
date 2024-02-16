$fa = 1;
$fs = 0.4;

use <libpeginhole.scad>

// Hole
prism_diameter = 40;
tolerance = 1.0;
box_height = 50;
slot_size = 1.5 * prism_diameter;

rotate([90,0,0])
multiple_insertion_box(slot_size = slot_size, 
                       array_size = [ 1, 4 ], 
                       depth = box_height / 2, 
                       height = box_height,
                       leg_width = 2.0 * slot_size)
{
	regular_prism(vertices = 3, diameter = prism_diameter + tolerance, height = 100);
	regular_prism(vertices = 4, diameter = prism_diameter + tolerance, height = 100);
	regular_prism(vertices = 5, diameter = prism_diameter + tolerance, height = 100);
	regular_prism(is_cylinder = true, diameter = prism_diameter + tolerance, height = 100);
};
