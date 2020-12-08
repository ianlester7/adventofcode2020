\l test.q

i:read0`:../input/input5.txt;

ans1:996;
ans2:671;

////////////////
// Q1
////////////////

q1.1:{max 2 sv/: any x=/:"BR"}

test["q1.1"; 100; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{{-1+first x idx where 1<deltas x idx:iasc x} 2 sv/: any x=/:"BR"};

test["q2.1"; 100; i; ans2; ""];

getStats[];
