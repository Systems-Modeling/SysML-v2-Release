/**
 * This package defines Functions on Real values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package RealFunctions {
	import ScalarValues::*;
	
	function Abs specializes NumericalFunctions::Abs (x: Real[1]): Real[1];

	function '+' specializes NumericalFunctions::'+' (x: Real[1], y: Real[0..1]): Real[1];
	function '-' specializes NumericalFunctions::'-' (x: Real[1], y: Real[0..1]): Real[1];
	function '*' specializes NumericalFunctions::'*' (x: Real[1], y: Real[1]): Real[1];
	function '/' specializes NumericalFunctions::'/' (x: Real[1], y: Real[1]): Real[1];
	function '**' specializes NumericalFunctions::'**' (x: Real[1], y: Real[1]): Real[1];
	function '^' specializes NumericalFunctions::'^' (x: Real[1], y: Real[1]): Real[1];
	
	function '<' specializes NumericalFunctions::'<' (x: Real[1], y: Real[1]): Boolean[1];
	function '>' specializes NumericalFunctions::'>' (x: Real[1], y: Real[1]): Boolean[1];
	function '<=' specializes NumericalFunctions::'<=' (x: Real[1], y: Real[1]): Boolean[1];
	function '>=' specializes NumericalFunctions::'>=' (x: Real[1], y: Real[1]): Boolean[1];

	function Max specializes NumericalFunctions::Max (x: Real[1], y: Real[1]): Real[1];
	function Min specializes NumericalFunctions::Min (x: Real[1], y: Real[1]): Real[1];

	function '==' specializes DataFunctions::'==' (x: Real[0..1], y: Real[0..1]): Boolean[1];
			
	function Sqrt(x: Real[1]): Real[1];

	function Floor(x: Real[1]): Integer[1];
	function Round(x: Real[1]): Integer[1];
	
	function ToString specializes BaseFunctions::ToString (x: Real[1]): String[1];
	function ToInteger(x: Real[1]): Integer[1];
	function ToRational(x: Real[1]): Rational[1];
	function ToReal(x: String[1]): Real[1];
	
	function sum specializes ScalarFunctions::sum (collection: Real[0..*]): Real {
		ScalarFunctions::sum0(collection, 0.0)
	}
	
	function product specializes ScalarFunctions::product (collection: Real[0..*]): Real {
		ScalarFunctions::product1(collection, 1.0)
	}	
}
