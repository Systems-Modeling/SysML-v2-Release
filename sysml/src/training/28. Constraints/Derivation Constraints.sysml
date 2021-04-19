package 'Derivation Constraints' {
	import 'Constraints Example-1'::*;
	
	part vehicle1 : Vehicle {
		attribute totalMass : MassValue;			
		assert constraint {totalMass == chassisMass + engine::mass + transmission::mass}	
	}
	
	part vehicle2 : Vehicle {
		attribute totalMass : MassValue = chassisMass + engine::mass + transmission::mass;
	}
	
	constraint def Dynamics (
		mass: MassValue,
		initialSpeed : SpeedValue,
		finalSpeed : SpeedValue,
		deltaT : TimeValue,
		force : ForceValue ) {

		force * deltaT == mass * (finalSpeed - initialSpeed) &
		mass > 0[kg]
	}
	
}