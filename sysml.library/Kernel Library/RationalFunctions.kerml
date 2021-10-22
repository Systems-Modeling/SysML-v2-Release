/**
 * This package defines Functions on Rational values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package RationalFunctions {
	import ScalarValues::*;
	
	function Rat(numer: Integer[1], denum: Integer[1]): Rational[1];
	function Numer(rat: Rational[1]): Integer[1];
	function Denom(rat: Rational[1]): Integer[1];
	
	function Abs specializes NumericalFunctions::Abs (x: Rational[1]): Rational[1];

	function '+' specializes NumericalFunctions::'+' (x: Rational[1], y: Rational[0..1]): Rational[1];
	function '-' specializes NumericalFunctions::'-' (x: Rational[1], y: Rational[0..1]): Rational[1];
	function '*' specializes NumericalFunctions::'*' (x: Rational[1], y: Rational[1]): Rational[1];
	function '/' specializes NumericalFunctions::'/' (x: Rational[1], y: Rational[1]): Rational[1];
	function '**' specializes NumericalFunctions::'**' (x: Rational[1], y: Rational[1]): Rational[1];
	function '^' specializes NumericalFunctions::'^' (x: Rational[1], y: Rational[1]): Rational[1];
	
	function '<' specializes NumericalFunctions::'<' (x: Rational[1], y: Rational[1]): Boolean[1];
	function '>' specializes NumericalFunctions::'>' (x: Rational[1], y: Rational[1]): Boolean[1];
	function '<=' specializes NumericalFunctions::'<=' (x: Rational[1], y: Rational[1]): Boolean[1];
	function '>=' specializes NumericalFunctions::'>=' (x: Rational[1], y: Rational[1]): Boolean[1];

	function Max specializes NumericalFunctions::Max (x: Rational[1], y: Rational[1]): Rational[1];
	function Min specializes NumericalFunctions::Min (x: Rational[1], y: Rational[1]): Rational[1];

	function '==' specializes DataFunctions::'==' (x: Rational[0..1], y: Rational[0..1]): Boolean[1];
	
	function GCD(x: Rational[1], y: Rational[1]): Integer[1];
		
	function Floor(x: Rational[1]): Integer[1];
	function Round(x: Rational[1]): Integer[1];
	
	function ToString specializes BaseFunctions::ToString (x: Rational[1]): String[1];
	function ToInteger(x: Rational[1]): Integer[1];
	function ToRational(x: String[1]): Rational[1];
	
	function sum specializes ScalarFunctions::sum (collection: Rational[0..*]): Rational[1] {
		ScalarFunctions::sum0(collection, Rat(0, 1))
	}
	
	function product specializes ScalarFunctions::product (collection: Rational[0..*]): Rational[1] {
		ScalarFunctions::product1(collection, Rat(1, 1))
	}	
}
