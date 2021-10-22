/**
 * This package defines abstract functions on Numerical values for general arithmetic and comparison operations.
 */
package NumericalFunctions {
	import ScalarValues::*;
	
	abstract function Abs(x: NumericalValue[1]): NumericalValue[1];
		
	abstract function '+' specializes ScalarFunctions::'+' (x: NumericalValue[1], y: NumericalValue[0..1]): NumericalValue[1];
	abstract function '-' specializes ScalarFunctions::'-' (x: NumericalValue[1], y: NumericalValue[0..1]): NumericalValue[1];
	abstract function '*' specializes ScalarFunctions::'*' (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	abstract function '/' specializes ScalarFunctions::'/' (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	abstract function '**' specializes ScalarFunctions::'**' (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	abstract function '^' specializes ScalarFunctions::'^' (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	abstract function '%' specializes ScalarFunctions::'%' (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	
	abstract function '<' specializes ScalarFunctions::'<' (x: NumericalValue[1], y: NumericalValue[1]): Boolean[1];
	abstract function '>' specializes ScalarFunctions::'>' (x: NumericalValue[1], y: NumericalValue[1]): Boolean[1];
	abstract function '<=' specializes ScalarFunctions::'<=' (x: NumericalValue[1], y: NumericalValue[1]): Boolean[1];
	abstract function '>=' specializes ScalarFunctions::'>=' (x: NumericalValue[1], y: NumericalValue[1]): Boolean[1];
	
	abstract function Max specializes ScalarFunctions::Max (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	abstract function Min specializes ScalarFunctions::Min (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
}