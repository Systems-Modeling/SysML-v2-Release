package Inheritance {
	class A {
		feature f;
	}
	
	class B specializes A {
		
	}
		
	feature y: A {
		alias x for B::f;
		feature g redefines f;
	}
	
	alias z for y::g;
	
	feature w subsets y;
	
	alias us for w::g;
	
	feature yy: y;
}