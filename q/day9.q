\l test.q

i:"J"$read0`:../input/input9.txt;

ans1:257342611;
ans2:0n;

////////////////
// Q1
////////////////

q1.1:{g:(-24_x)+x(1+til[24])+/:til count[x]-24; x 25+first where not {[g;x;idx] x[25+idx] in raze g[idx+til 25]}[g;x] each til count[x]-25};

test["q1.1"; 100; i; ans1; ""];

////////////////
// Q2
////////////////

q2.1:{j:first raze{[s;idx] fi:first where ans1=(idx _ s)-0^s[idx-1]; $[not null fi; enlist (idx;idx+1+fi); ()]}[sums x] each til count x; sum (max;min) @\: first j _ x};

test["q2.1"; 100; i; ans2; ""];

getStats[];
