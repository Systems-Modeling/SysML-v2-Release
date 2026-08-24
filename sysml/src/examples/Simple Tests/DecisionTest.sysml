action def DecisionTest {
	attribute x = 1;
	
	decide 'test x';
	if x == 1 then A1; 
	if x > 1 then A2;
	else A3; 
	
	then decide D; 
	if true then A1;
	if false then A2;
	
	action A1;
	action A2;
	action A3;
	
	public succession S first A1 
		if x == 0 then A2;
		
	private first A3;
		if x > 0 then 'test x';
}