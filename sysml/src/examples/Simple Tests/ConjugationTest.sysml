package ConjugationTest {
	port def P;
	
	part def B {
		port p1: P;
		port p2: ~P;
	}
	
	connection def A {
		end port p1: P;
		end port p2: ~P;
	}
	
	interface def I {
		end p1: P;
		end p2: ~P;
	}
	
	part def B1 {
		part p {
			port p1: P;
			port p2: ~P;		
		}
	
		connection a: A connect p::p1 to p::p2 {
			end port p3: P;
			end port p4: ~P;
		}
		interface i: I connect p::p1 to p::p2 {
			end port p3: P;
			end port p4: ~P;
		}
	}
	
}