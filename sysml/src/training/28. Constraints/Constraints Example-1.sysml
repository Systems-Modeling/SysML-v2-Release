package 'Constraints Example-1' {
	import ISQ::*;
	import SI::*;
	import ScalarFunctions::*;
	
	part def Engine;
	part def Transmission;
	
	constraint def MassConstraint (
		partMasses : MassValue[0..*],
		massLimit : MassValue) {
			
		sum(partMasses) <= massLimit
	}
	
	part def Vehicle {
		constraint massConstraint : MassConstraint (
			partMasses = {chassisMass, engine::mass, transmission::mass},
			massLimit = 2500[kg]
		);
		
		attribute chassisMass : MassValue;
		
		part engine : Engine {
			attribute mass : MassValue;
		}
		
		part transmission : Engine {
			attribute mass : MassValue;
		}
	}
}