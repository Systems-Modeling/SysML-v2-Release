package MassRollup_1 {
	import ScalarFunctions::*;

	class MassedThing {
		feature mass subsets ISQ::mass;	
		composite subcomponents: MassedThing[0..*];

		feature totalMass subsets ISQ::mass = 
			mass + sum(subcomponents.totalMass);
	}
}