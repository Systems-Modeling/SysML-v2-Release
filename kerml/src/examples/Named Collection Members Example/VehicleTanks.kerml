package VehicleTanks {
	import ScalarValues::*;
	import RealFunctions::*;
	
	class V6Engine;
	
	class Tank {
		feature capacity: Real;
	}
	
	class Vehicle {
		composite tanks: Tank[1..*] ordered;
		
		feature fuelCapacity: Real = tanks->collect tank:Tank (tank.capacity)->reduce '+';
	}
	
	class Vehicle1 specializes Vehicle {
		composite tanks: Tank[4] ordered redefines Vehicle::tanks {
			feature main1[1] subsets tanks = tanks[1];
			feature main2[1] subsets tanks = tanks[2];
			feature aux1[1] subsets tanks = tanks[3];
			feature aux2[1] subsets tanks = tanks[4];
		}
		
		composite eng: V6Engine;
		
		connector eng to tanks::main1;
		connector tanks::main1 to tanks::aux1;
		
		connector eng to tanks::main2;
		connector tanks::main2 to tanks::aux2;
	}
}