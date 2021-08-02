package Expressions {
	import ScalarFunctions::*;
	import BaseFunctions::ToString;
	import ControlFunctions::*;
	
	a: Integer;
	aa : Boolean;
	x = ToString(a * a + 3 == 4);
	y = NumericalFunctions::'+'(1,2);
	z : Boolean = aa & true ^^ zz | false => z;
	zz : Boolean = aa and true xor aa or false implies z;
	
	b = x > y? x-y: y-x;
	c = x->collect {in xx; xx + 1}; 
	d = x->reduce {in s; in t; s + t}->reduce '+';
	
	behavior w specializes ControlPerformances::LoopPerformance (inout v: Integer)  {
		in expr redefines whileTest {v > 3}
		in step redefines body : Performances::Performance {
			step decrement {
				out v_decr : Integer = v - 1;			
			}
			succession decrement then update;
			step update : FeatureAccessPerformances::FeatureWritePerformance {
				inout replacementValues = decrement.v_decr;
				in redefines onOccurrence = w::self {
					feature redefines startingAt : w {
						feature redefines accessedFeature redefines v;
					}
				}
			}
		}
	}
	
	xx = x == 1 && y == 2? a:
	     x == 2? b:
	     x == 3? c:
	     0;
	     
	yy = if x == 1 and y == 2? a
	     else if x == 2? b
	     else if x == 3? c
	     else 0;
    
    function TotalMass(partMass, subparts) {
		partMass + (subparts->collect {in p; totalMass(partMass, subparts)}->reduce '+' ?? 0.0)
	}
	
	expr totalMass: TotalMass (mass, sub);
}