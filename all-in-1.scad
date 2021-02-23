x = 97.14;
h = 6;
delta = 2;

a = x / sqrt(2);
b = x / (2 * sqrt(2));
c = b;
d = x / 2;
e = d;
f = x * sqrt(2) / 2;
g = x * sqrt(2) / 4;


module triangle(length) {
  difference() {
    cube([length, length, h]);
    translate([length, 0, 0]) { 
      rotate([0, 0, 45]) cube([length * sqrt(2), length * sqrt(2), h]);
    }
  }
}

module diamond(length) {
  triangle(length);
  translate([length, 0, 0]) mirror([90, 90, 0]) triangle(length);
}

module mysquare(length) {
  cube([length, length, h]);
}


union() {
  translate([x / 2 + delta, x / 2, 0]) rotate([0, 0, -135]) triangle(a);
  translate([x / 2, x / 2 + delta, 0]) rotate([0, 0, 135]) triangle(a);
  translate([g / sqrt(2), x - g / sqrt(2) + 3 * delta, 0]) rotate([0, 0, 45]) diamond(g);
  translate([x / 2 + delta, x / 2 + 2 * delta, 0]) rotate([0, 0, 45]) triangle(c);
  translate([x/ 2 + 2 * delta + b * sqrt(2) / 2, x / 2 - b * sqrt(2) / 2 + delta, 0])rotate([0, 0, 45]) mysquare(b);
  translate([x - c * sqrt(2) / 2 + 3* delta, c * sqrt(2) / 2, 0]) rotate([0, 0, -45]) triangle(c);
  translate([x + 3 * delta, x + 3 * delta, 0]) rotate([0, 0, -180]) triangle(e);
}
