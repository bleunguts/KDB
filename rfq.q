rfqRequests:([]
 time: (2024.06.10T09:30:00; 2024.06.10T10:15:00;  2024.06.10T11:10:00);
 rfqClientName:`Goldman`Citi`JPM;
 party1: `Goldman`MyBank`JPM;
 party2: `MyBank`Citi`MyBank;
 rfqDirection:`PAY`RECEIVE`PAY;
 description:("10Y IRS trade"; "5Y swap trade"; "2Y 5Y curve trade");
 requestSubID:("A123";"B456";"C789");
 notional:100 200 300)

/ general query
(meta select 
    time, rfqClientName, party1, party2, rfqDirection, description, requestSubID, notional 
    from rfqRequests)

/ this explodes    
select seriesName from (update seriesName: raze raze each (string party1), ",", (string party2), ",", (string rfqDirection), ",", requestSubID, ",", description from rfqRequests)

/ this errors on each and string
select seriesName: "," sv each string each flip (party1;party2;rfqDirection;requestSubID;description) from rfqRequests

/ this gives type error '
select seriesName: "," sv' string flip (party1;party2;rfqDirection;requestSubID;description) from rfqRequests

/ detour to practice flip a list (transpose)
string flip (`Goldman;`MyBank;`PAY; "A123"; "10Y IRS trade")
(1 2 3;4)
flip (1 2 3;4)
flip (1 2 3; 4 5) / you cant transpose a 3x1 and a 1x2, but you can transpose a 3x1 and a 1x3
flip (1 2 3; 4 5 6)
a:("A123","10Y IRS trade") / commas are NOT used for lists semicolons are 
b:(`Goldman;`MyBank;`PAY)

select seriesName: "," sv each (string party1,/:string party2,/:string rfqDirection,/:raze requestSubID,/:raze description) from rfqRequests

cols:(party1; party2; rfqDirection; requestSubID; description)
stringCols: {raze string x} each cols
rows: flip stringCols
select seriesName: "," sv' rows from rfqRequests