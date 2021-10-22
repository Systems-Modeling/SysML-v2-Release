/**
 * This package defines a basic set of functions defined on all kinds of values. 
 * Most correspond to similarly named operators in the KerML expression syntax.
 */
package BaseFunctions {
	private import Base::Anything;
	private import Objects::Object;
	private import ScalarValues::*;
	
	abstract function '=='(x: Anything[0..1], y: Anything[0..1]): Boolean[1];
	function '!='(x: Anything[0..1], y: Anything[0..1]): Boolean[1] {
		!(x == y)
	}
	
	function ToString(x: Anything[0..1]): String;
	
	function '['(seq: Anything[0..*] ordered nonunique, index: Anything[0..*] ordered nonunique): Anything[0..1];
	function ','(seq1: Anything[0..*] ordered nonunique, seq2: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique;
	
    abstract function 'all'(): Object[0..*] {
    	abstract feature all 'type': Object;
    }
    
	abstract function 'istype'(x: Anything[1]): Boolean[1] {
		abstract feature 'type': Anything;
	}
	
	abstract function '@'(x: Anything[1]): Boolean[1] {
		abstract feature 'type': Anything;
	}
	
	abstract function 'hastype'(x: Anything[1]): Boolean {
		abstract feature 'type': Anything[1];
	}
	
	abstract function 'as'(seq: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		abstract feature 'type': Anything[1];
	}
	
}