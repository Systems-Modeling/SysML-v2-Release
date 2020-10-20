package MassRollup_1 {
	import ScalarFunctions::*;

	class MassedThing {
		feature mass subsets ISQ::mass;	
		composite subcomponents: MassedThing[0..*];

		feature totalMass subsets ISQ::mass = 
			mass + (subcomponents->collect p:MassedThing (p.totalMass)->reduce '+' ?? 0.0);
	}
}