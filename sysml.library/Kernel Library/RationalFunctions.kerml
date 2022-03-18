/**
 * This package defines Functions on Rational values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package RationalFunctions {
	import ScalarValues::*;
	
	function rat(numer: Integer[1], denum: Integer[1]): Rational[1];
	function numer(rat: Rational[1]): Integer[1];
	function denom(rat: Rational[1]): Integer[1];
	
	function abs specializes RealFunctions::abs (x: Rational[1]): Rational[1];

	function '+' specializes RealFunctions::'+' (x: Rational[1], y: Rational[0..1]): Rational[1];
	function '-' specializes RealFunctions::'-' (x: Rational[1], y: Rational[0..1]): Rational[1];
	function '*' specializes RealFunctions::'*' (x: Rational[1], y: Rational[1]): Rational[1];
	function '/' specializes RealFunctions::'/' (x: Rational[1], y: Rational[1]): Rational[1];
	function '**' specializes RealFunctions::'**' (x: Rational[1], y: Rational[1]): Rational[1];
	function '^' specializes RealFunctions::'^' (x: Rational[1], y: Rational[1]): Rational[1];
	
	function '<' specializes RealFunctions::'<' (x: Rational[1], y: Rational[1]): Boolean[1];
	function '>' specializes RealFunctions::'>' (x: Rational[1], y: Rational[1]): Boolean[1];
	function '<=' specializes RealFunctions::'<=' (x: Rational[1], y: Rational[1]): Boolean[1];
	function '>=' specializes RealFunctions::'>=' (x: Rational[1], y: Rational[1]): Boolean[1];

	function max specializes RealFunctions::max (x: Rational[1], y: Rational[1]): Rational[1];
	function min specializes RealFunctions::min (x: Rational[1], y: Rational[1]): Rational[1];

	function '==' specializes RealFunctions::'==' (x: Rational[0..1], y: Rational[0..1]): Boolean[1];
	
	function gcd(x: Rational[1], y: Rational[1]): Integer[1];
		
	function floor specializes RealFunctions::floor (x: Rational[1]): Integer[1];
	function round specializes RealFunctions::round (x: Rational[1]): Integer[1];
	
	function ToString specializes RealFunctions::ToString (x: Rational[1]): String[1];
	function ToInteger(x: Rational[1]): Integer[1];
	function ToRational(x: String[1]): Rational[1];
	
	function sum specializes RealFunctions::sum (collection: Rational[0..*]): Rational[1] {
		NumericalFunctions::sum0(collection, rat(0, 1))
	}
	
	function product specializes RealFunctions::product (collection: Rational[0..*]): Rational[1] {
		NumericalFunctions::product1(collection, rat(1, 1))
	}	
}
