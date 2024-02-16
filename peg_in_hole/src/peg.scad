$fa = 1;
$fs = 0.4;

use <libpeginhole.scad>

// Peg
rotate([90,0,0])
regular_prism(vertices = 5, diameter = 40, height = 100, is_cylinder=true);