package '15_02-Basic Value Properties' {
	import ScalarValues::*;
	
	/**
	 * Real world user models would use a quantity type
	 * from the library model. A attribute def is defined
	 * here to show that it is possible.
	 */
    attribute def LengthValue :> Real;

    part def Tire {
    	attribute manufacturer: String;
        attribute hubDiameter: LengthValue;
        attribute width: Integer;
    }
    
    part frenchTire: Tire {
    	attribute :>> manufacturer = "Michelin";
    	attribute :>> hubDiameter = 18.0;
    	attribute :>> width = 245;
    }
    
}
