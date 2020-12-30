.stats.tbl:([] f:(); passed:""; runtime:`long$(); memory:`long$(); iterations:`long$(); comment:());

getStats:{[] show .stats.tbl};
clearStats:{[] delete from `.stats.tbl};

test:{[f;iterations;input;expected;comment]
    .tmp.input:input;
    stats:system"ts:",string[iterations]," .tmp.ans:",f," .tmp.input";
    passmsg:$[(null expected) or 0=count expected;
       [passed:"?"; "got ans=",string[.tmp.ans]];
      all .tmp.ans=expected;
        [passed:"Y"; "passed with ans=",string[.tmp.ans]];
        [passed:"N"; "failed with ans=",string[.tmp.ans],", expected=",string[expected]]];
    cmntmsg:$[count comment; " (",comment,") "; " "];
    show f,cmntmsg,passmsg," in ",string[stats 0],"ms (",string[iterations]," run",$[count[iterations]>1;"s";""],") using ",string[stats 1]," bytes memory";
    `.stats.tbl upsert cols[.stats.tbl]!(f; passed; stats 0; stats 1; iterations; comment);
    delete ans, input from `.tmp;
 }
