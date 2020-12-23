\l test.q

i:"J"$read0`:../input/input10.txt;

ans1:2590;
ans2:226775649501184;

////////////////
// Q1
////////////////

q1.1:{{x[1]*1+x[3]}count each group deltas asc x};

q1.2:{{(sum 1=x)*(1+sum 3=x)}deltas asc x};

test["q1.1"; 1000; i; ans1; ""];
test["q1.2"; 1000; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{last {x[y]:sum 0^x y-1+til 3; -3#x}/[(enlist 0)!enlist 1;asc x]};

test["q2.1"; 1000; i; ans2; ""];

getStats[];
