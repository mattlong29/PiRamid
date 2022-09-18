HQmount=15;
module pimount(){
    //49mm wide and 58mm long between scres
    //56mm wide board and 85mm long
    //wide in y, 49mm apart, 49+3.5=52.5, so 3.5 and 52.5
    //long in x, 58mm apart, 58+3.5=61.5, so 3.5 and 61.5
    //put USB power in at back left, with screws
    //put origin in back left (top)
    $fn=24;
difference(){
union(){
    cube([85,56,2]); //base plate tightly matching pi
    translate([3.5,28,0]) cylinder(h=10,d=6); //mounts
    translate([58.5,28,0]) cylinder(h=10,d=6); //mounts
}
    translate([3.5,28,0]) cylinder(h=12,d=3); //mounts
    translate([58.5,28,0]) cylinder(h=12,d=3); //mounts
}
    
}



module shell1(){
difference() {
union(){
translate([60,-30,90])  rotate([0,73,0])pimount();
minkowski(){
hull(){
//top layer
translate([-50,-30,120]) cube([100,60,2]);
////base
translate([-90,-70,0]) cube([180,140,2]);
}
sphere(2);
}

}
hull(){
//top layer
translate([-50,-30,120]) cube([100,60,2]);
////base
translate([-90,-70,0]) cube([180,140,2]);
}
///holes to mount pi mount
    translate([HQmount,HQmount,0]) cylinder(h=220,d=5); //mounts
    translate([HQmount,-HQmount,0]) cylinder(h=220,d=5); //mounts
    translate([-HQmount,HQmount,0]) cylinder(h=220,d=5); //mounts
    translate([-HQmount,-HQmount,0]) cylinder(h=220,d=5); 
//camera ribbon slot
translate([30,-8,0])cube([1,16,200]);
translate([8,27,0])rotate ([0,0,90])cube([1,16,200]);
}
}


module midshell(cuth=30, cap=120) {
    difference(){
shell1();    
translate([-200,-200,-10])cube([400,400,10+cuth-25]);
translate([-200,-200,cap])cube([400,400,100]);    
}
}

module capshell(cuth=30, cap=120) {
    difference(){
shell1();    
translate([-200,-200,-10])cube([400,400,cap-10]);
}
}



module topshell(cuth=30){
difference(){
shell1();    
translate([-200,-200,-10])cube([400,400,10+cuth-25]);
}
}

module botshell(cuth=30){
difference(){
shell1();    
translate([-200,-200,cuth])cube([400,400,200]);
    translate ([-100,-18,5]) rotate ([0,90,0])cylinder (h=100,d=10);
    translate ([-100,22,5]) rotate ([0,90,0])cylinder (h=100,d=10);
}



difference (){
translate ([-46,-44.5,0]) cube ([104,95,15]);
    translate ([-45,-43,0]) cube ([101,92,15]);
    translate ([-50,-18,5]) rotate ([0,90,0])cylinder (h=100,d=10);
    translate ([-50,22,5]) rotate ([0,90,0])cylinder (h=100,d=10);
}
}

//translate([0,0,50])midshell();
translate([0,0,0])botshell();
//translate([0,0,80])capshell();

#translate([-70,0,0])import("/Ladder Comb_with label.stl");
