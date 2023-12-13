standard library package DataFunctions {
	doc
	/*
	 * This package defines the abstract base functions corresponding to all the unary and binary operators 
	 * in the KerML expression notation that might be defined on various kinds of DataValues.
	 */

	private import Base::DataValue;
	private import ScalarValues::Boolean;
	private import ControlFunctions::reduce;	
	
	abstract function '==' specializes BaseFunctions::'==' { in x: DataValue[0..1]; in y: DataValue[0..1]; 
		return : Boolean[1];
	}
	function '===' specializes BaseFunctions::'==='{ in x: DataValue[0..1]; in y: DataValue[0..1]; 
		return : Boolean[1] = x == y;
	}
	
	abstract function '+' { in x: DataValue[1]; in y: DataValue[0..1]; return : DataValue[1]; }
	abstract function '-' { in x: DataValue[1]; in y: DataValue[0..1]; return : DataValue[1]; }
	abstract function '*' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	abstract function '/' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	abstract function '**' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	abstract function '^' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	abstract function '%' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	
	abstract function 'not' { in x: DataValue[1]; return : DataValue[1]; }
	abstract function 'xor' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }

	abstract function '~' { in x: DataValue[1]; return : DataValue[1]; }
	abstract function '|' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	abstract function '&' { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	
	abstract function '<' { in x: DataValue[1]; in y: DataValue[1]; return : Boolean[1]; }
	abstract function '>' { in x: DataValue[1]; in y: DataValue[1]; return : Boolean[1]; }
	abstract function '<=' { in x: DataValue[1]; in y: DataValue[1]; return : Boolean[1]; }
	abstract function '>=' { in x: DataValue[1]; in y: DataValue[1]; return : Boolean[1]; }
	
	abstract function max { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	abstract function min { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
	
	abstract function '..' { in lower: DataValue[1]; in upper: DataValue[1]; return : DataValue[0..*] ordered; }	
}