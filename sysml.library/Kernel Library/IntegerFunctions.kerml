package IntegerFunctions {
	import ScalarValues::*;
	
	function Abs specializes NumericalFunctions::Abs (x: Integer): Natural;
	
	function '+' specializes NumericalFunctions::'+' (x: Integer, y: Integer[0..1]): Integer;
	function '-' specializes NumericalFunctions::'-' (x: Integer, y: Integer[0..1]): Integer;
	function '*' specializes NumericalFunctions::'*' (x: Integer, y: Integer): Integer;
	function '/' specializes NumericalFunctions::'/' (x: Integer, y: Integer): Rational;
	function '**' specializes NumericalFunctions::'**' (x: Integer, y: Natural): Integer;
	function '%' specializes NumericalFunctions::'%' (x: Integer, y: Integer): Integer;
	
	function '<' specializes NumericalFunctions::'<' (x: Integer, y: Integer): Boolean;
	function '>' specializes NumericalFunctions::'>' (x: Integer, y: Integer): Boolean;
	function '<=' specializes NumericalFunctions::'<=' (x: Integer, y: Integer): Boolean;
	function '>=' specializes NumericalFunctions::'>=' (x: Integer, y: Integer): Boolean;

	function Max specializes NumericalFunctions::Max (x: Integer, y: Integer): Integer;
	function Min specializes NumericalFunctions::Min (x: Integer, y: Integer): Integer;

	function '==' specializes BaseFunctions::'==' (x: Integer, y: Integer): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: Integer, y: Integer): Boolean;
	
	function '..' specializes ScalarFunctions::'..' (lower: Integer, upper: Integer): Integer[0..*];	
	
	function ToString specializes BaseFunctions::ToString (x: Integer): String;
	function ToNatural(x: Integer): Natural;
	function ToInteger(x: String): Integer;
	function ToRational(x: Integer): Rational;
	function ToReal(x: Integer): Real;
	
	function sum specializes ScalarFunctions::sum(collection: Integer[0..*]): Integer {
		ScalarFunctions::sum0(collection, 0)
	}
	
	function product specializes ScalarFunctions::product(collection: Integer[0..*]): Integer {
		ScalarFunctions::product1(collection, 1)
	}
}	
