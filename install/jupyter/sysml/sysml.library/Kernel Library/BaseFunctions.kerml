package BaseFunctions {
	private import Base::Anything;
	private import Objects::Object;
	private import ScalarValues::*;
	
	function '=='(x: Anything, y: Anything): Boolean;
	function '!='(x: Anything, y: Anything): Boolean;
	
	function ToString(x: Anything): String;
	
	function size(seq: Anything[*]): Natural;
	function isEmpty(seq: Anything[*]): Boolean;
	function notEmpty(seq: Anything[0..*]): Boolean {
		!isEmpty(seq)
	}
	
	function head(seq: Anything[0..*] ordered): Anything[0..1] {
		seq[1]
	}
	function tail(seq: Anything[0..*] ordered): Anything[0..1];
	function last(seq: Anything[0..*] ordered): Anything[0..1] {
		seq[size(seq)]
	}
	
	function '['(seq: Anything[0..*] ordered, index: Integer): Anything[0..1];
	function ','(x: Anything, seq: Anything[0..*] ordered): Anything[0..*] ordered;


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
	
	/** Deprecated */
	abstract function 'instanceof'(x: Anything): Boolean {
		abstract feature 'type': Anything;
	}
	
	abstract function 'hastype'(x: Anything): Boolean {
		abstract feature 'type': Anything;
	}
	
}