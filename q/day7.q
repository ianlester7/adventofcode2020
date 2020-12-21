\l test.q

i:read0`:../input/input7.txt;

ans1:296;
ans2:9339;

////////////////
// Q1
////////////////

p:{(!). flip {(`$y[2]#x; {(`$raze each x 1 2+/:y;"I"$x y)}[4_yy;4*til ((count yy:y cut x)-4) div 4])} .' flip(x;0,/:where each " " =/:x)}

q1.1:{[b;x] -1+count distinct raze over{[d;bs] {[d;b] key[d] where 0<sum each b=/:value[d][;0]}[d] each raze bs}[p x]\[b]}[`$"shiny gold"]

test["q1.1"; 10; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{[b;x] -1+count raze over{[d;bs] {x[0] where x 1} {$[0h=type first x; raze each flip x; x]} d bs}[p x]\[b]}[`$"shiny gold"]

test["q2.1"; 10; i; ans2; ""];

getStats[];
