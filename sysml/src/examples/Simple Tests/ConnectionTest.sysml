package ConnectionTest {
	
	part p {
		part x;
	}
	
	part def P {
		part y;
			
		connect p to y;
		
		part p1 :> p {
			part :>> x;
		}
	
		connect p1::x to y;
	}
}