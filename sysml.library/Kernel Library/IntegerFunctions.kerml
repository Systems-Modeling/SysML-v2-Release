/**
 * This package defines functions on Integer values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package IntegerFunctions {
	import ScalarValues::*;
	
	function abs specializes RationalFunctions::abs (x: Integer[1]): Natural[1];
	
	function '+' specializes RationalFunctions::'+' (x: Integer[1], y: Integer[0..1]): Integer[1];
	function '-' specializes RationalFunctions::'-' (x: Integer[1], y: Integer[0..1]): Integer[1];
	function '*' specializes RationalFunctions::'*' (x: Integer[1], y: Integer[1]): Integer[1];
	function '/' specializes RationalFunctions::'/' (x: Integer[1], y: Integer[1]): Rational;
	function '**' specializes RationalFunctions::'**' (x: Integer[1], y: Natural): Integer[1];
	function '^' specializes RationalFunctions::'^' (x: Integer[1], y: Natural): Integer[1];
	function '%' specializes NumericalFunctions::'%' (x: Integer[1], y: Integer[1]): Integer[1];
	
	function '<' specializes RationalFunctions::'<' (x: Integer[1], y: Integer[1]): Boolean[1];
	function '>' specializes RationalFunctions::'>' (x: Integer[1], y: Integer[1]): Boolean[1];
	function '<=' specializes RationalFunctions::'<=' (x: Integer[1], y: Integer[1]): Boolean[1];
	function '>=' specializes RationalFunctions::'>=' (x: Integer[1], y: Integer[1]): Boolean[1];

	function max specializes RationalFunctions::max (x: Integer[1], y: Integer[1]): Integer[1];
	function min specializes RationalFunctions::min (x: Integer[1], y: Integer[1]): Integer[1];

	function '==' specializes DataFunctions::'==' (x: Integer[0..1], y: Integer[0..1]): Boolean[1];
	
	function '..' specializes ScalarFunctions::'..' (lower: Integer[1], upper: Integer[1]): Integer[0..*];	
	
	function ToString specializes RationalFunctions::ToString (x: Integer[1]): String[1];
	function ToNatural(x: Integer[1]): Natural[1];
	function ToInteger(x: String[1]): Integer[1];
	
	function sum specializes RationalFunctions::sum(collection: Integer[0..*]): Integer[1] {
		NumericalFunctions::sum0(collection, 0)
	}
	
	function product specializes RationalFunctions::product(collection: Integer[0..*]): Integer[1] {
		NumericalFunctions::product1(collection, 1)
	}
}	
