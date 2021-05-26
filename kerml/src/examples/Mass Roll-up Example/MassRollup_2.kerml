package MassRollup_2 {
	import ScalarFunctions::*;
	import ISQ::*;
	
	class MassedThing {
		feature mass subsets ISQ::mass; 
		feature totalMass subsets ISQ::mass =
			mass + sum(subcomponents.totalMass);
			
		feature subcomponents is massedThings;	
	}
	
	feature massedThings: MassedThing[0..*];

}