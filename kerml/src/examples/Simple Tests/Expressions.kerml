package Expressions {
	import BaseFunctions::ToString;
	import ControlFunctions::*;
	
	a: ScalarValues::Integer;
	x = ToString(a * a + 3 == 4); 
	y = NumericalFunctions::'+'(1,2);
	z = a & true ^ x | false;
	
	b = x > y? x-y: y-x;
	c = x->collect {in xx; xx + 1}; 
	d = x->while({in q; q > 3}, {in r; r - 1})->reduce {in s; in t; s + t}->reduce ScalarFunctions::'+';
	
	function w specializes ControlFunctions::while (initial) result {
		expr condition redefines ControlFunctions::while::condition (v){v > 3}
		expr body redefines ControlFunctions::while::body (u){u - 1}
	}
	
	xx = x == 1 && y == 2? a:
	     x == 2? b:
	     x == 3? c:
	     0;
    
    function TotalMass(partMass, subparts) {
		partMass + (subparts->collect {in p; totalMass(partMass, subparts)}->reduce ScalarFunctions::'+' ?? 0.0)
	}
	
	expr totalMass: TotalMass (mass, sub);
}