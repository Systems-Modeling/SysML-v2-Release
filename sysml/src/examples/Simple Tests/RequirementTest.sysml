package RequirementTest {
	constraint def C;
	constraint c : C;
	private import q::**;
	requirement def R {
		assume constraint c1 : C;
		require c;
		doc /* */
    	requirement;
    	requirement def <'1'> A {
    		doc /* Text */
    		subject s;
    	}
	}
	requirement def R1 {
		require constraint c1 :>> c;
	}
	part p;
	part q {
		requirement r : R;
		satisfy r by p;
		assert satisfy r by q;
	}
	
	requirement r1 : R1;
	not satisfy r1 by p;
	assert not satisfy r1 by q;
	
}