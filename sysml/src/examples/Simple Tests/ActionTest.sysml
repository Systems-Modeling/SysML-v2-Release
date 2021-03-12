package ActionTest {
	attribute def S;
	
	action a {
		first start;		
		then merge m;
		then accept S; 
		
		then send S to B();		
		then decide;
			if true then m;
			else done;
	}
	
	action def B;
	
}