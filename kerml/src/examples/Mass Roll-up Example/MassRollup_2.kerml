package MassRollup_2 {
	import ScalarFunctions::*;
	import ISQ::*;
	
	class MassedThing {
		feature mass subsets ISQ::mass; 
		feature totalMass subsets ISQ::mass =
			mass + (subcomponents->collect p:MassedThing (p.totalMass)->reduce '+') ?? 0.0;
			
		feature subcomponents is massedThings;	
	}
	
	feature massedThings: MassedThing[0..*];

}