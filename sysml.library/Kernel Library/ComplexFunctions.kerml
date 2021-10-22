/**
 * This package defines functions on Complex values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package ComplexFunctions {
	import ScalarValues::*;
		
	feature i: Complex[1] = Rect(0.0, 1.0);
	
	function Rect(re: Real[1], im: Real[1]): Complex[1];
	function Polar(abs: Real[1], arg: Real[1]): Complex[1];
	
	function Re(x: Complex[1]): Real[1];
	function Im(x: Complex[1]): Real[1];
	
	function Abs specializes NumericalFunctions::Abs (x: Complex[1]): Real[1];
	function Arg(x: Complex[1]): Real[1];
	
	function '+' specializes NumericalFunctions::'+' (x: Complex[1], y: Complex[0..1]): Complex[1];
	function '-' specializes NumericalFunctions::'-' (x: Complex[1], y: Complex[0..1]): Complex[1];
	function '*' specializes NumericalFunctions::'*' (x: Complex[1], y: Complex[1]): Complex[1];
	function '/' specializes NumericalFunctions::'/' (x: Complex[1], y: Complex[1]): Complex[1];
	function '**' specializes NumericalFunctions::'**' (x: Complex[1], y: Complex[1]): Complex[1];
	function '^' specializes NumericalFunctions::'^' (x: Complex[1], y: Complex[1]): Complex[1];
	
	function '==' specializes DataFunctions::'==' (x: Complex[0..1], y: Complex[0..1]): Boolean[1];
	
	function ToString specializes BaseFunctions::ToString (x: Complex[1]): String[1];
	function ToComplex(x: String[1]): Complex[1];
	
	function sum specializes ScalarFunctions::sum (collection: Complex[0..*]): Complex[1] {
		ScalarFunctions::sum0(collection, Rect(0.0, 0.0))
	}
	
	function product specializes ScalarFunctions::product (collection: Complex[0..*]): Complex[1] {
		ScalarFunctions::product1(collection, Rect(1.0, 0.0))
	}	
}
