package BaseFunctions {
	private import Base::Anything;
	private import Objects::Object;
	private import ScalarValues::*;
	
	function '=='(x: Anything[0..*], y: Anything[0..*]): Boolean;
	function '!='(x: Anything[0..*], y: Anything[0..*]): Boolean;
	
	function ToString(x: Anything[0..1]): String;
	
	function size(seq: Anything[0..*]): Natural;
	function isEmpty(seq: Anything[0..*]): Boolean;
	function notEmpty(seq: Anything[0..*]): Boolean {
		!isEmpty(seq)
	}
	function includes(seq: Anything[0..*], value: Anything[1]): Boolean {
		seq->exists x (x == value)
	}
	
	function union(seq1: Anything[0..*] nonunique, seq2: Anything[0..*] nonunique): Anything[0..*] nonunique;
	
	function head(seq: Anything[0..*] ordered): Anything[0..1] {
		seq[1]
	}
	function tail(seq: Anything[0..*] ordered): Anything[0..1];
	function last(seq: Anything[0..*] ordered): Anything[0..1] {
		seq[size(seq)]
	}
	
	function '['(seq: Anything[0..*] ordered, index: Anything): Anything[0..1];
	function ','(seq1: Anything[0..*] ordered, seq2: Anything[0..*] ordered): Anything[0..*] ordered;


    abstract function 'all'(): Object[0..*] {
    	abstract feature all 'type': Object;
    }
    
    /** Deprecated */
	abstract function 'allInstances'(): Object[0..*] {
		abstract feature all 'type': Object;
	}
	
	abstract function 'istype'(x: Anything): Boolean {
		abstract feature 'type': Anything;
	}
	
	abstract function '@'(x: Anything): Boolean {
		abstract feature 'type': Anything;
	}
	
	/** Deprecated */
	abstract function 'instanceof'(x: Anything): Boolean {
		abstract feature 'type': Anything;
	}
	
	abstract function 'hastype'(x: Anything): Boolean {
		abstract feature 'type': Anything;
	}
	
}