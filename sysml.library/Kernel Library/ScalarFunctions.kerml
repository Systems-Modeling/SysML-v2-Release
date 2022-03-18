/**
 * This package defines abstract functions that specialize the DataFunctions for use with ScalarValues. 
 */
package ScalarFunctions {
	import ScalarValues::*;
	
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
	
	abstract function max specializes DataFunctions::Max (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	abstract function min specializes DataFunctions::Min (x: ScalarValue[1], y: ScalarValue[1]): ScalarValue[1];
	
	abstract function '..' specializes DataFunctions::'..' (lower: ScalarValue[1], upper: ScalarValue[1]): ScalarValue[0..*];
}