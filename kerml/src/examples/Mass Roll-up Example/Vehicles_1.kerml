package Vehicles_1 {
	import MassRollup_1::*;

	class Vehicle specializes MassedThing {
		feature vin: String;
		feature m redefines mass;
	
		composite engine: Engine subsets subcomponents;
		composite transmission: Transmission subsets subcomponents;
	}
	
	class Engine specializes MassedThing {
		feature serialNumber: String;
		feature m redefines mass;
		
		// ...
	}
	
	class Transmission specializes MassedThing {
		feature serialNumber: String;
		feature m redefines mass;
		
		// ...
	}
	
	// Example usage
	
	import SI::*;
	feature v: Vehicle {
		feature m redefines Vehicle::m = 1000@[kg];
		composite engine redefines Vehicle::engine {
			feature m redefines Engine::m = 100@[kg];
		}
		composite transmission redefines Vehicle::transmission {
			feature m redefines Transmission::m = 50@[kg];
		}
	}

	// v.totalMass evaluates to 1150.0@[kg]
}