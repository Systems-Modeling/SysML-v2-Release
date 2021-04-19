package ScalarFunctions {
	import ScalarValues::*;
	
	abstract function '+' specializes DataFunctions::'+' (x: ScalarValue, y: ScalarValue[0..1]): ScalarValue;
	abstract function '-' specializes DataFunctions::'-' (x: ScalarValue, y: ScalarValue[0..1]): ScalarValue;
	abstract function '*' specializes DataFunctions::'*' (x: ScalarValue, y: ScalarValue): ScalarValue;
	abstract function '/' specializes DataFunctions::'/' (x: ScalarValue, y: ScalarValue): ScalarValue;
	abstract function '**' specializes DataFunctions::'**' (x: ScalarValue, y: ScalarValue): ScalarValue;
	abstract function '%' specializes DataFunctions::'%' (x: ScalarValue, y: ScalarValue): ScalarValue;
	
	abstract function '!' specializes DataFunctions::'!' (x: ScalarValue): ScalarValue;
	abstract function '~' specializes DataFunctions::'~' (x: ScalarValue): ScalarValue;
	
	abstract function '|' specializes DataFunctions::'|' (x: ScalarValue, y: ScalarValue): ScalarValue;
	abstract function '^' specializes DataFunctions::'^' (x: ScalarValue, y: ScalarValue): ScalarValue;
	abstract function '&' specializes DataFunctions::'&' (x: ScalarValue, y: ScalarValue): ScalarValue;
	
	abstract function '<' specializes DataFunctions::'<' (x: ScalarValue, y: ScalarValue): Boolean;
	abstract function '>' specializes DataFunctions::'>' (x: ScalarValue, y: ScalarValue): Boolean;
	abstract function '<=' specializes DataFunctions::'<=' (x: ScalarValue, y: ScalarValue): Boolean;
	abstract function '>=' specializes DataFunctions::'>=' (x: ScalarValue, y: ScalarValue): Boolean;
	
	abstract function Max specializes DataFunctions::Max (x: ScalarValue, y: ScalarValue): ScalarValue;
	abstract function Min specializes DataFunctions::Min (x: ScalarValue, y: ScalarValue): ScalarValue;
	
	/** Deprecated */
	abstract function '@[' specializes DataFunctions::'@[' (x: ScalarValue, y: Base::Anything): ScalarValue;
	
	abstract function '..' specializes DataFunctions::'..' (lower: ScalarValue, upper: ScalarValue): ScalarValue[0..*];
	
	abstract function sum specializes DataFunctions::sum (collection: ScalarValue[0..*]): ScalarValue;
	abstract function product specializes DataFunctions::product (collection: ScalarValue[0..*]): ScalarValue;
	
	function sum0 specializes DataFunctions::sum0 (collection: ScalarValue[0..*], zero: ScalarValue): ScalarValue {
		collection->reduce '+' ?? zero
	}
	
	function product1 specializes DataFunctions::product1 (collection: ScalarValue[0..*], one: ScalarValue): ScalarValue {
		collection->reduce '*' ?? one
	}
}