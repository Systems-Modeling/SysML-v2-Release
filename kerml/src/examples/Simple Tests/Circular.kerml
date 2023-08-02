package Circular {
	class A { }
	feature a: A;
	alias Circ for Circular;
	package P {
		import Circular::*;
	}
	
	feature x :> z;
	feature y :> x;
	feature z :> y;
}