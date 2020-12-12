\l test.q

i:read0`:../input/input6.txt;

ans1:6387;
ans2:3039;

////////////////
// Q1
////////////////

q1.1:{sum count each distinct each raze each (0,where i~\:"") cut x}

test["q1.1"; 100; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{sum count each (inter/')1_/:@[(0,where i~\:"") cut x; 0; (enlist""),]}

test["q2.1"; 100; i; ans2; ""];

getStats[];
