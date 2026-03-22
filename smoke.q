fulldeckCheck:{[x]
  syms: `CDSO2`CDSO3`CDSO4`CDSO5`CDSO6;
  syms except (union/) x}

missingSyms: fulldeckCheck[(`CDSO2`CDSO3`CDSO4; `CDSO2`CDSO3`CDSO4)];
show "Test: happy case obviously two missing from rdb and idb"
show "Expected: (`CDSO5`CDSO6)";
show "Actual:(", "," sv string missingSyms, ")";

missingSyms: fulldeckCheck[(`CDSO2`CDSO3`CDSO4`CDSO5; `CDSO2`CDSO3`CDSO4`CDSO5`CDSO6 )];
show "Test: its not in rdb but in idb"
show "Expected: ()";
show "Actual:(", "," sv string missingSyms, ")";

missingSyms: fulldeckCheck[(`CDSO2`CDSO3`CDSO4`CDSO5`CDSO6; `CDSO2`CDSO3`CDSO4`CDSO5`CDSO6 )];
show "Test: its in both rdb and idb"
show "Expected: ()";
show "Actual:(", "," sv string missingSyms, ")";

missingSyms: fulldeckCheck[((); ())];
show "Test: both rdb and idb empty"
show "Expected: (`CDSO2`CDSO3`CDSO4`CDSO5`CDSO6)";
show "Actual:(", "," sv string missingSyms, ")";
