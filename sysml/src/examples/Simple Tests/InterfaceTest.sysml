package InterfaceTest {
	
	port def P1;
	port def P2;
	
	interface def I1 {
		end port p1: P1;
		end port p2: P2;
	}
	
	interface def I2 {
		end p1: P1;
		end p2: P2;
	}
	
	part def A {
		part x {
			port p1 : P1;
		}
		part y {
			port p2 : P2;
		}
		interface i1 : I1 connect x.p1 to y.p2;
		abstract interface i = i1;
	}
	
}