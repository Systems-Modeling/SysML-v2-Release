/**
 * This package defines functions that correspond to operators in the KerML expression notation 
 * for which one or more operands are expressions whose evaluation is determined by another operand.
 */
package ControlFunctions {
	private import Base::Anything;
	private import ScalarValues::ScalarValue;
	private import ScalarValues::Boolean;
	private import ScalarFunctions::min;
	private import ScalarFunctions::max;
	
	abstract function '.' {
		in feature source : Anything[0..*] nonunique {
	  		abstract feature target : Anything[0..*] nonunique;
	  	}	  	
	  	private feature chain chains source.target;
	    chain
	}
	
	abstract function '?'(test: Boolean[1]): Anything[0..*] ordered nonunique {
		in expr thenValue[0..1] (): Anything[0..*] ordered nonunique;
		in expr elseValue[0..1] (): Anything[0..*] ordered nonunique;
	}
	
	abstract function '??'(firstValue: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		in expr secondValue[0..1] (): Anything[0..*] ordered nonunique;
	}
	
	abstract function '&&'(firstValue: Boolean[1]): Boolean[1] {
		in expr secondValue[0..1] (): Boolean[1];
	}
	
	function 'and'(firstValue: Boolean[1]): Boolean[1] {
		in expr secondValue[0..1] (): Boolean[1];
		firstValue && secondValue()
	}
	
	abstract function '||'(firstValue: Boolean[1]): Boolean[1] {
		in expr secondValue[0..1] (): Boolean[1];
	}
	
	function 'or'(firstValue: Boolean[1]): Boolean[1] {
		in expr secondValue[0..1] (): Boolean[1];
		firstValue || secondValue()
	}
	
	abstract function '=>'(firstValue: Boolean[1]): Boolean[1] {
		in expr secondValue[0..1] (): Boolean[1];
	}
	
	function 'implies'(firstValue: Boolean[1]): Boolean[1] {
		in expr secondValue[0..1] (): Boolean[1];
		firstValue => secondValue()
	}
	
	abstract function collect(collection: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		in expr mapper[0..*] (argument: Anything[1]): Anything[0..*] ordered nonunique;
	}
	
	abstract function select(collection: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		in expr selector[0..*] (argument: Anything[1]): Boolean[1];
	}
	
	function selectOne(collection: Anything[0..*] ordered nonunique): Anything[0..1] {
		in expr selector1[0..*] (argument: Anything[1]): Boolean[1];
		collection->select {in x; selector1(x)}[1]
	}
	
	abstract function reject(collection: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		in expr rejector[0..*] (argument: Anything[1]): Boolean[1];
	}
	
	abstract function reduce(collection: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		in expr reducer[0..*] (firstArg: Anything[1], secondArg: Anything[1]): Anything[1];
	}
	
	abstract function forAll(collection: Anything[0..*] ordered nonunique): Boolean[1] {
		in expr test[0..*] (argument: Anything[1]): Boolean[1];
	}
	
	abstract function exists(collection: Anything[0..*] ordered nonunique): Boolean[1] {
		in expr test[0..*] (argument: Anything[1]): Boolean[1];
	}
	
	function allTrue(collection: Boolean[0..*]): Boolean[1] {
		collection->forAll {in x; x}
	}
	
	function anyTrue(collection: Boolean[0..*]): Boolean[1] {
		collection->exists {in x; x}
	}
	
	function minimize(collection: ScalarValue[1..*]): ScalarValue[1] {
		in expr fn[0..*] (argument: ScalarValue[1]): ScalarValue[1];
		collection->collect {in x; fn(x)}->reduce min
	}
	
	function maximize(collection: ScalarValue[1..*]): ScalarValue {
		in expr fn[0..*] (argument: ScalarValue[1]): ScalarValue[1];
		collection->collect {in x; fn(x)}->reduce max
	}
	
}