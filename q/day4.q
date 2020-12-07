\l test.q

i:read0`:../input/input4.txt;

ans1:242;
ans2:186;

////////////////
// Q1
////////////////

q1.1:{[x]
    cls:`byr`iyr`eyr`hgt`hcl`ecl`pid; 
    sum all each cls in/:("S: " 0:/: " " sv/: (0,where x~\:"") cut x)[;0]};

test["q1.1"; 100; i; ans1; ""];

////////////////
// Q2
////////////////

val:{[d]
    cls:`byr`iyr`eyr`hgt`hcl`ecl`pid; 
    if[not all cls in key d; :0b];
    if[not ("I"$d[`byr]) within 1920 2002; :0b];
    if[not ("I"$d[`iyr]) within 2010 2020; :0b];
    if[not ("I"$d[`eyr]) within 2020 2030; :0b];
    if[not any hu:(-2#d[`hgt]) ~/: ("cm";"in"); :0b];
    if[not ("I"$-2_d[`hgt]) within ((150;193); (59;76))first where hu; :0b]; 
    if[not (d[`hcl][0]="#") and (7=count d`hcl) and all (1_d`hcl) in "0123456789abcdef"; :0b];
    if[not d[`ecl] in ("amb";"blu";"brn";"gry";"grn";"hzl";"oth"); :0b];
    if[not (9=count d`pid) and not null "J"$d[`pid]; :0b];
    1b
 };

q2.1:{[x]
    xx:"S: " 0:/: " " sv/: (0,where x~\:"") cut x;
    sum {val (!). x}each xx
 };

test["q2.1"; 100; i; ans2; ""];

getStats[];
