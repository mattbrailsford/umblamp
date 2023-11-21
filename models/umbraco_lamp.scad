// Lense
lense_diameter = 200;
lense_height = 15;
lense_chamfer_size = 2.4;
2x_lense_chamfer_size = 2 * lense_chamfer_size;
lense_wall_thickness = 1.2;
2x_lense_wall_thickness = 2 * lense_wall_thickness;
lense_tabs_offset = 7;

// Base
base_lense_gap = 0.5;
base_lense_depth = 13.5;
base_inner_diameter = lense_diameter + (2 * base_lense_gap);
base_wall_thickness = 3;
base_outer_diameter = base_inner_diameter + (2 * base_wall_thickness);
base_bottom_thickness = 10;
base_total_thickness = base_bottom_thickness + base_lense_depth;

chamfer_lense_u = false; // Chamfering the U is more inensive

translate([0,0,lense_wall_thickness + 0.02]) lense();
translate([0,0,0.01]) reflector();
base();

/* 
 ========================================
 Base
 ========================================
*/

module base ()
{
    color([0.3,0.3,0.3])
    {
        difference()
        {
            union()
            {
                base_outer_wall();
                base_u_wall();
                translate([0,0,-base_bottom_thickness]) base_bottom();
            }            
        }
        
        // Flat bottom
        flat_size = 25;
        translate([-(flat_size/2),-(base_outer_diameter / 2), -base_bottom_thickness]) cube([flat_size, 1, base_total_thickness]);
    }
}

module base_bottom()
{
    difference()
    {
        // Base
        cylinder(h = base_bottom_thickness, d = base_outer_diameter, $fn = 100);
        
        // U cutout
        translate([0,0,-1]) umbraco_u(base_lense_depth + 2, - base_lense_gap - base_wall_thickness);
        
        translate([0,0,2])
        {
            // MCU cutout
            hull()
            {
                translate([0,5,0]) cylinder(h = 100, d = 70, $fn = 100);
                translate([0,60,0]) cylinder(h = 100, d = 60, $fn = 100);
            }
            
            // Cable tie holes
            translate([-7.5,65,-50]) cylinder(h = 100, d = 5, $fn = 50);
            translate([7.5,65,-50]) cylinder(h = 100, d = 5, $fn = 50);
            
            // USB cable cutout
            difference()
            {
                cylinder(h = 100, d = base_outer_diameter - 40, $fn = 100);
                translate([0,0,-1]) cylinder(h = 102, d = base_outer_diameter - 55, $fn = 100);
            }
        }
        
        // USB cable hole
        translate([0,-((base_outer_diameter / 2) - 25),-1]) cylinder(h = base_bottom_thickness + 2, d1 = 15, d2 = 30, $fn = 100);
    }
}

module base_u_wall()
{
    difference(){
        umbraco_u(base_lense_depth, - base_lense_gap);
        translate([0,0,-1]) umbraco_u(base_lense_depth + 2, - base_lense_gap - base_wall_thickness);
    }
}

module base_outer_wall ()
{
    difference(){
        cylinder(h = base_lense_depth, d = base_outer_diameter, $fn = 100);
        translate([0,0,-1]) cylinder(h = base_lense_depth + 2, d = base_inner_diameter, $fn = 100);
        
        // Lense tabs cutout (adjusted for refelector height)
        translate([0,0,lense_wall_thickness + .2]) lense_tabs(r = .2);
    }
}

/* 
 ========================================
 Reflector
 ========================================
*/

module reflector ()
{
    color([1,1,1])
    {
        difference(){
            cylinder(h = lense_wall_thickness, d = lense_diameter, $fn = 100);
            translate([0,0,-1]) 
            {
                umbraco_u(lense_height + 2);
                
                // Wiring cutout
                hull()
                {
                    translate([0,30,0]) cylinder(h = lense_height + 2, d = 10);
                    translate([0,60,0]) cylinder(h = lense_height + 2, d = 10);
                }
            }
        }
    }
}

/* 
 ========================================
 Lense
 ========================================
*/

module lense()
{ 
    color([1,1,1])
    {
        lense_shell();
        lense_tabs();
    }
}

module lense_tabs(r = 0)
{
    lense_tabs_oposites(r);
    rotate([0,0,90]) lense_tabs_oposites(r);
}

module lense_tabs_oposites(r = 0) 
{
    t = 1.5 + r;
    
    intersection()
    {
        difference()
        {
            translate([0,0,lense_tabs_offset]) 
            {
                translate([0,0,-t+0.01]) cylinder(h = t, d1 = lense_diameter, d2 = lense_diameter + (t * 2), $fn = 100);
                cylinder(h = t, d1 = lense_diameter + (t * 2), d2 = lense_diameter, $fn = 100);
            }
            cylinder(h = lense_height, d = lense_diameter);
        }
        cube([27 + r,300, 100], center = true);
    }
}

module lense_shell()
{
    if (chamfer_lense_u)
    {
        difference(){
            chamfered_u_cylinder(h = lense_height, d = lense_diameter, c = lense_chamfer_size);
            translate([0,0,-lense_wall_thickness]) chamfered_u_cylinder(h = lense_height, d = lense_diameter, c = lense_chamfer_size, r = lense_wall_thickness);
        }
    }
    else
    {
        
        difference()
        {    
            union()
            {
                // Outer shell
                outer_lense_shell();
                
                // U wall
                umbraco_u(lense_height, lense_wall_thickness);
            }
            
            // U cutout
            translate([0,0,-1]) umbraco_u(lense_height + 2);
        }
    }
}

module chamfered_u_cylinder(h, d, c, r = 0)
{
    layer_height = 0.2;
    layer_count = c / layer_height;
    
    union()
    {
        difference(){
            cylinder(h = h - c, d = d - (2 * r), $fn = 100);
            translate([0,0,-.1]) umbraco_u(h + .2, r);
        }
        
        translate([0,0,h - c]){
            for(i = [1:1:layer_count]){
                translate([0,0,(i-1) * layer_height]) difference(){
                    cylinder(h = layer_height, d = d -  (2 * r) - (i * (2 * layer_height)), $fn = 100);
                    translate([0,0,-.1]) umbraco_u(layer_height + 0.2, r + (i * layer_height));
                }
            }
        }
    }
}

module outer_lense_shell()
{
    difference() {
        chamfered_cylinder(lense_height, lense_diameter, lense_chamfer_size);
        translate([0,0,-lense_wall_thickness]) chamfered_cylinder(lense_height, lense_diameter - 2x_lense_wall_thickness, lense_chamfer_size);
    }
}

/* 
 ========================================
 Helpers
 ========================================
*/
module umbraco_u(h, r = 0) 
{
    scale_factor = lense_diameter / 200;
    center_offset = 5.5 * scale_factor;
    translate([0,-center_offset,0]) {
        linear_extrude(h) {
            scale([scale_factor, scale_factor]) offset(r = r) {
                import("umbraco_logo_u.svg", center = true);
            }
        }
    }
}

module chamfered_cylinder(h, d, c)
{
    hull(){
        cylinder(h = h, d = d - (2 * c), $fn = 100);
        cylinder(h = h - c, d = d, $fn = 100);
    }
}