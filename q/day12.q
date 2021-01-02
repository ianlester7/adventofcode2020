\l test.q

i:{flip(x[;0];"J"$1_/:x)}read0`:../input/input12.txt;

ans1:1457;
ans2:106860;

////////////////
// Q1
////////////////

turn:{[x;d] l:$[x[0]="L";reverse;] "NESW"; u:x[1] div 90; l (u+where d=l)mod 4};
move:{[d;v;c] v:$[d in "NE"; v; neg v]; c+$[d in "EW"; (v;0); (0;v)]};

q1.1:{[x]
    res:{[c;x]
        ($[x[0] in "NSEWF"; move[$[x[0]="F"; d; x 0]; x 1; c 0]; c 0];
         d:first $[x[0] in "LR"; turn[x;c 1]; c 1])
     }/[((0;0);"E");x];
     sum abs res 0
 };

test["q1.1"; 100; i; ans1; ""];

////////////////
// Q2
////////////////

rotateWP:{[x;d] {x*rotate[1;y]}[$[x[0]="L";-1 1;1 -1]]/[x[1] div 90;d]}

q2.1:{[x]
    res:{[c;x]
        ($[x[0]="F"; c[0]+x[1]*c[1]; c[0]];
         $[x[0] in "NSEW"; move[x 0; x 1; c 1]; x[0] in "LR"; rotateWP[x;c 1]; c 1])
     }/[((0;0);(10;1));x];
     sum abs res 0
 };

test["q2.1"; 100; i; ans2; ""];

getStats[];
