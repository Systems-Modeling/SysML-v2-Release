package ViewTest {
	package P;
	
	viewpoint def VP;
	rendering def R;
	
	view def V {
		viewpoint vp: VP;
		rendering r: R[0..1]; 
		
		view v: V[0..*] {
			expose P::*;
			rendering r1;
		}
	}

}