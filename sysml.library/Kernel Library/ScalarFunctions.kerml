/**
 * This package defines abstract functions that specialize the DataFunctions for use with ScalarValues. 
 */
package ScalarFunctions {
	import ScalarValues::*;
	private import ControlFunctions::reduce;
	
	abstract function '+' specializes DataFunctions::'+' (x: ScalarValue[1], y: ScalarValue[0..1]): ScalarValue[1];
	abstract function '-' specializes DataFunctions::'-' (x: ScalarValue[1], y: ScalarValue[0..1]): ScalarValue[1];
	abstract function '*' specializes DataFunctions::'*' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function '/' specializes DataFunctions::'/' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function '**' specializes DataFunctions::'**' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function '^' specializes DataFunctions::'^' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function '%' specializes DataFunctions::'%' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	
	abstract function '!' specializes DataFunctions::'!' (x: ScalarValue[1]): ScalarValue[1];
	abstract function 'not' specializes DataFunctions::'not' (x: ScalarValue[1]): ScalarValue[1];
	abstract function '~' specializes DataFunctions::'~' (x: ScalarValue[1]): ScalarValue[1];
	
	abstract function '|' specializes DataFunctions::'|' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function '^^' specializes DataFunctions::'^^' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function 'xor' specializes DataFunctions::'xor' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function '&' specializes DataFunctions::'&' (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	
	abstract function '<' specializes DataFunctions::'<' (x: ScalarValue[1], y: ScalarValue[1]): Boolean[1];
	abstract function '>' specializes DataFunctions::'>' (x: ScalarValue[1], y: ScalarValue[1]): Boolean[1];
	abstract function '<=' specializes DataFunctions::'<=' (x: ScalarValue[1], y: ScalarValue[1]): Boolean[1];
	abstract function '>=' specializes DataFunctions::'>=' (x: ScalarValue[1], y: ScalarValue[1]): Boolean[1];
	
	abstract function Max specializes DataFunctions::Max (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function Min specializes DataFunctions::Min (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	
	abstract function '..' specializes DataFunctions::'..' (lower: ScalarValue[1], upper: ScalarValue[1]): ScalarValue[0..*];
	
	abstract function sum specializes DataFunctions::sum (collection: ScalarValue[0..*]): ScalarValue[1];
	abstract function product specializes DataFunctions::product (collection: ScalarValue[0..*]): ScalarValue[1];
	
	function sum0 specializes DataFunctions::sum0 (collection: ScalarValue[0..*], zero: ScalarValue[1]): ScalarValue {
		collection->reduce '+' ?? zero
	}
	
	function product1 specializes DataFunctions::product1 (collection: ScalarValue[0..*], one: ScalarValue[1]): ScalarValue {
		collection->reduce '*' ?? one
	}
}