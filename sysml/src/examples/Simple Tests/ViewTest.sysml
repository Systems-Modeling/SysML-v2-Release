package ViewTest {
	package P;
	
	stakeholder def S;
	
	stakeholder s : S;
	
	concern def C {
		affect s;
	}
	
	concern c : C {
		affect stakeholder s1;
	}
	
	viewpoint def VP {
		frame c;
	}
	
	rendering def R;
	
	rendering r : R;
	
	view def V {
		viewpoint vp: VP {
			frame concern c1;
			concern c2;
		}
		rendering r1: R[0..1]; 
		
		view v: V[0..*] {
			expose P::*;
			render r;
		}
	}

}