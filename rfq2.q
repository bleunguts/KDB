rfqRequests:([]
 time: (2024.06.10T09:30:00; 2024.06.10T10:15:00;  2024.06.10T11:10:00);
 rfqClientName:`Goldman`Citi`JPM;
 party1: `Goldman`MyBank`JPM;
 party2: `MyBank`Citi`MyBank;
 rfqDirection:`PAY`RECEIVE`PAY;
 description:("10Y IRS trade"; "5Y swap trade"; "2Y 5Y curve trade");
 requestSubID:("A123";"B456";"C789");
 notional:100 200 300)

sanitizeRow:{[row]
    columns:(row[`party1]; row[`party2]; row[`rfqDirection]; row[`requestSubID]; row[`description]);
    stringCols:{raze string x} each columns;
    "|" sv stringCols
};

/ nice this works
sanitizeRow last rfqRequests

/ this works as well
select seriesName: sanitizeRow each rfqRequests from rfqRequests

/ inline version of the above
select seriesName: ({[row] 
                        columns:(row[`party1]; row[`party2]; row[`rfqDirection]; row[`requestSubID]; row[`description]);
                        stringCols:{raze string x} each columns;
                        "|" sv stringCols
                    } each rfqRequests) 
from rfqRequests