t:([]
    time:07:00 08:30 09:59 10:00 12:00 16:00t;
    sym:`IBM`IBM`IBM`IBM`AAPL`IBM;
    price:0.9 1.5 1.9 2 9. 10.;
    size:100*6?10);

q:([]
    time:08:00+`time$60*60000*til 8;
    sym:`IBM`AAPL`IBM`AAPL`AAPL`IBM`AAPL`IBM;
    bid:1 9 2 8 8.5 3 7 4.);

/ aj [ 1st arg exact match, 2nd arg less than match ....]
aj[`sym`time;t;q];

fq:update qtime:time, qsym:sym from q;
ft:update ftime:time, fsym:sym from t;
aj[`sym`time;ft;fq];
/ shows q table bids
t, 'q asof `sym`time#t

/ union join
q uj t;
`time xasc q uj t

