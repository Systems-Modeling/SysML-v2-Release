/**
 * This package defines functions on Integer values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package IntegerFunctions {
	import ScalarValues::*;
	
	function Abs specializes NumericalFunctions::Abs (x: Integer[1]): Natural[1];
	
	function '+' specializes NumericalFunctions::'+' (x: Integer[1], y: Integer[0..1]): Integer[1];
	function '-' specializes NumericalFunctions::'-' (x: Integer[1], y: Integer[0..1]): Integer[1];
	function '*' specializes NumericalFunctions::'*' (x: Integer[1], y: Integer[1]): Integer[1];
	function '/' specializes NumericalFunctions::'/' (x: Integer[1], y: Integer[1]): Rational;
	function '**' specializes NumericalFunctions::'**' (x: Integer[1], y: Natural): Integer[1];
	function '^' specializes NumericalFunctions::'^' (x: Integer[1], y: Natural): Integer[1];
	function '%' specializes NumericalFunctions::'%' (x: Integer[1], y: Integer[1]): Integer[1];
	
	function '<' specializes NumericalFunctions::'<' (x: Integer[1], y: Integer[1]): Boolean[1];
	function '>' specializes NumericalFunctions::'>' (x: Integer[1], y: Integer[1]): Boolean[1];
	function '<=' specializes NumericalFunctions::'<=' (x: Integer[1], y: Integer[1]): Boolean[1];
	function '>=' specializes NumericalFunctions::'>=' (x: Integer[1], y: Integer[1]): Boolean[1];

	function Max specializes NumericalFunctions::Max (x: Integer[1], y: Integer[1]): Integer[1];
	function Min specializes NumericalFunctions::Min (x: Integer[1], y: Integer[1]): Integer[1];

	function '==' specializes DataFunctions::'==' (x: Integer[0..1], y: Integer[0..1]): Boolean[1];
	
	function '..' specializes ScalarFunctions::'..' (lower: Integer[1], upper: Integer[1]): Integer[0..*];	
	
	function ToString specializes BaseFunctions::ToString (x: Integer[1]): String[1];
	function ToNatural(x: Integer[1]): Natural[1];
	function ToInteger(x: String[1]): Integer[1];
	
	function sum specializes ScalarFunctions::sum(collection: Integer[0..*]): Integer[1] {
		ScalarFunctions::sum0(collection, 0)
	}
	
	function product specializes ScalarFunctions::product(collection: Integer[0..*]): Integer[1] {
		ScalarFunctions::product1(collection, 1)
	}
}	
