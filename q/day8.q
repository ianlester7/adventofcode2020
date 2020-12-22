\l test.q

i:flip ("SI"; " ") 0:`:../input/input8.txt;

ans1:1814;
ans2:1056;

////////////////
// Q1
////////////////

stop:{
    {if[count[x]<last y 0; :y]; 
      idx:last y 0;
      a:y 1;
      if[idx in -1_y 0; :y]; 
      cmd:x[idx;0];
      $[cmd=`acc; (y[0],idx+1;a+x[idx;1]);
        cmd=`jmp; (y[0],idx+x[idx;1];a); 
        (y[0],idx+1;a)]
     }[x]/[(enlist 0;0)]};

q1.1:{last stop x};

test["q1.1"; 1000; i; ans1; ""];

////////////////
// Q2
////////////////

// TODO: terminate when answer is found
q2.1:{idx:where x[;0] in `jmp`nop; res:{[x;y] stop .[x;(y;0);`nop`jmp `nop=]}[x]each idx; res[;1] first where (last each res[;0])=1+count x};

test["q2.1"; 1; i; ans2; ""];

getStats[];
