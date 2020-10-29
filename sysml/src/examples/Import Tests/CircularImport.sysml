package CircularImport {

	package P1 {
		import P2::*;
		part def A;
	}
	package P2 {
		import P1::*;
		part def B;
	}
	package Test1 {
		import P1::*;
		part x: A;
		part y: B;
	}
	package Test2 {
		import P2::*;
		part x: A;
		part y: B;
	}
	
	part x: P1::A;
	
	// The following should not fail.
	part y: P1::B;
	
}