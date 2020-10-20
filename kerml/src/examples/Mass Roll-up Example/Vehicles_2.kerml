package Vehicles_2 {
	import MassRollup_1::*;
	
	class CarPart specializes MassedThing {		
		feature serialNumber: String;
		feature m redefines mass;
		
		composite subparts: CarPart[0..*] redefines subcomponents;
	}
	
	feature vehicle: CarPart {	
		feature vin redefines serialNumber;
		
		composite engine: CarPart subsets subparts {
			//...
		}
		
		composite transmission: CarPart subsets subparts {
			//...
		}
	}
	
	// Example usage
	
	import SI::*;
	feature v: vehicle {
		feature m redefines CarPart::m = 1000@[kg];
		composite engine redefines vehicle::engine {
			feature m redefines CarPart::m = 100@[kg];
		}
		composite transmission redefines vehicle::transmission {
			feature m redefines CarPart::m = 50@[kg];
		}
	}
	
	// v.totalMass evaluates to 1150.0@[kg]
}