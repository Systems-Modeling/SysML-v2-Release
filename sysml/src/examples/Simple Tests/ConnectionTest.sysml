package ConnectionTest {
	
	part p {
		part x {
			part x1;
		}
	}
	
	part def P {
		part y;

		connect p to y;
		
		part p1 :> p;
	
		connect p1.x to y;
		connect p1.x.x1 to y;
	}
}