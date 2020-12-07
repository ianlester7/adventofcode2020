\l test.q

i:"I"$read0`:../input/input1.txt;
ans1:1007104;
ans2:18847752;

////////////////
// Q1
////////////////

q1.1:{[t;x]
    x:asc x;
    d:x!t-x;
    a:first x where (d x where x<t%2) in x;
    a * d a}

// bug here if t%2 is in input, assuming there are no duplicates
q1.2:{[t;x] prd x (t-x)?x}

// no bug since we can't use 1010
q1.3:{[t;x] prd abs (t; 0) -first desc x x?t-x where x<t%2}

test["q1.1[2020]"; 1000; i; ans1; ""]
test["q1.2[2020]"; 1000; i; ans1; ""]
test["q1.3[2020]"; 1000; i; ans1; ""]

test["q1.1[2020]"; 1000; 1010i,i; ans1; "with 1010 added to input"]
test["q1.2[2020]"; 1000; 1010i,i; ans1; "with 1010 added to input"]
test["q1.3[2020]"; 1000; 1010i,i; ans1; "with 1010 added to input"]

randTarget:2020202;
randInput:{[t;x] abs(count[x]?(0;t))-x}[randTarget] (?). `long$randTarget%-4 2;
randAns2:randTarget - randAns1:first 1?randInput;
randInput:{xx:x,y; (neg count xx)?xx}[randInput;randAns2];
randAns:randAns1*randAns2;

test["q1.1[",string[randTarget],"]"; 10; randInput; randAns; ""]
test["q1.2[",string[randTarget],"]"; 10; randInput; randAns; ""]
test["q1.3[",string[randTarget],"]"; 10; randInput; randAns; ""]

////////////////
// Q2
////////////////

q2.2:{[t;x] prd xx (xx:t-raze x+/:x)?x}

q2.3:{[t;x] prd xx (xx:t-raze x+/:x where x<t%3)?x}

// test["q2.1[2020]"; 1000; ans2]
test["q2.2[2020]"; 1000; i; ans2; ""]
test["q2.3[2020]"; 1000; i; ans2; ""]

getStats[]
