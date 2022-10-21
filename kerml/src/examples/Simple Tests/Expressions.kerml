package Expressions {
	import ScalarFunctions::*;
	import BaseFunctions::ToString;
	import ControlFunctions::*;
	
	a: Integer;
	aa : Boolean;
	x = ToString(a * a + 3 == 4);
	y = NumericalFunctions::'+'(1,2);
	z : Boolean = aa & true xor zz | false implies z;
	zz : Boolean = aa and true xor aa or false implies z;
	
	b = if x > y? x-y else y-x;
	c = x->collect {in xx; xx + 1}; 
	c1 = x.{in xx; xx + 1}; 
	d = x->select {in xx; xx != null};
	d1 = x.?{in xx; xx != null};
	e = x->reduce {in s; in t; s + t}->reduce '+';
	
	behavior w specializes ControlPerformances::LoopPerformance { inout v: Integer;
		in expr redefines whileTest {v > 3}
		in step redefines body : Performances::Performance {
			step decrement {
				out v_decr : Integer = v - 1;			
			}
			succession decrement then update;
			step update : FeatureReferencingPerformances::FeatureWritePerformance {
				in redefines onOccurrence = w::self {
					feature redefines startingAt : w {
						feature redefines accessedFeature redefines v;
					}
				}
				inout replacementValues = decrement.v_decr;
			}
		}
	}
	
	xx = if x == 1 and y == 2? a
	     else if x == 2? b
	     else if x == 3? c
	     else 0;
    
    function TotalMass { in partMass; in subparts;
		partMass + (subparts->collect {in p; totalMass(partMass, subparts)}->reduce '+' ?? 0.0)
	}
	
	expr totalMass: TotalMass { in mass; in sub; }
	
	feature f {
		expr s { in x; return : Boolean; }
	}
	
	bb : Boolean = f.s(1);
	
	class C {
		count := 0;
	}
	
	feature obj1 : C;
	feature obj2 : C;
	
	test1 = obj1 === obj2;
	test2 = x !== obj2;
}