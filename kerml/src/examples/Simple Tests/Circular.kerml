package Circular {
	class A { }
	feature a: A;
	import Circular as Circ;
	package P {
		import Circular::*;
	}
}