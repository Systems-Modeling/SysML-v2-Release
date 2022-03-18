/**
 * This package defines abstract functions on Numerical values for general arithmetic and comparison operations.
 */
package NumericalFunctions {
	import ScalarValues::*;
	private import ControlFunctions::reduce;
	
	abstract function isZero(x: NumericalValue[1]): Boolean;
	abstract function isUnit(x : NumericalValue[1]): Boolean;
	
	abstract function abs(x: NumericalValue[1]): NumericalValue[1];
		
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
	
	abstract function max specializes ScalarFunctions::max (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	abstract function min specializes ScalarFunctions::min (x: NumericalValue[1], y: NumericalValue[1]): NumericalValue[1];
	
	abstract function sum (collection: ScalarValue[0..*]): ScalarValue[1];	
	abstract function product (collection: ScalarValue[0..*]): ScalarValue[1];
	
	function sum0 (collection: NumericalValue[0..*], zero: ScalarValue[1]): ScalarValue {
		inv { isZero(zero) }
		collection->reduce '+' ?? zero
	}
	
	function product1 (collection: ScalarValue[0..*], one: ScalarValue[1]): ScalarValue {
		inv { isUnit(one) }
		collection->reduce '*' ?? one
	}
}