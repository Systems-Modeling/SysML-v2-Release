package PrivateImportTest {
	package P1 {
		part def A;
	}
	package P2 {
		private import P1::*;
	}
	part x: P1::A;
	
	import P2::*;
	// This should fail.
	// A is not visible, because the import in P2 is private.
	// y: A;
	
	package P3 {
		part def B;
	}
	
	private import P3::*;
	
	// This should not fail.
	// Private import only restricts visibility outside the package.
	part z: B;
	
}