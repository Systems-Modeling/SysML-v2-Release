package AliasTest {
    part def P1 {
        port porig1;
        alias porig1 as po1;
    }

    part p1 : P1 {
        port po1 :>> po1;
    }

    part p2 : P1 {
        port pdest;
        alias pdest as pd1;
    }


    connect p1::po1 to p2::pdest;
	connect p1::po1 to p2::pd1;
}