price_response: ([]
    time: 09:00:00.000 09:00:30.000 09:00:45.000 09:01:00.000 09:02:00.000;
    sym: `CAD2Y`CAD2Y`CAD2Y`CAD2Y`CAD2Y;
    price: 3.045 3.040 3.050 3.032 3.501)

/  09:00:45 test aj0 as it falls between 09:00:30 and 09:01:00 in market_data

market_data: ([]
    time: 09:00:00.500 09:01:00.500 09:02:00.500;
    sym: `UISRSC02`UISRSC02`UISRSC02;
    source: `BGN`BGN`BGN;
    price: 3.046 3.033 3.502)

sym_map: (`CAD2Y; `CAD5Y) ! (`UISRSC02; `UISRSC05);

pr: update sym_market: sym_map @ sym, ptime:time from price_response;
md: update sym_market:sym, mtime:time, price_market:price from market_data;
md: ([time: md.time; sym_market: md.sym] mtime: md.time; price_market: md.price);
md: `time`sym_market xasc md;

aj_result: aj[`sym_market`time; pr;md];
aj_result: update delta: price - price_market, ptime:ptime from aj_result;

/ nearest neighbor join on sym_market and time
aj0_result: aj0[`sym_market`time; pr;md];
aj0_result: update delta: price - price_market, ptime:ptime from aj0_result;

select ptime, sym, price, mtime,price_market, delta from aj_result