t:([] 
    time:  09:00 09:04 09:12 09:13t; 
    sym:   `AAPL`AAPL`AAPL`AAPL; 
    price: 182.35 191.82 182.41 191.76);

q:([] 
    time: 09:00+`time$60000*til 13; 
    sym: `AAPL`AAPL`AAPL`AAPL`AAPL`IBM`IBM`IBM`AAPL`AAPL`AAPL`AAPL`AAPL;
    bid: asc 9.+13?10);

windows1:t.time +\: -00:02 00:02t;
windows:flip windows1;

// list bids per time window
wj[windows; `sym`time; t; (q; (::; `bid))];
// avg bids per time window
wj[windows; `sym`time; t; (q; (avg; `bid))]
// both list and avg bids per time window
//wj[windows; `sym`time; t; (q; (::; `bid); (sum;`bid))];

// qwindows:flip q.time +\: -00:02 00:02t;
// wj[qwindows; `sym`time; q; (t; (::; `price) )];
// wj[qwindows; `sym`time; q; (t; (avg; `price) )];
