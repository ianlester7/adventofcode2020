\l test.q

i:flip ("***"; " ")0:`:../input/input2.txt;
i:((flip ("II";"-") 0: i[;0]),'i[;1][;0]),'enlist each i[;2];

ans1:410;
ans2:694;

////////////////
// Q1
////////////////

q1.1:{sum {[u;l;c;s] (sum c=s) within (u;l)} .' x};

test["q1.1"; 1000; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{sum {[u;l;c;s] 1=(c=s l-1) + c=s u-1} .' x};

test["q2.1"; 1000; i; ans2; ""];

getStats[];
