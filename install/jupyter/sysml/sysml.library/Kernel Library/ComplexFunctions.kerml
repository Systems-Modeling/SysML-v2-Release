package ComplexFunctions {
	import ScalarValues::*;
		
	feature i: Complex = Rect(0.0, 1.0);
	
	function Rect(re: Real, im: Real): Complex;
	function Polar(abs: Real, arg: Real): Complex;
	
	function Re(x: Complex): Real;
	function Im(x: Complex): Real;
	
	function Abs specializes NumericalFunctions::Abs (x: Complex): Real;
	function Arg(x: Complex): Real;
	
	function '+' specializes NumericalFunctions::'+' (x: Complex, y: Complex[0..1]): Complex;
	function '-' specializes NumericalFunctions::'-' (x: Complex, y: Complex[0..1]): Complex;
	function '*' specializes NumericalFunctions::'*' (x: Complex, y: Complex): Complex;
	function '/' specializes NumericalFunctions::'/' (x: Complex, y: Complex): Complex;
	function '**' specializes NumericalFunctions::'**' (x: Complex, y: Complex): Complex;
	
	function '==' specializes BaseFunctions::'==' (x: Complex, y: Complex): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: Complex, y: Complex): Boolean;
	
	function ToString specializes BaseFunctions::ToString (x: Complex): String;
	function ToComplex(x: String): Complex;
	
	function sum specializes ScalarFunctions::sum (collection: Complex[0..*]): Complex {
		ScalarFunctions::sum0(collection, Rect(0.0, 0.0))
	}
	
	function product specializes ScalarFunctions::product (collection: Complex[0..*]): Complex {
		ScalarFunctions::product1(collection, Rect(1.0, 0.0))
	}	
}
