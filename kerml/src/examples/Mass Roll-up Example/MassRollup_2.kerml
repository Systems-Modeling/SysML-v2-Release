package MassRollup_2 {
	import NumericalFunctions::*;
	import ISQ::*;
	
	class MassedThing {
		feature mass subsets ISQ::mass; 
		feature totalMass subsets ISQ::mass =
			mass + sum(subcomponents.totalMass);
			
		feature subcomponents redefines massedThings;	
	}
	
	feature massedThings: MassedThing[0..*];

}