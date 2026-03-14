n: 100
swapPrices: {
    dates: .z.d + til n;
    rates: 0.02 + 0.03 * sin[2 * 3.14159 * til[n] % 30] + -0.001 + 0.002 * n?1f;
    notional: 1000000 + n?500000;
    ([] date: dates; rate: rates; notional: notional; mid: notional * rates)
    }[];

 swapPrices
//wj1[`date;`date;swapPrices;(swapPrices;-;`date;`date;{select avg_rate: avg rate, avg_notional: avg notional from x})]