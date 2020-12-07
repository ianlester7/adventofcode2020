\l test.q

i:read0`:../input/input3.txt;

ans1:211;
ans2:3584591857;

////////////////
// Q1
////////////////

q1.1:{[r;d;x] x:x=\:"#"; sum x ./: flip (l*d; (r*l:til `long$count[x]%d) mod count first x)};

q1.2:{[r;d;x] x:x=\:"#"; sum raze[x] (l*d*count first x) + (r*l:til `long$count[x]%d) mod count first x}

q1.3:{[r;d;x] sum "#"=raze[x] (cx*l*d) + (r*l:til `long$count[x]%d) mod cx:count first x}

test["q1.1[3;1]"; 1000; i; ans1; ""];
test["q1.2[3;1]"; 1000; i; ans1; ""];
test["q1.3[3;1]"; 1000; i; ans1; ""];

////////////////
// Q2
////////////////

args:(1 1; 3 1; 5 1; 7 1; 1 2);

q2.1:{[m;x] prd `long$q1.1[;;x] .' m};

q2.2:{[m;x] prd `long$q1.2[;;x] .' m};

q2.3:{[m;x] prd `long$q1.3[;;x] .' m};

test["q2.1[",(.Q.s1 args),"]"; 1000; i; ans2; ""];
test["q2.2[",(.Q.s1 args),"]"; 1000; i; ans2; ""];
test["q2.3[",(.Q.s1 args),"]"; 1000; i; ans2; ""];

getStats[];
