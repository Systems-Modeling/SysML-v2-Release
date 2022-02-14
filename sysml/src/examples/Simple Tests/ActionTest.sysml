package ActionTest {
	attribute def S;
	
	action a {
		first start;		
		then merge m;
		then accept S;
		then accept sig after 10[SI::s]; 
		then accept at Time::Iso8601DateTime("2022-01-30T01:00:00Z");
		
		then send S() to b;
		then accept when b.f;
		then decide;
			if true then m;
			else done;
	}
	
	action b {
		attribute f : ScalarValues::Boolean;
	}
	
}