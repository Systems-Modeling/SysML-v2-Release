package RealFunctions {
	import ScalarValues::*;
	
	function Abs specializes NumericalFunctions::Abs (x: Real): Real;

	function '+' specializes NumericalFunctions::'+' (x: Real, y: Real[0..1]): Real;
	function '-' specializes NumericalFunctions::'-' (x: Real, y: Real[0..1]): Real;
	function '*' specializes NumericalFunctions::'*' (x: Real, y: Real): Real;
	function '/' specializes NumericalFunctions::'/' (x: Real, y: Real): Real;
	function '**' specializes NumericalFunctions::'**' (x: Real, y: Real): Real;
	
	function '<' specializes NumericalFunctions::'<' (x: Real, y: Real): Boolean;
	function '>' specializes NumericalFunctions::'>' (x: Real, y: Real): Boolean;
	function '<=' specializes NumericalFunctions::'<=' (x: Real, y: Real): Boolean;
	function '>=' specializes NumericalFunctions::'>=' (x: Real, y: Real): Boolean;

	function Max specializes NumericalFunctions::Max (x: Real, y: Real): Real;
	function Min specializes NumericalFunctions::Min (x: Real, y: Real): Real;

	function '==' specializes BaseFunctions::'==' (x: Real, y: Real): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: Real, y: Real): Boolean;
		
	function Sqrt(x: Real): Real;

	function Floor(x: Real): Integer;
	function Round(x: Real): Integer;
	
	function ToString specializes BaseFunctions::ToString (x: Real): String;
	function ToInteger(x: Real): Integer;
	function ToRational(x: Real): Rational;
	function ToReal(x: String): Real;
	function ToComplex(x: Real): Complex;
	
	function sum specializes ScalarFunctions::sum (collection: Real[0..*]): Real {
		ScalarFunctions::sum0(collection, 0.0)
	}
	
	function product specializes ScalarFunctions::product (collection: Real[0..*]): Real {
		ScalarFunctions::product1(collection, 1.0)
	}	
}
