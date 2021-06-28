package DataFunctions {
	private import Base::DataValue;
	private import ScalarValues::Boolean;
	private import ControlFunctions::reduce;
	
	abstract function '+'(x: DataValue[1], y: DataValue[0..1]): DataValue[1];
	abstract function '-'(x: DataValue[1], y: DataValue[0..1]): DataValue[1];
	abstract function '*'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function '/'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function '**'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function '^'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function '%'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	
	abstract function '!'(x: DataValue[1]): DataValue[1];
	abstract function 'not'(x: DataValue[1]): DataValue[1];
	abstract function '~'(x: DataValue[1]): DataValue[1];
	
	abstract function '|'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function '^^'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function 'xor'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function '&'(x: DataValue[1], y: DataValue[1]): DataValue[1];
	
	abstract function '<'(x: DataValue[1], y: DataValue[1]): Boolean[1];
	abstract function '>'(x: DataValue[1], y: DataValue[1]): Boolean[1];
	abstract function '<='(x: DataValue[1], y: DataValue[1]): Boolean[1];
	abstract function '>='(x: DataValue[1], y: DataValue[1]): Boolean[1];
	
	abstract function Max(x: DataValue[1], y: DataValue[1]): DataValue[1];
	abstract function Min(x: DataValue[1], y: DataValue[1]): DataValue[1];
	
	abstract function '==' specializes BaseFunctions::'=='(x: DataValue[0..1], y: DataValue[0..1]): Boolean[1];
	
	/** Deprecated */
	abstract function '@['(x: DataValue[1], y: Base::Anything[1]): DataValue[1];
	
	abstract function '..'(lower: DataValue[1], upper: DataValue[1]): DataValue[0..*] ordered;
	
	abstract function sum(collection: DataValue[0..*] ordered): DataValue[1];
	abstract function product(collection: DataValue[0..*] ordered): DataValue[1];
	
	function sum0(collection: DataValue[0..*] ordered, zero: DataValue[1]): DataValue[1] {
		collection->reduce '+' ?? zero
	}
	
	function product1(collection: DataValue[0..*] ordered, one: DataValue[1]): DataValue[1] {
		collection->reduce '*' ?? one
	}
}