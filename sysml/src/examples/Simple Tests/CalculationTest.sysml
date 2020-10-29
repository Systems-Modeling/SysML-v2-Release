package CalculationExample {
	import ISQ::*;
	import ScalarFunctions::*;
	
	part vehicle {
		attribute m : MassValue;
		
		part eng {
			attribute m : MassValue;
		}
		
		part trans {
			attribute m : MassValue;
		}
	}
	
	calc def MassSum (partMasses : MassValue[0..*]) totalMass : MassValue {
		sum(partMasses)
	}
	
	calc ms: MassSum (
		partMasses = {vehicle::eng::m, vehicle::trans::m})
		totalMass = vehicle::m;
		
	calc def MassSum1 {
		in partMasses : MassValue[0..*];
		return totalMass : MassValue = sum(partMasses);
	}
	
	calc ms1: MassSum {
		in partMasses = {vehicle::eng::m, vehicle::trans::m};
		return totalMass = vehicle::m;
	}
}