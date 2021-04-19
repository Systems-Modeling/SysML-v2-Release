package DataFunctions {
	private import Base::DataValue;
	private import ScalarValues::Boolean;
	
	abstract function '+'(x: DataValue, y: DataValue[0..1]): DataValue;
	abstract function '-'(x: DataValue, y: DataValue[0..1]): DataValue;
	abstract function '*'(x: DataValue, y: DataValue): DataValue;
	abstract function '/'(x: DataValue, y: DataValue): DataValue;
	abstract function '**'(x: DataValue, y: DataValue): DataValue;
	abstract function '%'(x: DataValue, y: DataValue): DataValue;
	
	abstract function '!'(x: DataValue): DataValue;
	abstract function '~'(x: DataValue): DataValue;
	
	abstract function '|'(x: DataValue, y: DataValue): DataValue;
	abstract function '^'(x: DataValue, y: DataValue): DataValue;
	abstract function '&'(x: DataValue, y: DataValue): DataValue;
	
	abstract function '<'(x: DataValue, y: DataValue): Boolean;
	abstract function '>'(x: DataValue, y: DataValue): Boolean;
	abstract function '<='(x: DataValue, y: DataValue): Boolean;
	abstract function '>='(x: DataValue, y: DataValue): Boolean;
	
	abstract function Max(x: DataValue, y: DataValue): DataValue;
	abstract function Min(x: DataValue, y: DataValue): DataValue;
	
	/** Deprecated */
	abstract function '@['(x: DataValue, y: Base::Anything): DataValue;
	
	abstract function '..'(lower: DataValue, upper: DataValue): DataValue[0..*];
	
	abstract function sum(collection: DataValue[0..*]): DataValue;
	abstract function product(collection: DataValue[0..*]): DataValue;
	
	function sum0(collection: DataValue[0..*], zero: DataValue): DataValue {
		collection->reduce '+' ?? zero
	}
	
	function product1(collection: DataValue[0..*], one: DataValue): DataValue {
		collection->reduce '*' ?? one
	}
}