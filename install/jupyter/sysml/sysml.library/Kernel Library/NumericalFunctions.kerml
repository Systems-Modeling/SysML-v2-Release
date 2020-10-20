package NumericalFunctions {
	import ScalarValues::*;
	
	abstract function Abs(x: NumericalValue): NumericalValue;
		
	abstract function '+' specializes ScalarFunctions::'+' (x: NumericalValue, y: NumericalValue[0..1]): NumericalValue;
	abstract function '-' specializes ScalarFunctions::'-' (x: NumericalValue, y: NumericalValue[0..1]): NumericalValue;
	abstract function '*' specializes ScalarFunctions::'*' (x: NumericalValue, y: NumericalValue): NumericalValue;
	abstract function '/' specializes ScalarFunctions::'/' (x: NumericalValue, y: NumericalValue): NumericalValue;
	abstract function '**' specializes ScalarFunctions::'**' (x: NumericalValue, y: NumericalValue): NumericalValue;
	abstract function '%' specializes ScalarFunctions::'%' (x: NumericalValue, y: NumericalValue): NumericalValue;
	
	abstract function '<' specializes ScalarFunctions::'<' (x: NumericalValue, y: NumericalValue): Boolean;
	abstract function '>' specializes ScalarFunctions::'>' (x: NumericalValue, y: NumericalValue): Boolean;
	abstract function '<=' specializes ScalarFunctions::'<=' (x: NumericalValue, y: NumericalValue): Boolean;
	abstract function '>=' specializes ScalarFunctions::'>=' (x: NumericalValue, y: NumericalValue): Boolean;
	
	abstract function Max specializes ScalarFunctions::Max (x: NumericalValue, y: NumericalValue): NumericalValue;
	abstract function Min specializes ScalarFunctions::Min (x: NumericalValue, y: NumericalValue): NumericalValue;
}