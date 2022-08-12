package BaseFunctions {
	doc
	/*
	 * This package defines a basic set of functions defined on all kinds of values. 
	 * Most correspond to similarly named operators in the KerML expression syntax.
	 */

	private import Base::Anything;
	private import Objects::Object;
	private import ScalarValues::*;
	
	abstract function '=='{ in x: Anything[0..1]; in y: Anything[0..1]; 
		return : Boolean[1];
	}
	function '!='{ in x: Anything[0..1]; in y: Anything[0..1]; 
		return : Boolean[1] = not (x == y);
	}
	
	function ToString{ in x: Anything[0..1]; 
		return : String;
	}
	
	function '['{ in seq: Anything[0..*] ordered nonunique; in index: Anything[0..*] ordered nonunique; 
		return : Anything[0..1];
	}
	function ','{ in seq1: Anything[0..*] ordered nonunique; seq2: Anything[0..*] ordered nonunique; 
		return : Anything[0..*] ordered nonunique;
	}
	
    abstract function 'all'{
    	abstract feature all 'type': Object;
    	return : Object[0..*];
    }
    
	abstract function 'istype'{ in x: Anything[1];
		abstract feature 'type': Anything;
		return : Boolean[1];
	}
	
	abstract function '@'{ in x: Anything[1];
		abstract feature 'type': Anything;
		return : Boolean[1];
	}
	
	abstract function 'hastype'{ in x: Anything[1];
		abstract feature 'type': Anything[1];
		return : Boolean;
	}
	
	abstract function 'as'{ in seq: Anything[0..*] ordered nonunique; 
		abstract feature 'type': Anything[1];
		return : Anything[0..*] ordered nonunique;
	}
	
}