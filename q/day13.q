\l test.q

i:{("J"$x 0; "," vs x 1)}read0`:../input/input13.txt;

ans1:115;
ans2:756261495958122;

////////////////
// Q1
////////////////

q1.1:{[x]
    t:x 0;
    xx:except["J"$x 1; 0n];
    xx[idx]*(mm idx:first iasc mm:m .' where each t<=m:xx*0 1+/:t div xx)-t
 };

test["q1.1"; 1000; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{[x]
    v:"J"$x[1;off:where not null "J"$x 1];
    d:flip (v; (v-off) mod v);
    last {idx:first where y[1]=(x[1]+x[0]*til y 0) mod y 0; (x[0]*y[0]; x[1]+idx*x 0)}/[d]
 };

test["q2.1"; 1000; i; ans2; ""];

getStats[];
