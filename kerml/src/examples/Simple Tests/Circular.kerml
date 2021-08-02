package Circular {
	class A { }
	feature a: A;
	alias Circ for Circular;
	package P {
		import Circular::*;
	}
}