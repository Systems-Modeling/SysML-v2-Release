package Inheritance {
	class A {
		feature f;
	}
	
	class B specializes A {
		
	}
		
	feature y: A {
		feature x is B::f;
		feature g redefines f;
	}
	
	alias y::g as z;
	
	feature w subsets y;
	
	alias w::g as u;
	
	feature yy: y;
}