/**
 * This package defines Functions on Real values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package RealFunctions {
	import ScalarValues::*;
	
	function re :> ComplexFunctions::re(x: Real[1]): Real[1] {
		x
	}
	function im :> ComplexFunctions::im(x: Real[1]): Real[1] {
		0.0
	}
	
	function abs specializes ComplexFunctions::abs (x: Real[1]): Real[1];
	function arg specializes ComplexFunctions::arg (x: Real[1]): Real[1] {
		0.0
	}

	function '+' specializes ComplexFunctions::'+' (x: Real[1], y: Real[0..1]): Real[1];
	function '-' specializes ComplexFunctions::'-' (x: Real[1], y: Real[0..1]): Real[1];
	function '*' specializes ComplexFunctions::'*' (x: Real[1], y: Real[1]): Real[1];
	function '/' specializes ComplexFunctions::'/' (x: Real[1], y: Real[1]): Real[1];
	function '**' specializes ComplexFunctions::'**' (x: Real[1], y: Real[1]): Real[1];
	function '^' specializes ComplexFunctions::'^' (x: Real[1], y: Real[1]): Real[1];
	
	function '<' specializes NumericalFunctions::'<' (x: Real[1], y: Real[1]): Boolean[1];
	function '>' specializes NumericalFunctions::'>' (x: Real[1], y: Real[1]): Boolean[1];
	function '<=' specializes NumericalFunctions::'<=' (x: Real[1], y: Real[1]): Boolean[1];
	function '>=' specializes NumericalFunctions::'>=' (x: Real[1], y: Real[1]): Boolean[1];

	function max specializes NumericalFunctions::max (x: Real[1], y: Real[1]): Real[1];
	function min specializes NumericalFunctions::min (x: Real[1], y: Real[1]): Real[1];

	function '==' specializes ComplexFunctions::'==' (x: Real[0..1], y: Real[0..1]): Boolean[1];
			
	function sqrt(x: Real[1]): Real[1];

	function floor(x: Real[1]): Integer[1];
	function round(x: Real[1]): Integer[1];
	
	function ToString specializes ComplexFunctions::ToString (x: Real[1]): String[1];
	function ToInteger(x: Real[1]): Integer[1];
	function ToRational(x: Real[1]): Rational[1];
	function ToReal(x: String[1]): Real[1];
	
	function sum specializes ComplexFunctions::sum (collection: Real[0..*]): Real {
		NumericalFunctions::sum0(collection, 0.0)
	}
	
	function product specializes ComplexFunctions::product (collection: Real[0..*]): Real {
		NumericalFunctions::product1(collection, 1.0)
	}	
}
