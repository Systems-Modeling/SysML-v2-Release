package QualifiedNameImportTest {
	package P1 {
		part def A;
	}
	package P2 {
		package P2a {
			import P1::*;
		}
		// The following should not fail.
		// A is a member of P2a because of the import.
		part x: P2a::A;
	}
}