action def ControlNodeTest {
	action A1;
	then J;
	
	action A2;
	then J;
	
	join J;
	then fork F;
	then B1;
	then B2;
		
	action B1;
	action B2;
}