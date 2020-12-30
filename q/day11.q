\l test.q

i:read0`:../input/input11.txt;

ans1:2368;
ans2:2124;

////////////////
// Q1
////////////////

gn:{[w;idx] idx+\:raze(neg w + 1 0 -1; -1 1; w + -1 0 1)};
us:{[c;s;b] $[(s="L") & 0=no:sum "#"=c; "#"; (s="#") and no>=b; "L"; s]}

q1.1:{px:".",/:x,\:"."; w:count first px; px:raze px; idx:gn[w] til count px; sum "#"={[idx;xx] n:xx idx; us[;;4] .' flip (n;xx)}[idx]/[px]};

test["q1.1"; 1; i; ans1; ""];

////////////////
// Q2
////////////////

gs:{[w;l;xl;j]
    f:{[x;y] y @' first each where each x y}xl;
    n:j mod w;
    m:j div w;
    raze over (f (n;m;w-n+1)#'j-(w+1;w;w-1)*\:1+til m;
               f (j-1+til n; j+1_til w-n);
               f (n;l-m;w-n+1)#'j+(w-1;w;w+1)*\:1+til l-m)
 };

q2.1:{xx:raze x; idx:gs[count first x; count x; xx="L"]each til count xx; sum "#"={[idx;xx] n:xx idx; us[;;5] .' flip (n;xx)}[idx]/[xx]};

test["q2.1"; 1; i; ans2; ""];

getStats[];
