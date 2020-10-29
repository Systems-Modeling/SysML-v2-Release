package RationalFunctions {
	import ScalarValues::*;
	
	function Rat(numer: Integer, denum: Integer): Rational;
	function Numer(rat: Rational): Integer;
	function Denom(rat: Rational): Integer;
	
	function Abs specializes NumericalFunctions::Abs (x: Rational): Rational;

	function '+' specializes NumericalFunctions::'+' (x: Rational, y: Rational[0..1]): Rational;
	function '-' specializes NumericalFunctions::'-' (x: Rational, y: Rational[0..1]): Rational;
	function '*' specializes NumericalFunctions::'*' (x: Rational, y: Rational): Rational;
	function '/' specializes NumericalFunctions::'/' (x: Rational, y: Rational): Rational;
	function '**' specializes NumericalFunctions::'**' (x: Rational, y: Rational): Rational;
	
	function '<' specializes NumericalFunctions::'<' (x: Rational, y: Rational): Boolean;
	function '>' specializes NumericalFunctions::'>' (x: Rational, y: Rational): Boolean;
	function '<=' specializes NumericalFunctions::'<=' (x: Rational, y: Rational): Boolean;
	function '>=' specializes NumericalFunctions::'>=' (x: Rational, y: Rational): Boolean;

	function Max specializes NumericalFunctions::Max (x: Rational, y: Rational): Rational;
	function Min specializes NumericalFunctions::Min (x: Rational, y: Rational): Rational;

	function '==' specializes BaseFunctions::'==' (x: Rational, y: Rational): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: Rational, y: Rational): Boolean;
	
	function GCD(x: Rational, y: Rational): Integer;
		
	function Floor(x: Rational): Integer;
	function Round(x: Rational): Integer;
	
	function ToString specializes BaseFunctions::ToString (x: Rational): String;
	function ToInteger(x: Rational): Integer;
	function ToRational(x: String): Rational;
	function ToReal(x: Rational): Real;
	function ToComplex(x: Rational): Complex;
	
	function sum specializes ScalarFunctions::sum (collection: Rational[0..*]): Rational {
		ScalarFunctions::sum0(collection, Rat(0, 1))
	}
	
	function product specializes ScalarFunctions::product (collection: Rational[0..*]): Rational {
		ScalarFunctions::product1(collection, Rat(1, 1))
	}	
}
