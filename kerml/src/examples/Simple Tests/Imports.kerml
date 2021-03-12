package Imports {

	package P {
		class A;
		class B;
		class C;
	}
	
	package Q {
		class A;
		class D {
			class E;
		}
		package Q1 {
			class D;
			class E;
			private package Q1a {
				class G;
			}
		}
		package Q2 {
			class F;
		}
	}
	
	package R {
		import Q::*;
	}

	
	package S {
		import P::*;
		import Q::**;
		
		class X :> A;
		class Y :> D;
		class Z :> F;
	}
	
	package S1 {
		import P::*;
		import R::*;
		
		class X :> A;
	}
}