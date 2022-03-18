/**
 * This package defines functions on Complex values, including concrete specializations of the 
 * general arithmetic and comparison operations.
 */
package ComplexFunctions {
	import ScalarValues::*;
		
	feature i: Complex[1] = rect(0.0, 1.0);
	
	function rect(re: Real[1], im: Real[1]): Complex[1];
	function polar(abs: Real[1], arg: Real[1]): Complex[1];
	
	function re(x: Complex[1]): Real[1];
	function im(x: Complex[1]): Real[1];
	
	function isZero specializes NumericalFunctions::isZero (x : Complex) {
		re(x) == 0.0 and im(x) == 0.0
	}
	function isUnit specializes NumericalFunctions::isUnit (x : Complex) {
		re(x) == 1.0 and im(x) == 0.0
	}
	
	function abs specializes NumericalFunctions::abs (x: Complex[1]): Real[1];
	function arg(x: Complex[1]): Real[1];
	
	function '+' specializes NumericalFunctions::'+' (x: Complex[1], y: Complex[0..1]): Complex[1];
	function '-' specializes NumericalFunctions::'-' (x: Complex[1], y: Complex[0..1]): Complex[1];
	function '*' specializes NumericalFunctions::'*' (x: Complex[1], y: Complex[1]): Complex[1];
	function '/' specializes NumericalFunctions::'/' (x: Complex[1], y: Complex[1]): Complex[1];
	function '**' specializes NumericalFunctions::'**' (x: Complex[1], y: Complex[1]): Complex[1];
	function '^' specializes NumericalFunctions::'^' (x: Complex[1], y: Complex[1]): Complex[1];
	
	function '==' specializes DataFunctions::'==' (x: Complex[0..1], y: Complex[0..1]): Boolean[1];
	
	function ToString specializes BaseFunctions::ToString (x: Complex[1]): String[1];
	function ToComplex(x: String[1]): Complex[1];
	
	function sum specializes NumericalFunctions::sum (collection: Complex[0..*]): Complex[1] {
		NumericalFunctions::sum0(collection, rect(0.0, 0.0))
	}
	
	function product specializes NumericalFunctions::product (collection: Complex[0..*]): Complex[1] {
		NumericalFunctions::product1(collection, rect(1.0, 0.0))
	}	
}
