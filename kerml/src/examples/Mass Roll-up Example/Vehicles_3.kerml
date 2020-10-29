package Vehicles_3 {
	import ScalarValues::*;
	import MassRollup_2::*;
	
	class CarPart specializes MassedThing {			
		feature serialNumber: String;
		feature m redefines MassedThing::mass;
		
		composite subparts is carParts;	
	}
	
	feature carParts: CarPart[0..*] redefines massedThings;
	
	feature vehicle subsets carParts {	
		feature vin redefines serialNumber;
		
		composite is engine;
		composite is transmission;
	}
	
	feature engine subsets carParts {
		//...
	}
	
	feature transmission subsets carParts {
		//...
	}

	// Example usage
	
	import SI::*;
	feature v: vehicle {
		feature m redefines CarPart::m = 1000@[kg];
		composite :>> engine = e;
		composite :>> transmission = t;
	}
	
	feature e :> engine {
		feature m redefines CarPart::m = 100@[kg];
	}
	
	feature t :> transmission {
		feature m redefines CarPart::m = 50@[kg];
	}
	
	// v.totalMass evaluates to 1150.0@[kg]
}