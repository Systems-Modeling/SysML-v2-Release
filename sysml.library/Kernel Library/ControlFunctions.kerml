package ControlFunctions {
	private import Base::Anything;
	private import ScalarValues::ScalarValue;
	private import ScalarValues::Boolean;
	private import ScalarFunctions::Min;
	private import ScalarFunctions::Max;
	
	abstract function '?'(test: Boolean): Anything[0..*] {
		composite abstract expr thenValue[0..1] (): Anything[0..*];
		composite abstract expr elseValue[0..1] (): Anything[0..*];
	}
	
	abstract function '??'(firstValue: Anything[0..*]): Anything[0..*] {
		composite abstract expr secondValue[0..1] (): Anything[0..*];
	}
	
	abstract function '&&'(firstValue: Boolean): Boolean {
		composite abstract expr secondValue[0..1] ():Boolean;
	}
	
	abstract function '||'(firstValue: Boolean): Boolean {
		composite abstract expr secondValue[0..1] ():Boolean;
	}
	
	abstract function while('initial': Anything[0..*]): Anything[0..*] {
		composite abstract expr condition[1..*] (argument: Anything[0..*]): Boolean;
		composite abstract expr body[0..*] (argument: Anything[0..*]): Anything[0..*];
	}
	
	abstract function collect(collection: Anything[0..*]): Anything[0..*] {
		composite abstract expr mapper[0..*] (argument: Anything[1]): Anything[0..*];
	}
	
	abstract function select(collection: Anything[0..*]): Anything[0..*] {
		composite abstract expr selector[0..*] (argument: Anything[1]): Boolean;
	}
	
	function selectOne(collection: Anything[0..*]): Anything[0..1] {
		composite abstract expr selector1[0..*] (argument: Anything[1]): Boolean;
		collection->select x (selector1(x))[1]
	}
	
	abstract function reject(collection: Anything[0..*]): Anything[0..*] {
		composite abstract expr rejector[0..*] (argument: Anything[1]): Boolean;
	}
	
	abstract function reduce(collection: Anything[0..*]): Anything[0..*] {
		composite abstract expr reducer[0..*] (firstArg: Anything[1], secondArg: Anything[1]): Anything[1];
	}
	
	abstract function forAll(collection: Anything[0..*]): Boolean {
		composite abstract expr test[0..*] (argument: Anything[1]): Boolean;
	}
	
	abstract function exists(collection: Anything[0..*]): Boolean {
		composite abstract expr test[0..*] (argument: Anything[1]): Boolean;
	}
	
	function allTrue(collection: Boolean[0..*]): Boolean {
		collection->forAll x (x)
	}
	
	function anyTrue(collection: Boolean[0..*]): Boolean {
		collection->exists x (x)
	}
	
	function minimize(collection: ScalarValue[1..*]): ScalarValue {
		composite abstract expr fn[0..*] (argument: ScalarValue[1]): ScalarValue[1];
		collection->collect x (fn(x))->reduce Min
	}
	
	function maximize(collection: ScalarValue[1..*]): ScalarValue {
		composite abstract expr fn[0..*] (argument: ScalarValue[1]): ScalarValue[1];
		collection->collect x (fn(x))->reduce Max
	}
	
}