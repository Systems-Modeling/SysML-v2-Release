package Relationships {
	namespace {
		element <'1'> A;
		element <'2'> B;
		element <'3'> C;
		relationship <'4'> R from A to B, C;
	}
	
	namespace {
		package P1 {
		    element S;
		}
		package P2 {
		    element T; 
		}
		relationship from P1::S to P2::T;
	}
	
	namespace N {		
		element A;
		element B {
        	relationship x {
            	element y; // Owned related Element
            	relationship from A to B; // Relationship as owned related Element 
			} 
		}
		relationship R from A to B {
		    doc /* This relationship has no owned related Elements. */
		}
	}
}